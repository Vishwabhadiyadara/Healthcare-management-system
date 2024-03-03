import pandas as pd
import pymysql
from sqlalchemy import create_engine

# Database connection details
db_user = 'root'
db_password = 'IE6700user'
db_host = 'localhost'  # or your database host
db_name = 'hospital'

# Path to your CSV file
csv_file = 'doctors (1).csv'

# Establish database connection
engine = create_engine(f'mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}')

# Read CSV file
df = pd.read_csv(csv_file)

# Format and execute INSERT INTO statements for each row
for index, row in df.iterrows():
    query = f"""
    INSERT INTO Doctors (Doctor_ID, Doctor_Name, Speciality, Qualification, Doctor_Contact, Department_ID)
    VALUES ('{row['Doctor_ID']}', '{row['Doctor_Name']}', '{row['Speciality']}', '{row['Qualification']}', '{row['Doctor_Contact']}', '{row['Department_ID']}');
    """
    with engine.connect() as connection:
        connection.execute(query)
        print(f"Inserted row {index + 1}")

print("All data inserted successfully")
