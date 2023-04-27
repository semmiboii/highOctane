<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<html>
<head>
    <title>Logging In...</title>
</head>
<body>
<%
    try{
        Class.forName("org.h2.Driver");
        Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/highOctane","sa","");
        String formEmail = request.getParameter("email");
        String formPassword = request.getParameter("password");
        String query = " SELECT * from LOGIN where EMAIL = ? and PASSWORD = ? ";
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1,formEmail);
        st.setString(2,formPassword);
        ResultSet rs = st.executeQuery();
        if(rs.next()){
            out.println("Logged In Succesfully");
            response.sendRedirect("/index.jsp");
        }else{
            out.println("Couldn't Log In");
        }
    }catch (Exception e){
        e.getStackTrace();
    }
%>
</body>
</html>
