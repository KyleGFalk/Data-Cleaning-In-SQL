# Data-Cleaning-In-SQL

<a href= "https://github.com/KyleGFalk/Data-Cleaning-In-SQL/blob/main/Data%20Cleaning%20Project.sql">SQL statements used to clean the data can be viewed here.</a>

<a href= "https://github.com/KyleGFalk/Data-Cleaning-In-SQL/blob/main/Nashville%20Housing%20Clean%20Data.xlsx">Clean Data can be downloaded and viewed here.</a>

A large part of a data analyst's job is to clean data before it can be queried. This project describes the data cleaning process using <a href= "https://github.com/KyleGFalk/Data-Cleaning-In-SQL/blob/main/Nashville%20Housing%20Dirty%20Data.xlsx">Nashville housing data</a>. We started by standardizing the data format to change the Date column to the correct format. Next, I populated the property address column by joining two of the same tables and using the ISNULL function to replace the NULL values with addresses. I then broke down the property address and owner address columns from STREET, CITY, STATE into separate columns to make the data easier to read and query. One for the street, one for the city, and another for the state. The raw data set had four values for yes and no: "yes", "y", "no", and "n". So I changed all the "y" and "n" values to "yes" and "no". Lastly, I removed duplicate data with CTEs and deleted unused columns.

</p>

<p align="center">
<img src="https://images.pexels.com/photos/1370704/pexels-photo-1370704.jpeg?auto=compress&cs=tinysrgb&w=800"
  alt="Size Limit comment in pull request about bundle size changes">
  
</p>
  </a>
</p>
