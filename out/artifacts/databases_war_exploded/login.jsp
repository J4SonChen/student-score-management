<%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 上午11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<form action="do_login.jsp"method="post">
    <table align="center">
        <caption>用户登录</caption>
        <tr><td>用户名：</td><td><input type="text" name="username" size="20"/></td></tr>
        <tr><td>密码:</td><td><input type="password" name="password" size="20"/></td></tr>
        <tr><td><input type="submit" value="登录"/></td><td><input type="reset" value="重置" /></td></tr>
    </table>
</form>
</body>
</html>
