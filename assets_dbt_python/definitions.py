import os

from dagster import (
    Definitions,
    FilesystemIOManager,
    ScheduleDefinition,
    define_asset_job,
    load_assets_from_modules,
)
from dagster_dbt import DbtCliResource
from dagster_duckdb_pandas import DuckDBPandasIOManager

from .assets import raw_data
from .assets.dbt import dbt_project_assets
from .project import dbt_project

raw_data_assets = load_assets_from_modules(
    [raw_data],
    group_name="raw_data",
    # all of these assets live in the duckdb database, under the schema raw_data
    key_prefix=["duckdb", "raw_data"],
)

# The freshness check sensor will run our freshness checks even if the underlying asset fails to run, for whatever reason.

# define jobs as selections over the larger graph
everything_job = define_asset_job("everything_everywhere_job", selection="*")

resources = {
    # this io_manager allows us to load dbt models as pandas dataframes
    "io_manager": DuckDBPandasIOManager(
        database=os.path.join(dbt_project.project_dir, "example.duckdb")
    ),
    # this io_manager is responsible for storing/loading our pickled machine learning model
    "model_io_manager": FilesystemIOManager(),
    # this resource is used to execute dbt cli commands
    "dbt": DbtCliResource(project_dir=dbt_project),
}

defs = Definitions(
    assets=[dbt_project_assets, *raw_data_assets],
    resources=resources,
    schedules=[
        ScheduleDefinition(job=everything_job, cron_schedule="@weekly"),
    ],
)
