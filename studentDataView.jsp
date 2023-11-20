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
<h1>Student Admission List</h1>
<table border="1">
    <tr>
        <th>First Name</th>
        <th>Second Name</th>
        <th>Email</th>
        <th>Date of Birth</th>
        <th>Father's Name</th>
        <th>Mother's Name</th>
        <th>Gender</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Department</th>
    </tr>
    <%
        try {
            // Establish a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/Students";
            String dbUser = "root";
            String dbPassword = ""; // Replace with your database password

            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String query = "SELECT * FROM StudentAdmissionForm";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String firstName = resultSet.getString("firstName");
                String secondName = resultSet.getString("secondName");
                String email = resultSet.getString("email");
                String dob = resultSet.getString("dob");
                String fatherName = resultSet.getString("fatherName");
                String motherName = resultSet.getString("motherName");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String phone = resultSet.getString("phone");
                String department = resultSet.getString("department");
    %>
    <tr>
        <td><%= firstName %></td>
        <td><%= secondName %></td>
        <td><%= email %></td>
        <td><%= dob %></td>
        <td><%= fatherName %></td>
        <td><%= motherName %></td>
        <td><%= gender %></td>
        <td><%= address %></td>
        <td><%= phone %></td>
        <td><%= department %></td>
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
