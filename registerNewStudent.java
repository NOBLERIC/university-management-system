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

@WebServlet(name = "registerNewStudent", value = "/addNewStudent")
public class registerNewStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out  = resp.getWriter();

        String firstName   = req.getParameter("firstName");
        String secondName  = req.getParameter("secondName");
        String email       = req.getParameter("email");
        String dob         = req.getParameter("dob");
        String fatherName  = req.getParameter("fatherName");
        String motherName  = req.getParameter("motherName");
        String gender      = req.getParameter("gender");
        String address     = req.getParameter("address");
        String phone       = req.getParameter("phone");
        String studentPassword = "auca@123";

        try {

            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;

            String Query="insert into students set studentFname=?,studentLname=?,studentGender=?,studentPhone=?,studentEmail=?,studentAddress=?,studentFatherName=?,studentMotherName=?,studentDob=?,studentPassword=?";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);

            Ps.setString(1,  firstName);
            Ps.setString(2,  secondName);
            Ps.setString(3,  gender);
            Ps.setString(4,  phone);
            Ps.setString(5,  email);
            Ps.setString(6,  address);
            Ps.setString(7,  fatherName);
            Ps.setString(8,  motherName);
            Ps.setString(9,  dob);
            Ps.setString(10, studentPassword);
            Ps.executeUpdate();
            resp.sendRedirect("studentLogin.jsp");
        }catch (Exception ex){
            out.println(ex);
        }

    }
}
