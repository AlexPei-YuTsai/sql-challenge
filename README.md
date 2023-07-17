# SQL Challenge
> How can I wrangle structured data to answer questions about collected information?
## Folder Contents
- A folder of the 6 `.csv` files used for this project.
- A `.png` image of the Entity Relationship Diagram relating each of the 6 aforementioned files to each other.
- The `.txt` script used on [QuickDBD](https://app.quickdatabasediagrams.com/#/) in order to generate that `.png` image.
- An `employee_schema.sql` file used to build the tables on a local Relational Database Management System (RDBMS).
- An `employee_analysis.sql` file used to manipulate the imported tables and answer questions about the data.

### Installation/Prerequisites
- Make sure you can run SQL and import all the CSV data in this directory. The code used was developed on pgAdmin4 and PostgreSQL 15.3 is the RDBMS used for implementation and testing.
  - Both Postgres and pgAdmin4 can be downloaded from the [same EDB download link here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) and no stacks or plug-ins were used during the creation of the attached SQL scripts.
- In order to run the analysis code, these are the steps needed:
  1. On pgAdmin, open a database or create one through the GUI's Object Explorer.
    ![Screenshot for step 1](https://cdn.discordapp.com/attachments/939673945240637450/1130422881709461564/image.png)

  2. Right click on whatever database you'll be working in and open the Query Tool.
    ![Screenshot for step 2](https://cdn.discordapp.com/attachments/939673945240637450/1130423081047961660/image.png)
     
  3. Open a file through pgAdmin or copy the code from `employee_schema.sql` into the Query Tool and run it.
    ![Screenshot for step 3](https://cdn.discordapp.com/attachments/939673945240637450/1130423443679084544/image.png)
  
  4. Once you've run it, you can right click on your database like you did in Step 2 and click Refresh in order to update what you see in the Object Explorer. In the collection of dropdown menus under your database, expand Schemas, then Public, and navigate down to Tables. If everything goes well, you should see 6 new table schemas in your SQL navigator.
    ![Screenshot for step 4](https://cdn.discordapp.com/attachments/939673945240637450/1130423992071761982/image.png)
  
  5. At which point, you can right click on each of the 6 tables, click on the Import/Export Data options, and set up your file paths like you would when you upload a picture onto your social media platform of choice. Be sure to go to Options and toggle on the Header option to account for the first row of the CSVs.
    ![Screenshot for step 5](https://cdn.discordapp.com/attachments/939673945240637450/1130425448829046805/image.png)
     
  6. Finally, you can open the `employee_analysis.sql` file, highlight the query you want, and run it to see the results reflected in the output. Do note that, unlike Python Notebooks and other software, pgAdmin only returns the results of the *last* called query. Running the entire file will not print out all the results of every query.
    ![Screenshot for step 6](https://cdn.discordapp.com/attachments/939673945240637450/1130424488371171369/image.png)

## Data Analysis
### Brief Data Introduction
The project uses Postgres to analyze mocked up employee data of a fictional company. There are 6 files:
1. `departments.csv` lists the different departments of the company.
2. `dept_emp.csv` lists the different department(s) each employee of the company belongs to.
3. `dept_manager.csv` lists the different people in charge of each department of the company.
4. `employees.csv` lists the employees of the company and some of their descriptions.
5. `salaries.csv` lists the salaries of each employee of the company.
6. `departments.csv` lists the different titles an employee of the company can have.

### Entity Relationships
![Entity Relationship Diagram for this project](https://cdn.discordapp.com/attachments/939673945240637450/1130419500819415090/image.png)

Explanations can all be found in the `.txt` file attached in this directory, but I might as well explain how I determined some of the one-to-many or many-to-many relationships.
1. Check for connections
2. Sort data
3. Check for duplicates

The first thing to do is always to read through the tables and try to understand what's going on. With shared column names, it takes a while to understand the logic and what is being conveyed. After doing that, it would be possible to scroll through the files on Excel and manually determine the relationships between relevant, connected tables, but 2 of the 6 tables have over 300,000 rows of data, making this approach not so feasible. 

However, the `employees.csv` listing employee details had roughly 300,000 rows while `dept_emp.csv` listing which department each employee belonged to had roughly 330,000 rows. This informs me that while a single department can be responsible for many employees, a single employee can also be working for many departments at the same time like some overworked pack mule, making their connection a many-to-many rather than a one-to-many.

### Importing and Manipulating Data
This is the more menial part of the process. Since I'm working with pgAdmin, any `.csv` imports are done manually as per the procedure listed in the Installations section at the top of this README. Although my ERD isn't perfect and the schemas based on that diagram could be improved upon, they are good enough for me to navigate through and merge with in order to get all the data I need.

Notable results can be found in the comments of the `employee_analysis.sql` scripts, so I do recommend reading through them and replicating my results for verification purposes.
![An example of the results to be seen](https://cdn.discordapp.com/attachments/939673945240637450/1130430870101184522/image.png)

## Resources that helped a lot
Unfortunately, there are very many ways to run SQL. Similar to how there's a myriad of programming languages and tech stacks one could use to get their product online, there are many different options to managing a relational database such as PostgreSQL, MySQL, SQLite, and Oracle Database. Fortunately, though the documentation for each RDBMS varies, the skills needed to handle SQL are largely interexchangeable.
- [Kevin Stratvert's SQL Tutorial](https://www.youtube.com/watch?v=h0nxCDiD-zg) provides a good start, though he operates on Microsoft's SQL software.
- I used this [pgAdmin Tutorial](https://www.youtube.com/watch?v=WFT5MaZN6g4) as it's how I interfaced with Postgres to get all of my work for this project done.
- [Free Code Camp's Postgres Tutorial](https://www.youtube.com/watch?v=qw--VYLpxG4) is also helpful, though it's 4 hours long. Peruse at your own leisure.

Much of the unique quirks of the language I found were best understood through online inquiries and, as usual, the documentation. For example:
- The `YEAR()` function cannot be used as that syntax is not compatible with Postgres, so, according to this [StackOverflow response](https://stackoverflow.com/a/29494990), you would instead use `EXTRACT(some_time_interval FROM some_column)` in order to do date extraction through pgAdmin/PostgreSQL. The [exact documentation for Postgres datetime functions](https://www.postgresql.org/docs/current/functions-datetime.html) can be found in this hyperlink.
- Similarly, string manipulation relies on [string functions](https://www.postgresql.org/docs/9.1/functions-string.html).
  
## FINAL NOTES
> Project completed on June 22, 2023
