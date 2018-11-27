<%--
  Created by IntelliJ IDEA.
  User: J4son Chen
  Date: 17-12-2
  Time: 上午11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息查询系统</title>

</head>
<body style="background:url(image/3.jpg);">
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
    <img src="image/3.jpg" height="100%" width="100%"/>
</div>
<a href ="login.jsp">←退出<br/><br/></a>
<%
    String flag = (String) session.getAttribute("flag");
    if (flag != null) {

        String name = (String) session.getAttribute("u");
        System.out.print("欢迎用户：" + name + "登录！");
%>

<form action="do_judge.jsp" method="post">
    选择表格：
    <select name="opt" style="width:150px;height:25px;font-size:15px;align:center">
        <option value="student">学生名单</option>
        <option value="course">课程名单</option>
        <option value="sc">学生成绩</option>
    </select>
    <input type="submit" value="确认" style="width:100px;height:25px;font-size:15px;align:center">
</form>
<%
    } else {
        System.out.print("你还没登录");
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
