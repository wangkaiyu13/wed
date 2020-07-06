<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/5
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Map<String,Object> map = (Map<String,Object>)request.getAttribute("productMap");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>查看产品</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<div align="center">

    <table width=60% style="margin:auto">

        <tr>
            <td height=100>

            </td>
        </tr>
        <tr>
            <td >
                产品信息
            </td>
        </tr>
        <tr>
            <td>
                <table width = 99% border =1 >
                    <tr align="center">
                        <td width = 20%>产品名称</td>
                        <td width = 30%><%=map.get("proname") %></td>
                        <td width = 20%>产品价格</td>
                        <td><%=map.get("proprice") %></td>


                    </tr>
                    <tr align="center">
                        <td >产品产地</td>
                        <td colspan=3><%=map.get("proaddress") %></td>


                    </tr>
                    <tr align="center">
                        <td>产品图片</td>
                        <td colspan=3><img src="<%=path%>/upload/<%=map.get("proimage") %>"></td>

                    </tr>


                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <button type="button" onclick="javascript:location.href='<%=path %>/main.jsp'">确定</button>
                <button type="button" onclick="javascript:history.go(-1)">返回</button>
            </td>
        </tr>

    </table>


</div>
</body>
</html>
6.LoginAction.java

package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction extends HttpServlet {

private LoginService service;
/**
* Constructor of the object.
*/
public LoginAction() {
super();
}

/**
* Destruction of the servlet. <br>
*/
public void destroy() {
super.destroy(); // Just puts "destroy" string in log
// Put your code here
}

/**
* The doGet method of the servlet. <br>
*
* This method is called when a form has its tag value method equals to get.
*
* @param request the request send by the client to the server
* @param response the response send by the server to the client
* @throws ServletException if an error occurred
* @throws IOException if an error occurred
*/
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
this.doPost(request, response);

}

/**
* The doPost method of the servlet. <br>
*
* This method is called when a form has its tag value method equals to post.
*
* @param request the request send by the client to the server
* @param response the response send by the server to the client
* @throws ServletException if an error occurred
* @throws IOException if an error occurred
*/
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html;charset=utf-8");
PrintWriter out = response.getWriter();

String path = request.getContextPath();
String username = request.getParameter("username");
String pswd = request.getParameter("pswd");

List<Object> params = new ArrayList<Object>();
params.add(username);
params.add(pswd);
boolean flag = service.login(params);

if (flag) {

request.getSession().setAttribute("username", username);
response.sendRedirect(path+"/main.jsp");
}else{

response.sendRedirect(path+"/index.jsp");
}




out.flush();
out.close();
}

/**
* Initialization of the servlet. <br>
*
* @throws ServletException if an error occurs
*/
public void init() throws ServletException {
// Put your code here
service = new LoginDao();
}

}