<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
    <div class="col-md-1"></div>
    <div class="col-md-10"> <br><br><br>

      <div class="shadow-lg p-3 bg-white">


        <center><h5> <b class="text text-info">List Of Courses Per Dept <%= request.getParameter("selectDepartment")%>  and Semester  <%= request.getParameter("selectSemester") %> </b></h5></center> <br>

        <table class="table table-striped table-bordered table-sm" style="border:1px solid black;" id="example">
          <thead class="table-primary text-dark">
          <tr>
            <th>Id</th>
            <th>Courses</th>
            <th>Tutor/Assistant</th>
            <th>Date</th>
          </tr>
          </thead>

          <%
            try {
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
              Statement st= conn.createStatement();
              String filterSmester  = request.getParameter("selectSemester");
              String selectDepartment  = request.getParameter("selectDepartment");

              String sql="select students.studentFname,students.studentLname,studentenrollment.stdentId,studentenrollment.stdSemester,studentenrollment.stdDept,studentenrollment.stdCourses,studentenrollment.enrDate,studentenrollment.teacherStatus,studentenrollment.teacherName from students join  studentenrollment on students.studentEmail  = studentenrollment.studentEmail where studentenrollment.stdSemester='"+filterSmester+"' and studentenrollment.stdDept='"+selectDepartment+"'";
              ResultSet rs=st.executeQuery(sql);
              int id =0;
              while (rs.next())
              {
                id += 1;
          %>
          <tr>
            <td><%= id %></td>
            <th><%= rs.getString("stdCourses") %></th>
            <th><%= rs.getString("teacherStatus") %> <%= rs.getString("teacherName") %> </th>
            <td><%=  rs.getString("enrDate") %></td>
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

    </div>
    <div class="col-md-1"></div>
  </div>
</div>
</body>
</html>
