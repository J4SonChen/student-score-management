<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午1:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生成绩查询</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<a href ="index.jsp">←返回<br/></a>
<%
    //int id =Integer.parseInt(request.getParameter("id"));
    request.setCharacterEncoding("utf-8");
    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/student?useSSL=true";
    String dbUser="root";
    String dbPass="admin";
    Class.forName(dbDriver);
    Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);

    String sql ="select * from sc order by sno";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>
<table border="1"cellpadding="0" cellspacing="0">
    <%while(rs.next()){%>
    <tr height="40">
        <td width="80" align="center"><%=rs.getString("sno")%></td>
        <td width="80" align="center"><%=rs.getString("cno")%></td>
        <td width="80" align="center"><%=rs.getFloat("grade")%></td>
        <td width="60" align="center"><a href ="sc_delete.jsp?sno=<%=rs.getString("sno")%>&cno=<%=rs.getString("cno")%>" >删除 </a> </td>
        <td width="60" align="center"><a href ="sc_edit.jsp?sno=<%=rs.getString("sno")%>&cno=<%=rs.getString("cno")%>" >编辑 </a> </td>
    </tr>
    <%
        }
    %>
</table>
<a href ="addSC.jsp">添加</a>
<a href ="index.jsp">返回</a>
</body>
</html>
