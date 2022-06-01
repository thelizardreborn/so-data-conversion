# so-data-conversion
Scripts and database schema for SO Data converion

## Machine Prep
1. Install a MySQL server (or MariaDB server)
2. Install `dbf2mysql`

## Data Import
### Prep DBF File
The DBF File can be edited in Excel or LibreOffice. Most columns will be empty, except Bib and Qualifying times.

Update the field headers to have reasonable size limits:
ENTRANT_NA,C,50	GENDER,C,1	DOB,D	AGE,N,9,0	AGE_GROUP,C,10	DELEGATION,C,40	BIB__,N,9,0	EVENT,C,40	FINAL_DIVI,C,6	QUAL_S,C,8	QUAL_N,F,9,0	TEAM,C,48	SPORT,C,10

Copy missing data over from the Excel file of entry data. Some columns will need truncated to a single character ("gender", in particular).

You may need to adjust the column headers further if you get errors when saving the file.

### Import the DBF
Copy the DBF to the machine that is running `dbf2mysql` and MySQL. Create a database to use for the data:
```
CREATE DATABASE `SO`;
```

At the command line, use `dbf2mysql` to convert the DBF file into an `Entries` table in the new MySQL database. For example:
```
dbf2mysql -vvvc -d SO -t Entries -h localhost datafile.DBF
```

Connect to the database and check the contents of the `Entries` table to make sure the import worked.

### Data Modifications
Divisioning depends on an external table - `so_divisions`. If you're not re-using a previous year's setup, you can create this table from [here](schema/so_divisions.sql)

Some of the data needs converted to simplify generating data files that can be used downstream. Run the [conversion queries](schema/conversion-queries.sql)

### Exporting the Data
If the views don't already exist, create the [athlete](views/i-records.sql), [entry](views/d-records.sql), and [relay](views/r-records.sql) views.

You can create simple SQL files on the database machine containing queries to select all the records from these views. Run these files into the database, and dump the results to a CSV file. For example:
```
echo "SELECT * FROM athletes;" > athletes.sql
mysql SO < athletes.sql > athletes.csv
```

Use your favorite text editor to replace all occurances of TAB characters with semicolons (`;`) in each file. The resulting CSVs are ready to import.
