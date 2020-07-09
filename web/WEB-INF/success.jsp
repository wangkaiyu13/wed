<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/9
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

  <head>

        <title>success.jsp页面</title>

      </head>

  <body>

<%

    String referer = request.getHeader("Referer");

    if(referer==null||referer.trim().length()==0||

            !referer.equals("http://localhost:8080/test1_war_exploded/web/login.jsp")){

        response.sendRedirect("login.jsp");

        return;

    }

    request.setCharacterEncoding("utf-8");

    response.setContentType("text/html;charset=utf-8");

%>  

<%=(String)request.getAttribute("usertxt") %>

  </body>

</html>
