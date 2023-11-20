<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>

        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .container{
            width: 40%;
            margin:0 auto;
        }

        .logo {
            max-width: 100%; /* Ensure the logo doesn't exceed its original width */
            margin-bottom: 20px; /* Add space between the logo and the form */
        }

        form {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="phone"],
        input[type="password"],
        input[type="submit"],
        input[type="qualification"],

        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <title>AUCA Student Admission Form</title>
</head>
<body>
<img src="AUCA.PNG" alt="Logo" class="logo">
<div id="student-admission" class="container">
    <h1><%= "AUCA Lecturer Registration Form" %>
    </h1>
    <br/>



    <%
        HttpSession ReceiveParameter= request.getSession(true);
        ReceiveParameter.setAttribute("parameters","parameterNames");
    %>

    <form action="registerLecturer" method="POST">
        <label for="name">Names:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="course">Course:</label>
        <select id="course" name="course">
            <option >Select Courses</option>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                    Statement st= conn.createStatement();
                    String sql="select *  from course";
                    ResultSet rs=st.executeQuery(sql);
                    while(rs.next())
                    {
                    %>
                    <option><%= rs.getString("courseName")%></option>
                    <%
                    }
                    conn.close();
                    st.close();
                    }catch (Exception ex){
                    %>
                    <%= ex %>
                    <%
                    }
                    %>
        </select><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="phone">Phone:</label>
        <input type="phone" id="phone" name="phone" required><br>

        <option >Select Your Qualification</option>
        <select id="qualification" name="qualification">
            <option >Select Your Qualification</option>
            <option value="Masters">Masters</option>
            <option value="PHD">PHD</option>
            <option value="Professor">Professor</option>
        </select><br>

        <select id="time" name="time">
            <option >Select Day available</option>
            <option value="Monday">Monday</option>
            <option value="Tuesday">Tuesday</option>
            <option value="Wednesday">Wednesday</option>
            <option value="Thursday">Thursday</option>
            <option value="Friday">Friday</option>
            <option value="Sunday">Sunday</option>
        </select><br>

        <select id="LectureStatus" name="LectureStatus">
            <option >Select Lecture Status</option>
            <option value="Tutor">Tutor</option>
            <option value="Assistant">Assistant</option>
        </select><br>

        <input type="submit" value="submit">
    </form>
</div>
</body>
</html>