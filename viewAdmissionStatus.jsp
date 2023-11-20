<%@ page import="java.sql.*" %>
<%@ page import="static javax.print.attribute.standard.JobState.PENDING" %>
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
    <div class="col-md-4">
      <a href="requestAdmission.jsp" class="btn btn-primary btn-sm">Home</a>
    </div>

    <div class="col-md-4">
      <a  href="viewEnrollment.jsp" class="btn btn-warning btn-lg">View Enrollment</a>
    </div>

    <div class="col-md-4">
      <a  href="viewAdmissionStatus.jsp" class="btn btn-dark btn-sm">View  Admision Status</a>
    </div>

  </div>

  <br><br>



  <div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8"> <br>


      <center><h4> <b class="text text-info">Admission Status</b></h4></center>

      <table class="table table-striped table-bordered table-sm">
        <thead class="bg-dark text-white">
        <tr>
          <th>Id</th>
          <th>Student Email</th>
          <th>Admission Status</th>
          <th>Date</th>
          <th>Enrollment</th>
        </tr>
        </thead>

      <%
        try {
              String studentemail  = (String)session.getAttribute("studentemail");
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
              Statement st= conn.createStatement();
              String sql="select students.studentFname,students.studentLname,students.studentEmail,studentregistration.studentEmail,studentregistration.admiId,studentregistration.admisStatus,studentregistration.admisDate from students join studentregistration on studentregistration.studentEmail    = students.studentEmail  where studentregistration.studentEmail='"+studentemail+"'";
              ResultSet rs=st.executeQuery(sql);
              String studentNames  = "";
              int id =0;

              while (rs.next())
              { id += 1;
              %>
                <tr>
                  <td><%= id %></td>
                  <th><%= rs.getString("studentEmail") %></th>
                  <td>
                    <%
                      if (rs.getString("admisStatus").equals("PENDING"))
                      {
                      %>
                        <span class="badge badge-warning"><b>PENDING...</b></span>
                      <%
                      }else if (rs.getString("admisStatus").equals("ADMITED")) {
                      %>
                           <span class="badge badge-success"><b>ADMITED</b></span>
                      <%
                      }else if (rs.getString("admisStatus").equals("REJECTED")){
                      %>
                        <span class="badge badge-danger"><b>REJECTED</b></span>
                      <%
                      }
                    %>
                  </td>
                  <td><%= rs.getString("admisDate") %></td>
                  <td>
                    <%
                      if (rs.getString("admisStatus").equals("PENDING"))
                      {
                    %>
                    <span class="badge badge-warning"><b>Wait...</b></span>
                    <%
                    }else if (rs.getString("admisStatus").equals("ADMITED")) {
                    %>
                      <a href="EnrollStudent.jsp" class="btn btn-sm btn-info">Enrollment</a>
                    <%
                    }else if (rs.getString("admisStatus").equals("REJECTED")){
                    %>
                    <span class="badge badge-danger"><b>REJECTED</b></span>
                    <%
                      }
                    %>
                  </td>

                </tr>
              <%}

      }catch (Exception ex){
      %>
      <%= ex %>
      <%
        }
      %>

      </table>

    </div>
    <div class="col-md-2"></div>
  </div>

</div>
</body>
</html>