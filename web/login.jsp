<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/4
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <title>WormJam-登录</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div class="loginHeader">
    <div class="title">
        <center><span>WormJam</span></center>
        <center><h3>秀出你的源代码</h3></center>
    </div>
</div>
<div class="form">
    <form method="post" name="loginForm">
        账号：<input type="text" name="account" onInput="accountChange()">
        <span id="accountText"> </span><span id="loginInfo"></span><br><br>
        密码：<input type="password" name="password" onInput="passwordChange()">
        <span id="passwordText"> </span><br><br>
        验证码：<input type="text" name="code" size="10" onInput="validate()">
        <img name="imgValidate" "refresh()" border=0 src="validate.jsp"></img>
        <span id="codeText" name="codeText" style="color:green"> </span><br><br>
        <input type="button" value="登录" "validateSubmit()">
        <a href="register.jsp">注册</a>
    </form>
</div>
<script>
    //验证账号密码格式
    function accountChange(){
        var str = loginForm.account.value;
        var reg = /[a-zA-Z0-9]{6,16}/;
        if(reg.test(str)){
            accountText.innerHTML = "√";
            accountText.style.color = "green";
        }
        else{
            accountText.innerHTML = "账号为6至16位数字或字母！";
            accountText.style.color = "red";
        }
    }
    function passwordChange(){
        var str = loginForm.password.value;
        var reg = /^[x00-x7f]+$/;
        if(reg.test(str) && str.length>5 && str.length<17){
            passwordText.innerHTML = "√";
            passwordText.style.color = "green";
        }else{
            passwordText.innerHTML = "密码必须是6至16位！";
            passwordText.style.color = "red";
        }
    }
    //验证码刷新
    function refresh(){
        //加入随机参数防止调用浏览器缓存
        loginForm.imgValidate.src = "validate.jsp" + "?id=" + Math.random();
    }
    //表单提交验证
    function validateSubmit(){
        if(accountText.innerHTML=="√" && passwordText.innerHTML == "√" && codeText.innerHTML == "√"){
            var account = loginForm.account.value;
            var password = loginForm.password.value;
            var xmlHttp = new XMLHttpRequest();
            var url = "LoginServlet?account=" + account + "&password=" + password;
            xmlHttp.open("POST",url,true);
            xmlHttp.onreadystatechange = function(){
                if(xmlHttp.readyState == 4){
                    loginInfo.innerHTML = xmlHttp.responseText;
                }else{
                    loginInfo.innerHTML = "正在验证密码……";
                }
            }
            xmlHttp.send();
        }else{
            return false;
        }
    }
    //AJAX
    function validate(){
        var code = loginForm.code.value;
        var xmlHttp = new XMLHttpRequest();
        var url = "ValidateServlet?code=" + code;
        xmlHttp.open("POST",url,true);
        xmlHttp.onreadystatechange = function(){
            if(xmlHttp.readyState == 4){
                codeText.innerHTML = xmlHttp.responseText;
            }else{
                codeText.innerHTML = "正在验证……";
            }
        }
        xmlHttp.send();
    }
</script>
</body>
</html>