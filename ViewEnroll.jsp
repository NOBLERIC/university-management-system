<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.demo.hibernatedemo.bean.StudentAdmissionForm" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Admission List</title>
</head>
<body>
<h1>Students Enrolled courses List</h1>
<table border="1">
    <tr>
        <th>Student Id</th>
        <th>Department</th>
        <th>Course</th>
        <th>Semester</th>

    </tr>
    <%
        try {
            // Establish a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/Students";
            String dbUser = "root";
            String dbPassword = ""; // Replace with your database password

            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String query = "SELECT * FROM courseenrolment";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String StudentId = resultSet.getString("StudentId");
                String Course = resultSet.getString("course");
                String Semester= resultSet.getString("semester");
                String Department= resultSet.getString("department");

    %>
    <tr>
        <td><%= StudentId %></td>
        <td><%= Department %></td>
        <td><%= Course %></td>
        <td><%= Semester %></td>


    </tr>
    <%
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
