<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<%
    try{
        Class.forName("org.h2.Driver");
        Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/highOctane","sa","");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("password2");
        String query = "INSERT INTO LOGIN VALUES(?,?,?)";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setString(1,name);
        statement.setString(2,email);
        statement.setString(3,password);
        int count = statement.executeUpdate();
        if (count==1)
            out.println("Succesfully added one record" + "<br>");
        else
            out.println("Failed");
    }catch (Exception e){
        e.getStackTrace();
    }
%>
