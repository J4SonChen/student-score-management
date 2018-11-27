<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩编辑</title>
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
    Class.forName(dbDriver);
    Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);

    String sno  = request.getParameter("sno");
    String cno  = request.getParameter("cno");
    String sql ="select * from sc where sno=? and cno=?";

    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1,sno);
    ps.setString(2,cno);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
%>
<form action="sc_update.jsp?sno_old=<%=sno%>&cno_old=<%=cno%>"method="post">
    学生学号：<input type="text"name="sno"value=<%=rs.getString("sno")%>><br>
    课程课号：<input type="text"name="cno"value=<%=rs.getString("cno")%>><br>
    学生成绩：<input type="text"name="grade"value=<%=rs.getFloat("grade")%>><br>
    <input type="submit"value="更新">
</form>
<%
    }
%>

</body>
</html>
