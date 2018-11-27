<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-1
  Time: 下午3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <title>查询所有学生记录</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<a href ="index.jsp">←返回<br/></a>
<form action="do_query.jsp"method="post">
        查询选项：
        <select name="column" style="width:100px;height:25px;font-size:15px;align:center">
            <option value="sno">学号</option>
            <option value="sname">姓名</option>
            <option value="ssex">性别</option>
            <option value="sdept">学院</option>
            <option value="sage">年龄</option>
        </select>
        <td>：</td><td><input type="text" name="search" size="25"/></td>
        <td><input type="submit" value="查询"/></td>
</form>
<%
    request.setCharacterEncoding("utf-8");

    String dbDriver ="com.mysql.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/student?useSSL=true";
    String dbUser="root";
    String dbPass="admin";
    Class.forName(dbDriver);
    Connection conn= DriverManager.getConnection(dbUrl,dbUser,dbPass);

    PreparedStatement ps = null;
    String opt = request.getParameter("column");
    if(opt==null) {
        String sql ="select * from student order by sno";

        ps = conn.prepareStatement(sql);
    }
    else {
        String search = request.getParameter("search");
        String  sql = null;
        switch (opt) {
            case "sno"  :sql ="select * from student where sno = ? order by sno";break;
            case "sname":sql ="select * from student where sname = ? order by sno";break;
            case "ssex" :sql ="select * from student where ssex = ? order by sno";break;
            case "sdept":sql ="select * from student where sdept = ? order by sno";break;
            case "sage" :sql ="select * from student where sage = ? order by sno";break;
            default     :break;
        }
        ps = conn.prepareStatement(sql);
        ps.setString(1,search);
    }

    ResultSet rs = null;
    try {
        rs = ps.executeQuery();
    } catch (Exception e) {
        out.print("查询失败！");
    }
%>
<table border="1">
    <td width="80" align="center"><%="学号"%></td>
    <td width="80" align="center"><%="姓名"%></td>
    <td width="60" align="center"><%="性别"%></td>
    <td width="60" align="center"><%="学院"%></td>
    <td width="60" align="center"><%="年龄"%></td>
    <td width="60" align="center"></td>
    <td width="60" align="center"></td>
    <%while(rs.next()){%>
    <tr height="40">
        <td width="80" align="center"><%=rs.getString("sno")%></td>
        <td width="80" align="center"><%=rs.getString("sname")%></td>
        <td width="60" align="center"><%=rs.getString("ssex")%></td>
        <td width="60" align="center"><%=rs.getString("sdept")%></td>
        <td width="60" align="center"><%=rs.getInt("sage")%></td>
        <td width="60" align="center"><a href ="do_delete.jsp?sno=<%=rs.getString("sno")%>" >删除 </a> </td>
        <td width="60" align="center"><a href ="do_edit.jsp?sno=<%=rs.getString("sno")%>" >编辑 </a> </td>
    </tr>
<%
    }
%>
</table>
<a href ="addSTUDENT.jsp">添加</a>
<a href ="index.jsp">返回</a>
</body>
</html>
