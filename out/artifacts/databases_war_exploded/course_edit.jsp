<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程编辑</title>
</head>
<body  style="background:url(image/3.jpg);">
<a href ="course_query.jsp">←返回<br/></a>
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<%
    request.setCharacterEncoding("utf-8");
    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/student?useSSL=true";
    String dbUser="root";
    String dbPass="admin";

    String sql ="select * from course where cno=?";
    String cno = request.getParameter("cno");
    Class.forName(dbDriver);
    Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1,cno);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
%>
<form action="course_update.jsp?cno_old=<%=cno%>"method="post">
    课程课号：<input type="text"name="cno"value=<%=rs.getString("cno")%>><br>
    课程名称：<input type="text"name="cname"value=<%=rs.getString("cname")%>><br>
    课程学分：<input type="text"name="credit"value=<%=rs.getFloat("credit")%>><br>
    课程先修课<input type="text"name="cpno"value=<%=rs.getString("cpno")%>><br>
    <input type="submit"value="更新">
</form>
<%
    }
%>

</body>
</html>
