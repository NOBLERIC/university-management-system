package com.example.demoauca;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "registerLecturer", value = "/registerLecturer")
public class registerLecturer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out  = resp.getWriter();

        try {
            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;

            String lecturerName    = req.getParameter("name");
            String lecturerCourse  = req.getParameter("course");
            String lecturerEmail   = req.getParameter("email");
            String lecturerPhone   = req.getParameter("phone");
            String lecturerQualif  = req.getParameter("qualification");
            String lecturerAvailability  = req.getParameter("time");
            String lecturerStatus  = req.getParameter("LectureStatus");


            String Query="insert into teacher set lecturerName=?,lecturerCourse=?,lecturerEmail=?,lecturerPhone=?,lecturerQualif=?,lecturerAvailability=?,lecturerStatus=?";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);

            Ps.setString(1, lecturerName);
            Ps.setString(2, lecturerCourse);
            Ps.setString(3, lecturerEmail);
            Ps.setString(4, lecturerPhone);
            Ps.setString(5, lecturerQualif);
            Ps.setString(6, lecturerAvailability);
            Ps.setString(7, lecturerStatus);
            Ps.executeUpdate();
            resp.sendRedirect("ViewTeacher.jsp");

        }catch (Exception ex){
            out.println(ex);
        }
    }
}
