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
    <title>Enrolment Form</title>
</head>
<body>
<img src="AUCA.PNG" alt="Logo" class="logo">
<div id="student-admission" class="container">
    <h1><%= "Enrolment Form" %>
    </h1>
    <br/>



    <%
        HttpSession ReceiveParameter= request.getSession(true);
        ReceiveParameter.setAttribute("parameters","parameterNames");
    %>

    <form action="/EnrolForm" method="POST">
        <label for="StudentId">Student ID Number</label>
        <input type="text" id="StudentId" name="StudentId" required><br>

        <select id="semester" name="semester">
            <option >Select Semeter</option>
            <option value="One">I</option>
            <option value="Two">II</option>
            <option value="Three">III</option>
            <option value="Four">Iv</option>
            <option value="Five">V</option>
            <option value="Six">VI</option>
            <option value="Seven">VII</option>
            <option value="Eight">VIII</option>
        </select><br>

        <select id="department" name="department">
            <option >Select Department</option>
            <option value="Software Engineering">Software Engineering</option>
            <option value="Network and Communication System">Network and Communication System</option>
            <option value="InformationManagement">Information Management</option>
        </select><br>

        <select id="Course" name="course">
            <option >Select Semeter</option>
            <option value="oop">OOP</option>
            <option value="c">C Programing</option>
            <option value="Multivariable">Multibariable</option>
            <option value="bible">Bible Doctrine</option>
            <option value="English">English</option>
            <option value="Java">Java</option>

        </select><br>

        <input type="submit" value="Confirm">
    </form>
</div>
</body>
</html>