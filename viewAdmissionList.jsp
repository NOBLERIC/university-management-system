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
                <center><h3> <b class="text text-danger">Admission Request  List</b></h3></center> <br>

                <table class="table table-striped table-bordered table-sm" style="border:1px solid black;" id="example">
                    <thead class="table-success text-dark">
                    <tr>
                        <th>#Id</th>
                        <th>std Names</th>
                        <th>std Gender</th>
                        <th>std Address</th>
                        <th>Admission Status</th>
                        <th>Admit</th>
                        <th>Reject</th>
<%--                        <th>View</th>--%>
                    </tr>
                    </thead>

                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                            Statement st= conn.createStatement();
                            String sql="select students.studentFname,students.studentLname,students.studentEmail,students.studentAddress,students.studentAddress,students.studentGender,studentregistration.studentEmail,studentregistration.admiId,studentregistration.admisStatus,studentregistration.admisDate from students join studentregistration on studentregistration.studentEmail    = students.studentEmail";
                            ResultSet rs=st.executeQuery(sql);
                            int id =0;
                            while (rs.next())
                            {
                              id += 1;
                              String stNames  = rs.getString("studentFname") +" "+ rs.getString("studentLname");
                            %>
                            <tr>
                                <td><%= id %></td>
                                <td><%= stNames %></td>
                                <td><%= rs.getString("studentGender") %></td>
                                <td><%= rs.getString("studentAddress") %></td>
                                <td><%
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
                                %></td>
                                <td><a href="AdmitStudent?reqId=<%=rs.getString("admiId")%>">  <button class="btn btn-info btn-sm" onclick="return window.confirm('Are Sure You Want To Admit This Student??')">Admit</button></a></td>
                                <td><a href="rejectStudent?reqId=<%=rs.getString("admiId")%>"> <button class="btn btn-danger btn-sm" onclick="return window.confirm('Are Sure You Want To Reject This Admition??')">Reject</button></a></td>
<%--                                <td><a class="btn btn-primary btn-sm">View</a></td>--%>
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
