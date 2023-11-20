<%@ page import="java.sql.*" %>
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

        /*form {*/
        /*    width: 80%;*/
        /*    margin: 0 auto;*/
        /*    padding: 20px;*/
        /*    border: 1px solid #ccc;*/
        /*    border-radius: 5px;*/
        /*    background-color: #f9f9f9;*/
        /*}*/

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
    </style>
    <title>AUCA Student Admission Form</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<img src="AUCA.PNG" alt="Logo" class="logo">
<div id="student-admission" class="container">
    <h3>

        <%= "Welcome Dear " +(String)session.getAttribute("studentemail") %>
    </h3>
    <br/>

    <div class="row">
        <div class="col-md-6">
            <a href="stDashboard.jsp" class="btn btn-primary btn-sm">Home</a>
        </div>

        <div class="col-md-6">
            <a  href="viewAdmissionStatus.jsp" class="btn btn-dark btn-sm">View  Admision Status</a>
        </div>

    </div>

    <br><br>



    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6"> <br>

            <%



                try {

                    String studentemail  = (String)session.getAttribute("studentemail");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                    Statement st= conn.createStatement();
                    String sql="select * from students where studentEmail='"+studentemail+"'";

                    ResultSet rs=st.executeQuery(sql);

                    String studentNames  = "";

                    while (rs.next())
                    {
                        studentNames  = rs.getString("studentFname") +" "+ rs.getString("studentLname");
                    %>

                        <center><h4> <b class="text text-danger"> STUDENT BASIC INFO</b></h4></center>

                        <table class="table table-striped table-bordered table-sm">
                            <thead class="bg-info text-white">
                              <tr>
                                  <th>Data</th>
                                  <th>Value</th>
                              </tr>
                            </thead>

                              <tr>
                                  <th>Student Names</th>
                                  <td><%= studentNames %></td>
                              </tr>

                              <tr>
                                  <th>Student Gender</th>
                                  <td><%= rs.getString("studentGender") %></td>
                              </tr>

                              <tr>
                                  <th>Student Phone</th>
                                  <td><%= rs.getString("studentPhone") %></td>
                              </tr>

                            <tr>
                                <th>Student Address</th>
                                <td><%= rs.getString("studentAddress") %></td>
                            </tr>

                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>

                            <tr>
                                <td colspan="2">

                                    <form action="admissionRequest" method="POST">
                                    <input type="hidden" name="studentEmail" value="<%=rs.getString("studentEmail") %>">
                                    <button class="btn btn-primary btn-block">Request Admission</button>
                                    </form>
                                </td>
                            </tr>






                        </table>

                    <%}


                }catch (Exception ex){
                %>
                    <%= ex %>
                <%
                }
            %>



        </div>
        <div class="col-md-3"></div>

    </div>




</div>
</body>
</html>