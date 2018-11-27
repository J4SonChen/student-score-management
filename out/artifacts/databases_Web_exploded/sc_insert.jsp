<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩插入</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<a href ="sc_query.jsp">←返回<br/></a>
<%
    request.setCharacterEncoding("utf-8");
    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/student?useSSL=true";
    String dbUser="root";
    String dbPass="admin";
    String sql ="insert into sc (sno,cno,grade)values(?,?,?)";
    try {
        String sno = request.getParameter("sno");
        String cno= request.getParameter("cno");
        Float grade=new Float(request.getParameter("grade"));
        try {
            Class.forName(dbDriver);
            Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1,sno);
                ps.setString(2,cno);
                ps.setFloat(3,grade);
                ps.executeUpdate();
                response.sendRedirect("sc_query.jsp");
            } catch (Exception e) {
                out.print("未知原因导致添加失败！");
            }
        } catch (Exception e) {
            out.print("数据库连接失败！");
        }
    } catch (Exception e) {
        out.print("数据格式不正确，请重新输入！");
    }
%>
</body>
</html>
