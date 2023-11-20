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

@WebServlet(name = "CourseReg", value = "/CourseReg")
public class CourseReg extends HttpServlet {

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

            String courseName  = req.getParameter("name");
            String courseCode  = req.getParameter("code");
            String courseDesc  = req.getParameter("description");

            String Query="insert into course set courseName=?,courseCode=?,courseDesc=?";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);

            Ps.setString(1, courseName);
            Ps.setString(2, courseCode);
            Ps.setString(3, courseDesc);
            Ps.executeUpdate();
            resp.sendRedirect("ViewCourse.jsp");

        }catch (Exception ex){
            out.println(ex);
        }
    }
}
