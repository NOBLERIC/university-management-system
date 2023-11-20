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

@WebServlet(name = "rejectStudent", value = "/rejectStudent")
public class rejectStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out  = resp.getWriter();

        try{

            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;

            int reqId  = Integer.parseInt(req.getParameter("reqId"));
            String Query="update studentregistration set admisStatus='REJECTED'  where admiId =?";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);
            Ps.setInt(1, reqId);
            Ps.executeUpdate();
            resp.sendRedirect("viewAdmissionList.jsp");

        }catch (Exception ex){
            out.println(ex);
        }
    }
}
