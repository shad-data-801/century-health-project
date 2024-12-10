import pandas as pd
from dagster import asset, AssetExecutionContext
import os



@asset()
def conditions(context: AssetExecutionContext) -> pd.DataFrame:
    """Condition of patient in encounter, including diagnosis code and description"""
    context.log.info(os.getcwd())
    return pd.read_excel('./data/conditions.xlsx')

@asset()
def encounters() -> pd.DataFrame:
    """Visit-level information, including visit description, diagnosis code, and cost"""
    return pd.read_parquet('./data/encounters.parquet')

@asset()
def medications() -> pd.DataFrame:
    """Medication information, including therapeutic code, description, reason, and cost"""
    return pd.read_csv('./data/medications.csv')

@asset()
def patients() -> pd.DataFrame:
    """Patient demographics including birth date, name, race, ethnicity, gender, location, and income"""
    return pd.read_csv('./data/patients.csv')

@asset()
def symptoms() -> pd.DataFrame:
    """Lab results, specifically symptoms taken for Lupus patients, such as Rash, Joint Pain, Fatigue, and Fever."""
    return pd.read_csv('./data/symptoms.csv')

@asset()
def patient_gender()-> pd.DataFrame:
    """The gender of the patients"""
    return pd.read_csv('./data/patient_gender.csv')