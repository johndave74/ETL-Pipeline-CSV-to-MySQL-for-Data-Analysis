# ETL-Pipeline-CSV-to-MySQL-for-Data-Analysis
This project demonstrates an ETL (Extract, Transform, Load) pipeline using Python (pandas) to clean raw data from a CSV file and load it into MySQL for structured analysis.

# ETL Pipeline: CSV to MySQL for Data Analysis

## Overview
This project demonstrates an **ETL (Extract, Transform, Load) pipeline** using **Python (pandas)** to clean raw data from a CSV file and load it into **MySQL** for structured analysis.

## Project Workflow
1. **Extract**: Read raw data from a CSV file using `pandas`.
2. **Transform**: Perform data cleaning (handle missing values, remove duplicates, standardize formats, and correct data types).
3. **Load**: Insert cleaned data into a **MySQL database**.
4. **Analyze**: Run **SQL queries** to generate insights from the cleaned dataset.

## Tech Stack
- **Python** (`pandas`, `mysql-connector-python`)
- **MySQL** (for storage and analysis)
- **Jupyter Notebook** (for script execution)

## Installation & Setup
### **1. Clone the Repository**
```bash
   git clone https://github.com/yourusername/etl-csv-mysql.git
   cd etl-csv-mysql
```

### **2. Install Dependencies**
```bash
   pip install pandas mysql-connector-python
```

### **3. Setup MySQL Database**
1. Create a new MySQL database:
   ```sql
   CREATE DATABASE etl_db;
   ```
2. Create a table to store the cleaned data:
   ```sql
   CREATE TABLE cleaned_data (
       id INT AUTO_INCREMENT PRIMARY KEY,
       column1 VARCHAR(255),
       column2 INT,
       column3 FLOAT
   );
   ```

### **4. Run the ETL Script**
Modify the MySQL credentials in `etl_script.py`, then execute:
```bash
   python etl_script.py
```

## Sample Python Script (`etl_script.py`)
```python
import pandas as pd
import mysql.connector

# Load CSV Data
file_path = "data/raw_data.csv"
df = pd.read_csv(file_path)

# Data Cleaning
# Example: Drop missing values
df.dropna(inplace=True)

# Connect to MySQL
db_connection = mysql.connector.connect(
    host="localhost",
    user="your_user",
    password="your_password",
    database="etl_db"
)
cursor = db_connection.cursor()

# Insert cleaned data into MySQL
for _, row in df.iterrows():
    cursor.execute("INSERT INTO cleaned_data (column1, column2, column3) VALUES (%s, %s, %s)",
                   (row["column1"], row["column2"], row["column3"]))

db_connection.commit()
cursor.close()
db_connection.close()
print("Data successfully loaded into MySQL!")
```

## Future Enhancements
✅ Automate ETL process with **Apache Airflow**
✅ Store data in a **cloud database (AWS RDS, Google BigQuery, etc.)**
✅ Build a **dashboard** to visualize insights

🚀 **Check out the project and feel free to contribute!**

## License
This project is licensed under the MIT License.

