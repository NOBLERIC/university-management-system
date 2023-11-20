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
</head>
<body>
<h1></h1>
<div class="container text-center">
    <div class="row">
        <div class="col-md-6">
            <form action="admission.jsp" method="post">
                <button type="submit" class="btn btn-primary btn-lg" name="target" value="Admission">Create Account</button>
            </form>
        </div>
        <div class="col-md-6">
            <form action="studentLogin.jsp" method="post">
                <button type="submit" class="btn btn-primary btn-lg" name="target" value="Enroll Course">Student Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
