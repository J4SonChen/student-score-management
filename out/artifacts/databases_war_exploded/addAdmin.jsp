<%--
  Created by IntelliJ IDEA.
  User: lfq
  Date: 17-12-1
  Time: 下午4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<%
request.setCharacterEncoding("utf-8");
%>
<form action="do_insert.jsp"method="post">
    学生学号：<input type="text" name="sno"><br>
    学生姓名：<input type="text" name="sname"><br>
    学生性别：<input type="text" name="ssex"><br>
    学生年龄：<input type="text" name="sage"><br>
    学生专业：<input type="text" name="sdept"><br>
    <input type="submit" value="添加">
</form>

</body>
</html>
