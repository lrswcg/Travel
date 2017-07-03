<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>注册新账户</title>
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
			margin: 12px 0;
			border-bottom: 1px solid #fff;
		}
		::-webkit-input-placeholder { /* WebKit browsers */
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
		option {
			color: #333;
		}
		input[type=file] {
			display: none;
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
		<h2>注册新账户</h2>
		<form action="/signIn" method="post" name="form1" id='form1' enctype="multipart/form-data">
			<input class="login-input" type="text" name="email" autocomplete="false" placeholder="邮箱">
			<input class="login-input" type="text" name="nickname" autocomplete="false" placeholder="用户名">
			<input class="login-input" type="password" name="password" autocomplete="false" placeholder="密码">
			<input class="login-input" type="password"  id="password_c" autocomplete="false" placeholder="确认密码">
			<input class='login-input' type='button' value='选择头像' style='text-align:left;' onclick='this.nextElementSibling.click();'>
			<input class="login-input" type="file" name="file" autocomplete="false">
			<input class="login-input" type="hidden" name="avatar" autocomplete="false">
			<select class='login-input' name='gender'>
				<option value='男'>男</option>
				<option value="女">女</option>
			</select>
			<div class="submit" id='regist-btn'>注册</div>
		</form>
		<div class='register'><a href="/login" title='登录'>已有账户？点击登录</a></div>
	</div>
</div>
<c:if test="${error!=null}">
	<script>
		alert("${error}");
	</script>
</c:if>
</body>
</html>
<script src='/js/jQuery.js'></script>
<script>
	var regist={
		eventBind:function(){
			var self=this;
			$("#regist-btn").click(function(){
				if(self.validateInput()){
					$("#form1").submit();
				}
			});
		},
		validateInput:function(){
			var flag=null;
			var thisForm=$("#form1");
			var email=thisForm.children('input').eq(0).val();
			var nickname=thisForm.children('input').eq(1).val();
			var password=thisForm.children('input').eq(2).val();
			var passwordC=thisForm.children('input').eq(3).val();
			if(email=="" || nickname=="" || password=="" || passwordC==""){
				alert('请填写完整');
				flag=false;
			}else{
				var regExp=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
				if(regExp.test(email) && password==passwordC){
					console.log('success');
					flag=true;
				}else if(!regExp.test(email)){
					alert('邮箱格式不正确');
				}else if(password!=passwordC){
					alert('两次密码输入不一致');
				}
			}
			return flag;
		}
	}
	regist.eventBind();
</script>