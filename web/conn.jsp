<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-1
  Time: 下午4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MySQL数据库链接</title>
</head>
<body>
<%
    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/studentuse?useSSL=true";
    String dbUser="root";
    String dbPass="admin";
    Connection conn=null;
    Class.forName(dbDriver);
    conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);
    if(conn!=null)
        out.print("数据库链接成功");
    else
        out.print("数据库链接失败");
%>
</body>
</html>
