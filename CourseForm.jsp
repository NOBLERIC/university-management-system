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

    <form action="CourseReg" method="POST">
        <label for="name">Course Name</label>
        <input type="text" id="name" name="name" required><br>
        <label for="code">Course Code</label>
        <input type="text" id="code" name="code" required><br>
        <label for="description">Course Description</label>
        <input type="text" id="description" name="description" required><br>
        <input type="submit" value="Confirm">
    </form>
</div>
</body>
</html>