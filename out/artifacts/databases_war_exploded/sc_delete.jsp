<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩删除</title>
</head>
<body>
<a href ="sc_query.jsp">←返回<br/></a>
<%
    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/student?useSSL=true";
    String dbUser="root";
    String dbPass="admin";
    String sql="DELETE  FROM sc WHERE sno =? AND  cno = ?";
    String sno = request.getParameter("sno");
    String cno = request.getParameter("cno");
    try {
        Class.forName(dbDriver);
        Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,sno);
            ps.setString(2,cno);
            ps.executeUpdate();
            response.sendRedirect("sc_query.jsp");
        } catch (Exception e) {
            out.print("未知原因导致删除失败！");
        }
    } catch (Exception e) {
        out.print("数据库连接失败！");
    }

%>
</body>
</html>
