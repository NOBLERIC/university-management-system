package com.example.demoauca;

import com.mysql.cj.Session;
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


@WebServlet(name = "studentLoginController", value = "/studentMustLogin")
public class studentLoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out  = resp.getWriter();
        String studentemail       = req.getParameter("studentemail");
        String studentPass        = req.getParameter("studentPass");

        try {
            String Driver = "com.mysql.jdbc.Driver";
            String ConnectionURL = "jdbc:mysql://localhost:3306/aucaregustrationmodule";
            String Username = "root";
            String Password = "";
            Connection Conn;
            PreparedStatement Ps;

            String Query="select * from  students where studentEmail =? and studentPassword=?";
            Class.forName(Driver);
            Conn = DriverManager.getConnection(ConnectionURL,Username,Password);
            Ps = Conn.prepareCall(Query);
            Ps.setString(1, studentemail);
            Ps.setString(2, studentPass);
            ResultSet rs  = Ps.executeQuery();
            HttpSession session = req.getSession(true);

            if(rs.next()){
                session.setAttribute("studentemail",studentemail);
                resp.sendRedirect("stDashboard.jsp");
            }else{
                out.println("Oooops Either Username  and Password Nit Match");
            }

        }catch (Exception ex){
            out.println(ex);
        }

    }
}
