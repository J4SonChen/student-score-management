<%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加课程</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<a href ="course_query.jsp"> ←返回<br/> </a>
<%
    request.setCharacterEncoding("utf-8");
%>
<form action="course_insert.jsp"method="post">
    课程课号：<input type="text" name="cno"><br>
    课程名称：<input type="text" name="cname"><br>
    课程学分：<input type="text" name="credit"><br>
    需要先修课：<input type="text" name="cpno"><br>
    <input type="submit" value="添加">
</form>

</body>
</html>
