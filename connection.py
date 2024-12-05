import pandas as pd
import oracledb  # Import the Oracle library

# Load the CSV file into a DataFrame
df = pd.read_csv('netflix_titles.csv')

# Oracle database connection details
username = 'netflix'
password = '123'
dsn = 'localhost:1521/xe'  

# Establish the connection
try:
    connection = oracledb.connect(user=username, password=password, dsn=dsn)
    cursor = connection.cursor()

    # Insert DataFrame into Oracle DB
    # Note: Adjust column names to match your table
    df.to_sql('netflix_raw', con=connection, if_exists='append', index=False, method='multi')

    print("Data successfully inserted into Oracle database.")

except Exception as e:
    print(f"Error: {e}")

finally:
    if cursor:
        cursor.close()
    if connection:
        connection.close()
