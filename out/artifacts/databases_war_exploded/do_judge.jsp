<%@ page import="java.util.stream.Stream" %><%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 下午1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>handle_judge</title>
</head>
</head>
<body  style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>

<%
    String opt=request.getParameter("opt");
    if(opt.equals("student"))
    {
        response.sendRedirect("do_query.jsp");
    }else if (opt.equals("sc"))
    {
        response.sendRedirect("sc_query.jsp");
    }else if (opt.equals("course"))
    {
        response.sendRedirect("course_query.jsp");
    }
%>

</body>
</html>
