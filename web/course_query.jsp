<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程查询</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<a href ="index.jsp">←返回<br/></a>
<form action="course_query.jsp"method="post">
    查询选项：
    <select name="column" style="width:100px;height:25px;font-size:15px;align:center">
        <option value="cno">课程号</option>
        <option value="cname">课程名</option>
        <option value="credit">学分</option>
        <option value="cpno">先修课程号</option>
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
        String sql ="select * from course order by cno";
        ps = conn.prepareStatement(sql);
    }
    else {
        String search = request.getParameter("search");
        out.print(search);
        String  sql = null;
        switch (opt) {
            case "cno"      :sql ="select * from course where cno = ? order by cno";break;
            case "cname"    :sql ="select * from course where cname = ? order by cno";break;
            case "credit"   :sql ="select * from course where credit = ? order by cno";break;
            case "cpno"     :sql ="select * from course where cpno = ? order by cno";break;
            default     :break;
        }
        ps = conn.prepareStatement(sql);
        ps.setString(1,search);
    }
    ResultSet rs = ps.executeQuery();
%>
<table border="1">
    <td width="60" align="center"><%="课程号"%></td>
    <td width="80" align="center"><%="课程名"%></td>
    <td width="60" align="center"><%="学分"%></td>
    <td width="60" align="center"><%="先修课"%></td>
    <td width="60" align="center"></td>
    <td width="60" align="center"></td>
    <%while(rs.next()){%>
    <tr height="40">
        <td width="60" align="center"><%=rs.getString("cno")%></td>
        <td width="80" align="center"><%=rs.getString("cname")%></td>
        <td width="60" align="center"><%=rs.getFloat("credit")%></td>
        <td width="60" align="center"><%=rs.getString("cpno")%></td>
        <td width="60" align="center"><a href ="course_delete.jsp?cno=<%=rs.getString("cno")%>" >删除 </a> </td>
        <td width="60" align="center"><a href ="course_edit.jsp?cno=<%=rs.getString("cno")%>" >编辑 </a> </td>
    </tr>
    <%
        }
    %>
</table>
<a href ="addCOURSE.jsp">添加</a>
<a href ="index.jsp">返回</a>

</body>
</html>
