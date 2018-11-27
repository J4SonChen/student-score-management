<%@ page import="java.sql.*" %>
<%@ page import="java.util.Stack" %>
<%@ page import="java.lang.*" %>
<%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-1
  Time: 下午4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<a href ="do_query.jsp">←返回<br/></a>
<%
    request.setCharacterEncoding("utf-8");
    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=UTF-8&useSSL=true";
    String dbUser="root";
    String dbPass="admin";
    String sql = "UPDATE student SET sno=?,sname=?,ssex=?,sdept=?,sage=? WHERE  sno=?";


    try {
        String sno_old = request.getParameter("sno_old");
        String sno = request.getParameter("sno");
        String sname = request.getParameter("sname");
        String ssex = request.getParameter("ssex");
        String sdept = request.getParameter("sdept");
        Integer sage = new Integer(request.getParameter("sage"));
        try {
            Class.forName(dbDriver);
            Connection conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1,sno);
                ps.setString(2,sname);
                ps.setString(3,ssex);
                ps.setString(4,sdept);
                ps.setInt(5,sage);
                ps.setString(6,sno_old);
                ps.executeUpdate();
                response.sendRedirect("do_query.jsp");
            } catch (Exception e) {
                    out.print("未知原因导致更新失败！");
            }
        } catch (ClassNotFoundException e) {
            out.print("数据库连接失败！");
        }
    } catch (Exception e) {
        out.print("数据格式不正确，请重新输入！");
    }

%>
</body>
</html>
