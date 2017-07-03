<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>login</title>
	<meta charset='utf-8'>
	<style type="text/css">
		* {
			padding: 0;
			margin: 0;
		}
		html,body {
			width: 100%;
			height: 100%;
		}
		a {
			text-decoration: none;
			color: inherit;
		}
		input {
			font-family: inherit;
		}
		.out {
			width: 100%;
			height: 100%;
			background: linear-gradient(#fff, #17b4bb);
		}
		.in {
			border-radius: 6px;
			position:relative;
			box-sizing: border-box;
			padding: 24px;
            top:50%;
            left:50%;
            width:240px;
            background: rgba(0,0,0,.4);
            transform:translate(-50%,-50%);
            transform-origin:50% 50%;
            color: #fff;
		}
		h1,h2 {
			text-align: center;
			font-weight: 500;
		}
		.login-input {
			box-sizing: border-box;
			height: 32px;
			outline: none;
			border: none;
			display: block;
			background: rgba(0,0,0,0);
			width: 100%;
			font-size: 16px;
			color: #fff;
			margin: 24px 0;
			border-bottom: 1px solid #fff;
		}
		/* WebKit browsers */
		::-webkit-input-placeholder { 
    		color: #dbdbdb;
		}
		.submit {
			width: 100%;
			height: 32px;
			line-height: 32px;
			font-size: 16px;
			text-align: center;
			background: #17b4bb;
			border-radius: 6px;
			cursor: pointer;
			transition: background .3s;
		}
		.submit:hover {
			background: #199;
		}
		.register {
			margin-top: 6px;
			line-height: 16px;
			height: 16px;
			font-size: 10px;
			text-align: center;
			color: #dbdbdb;
		}
		.header {
			position: fixed;
			box-sizing: border-box;
			width: 100%;
			height: 60px;
			left: 0;
			top: 0;
			background: transparent;
			z-index: 12;
		}
		.logo {
			display: inline-block;
			height: 60px;
			margin-left: 24px;
		}
		.logo img {
			height: 48px;
			position: relative;
			margin-top: 6px;
		}
		.header-link-wrapper {
			float: right;
			margin-right: 24px;
			cursor: default;
			background: #fff;
			z-index: 6;
		}
		
		.header-link-wrapper a {
			display: inline-block;
			box-sizing: border-box;
			height: 100%;
			line-height: 60px;
			height: 60px;
			margin: 0 12px;
			font-size:16px;
			color: #999;
			border-bottom: 2px solid transparent;
			transition: color,border-bottom .3s;
		}
	</style>
</head>
<body>
<header class="header">
	<div class="logo">
		<a href="/"><img src="/img/logo.png"></a>
	</div>
</header>
<div class="out">
	<div class="in" >
		<h2>登录iTrip</h2>
		<form action="/login" method="POST" name="form0" id='form0'>
			<input class="login-input" type="text" name="email" autocomplete="false" placeholder="用户名">
			<input class="login-input" type="password" name="password" autocomplete="false" placeholder="密码">
			<input name="redirectUrl" type="hidden" value="${redirectUrl}"/>
			<div class="submit" id='submit-btn'>登录</div>
		</form>
		<div class='register'><a href="/signIn" title='注册新账户'>没有账户？点击注册</a></div>
	</div>
</div>
<c:if test="${error!=null}">
	<script>
		alert("${error}");
	</script>
</c:if>
<c:if test="${param.error}">
	<script>
		alert("${param.error}");
	</script>
</c:if>
</body>
</html>
<script src='js/jQuery.js'></script>
<script>
	var login={
		eventBind:function(){
			var self=this;
			var submitBtn=$("#submit-btn");
			submitBtn.click(function(){
				if(self.validateInput("form0")==true){
					$("#form0").submit();
				}else{
					alert(self.validateInput("form0")+'不能为空');
				}
			});
		},
		validateInput:function(id){
			var flag=null;
			var thisForm=$("#"+id);
			var username=thisForm.children('input').eq(0).val();
			var password=thisForm.children('input').eq(1).val();
			if(username==""){
				flag='用户名';
			}else if(password==""){
				flag='密码';
			}else{
                flag=true;
            }
			return flag;
		}
	};
	login.eventBind();
</script>