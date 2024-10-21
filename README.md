# Assignment 4:  Query a Database with SQL
This project demonstrates SQL skills using an SQLite sample database The tasks in this assignment are completed using SQL queries, which are run on the provided sample database from [MediaDB.db](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/DB_Sample/MediaDB.db).
# Prerequisites
To run this project, make sure you have the following installed:  
1.Node.js: [Download here](https://nodejs.org/zh-cn/).  
2.SQLite: The SQLite CLI or an SQLite GUI tool such as DB Browser for SQLite(I used DataGrip)  
# Steps to Set Up the Environment
1.Clone this repository  
2.Download the SQLite sample database from the link below: [MediaDB.db](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/DB_Sample/MediaDB.db).  
3.Place the downloaded  MediaDB.db file in the root directory of this project.  
4.Install the necessary dependencies:  
```bash
npm install sqlite3
```
# Instructions for the Assignment
Query 1: What are the last names and emails of all customer who made purchased in the store?        
[query1](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query1.sql)  
Query 2: What are the names of each album and the artist who created it?      
[query2](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query2.sql)    
Query 3: What are the total number of unique customers for each state, ordered alphabetically by state?  
[query3](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query3.sql)      
Query 4: Which states have more than 10 unique customers?    
[query4](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query4.sql)     
Query 5: What are the names of the artists who made an album containing the substring "symphony" in the album title?      
[query5](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query5.sql)       
Query 6: What are the names of all artists who performed MPEG (video or audio) tracks in either the "Brazilian Music" or the "Grunge" playlists?      
[query6](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query6.sql)       
Query 7: How many artists published at least 10 MPEG tracks?     
[query7](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query7.sql)          
Query 8: What is the total length of each playlist in hours? List the playlist id and name of only those playlists that are longer than 2 hours, along with the length in hours rounded to two decimals.     
[query8](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query8.sql)  
Query 9: Creative addition: Define a new meaningful query using at least three tables, and some window function. Explain clearly what your query achieves, and what the results mean.  
[query9](https://github.com/hansama0902/hansama0902-DBMS_Assignment_QueryDatabaseWithSQL/blob/main/Query/query9.sql) 
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
