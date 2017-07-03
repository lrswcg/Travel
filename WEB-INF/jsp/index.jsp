<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>index</title>
	<link rel="stylesheet" type="text/css" href="css/scrollbar.css">
	<style type="text/css">
		* {
			padding: 0;
			margin: 0;
			color: #333;
		}
		a {
			text-decoration: none;
			color: inherit;
		}
		h1,h2 {
			text-align: center;
		}
		.header {
			position: fixed;
			box-sizing: border-box;
			width: 100%;
			height: 60px;
			left: 0;
			top: 0;
			box-shadow: 0 0 10px rgba(0,0,0,.2);
			background: #fff;
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
		.login {
			box-sizing: border-box;
			line-height: 60px;
			margin: 0 12px;
			font-size: 16px;
			cursor: pointer;
			padding: 6px 18px;
			color: #fff;
			background: #17b4bb;
			border-radius: 6px;
			transition: background .3s;
		}
		.login:hover {
			background: #199;
		}
		.header-link-wrapper a:hover {
			color: #333;
			border-bottom: 2px solid #17b4bb;
		}
		.header-link-wrapper a.active {
			color: #333;
			border-bottom: 2px solid #17b4bb;
		}
		.main {
			position: relative;
			margin: 0 auto;
			margin-top: 60px;
			width: 1200px;
			max-width: 1200px;
			overflow: hidden;
		}
		.main-title {
			padding: 72px;
		}
		.main-title h1 {
			font-size: 48px;
			margin-bottom: 24px;
			font-weight: 500;
		}
		.main-title p {
			text-align: center;
			font-size: 18px;
		}
		.content {
			width: 100%;
		}
		@media(max-width: 1248px){
			.main {
				width: calc(100% - 48px);
				position: relative;
				margin-left: 24px;
			}
		}
		.content-tab {
			box-sizing: border-box;
			height: 32px;
			margin-bottom: 24px;
		}
		.content-tab a {
			box-sizing: border-box;
			display: inline-block;
			line-height: 32px;
			height: 100%;
			font-size: 20px;
		}
		.content-tab a.active {
			color: #333;
			border-bottom: 2px solid #17b4bb;
		}
		._2-col-grid {
			width: 100%;
			display: grid;
			grid-gap: 24px;
			grid-template-columns:1fr 1fr;
			margin-bottom: 24px;
		}
		._3-col-grid {
			width: 100%;
			display: grid;
			grid-gap: 24px;
			grid-template-columns:1fr 1fr 1fr;
			margin-bottom: 24px;
		}
		@media(max-width: 600px){
			._2-col-grid {
				grid-template-columns: 1fr;
			}
			._3-col-grid {
				grid-template-columns: 1fr 1fr;
			}
			.figure-2 {
				height: 200px;
			}
			.figure-3 {
				height: 120px;
			}
/*			.header-link-wrapper a {
				box-sizing: border-box;
				display: inline-block;
				line-height: 60px;
				height: 100%;
				width: 100%;
				font-size: 20px;
				padding-left: 24px;
				margin: 0;
			}
			.header-link-wrapper {
				position: fixed;
				top: -280px;
				left: 0;
				right: 0;
				margin-right: 0;
				box-shadow: 0 0 10px rgba(0,0,0,.2);
			}
			.header-link-wrapper span {
				display: inline-block;
				line-height: 32px;
				width: calc(100% - 48px);
				margin: 24px;
				text-align: center;
			}*/
		}
		.figure-2 {
			height: 360px;
			background: #000;
			background-size: cover;
			border-radius: 6px;
			position: relative;
			overflow: hidden;
		}
		.figure-3 {
			height: 240px;
			background: #000;
			background-size: cover;
			border-radius: 6px;
			position: relative;
			overflow: hidden;
		}
		.figure-inner {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
			z-index: 5;
		}
		.figure-image {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			transition: transform .3s;
			z-index: 3;
		}
		.figure-text {
			position: absolute;
			box-sizing: border-box;
			padding: 32px;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			color: #fff;
			z-index: 4;
			background: rgba(0,0,0,.2);
			cursor: pointer;
			transition: background .3s;
		}
		.figure-text span {
			color: #eee;
			font-size: 16px;
		}
		.figure-text h1 {
			font-size: 28px;
			color: #fff;
			text-align: left;
			margin-top: 6px;
			position: relative;
		}
		.figure-inner:hover .figure-image {
			transform: scale(1.15);
		}
		.figure-inner:hover .figure-text {
			background: rgba(0,0,0,.3);
		}
		.origin {
			position: absolute;
			bottom: 32px;
			left: 32px;
			height: 32px;
			color: #fff;
			overflow: hidden;
			z-index: 5;
		}
		.origin img {
			width: 32px;
			height: 32px;
			float: left;
			border-radius: 50%;
		}
		.origin span {
			margin-left: 12px;
			line-height: 32px;
			float: left;
			color: #fff;
		}
		.login-avatar-wrapper {
			height: 60px;
			float: left;
			box-sizing: border-box;
			padding: 12px;
			overflow: hidden;
		}
		.login-avatar-wrapper img {
			width:36px;
			display: block;
			height: calc(60px - 24px);
			border-radius: 50%;
			float: left;
		}
		.login-avatar-wrapper p {
			float: left;
			margin-left: 8px;
			line-height: calc(60px - 24px);
		}
		.login-avatar-wrapper div {
			cursor: pointer;
		}
		.login-avatar-wrapper div:last-child {
			transition: background .3s;
		}
		.login-avatar-wrapper div:last-child:hover {
			background: #dbdbdb;
		}

		.see-more {
			position: relative;width: 100%;text-align: center;
		}
		.see-more a {
			height: 48px;
			line-height: 48px;
			display: inline-block;
			font-size: 24px;
			padding: 0 24px;
			margin: 12px 0 36px;
			border-radius: 6px;
			background: #17b4bb;
			color: #fff;
			cursor: pointer;
			transition: background .3s;
		}
		.see-more a:hover {
			background: #199;
		}
	</style>
</head>
<body>
<header class="header">
	<div class="logo">
		<a href="/"><img src="/img/logo.png"></a>
	</div>
	<div class="header-link-wrapper">
		<c:if test="${!empty sessionScope.user}">
			<div class="login-avatar-wrapper" id="login-avatar">
				<div style="float: left;" id="user-link" onclick="location.href='/user'">
					<img src=${sessionScope.user.avatar}>
					<p>${sessionScope.user.nickname}</p>
				</div>
				<div style="float: left;height: 36px;width:36px;margin: 0 0 0 8px;border-radius: 6px;" id="logout" onclick="location.href='/logout'">
					<img src="/img/logout.svg" style="border-radius: 0;float: left;width: 28px;height: 28px;margin: 4px 0 0 4px;" title="退出登录">
				</div>
			</div>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			<span class="login" id="login" onclick="location.href='/login';">登录</span>
		</c:if>
	</div>
</header>
<div class="main">
	<div class="main-title">
		<h1>让旅行不再孤单</h1>
		<p><del>副标题什么的还没想好</del></p>
	</div>
	<div class="content">
		<div class="_3-col-grid" id='article'>
			<c:forEach items="${list}" var="note">
				<div class="figure-3">
					<div class="figure-inner">
						<div class="figure-image" style="background: url(${note.cover}) center;	background-size: cover;"></div>
						<div class="figure-text" data-noteId=${note.noteId}>
							<span style="font-size: 12px;"><fmt:formatDate value="${note.createTime}" dateStyle="long"/></span>
							<h1 style="font-size: 20px;margin-top: 3px;">${note.title}</h1>
							<div class="origin" data-userId="${note.user.userId}">
								<img src=${note.user.avatar}>
								<span>${note.user.nickname}</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${fn:length(list) == 12}">
			<div style='' class='see-more'>
				<a id='see-more'>查看更多</a>
			</div>
		</c:if>
	</div>
</div>
</body>
</html>
<script>
	var loginStatus = 1;
	var login = document.getElementById('login');
	var loginAvatar = document.getElementById('login-avatar');

	var fts=document.getElementsByClassName('figure-text');
	for(var o=0;o<fts.length;o++) {
		fts[o].onclick=function(e){
			var target=e.target;
			if(target.parentElement.className=='origin' || target.className=='origin'){
				var userId=target.parentElement.getAttribute('data-userId') || target.getAttribute('data-userId');
				location.href='/user/uid/'+userId;
			}else {
				var noteId=target.parentElement.getAttribute('data-noteId') || target.getAttribute('data-noteId');
				location.href='/note/nid/'+noteId;
			}
		}
	}
</script>
<script src='/js/jQuery.js'></script>
<script>
	var page=2;
	var seeMore=$("#see-more");
	seeMore.click(function(){
		if(page<0){

		}else{
			var seeMoreAjax=$.ajax({
				url: '/note/list/p/'+page,
				type: 'GET',
				success: function(resp){
					var obj=resp;

					if(obj.message=='SUCCESS'){
						var datas=obj.data;
						if(datas.length<12){
							page=-1;
							seeMore.hide();
						}else{
							page++;
						}
						for(var d=0;d<datas.length;d++){
							var newNote=
									'<div class="figure-3" onclick="noteClickHandler(this);">\
                                        <div class="figure-inner">\
                                            <div class="figure-image" style="background: url('+datas[d].cover+');"></div>\
								<div class="figure-text" data-noteId="'+datas[d].noteId+'">\
									<span style="font-size: 12px;">'+datas[d].createTime+'</span>\
									<h1 style="font-size: 20px;margin-top: 3px;">'+datas[d].title+'</h1>\
									<div class="origin" data-userId="'+datas[d].user.userId+'">\
										<img src="'+datas[d].user.avatar+'">\
										<span>'+datas[d].user.nickname+'</span>\
									</div>\
								</div>\
							</div>\
						</div>';
							$("#article").append(newNote);
						}
					}else{
						seeMore.hide();
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	});
</script>