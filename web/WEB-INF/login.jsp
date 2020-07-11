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

        <title>login.jsp页面</title>

      </head>

  <body>
    <form action="loginCL.jsp" method="post" name=form >

     <font size="5">登录界面</font><br>

     用户名：<input type="text" value=""name="username"><br>

     密    码：<input type="text"value="" name="password"><br>

     <input type="submit"value="提交"name="submit">
    <input type="submit"value="提交"name="submit">

     <input type="reset"value="重置"name="submit">   

    </form>

<%=(String)request.getAttribute("usertxt") %>

  </body>
</html>
