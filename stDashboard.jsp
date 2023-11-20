<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

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
        input[type="tel"],
        input[type="password"],

        input[type="submit"],
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


         body {
             background-image: url('gishushu.jpg'); /* Replace with the actual URL or path to your background image */
             background-size: cover;
             background-repeat: no-repeat;
             background-attachment: fixed;
         }

    </style>
    <title>AUCA Student Admission Form</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<div id="student-admission" class="container">
    <h3>

        <%= "Welcome Dear " +(String)session.getAttribute("studentemail") %>
    </h3>
    <br/>

    <div class="row">
        <div class="col-md-4">
            <a href="requestAdmission.jsp" class="btn btn-info btn-lg">Request Admission</a>
        </div>

        <div class="col-md-4">
            <a  href="viewEnrollment.jsp" class="btn btn-warning btn-lg">View Enrollment</a>
        </div>

        <div class="col-md-4">
            <a  href="viewAdmissionStatus.jsp" class="btn btn-dark btn-lg">View  Admision Status</a>
        </div>

    </div>
</div>
</body>
</html>