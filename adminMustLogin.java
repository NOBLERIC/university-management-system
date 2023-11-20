package com.example.demoauca;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "adminMustLogin", value = "/adminMustLogin")
public class adminMustLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out  = resp.getWriter();
        String adminUsername       = req.getParameter("adminUsername");
        String adminPassword        = req.getParameter("adminPassword");

        try {
            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;

            String Query="select * from  academicunitstaff where username =? and password=?";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);
            Ps.setString(1, adminUsername);
            Ps.setString(2, adminPassword);
            ResultSet rs  = Ps.executeQuery();
            HttpSession session = req.getSession(true);

            if(rs.next()){
                resp.sendRedirect("adminDashboard.jsp");
            }else{
                out.println("Oooops Either Username  and Password Not Match");
            }

        }catch (Exception ex){
            out.println(ex);
        }



    }
}
