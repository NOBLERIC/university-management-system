<%@ page import="java.sql.*" %>

<%

    String Driver = "com.mysql.jdbc.Driver";
    String ConnectionUrl = "dbc:mysql://localhost:3306/aucaregustrationmodule";
    String Username = "root";
    String Password = "";
    Connection Conn;
    PreparedStatement Ps;
    ResultSet Rs;


    try {
        int reqId = Integer.parseInt(request.getParameter("reqId"));
        String Query = "update studentregistration set admisStatus='ADMITED'  where admiId ='"+reqId+"'";
        Class.forName(Driver);
        Conn = DriverManager.getConnection(ConnectionUrl,Username,Password);
        Ps = Conn.prepareStatement(Query);
        Ps.executeUpdate();
        response.sendRedirect("viewAdmissionList.jsp");

    }catch (Exception ex){
    %>
        <%= ex %>
    <%
    }
    %>
%>