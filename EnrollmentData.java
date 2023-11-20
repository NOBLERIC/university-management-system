package com.example.demoauca;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "EnrollmentData", value = "/EnrollmentData")
public class EnrollmentData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out  = resp.getWriter();

        String StudentId     = req.getParameter("StudentId");
        String semester      = req.getParameter("semester");
        String department    = req.getParameter("department");
        String course        = req.getParameter("course");
        String studentEmail = req.getParameter("studentEmail");

        try{

            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Statement st= Conn.createStatement();


            String selQuery="select course.courseName,teacher.lecturerCourse,teacher.lecturerStatus,teacher.lecturerName from course join teacher on teacher.lecturerCourse = course.courseName where course.courseName='"+course+"'";
            ResultSet rs=st.executeQuery(selQuery);
            String teacherStatus = "";
            String techerName    = "";

            while (rs.next()){
                teacherStatus = rs.getString("lecturerStatus");
                techerName    = rs.getString("lecturerName");
            }

            String Query="insert into studentenrollment set stdentId=?,stdSemester=?,stdDept=?,stdCourses=?,studentEmail=?,teacherStatus=?,teacherName=?";
            Ps = Conn.prepareCall(Query);
            Ps.setString(1, StudentId);
            Ps.setString(2, semester);
            Ps.setString(3, department);
            Ps.setString(4, course);
            Ps.setString(5, studentEmail);
            Ps.setString(6, teacherStatus);
            Ps.setString(7, techerName);
            Ps.executeUpdate();

            resp.sendRedirect("viewEnrollment.jsp");

        }catch (Exception ex){
            out.println(ex);
        }

    }
}
