# Data-Cleaning-In-SQL

A large part of a data analysts job is to clean data before it can be queried. This project describes the data cleaning process using Nashville housing data. We started by standardizing the data format to change the Date column to the correct format. Next, I populated the property address column by joining two of the same tables, and using the ISNULL function to replace the NULL values with addresses. I then broke down the property address and owner address columns from STREET,CITY,STATE into seperate columns to make the data easier to read and query. One for street, one for city, and another for state. The raw data set had four values for yes and no: "yes", "y", "no", "n". So I changed all the "y" and "n" values to "yes" and "no". Lastly I removed duplicate data with CTE's and deleted unused columns.

</p>

<p align="center">
<img src="https://nccid.ca/wp-content/uploads/sites/2/2020/06/iStock-1203426591-scaled.jpg"
  alt="Size Limit comment in pull request about bundle size changes"
  width="686" height="289">
</p>
  </a>
</p>
