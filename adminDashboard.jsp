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
            <form action="studentListView.jsp" method="post">
                <input type="submit" class="btn btn-primary" name="target" value="Student List">
            </form>
        </div>

        <div class="col-md-6">
            <form action="registerTeacher.jsp" method="post">
                <input type="submit" class="btn btn-success" name="target" value="Register Teacher">
            </form>
        </div>

        <div class="col-md-6">
            <form action="viewAdmissionList.jsp" method="post">
                <input type="submit" class="btn btn-info" name="target" value="View Admission">
            </form>
        </div>

        <div class="col-md-6">
            <form action="ViewTeacher.jsp" method="post">
                <input type="submit" class="btn btn-primary" name="target" value="Teacher List">
            </form>
        </div>



        <div class="col-md-6">
            <form action="filterEnrollment.jsp" method="post">
                <input type="submit" class="btn btn-dark" name="target" value="Enrolled Student Filter">
            </form>
        </div>

        <div class="col-md-6">
            <form action="ViewCourse.jsp" method="post">
                <input type="submit" class="btn btn-success" name="target" value="Course List">
            </form>
        </div>

    </div>
</div>
</body>
</html>
