<%@ page import="javax.print.DocFlavor" %>
<%@ page import="javax.xml.soap.SAAJMetaFactory" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 上午11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>handle login</title>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<%
    String name = request.getParameter("username");
    String pass = request.getParameter("password");
    if(name!=null&&pass!=null) {
        if (name.equals("root") && pass.equals("admin")) {
            session.setAttribute("u", name);
            session.setAttribute("flag", "ok");
            response.sendRedirect("index.jsp");
        } else {
            out.print("用户名或密码不对，请重新输入！");
        }
    }
%>
</body>
</html>
