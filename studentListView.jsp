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
                <center><h3> <b class="text text-info">REGISTED STUDENT LIST</b></h3></center> <br>

                <table class="table table-striped table-bordered table-sm" style="border:1px solid black;" id="example">
                    <thead class="table-dark text-white">
                    <tr>
                      <th>#Id</th>
                      <th>std Fname</th>
                      <th>std Lname</th>
                      <th>std Gender</th>
                      <th>std DOB</th>
                      <th>std Address</th>
                      <th>std Reg Date</th>
                    </tr>
                    </thead>

                    <%
                        try {
                            String studentemail  = (String)session.getAttribute("studentemail");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                            Statement st= conn.createStatement();
                            String sql="select * from  students";
                            ResultSet rs=st.executeQuery(sql);
                            int id =0;

                            while (rs.next())
                            { id += 1;
                            %>
                            <tr>
                                <td><%= id %></td>
                                <th><%= rs.getString("studentFname") %></th>
                                <td><%= rs.getString("studentLname") %></td>
                                <td><%= rs.getString("studentGender") %></td>
                                <td><%= rs.getString("studentDob") %></td>
                                <td><%= rs.getString("studentAddress") %></td>
                                <td><%= rs.getString("regDate") %></td>
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
