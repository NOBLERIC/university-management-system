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


@WebServlet(name = "admissionRequest", value = "/admissionRequest")
public class admissionRequest extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);

        PrintWriter out  = resp.getWriter();
        String studentEmail  = req.getParameter("studentEmail");

        try {
            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;

            String Query="insert into studentregistration set studentEmail=?,admisStatus='PENDING'";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);
            Ps.setString(1, studentEmail);
            Ps.executeUpdate();
            resp.sendRedirect("viewAdmissionStatus.jsp");
        }catch(Exception ex){
            out.println(ex);
        }

    }
}
