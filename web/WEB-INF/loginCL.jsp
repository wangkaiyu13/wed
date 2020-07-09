<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/9
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>

        <title>loginCL.jsp页面</title>

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

    String name=request.getParameter("username");

    String password=request.getParameter("password");

//判断登陆界面的用户名和密码，根据输入的不同情况进行不同的处理

    if(name.trim().equals("admin")&&password.trim().equals("1234"))

    {

        request.setAttribute("usertxt", "正常登录！！！");

        request.getRequestDispatcher("success.jsp").forward(request, response);

    }

    else{

        request.setAttribute("usertxt", "用户名或密码错误！！！");

        request.getRequestDispatcher("login.jsp").forward(request, response);

    }

%>

  </body>
</html>
