package com.example.demoauca;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "newStudent", value = "/Cool")

public class newStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);

        PrintWriter out  = resp.getWriter();


//        String a  = req.getParameter("a");
//        String b  = req.getParameter("b");

        try {

            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;


            String studentFname   = "Byiringiro";
            String studentLname   = "Erick";
            String studentGender  = "Male";
            String studentPhone   = "0789229908";
            String studentEmail   = "byiringiro@gmail.com";
            String studentAddress = "Rubavu";
            String studentFatherName = "Papa";
            String studentMotherName = "Mama";
            String studentCode  = "ST005";
            String studentDept = "CSC";


            String Query="insert into students set studentFname=?,studentLname=?,studentGender=?,studentPhone=?,studentEmail=?,studentAddress=?,studentFatherName=?,studentMotherName=?,studentCode=?,studentDept=?";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);


            Ps.setString(1, studentFname);
            Ps.setString(2, studentLname);
            Ps.setString(3, studentGender);
            Ps.setString(4, studentPhone);
            Ps.setString(5, studentEmail);
            Ps.setString(6, studentAddress);
            Ps.setString(7, studentFatherName);
            Ps.setString(8, studentMotherName);
            Ps.setString(9, studentCode);
            Ps.setString(10, studentDept);

            Ps.executeUpdate();

            out.println("Student Created Sucessfull !!!");

        }catch (Exception ex){
            out.println(ex);
        }

    }
}
