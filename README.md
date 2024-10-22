# DBMS_Project-I_RelationalDatabase  
This project demonstrates SQL skills using an SQLite sample database The tasks in this assignment are completed using SQL queries, which are run on the provided sample database from [PatientManagement.db](https://github.com/hansama0902/DBMS_Project-I_RelationalDatabase/blob/main/DB/PatientManagement.db).  
# Prerequisites
To run this project, make sure you have the following installed:  
1.Node.js: [Download here](https://nodejs.org/zh-cn/).  
2.SQLite: The SQLite CLI or an SQLite GUI tool such as DB Browser for SQLite(I used DataGrip)  
# Steps to Set Up the Environment
1.Clone this repository  
2.Download the SQLite sample database from the link below: [PatientManagement.db](https://github.com/hansama0902/DBMS_Project-I_RelationalDatabase/blob/main/DB/PatientManagement.db).   
3.Place the downloaded  MediaDB.db file in the root directory of this project.  
4.Install the necessary dependencies:  
```bash
npm install sqlite3
```
# Instructions for the Assignment
Query 1:The SQL statement retrieves information about patients, including their first name, last name, the type of test they underwent,
and the name of the laboratory that conducted the test.(one query must contain a join of at least three tables).      
[query1](https://github.com/hansama0902/DBMS_Project-I_RelationalDatabase/blob/main/Query/query1.sql)  
Query 2:The SQL statement retrieves the name of each doctor along with the count of prescriptions they have issued.  
It uses a LEFT JOIN to ensure that all doctors are included, even if they have not issued any prescriptions(contain a subquery).     
[query2](https://github.com/hansama0902/DBMS_Project-I_RelationalDatabase/blob/main/Query/query2.sql)    
Query 3:The SQL statement retrieves the names of doctors who have issued two or more prescriptions, along with the count of those prescriptions(a group by with a having clause).  
[query3](https://github.com/hansama0902/DBMS_Project-I_RelationalDatabase/blob/main/Query/query3.sql)      
Query 4:The SQL statement Filter patients based on gender and either symptoms or test type. Male patients must have taken a CRP test, and female patients must have a symptom of 'Cough'.(contain a complex search criterion).   
[query4](https://github.com/hansama0902/DBMS_Project-I_RelationalDatabase/blob/main/Query/query4.sql)     
Query 5: -- The SQL statement rank each patient's tests based on test date, with the most recent test ranked as 1.(PARTITION BY).       
[query5](https://github.com/hansama0902/DBMS_Project-I_RelationalDatabase/blob/main/Query/query5.sql)       
# How to Run
1.Open Terminal  
Make sure you are in a terminal window, and navigate to the directory where the  MediaDB.db and query.sql files are located. Use the cd command to navigate to the correct directory. For example:
```bash
cd /path/to/your/directory
```
2.Connect to the SQLite Database  
In the terminal, connect to  MediaDB.db by running the following command:
```bash
sqlite3 MediaDB.db
```
This will open SQLite and connect to the  MediaDB.db database.  
  
3.Execute the SQL Script  
Use the .read command to execute each query.sql file:    
For example:  
```bash
.read query1.sql
```
This command will read and execute the SQL statements from the query1.sql file, creating the MusicVideo table in the  MediaDB.db database. 
  
4.Exit SQLite  
```bash
.exit
```
# How to Run（easy method）
1.Launch DB Browser for SQLite.  
2.Click the "Open Database" button on the toolbar, or go to "File" -> "Open Database...".   
3.In the dialog box, locate and select your .db or .sqlite database file, then click "Open".  
4.The database will load, and you'll see its tables and structure displayed in the left-hand panel.  
5.In DB Browser for SQLite, click on the "Execute SQL" tab in the toolbar.  
6.In the "Execute SQL" window, click "File" -> "Import SQL file...", or use copy and paste to import the SQL file.  
7.Select your .sql file and click "Open".  
8.The SQL file’s contents will load into the query editor.    
9.Click "Execute" at the window to run all the SQL commands in the file.  
# Introduce
1.The DOC contains the requirements document(Definition of relational schema with proof that it is in BCNF) in PDF, the UML Class Diagram, the ERD Diagram and result of queries.    
2.The DB contains the PatientManagement.db  
3.The Query contains the create_table.sql and five execute queries.

