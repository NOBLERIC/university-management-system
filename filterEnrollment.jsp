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
        <div class="col-md-0"></div>
        <div class="col-md-12"> <br><br><br>

            <div class="shadow-lg p-3 bg-white">

                <div class="row">
                    <div class="col-md-2">
                        <h6 class="text text-info">Student / Semester</h6>
                        <form action="viewFilterBySemester.jsp" method="POST">
                        <select class="form-control selectSemester" name="selectSemester">

                            <option selected disabled>Select Semester</option>

                        <%
                            try {

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                Statement st= conn.createStatement();
                                String sql="select distinct(stdSemester) from studentenrollment";
                                ResultSet rs=st.executeQuery(sql);

                                while(rs.next())
                                {
                                %>
                                    <option><%= rs.getString("stdSemester")%></option>
                                <%
                                }
                                conn.close();
                                st.close();


                            }catch (Exception ex){
                        %>
                        <%= ex %>
                        <%
                            }
                        %>
                        </select> <br>
                        <button class="btn btn-sm btn-info">Filter</button>
                        </form>
                    </div>






                    <div class="col-md-2">
                        <h6 class="text text-info">Student / Dept & Sem</h6>
                        <form action="viewFilterBySemesterAndDepartment.jsp" method="POST">
                            <select class="form-control" name="selectDepartment">
                                <option selected disabled>Select Dept</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                        Statement st= conn.createStatement();
                                        String sql="select distinct(stdDept) from studentenrollment";
                                        ResultSet rs=st.executeQuery(sql);
                                        while(rs.next())
                                        {
                                %>
                                <option><%= rs.getString("stdDept")%></option>
                                <%
                                    }
                                    conn.close();
                                    st.close();
                                }catch (Exception ex){
                                %>
                                <%= ex %>
                                <%
                                    }
                                %>
                            </select> <div class="mb-3"></div>
                            <select class="form-control selectSemester" name="selectSemester">
                                <option selected disabled>Select Semester</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                        Statement st= conn.createStatement();
                                        String sql="select distinct(stdSemester) from studentenrollment";
                                        ResultSet rs=st.executeQuery(sql);
                                        while(rs.next())
                                        {
                                %>
                                <option><%= rs.getString("stdSemester")%></option>
                                <%
                                    }
                                    conn.close();
                                    st.close();
                                }catch (Exception ex){
                                %>
                                <%= ex %>
                                <%
                                    }
                                %>
                            </select> <br>
                            <button class="btn btn-sm btn-info">Filter</button>
                        </form>
                    </div>


                    <div class="col-md-3">

                        <h6 class="text text-info">Student / Course & Sem</h6>
                        <form action="viewFilterByCourseAndSemester.jsp" method="POST">
                            <select class="form-control" name="stdCourses">

                                <option selected disabled>Select Course</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                        Statement st= conn.createStatement();
                                        String sql="select distinct(stdCourses) from studentenrollment";
                                        ResultSet rs=st.executeQuery(sql);
                                        while(rs.next())
                                        {
                                %>
                                <option><%= rs.getString("stdCourses")%></option>
                                <%
                                    }
                                    conn.close();
                                    st.close();
                                }catch (Exception ex){
                                %>
                                <%= ex %>
                                <%
                                    }
                                %>
                            </select> <div class="mb-3"></div>

                            <select class="form-control selectSemester" name="selectSemester">
                                <option selected disabled>Select Semester</option>
                                <%
                                    try {

                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                        Statement st= conn.createStatement();
                                        String sql="select distinct(stdSemester) from studentenrollment";
                                        ResultSet rs=st.executeQuery(sql);
                                        while(rs.next())
                                        {
                                %>
                                <option><%= rs.getString("stdSemester")%></option>
                                <%
                                    }
                                    conn.close();
                                    st.close();
                                }catch (Exception ex){
                                %>
                                <%= ex %>
                                <%
                                    }
                                %>
                            </select> <br>
                            <button class="btn btn-sm btn-info">Filter</button>
                        </form>
                    </div>



                    <div class="col-md-3">

                        <h6 class="text text-info">Courses / Dept & Sem</h6>
                        <form action="viewCourseBySemesterAndDepartment.jsp" method="POST">
                            <select class="form-control" name="selectDepartment">
                                <option selected disabled>Select Dept</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                        Statement st= conn.createStatement();
                                        String sql="select distinct(stdDept) from studentenrollment";
                                        ResultSet rs=st.executeQuery(sql);
                                        while(rs.next())
                                        {
                                %>
                                <option><%= rs.getString("stdDept")%></option>
                                <%
                                    }
                                    conn.close();
                                    st.close();
                                }catch (Exception ex){
                                %>
                                <%= ex %>
                                <%
                                    }
                                %>
                            </select> <div class="mb-3"></div>
                            <select class="form-control selectSemester" name="selectSemester">
                                <option selected disabled>Select Semester</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                        Statement st= conn.createStatement();
                                        String sql="select distinct(stdSemester) from studentenrollment";
                                        ResultSet rs=st.executeQuery(sql);
                                        while(rs.next())
                                        {
                                %>
                                <option><%= rs.getString("stdSemester")%></option>
                                <%
                                    }
                                    conn.close();
                                    st.close();
                                }catch (Exception ex){
                                %>
                                <%= ex %>
                                <%
                                    }
                                %>
                            </select> <br>
                            <button class="btn btn-sm btn-info">Filter</button>
                        </form>
                    </div>




                    <div class="col-md-2">

                        <h6 class="text text-info">Courses / Student</h6>
                        <form action="viewCourseByStudentName.jsp" method="POST">
                            <select class="form-control" name="selectByName">
                                <option selected disabled>Select Student</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                                        Statement st= conn.createStatement();
                                        String sql="select distinct(students.studentFname) from students join  studentenrollment on students.studentEmail  = studentenrollment.studentEmail";
                                        ResultSet rs=st.executeQuery(sql);
                                        while(rs.next())
                                        {
                                %>
                                <option><%= rs.getString("studentFname")%></option>
                                <%
                                    }
                                    conn.close();
                                    st.close();
                                }catch (Exception ex){
                                %>
                                <%= ex %>
                                <%
                                    }
                                %>
                            </select> <div class="mb-3"></div> <br>
                            <button class="btn btn-sm btn-info">Filter</button>
                        </form>
                    </div>



                </div> <br>

                <center><h3> <b class="text text-danger">Enrolment Student</b></h3></center> <br>

                <table class="table table-striped table-bordered table-sm" style="border:1px solid black;" id="example">
                    <thead class="table-primary text-dark">
                    <tr>
                        <th>Id</th>
                        <th>Student Names</th>
                        <th>Student Id</th>
                        <th>Semester</th>
                        <th>Department</th>
                        <th>Courses</th>
                        <th>Date</th>
                        <%--                        <th>View</th>--%>
                    </tr>
                    </thead>

                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/aucaregustrationmodule","root","");
                            Statement st= conn.createStatement();
                            String sql="select students.studentFname,students.studentLname,studentenrollment.stdentId,studentenrollment.stdSemester,studentenrollment.stdDept,studentenrollment.stdCourses,studentenrollment.enrDate from students join  studentenrollment on students.studentEmail  = studentenrollment.studentEmail";
                            ResultSet rs=st.executeQuery(sql);
                            int id =0;
                            while (rs.next())
                            {
                                id += 1;
                                String stNames  = rs.getString("studentFname") +" "+ rs.getString("studentLname");
                            %>
                            <tr>
                                <td><%= id %></td>
                                <th><%= stNames  %></th>
                                <th><%=  rs.getString("stdentId") %></th>

                                <th><%=  rs.getString("stdSemester") %></th>
                                <th><%=  rs.getString("stdDept") %></th>
                                <th><%= rs.getString("stdCourses") %></th>
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
        <div class="col-md-0"></div>
    </div>
</div>
</body>
</html>
