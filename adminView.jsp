<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Server-Side Redirect</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            background-image: url('gishushu.jpg'); /* Replace with the actual URL or path to your background image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>

    <style>
        /* CSS styles go here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }a

         h2 {
             color: #333;
         }

        .container{
            width: 40%;
            margin:0 auto;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<h1></h1>
<div class="container text-center">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2>Admin Login Form</h2>
            <form action="adminMustLogin" method="post">
                <label for="email">Admin Username :</label>
                <input type="text" id="email" name="adminUsername" placeholder="Please Enter Your Email" required><br><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="adminPassword" placeholder="Please Enter Your Password" required><br><br>

                <input type="submit" value="Login" >
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>
