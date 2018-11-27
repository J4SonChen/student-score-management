<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-1
  Time: 下午4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type"content="text/html";charset="UTF-8">
    <title>编辑</title>
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
    Class.forName(dbDriver);
    Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);

    String sno  = request.getParameter("sno");
    String sql ="SELECT * from student where sno=?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1,sno);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
%>
<form action="do_update.jsp?sno_old=<%=sno%>"method="post">
    学生学号：<input type="text"name="sno"value=<%=rs.getString("sno")%>><br>
    学生姓名：<input type="text"name="sname"value=<%=rs.getString("sname")%>><br>
    学生性别：<input type="text"name="ssex"value=<%=rs.getString("ssex")%>><br>
    学生专业：<input type="text"name="sdept"value=<%=rs.getString("sdept")%>><br>
    学生年龄：<input type="text"name="sage"value=<%=rs.getInt("sage")%>><br>
    <input type="submit"value="更新">
</form>
<%
    }
%>

</body>
</html>
