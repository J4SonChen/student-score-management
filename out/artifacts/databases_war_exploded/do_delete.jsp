<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-1
  Time: 下午4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除</title>
</head>
<body>
<a href ="do_query.jsp">←返回<br/></a>
<%
    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/student?SSL=true";
    String dbUser="root";
    String dbPass="admin";
    String sql="delete from student where sno =?";
    String sno = request.getParameter("sno");
    try {
        Class.forName(dbDriver);
        Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,sno);
            ps.executeUpdate();
            response.sendRedirect("do_query.jsp");
        } catch (Exception e) {
            out.print("未知原因导致删除失败！");
        }
    } catch (Exception e) {
        out.print("数据库连接失败！");
    }
%>
</body>
</html>
