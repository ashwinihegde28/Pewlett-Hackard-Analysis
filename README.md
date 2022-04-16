# Pewlett-Hackard-Analysis
Employee Database with SQL

## Overview of Project
Pewlett-Hackard-Analysis project is to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. Then, to provide a report that summarizes the analysis and helps prepare managers for the “silver tsunami” as many current employees reach retirement age. The main task is to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program for the analysis. It includes Data Modeling, Data Engineering and Data Analysis.

### Steps involved
1. Design an ERD that will apply to the data.
2. Create and use a SQL database.
3. Import and export large CSV datasets into pgAdmin.
4. Practice using different joins to create new tables in pgAdmin.
5. Write SQL statements to produce desired outputs.

## Result
1. Created an ER diagram that depicts the relation between 6 different tables from the given .csv files after the Data Modeling process. The same schema is referred throughout the project. <br> <br>
![EmployeeDB Schema](https://github.com/ashwinihegde28/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.PNG)  <br>
3. For the Number of Retiring Employees by Title: 
 - Merged two tables , "Employees" and "Titles" using inner join operation and produced a new table "Retirement Titles" and output in "retirement_titles.csv" <br><br>
   ![Retirement and Titles](https://github.com/ashwinihegde28/Pewlett-Hackard-Analysis/blob/main/Data/Retirement%26Titles.PNG) <br>
 - The table "Retirement Titles" had duplicate entries and also contained the ex-employees so the same was refracted into a new table called "Unique Titles" using        DISTINCT ON, filtering current employees using "where" clause and sorted using "ordered by". The output is captured in "unique_titles.csv" <br><br>
   ![Unique Titles](https://github.com/ashwinihegde28/Pewlett-Hackard-Analysis/blob/main/Data/UniqueTitles.PNG) <br>
 - Using the "Unique Titles", "Retiring Titles" table was created, which resulted in "retiring_titles.csv" using group by and order by functions. This contains the        number of retiring employees by title. <br><br>
   ![Retiring Titles](https://github.com/ashwinihegde28/Pewlett-Hackard-Analysis/blob/main/Data/RetiringTitles.PNG) <br>
3. The Employees Eligible for the Mentorship Program: 
 - Joined three tables "Employees", "Department Employee", "Titles", applied "Distinct on" function, filtered the data using the "Where" clause and sorted using          "Ordered By" and saved the output in "mentorship_eligibilty.csv"  <br><br>
   ![Mentorship Eligibilty](https://github.com/ashwinihegde28/Pewlett-Hackard-Analysis/blob/main/Data/Mentorship%20Eligibilty.PNG) <br>
   
## Summary: 
### 1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
The "silver tsunami" will have a significant impact of leaving 72,458 vacancies. 

### 2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
Mentorship Eligibility table displays potential mentee list is 1,549 employees. The gap between mentors and mentees number is significantly large. 
- This indicates that an extensive hiring process is required in the upcoming years. 
- The employees that retire hold a high knowledge due to their experience hence mentorship program should provide different ways to captivate and record their           experience in the form of softcopies which can also be used as knowledge transfer to the newly hired employees in future.
- The following screenshot mentor eligible employees clearly displays that there are no eligible managers for mentoring program. This must be addressed so that the gap   is filled. <br><br>
   ![Mentee Count By Title](https://github.com/ashwinihegde28/Pewlett-Hackard-Analysis/blob/main/Data/MenteeCountByTitle.PNG) <br>
 









