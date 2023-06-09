<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Database Connection</title>
    <link rel="stylesheet" href="assets/css/login_table_page.css"/>
</head>
<body>
<%
    try{
        Class.forName("org.h2.Driver");
        Connection con = DriverManager.getConnection("jdbc:h2:~/highOctane","sa","");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from login");
        while(rs.next()){%>
            <table class="login-table">
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
                <tr>
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("password")%></td>
                </tr>
            </table>
        <%}
    }catch (Exception e){
        e.getStackTrace();
    }
%>
</body>
</html>
