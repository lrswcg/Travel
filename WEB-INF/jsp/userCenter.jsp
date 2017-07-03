<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>myHome</title>
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
			z-index: 25;
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
		}
		.main-title p {
			text-align: center;
			font-size: 16px;
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

		.main-avatar-wrapper {
			width: 100%;
			position: relative;
		}
		.main-avatar-wrapper img {
			display: block;
			height: 96px;
			width: 96px;
			border-radius: 50%;
			margin:0 auto;
		}
		.nickname-wrapper {
			text-align: center;
			overflow: hidden;
			height: 48px;
			line-height: 48px;
			width: 100%;
			font-size: 24px;
			position: relative;
		}
		.nickname-wrapper img {
			vertical-align: text-top;
			height: 32px;
			width: 32px;
		}
		.nickname {
			position: relative;
			height: 32px;
			display: inline;
			outline: none;
		}
		.nickname input {
			position: absolute;
			top: 0;
			width: 100%;
			left: 0;
			font-size: 24px;
			outline: none;
			border: none;
			display: none;
			line-height: 32px;
			font-family: inherit;
			border-bottom: 2px solid #17b4bb;
		}
		.edit-icon {
			transition: background .3s;
			display: inline-block;
			border-radius: 6px;
			width: 48px;
			height: 48px;
			cursor: pointer;
		}
		.edit-icon:hover {
			background: #dbdbdb;
		}
		.confirm-icon {
			transition: background .3s;
			display: inline-block;
			border-radius: 6px;
			width: 48px;
			height: 48px;
			position: absolute;
			transform: translate(-100%,100%);
			cursor: pointer;
		}
		.confirm-icon:hover {
			background: #dbdbdb;
		}
		.confirm-icon img,.edit-icon img {
			width: 32px;
			height: 32px;
		}
		.edit-icon-s {
			transition: background .3s;
			display: inline-block;
			border-radius: 6px;
			width: 28px;
			height: 28px;
			cursor: pointer;
			position: relative;
		}
		.edit-icon-s:hover {
			background: #dbdbdb;
		}
		.confirm-icon-s {
			transition: background .3s;
			display: inline-block;
			border-radius: 6px;
			width: 28px;
			height: 28px;
			position: absolute;
			transform: translate(-100%,100%);
			cursor: pointer;
		}
		.confirm-icon-s:hover {
			background: #dbdbdb;
		}
		.confirm-icon-s img,.edit-icon-s img {
			width: 18px;
			height: 18px;
			vertical-align: text-top;
		}
		.signature-wrapper {
			height: 28px;
			line-height: 28px;
			display: inline-block;
			position: relative;
			box-sizing: border-box;
		}
		.signature-wrapper input {
			position: absolute;
			display: block;
			top: 0;
			width: 100%;
			left: 0;
			font-size: 15px;
			outline: none;
			display: none;
			border: none;
			height: 28px;
			line-height: 28px;
			box-sizing: border-box;
			font-family: inherit;
			border-bottom: 1px solid #17b4bb;
		}
		._up1 {
			transform: translate(0,-100%);
			animation: __upo .3s;
		}
		@keyframes __upo {
			from {
				transform: translate(0,0);
			}
			to {
				transform: translate(0,-100%);
			}
		}
		._up2 {
			transform: translate(-100%,0);
			animation: __upt .3s;
		}
		@keyframes __upt {
			from {
				transform: translate(-100%,100%);
			}
			to {
				transform: translate(-100%,0);
			}
		}
		._down1 {
			transform: translate(0,0);
			animation: __downo .3s;
		}
		@keyframes __downo {
			from {
				transform: translate(0,-100%);
			}
			to {
				transform: translate(0,0);
			}
		}
		._down2 {
			transform: translate(-100%,100%);
			animation: __downt .3s;
		}
		@keyframes __downt {
			from {
				transform: translate(-100%,0);
			}
			to {
				transform: translate(-100%,100%);
			}
		}
		.signature {
			color: #666;
			font-size: 15px;
			line-height: 28px;
			margin-top: 12px;
			text-align: center;
			height: 28px;
			width: 100%;
			font-weight: 300;
			position: relative;
		}
		.content-tab-my {
			box-sizing: border-box;
			height: 32px;
			margin-bottom: 24px;
			cursor: default;
			position: relative;
		}
		.content-tab-my a {
			box-sizing: border-box;
			display: inline-block;
			line-height: 32px;
			height: 100%;
			font-size: 18px;
			margin: 0 24px 0 0;
			transition: color,border-bottom .3s;
			cursor: pointer;
		}
		.content-tab-my a.active {
			color: #333;
			border-bottom: 2px solid #17b4bb;
		}
		.content-tab-my a:hover {
			color: #333;
			border-bottom: 2px solid #17b4bb;
		}
		.content-slider {
			width: 100%;
		}
		.map {
			width: 100%;
			height: 600px;
			padding: 25px 0;
			box-sizing: border-box;
			margin: 0 0 24px 0;
			text-align: center;
			border-radius: 6px;
			position: relative;
		}
		._2-col-grid {
			width: 100%;
			display: grid;
			grid-gap: 24px;
			grid-template-columns:1fr 1fr;
			margin-bottom: 24px;
		}
		.figure {
			height: 320px;
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
			background-size: cover;
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

		.avatar-hover {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,.4);
			opacity: 0;
			border-radius: 50%;
			cursor: pointer;
			transition: opacity .3s;
		}
		.avatar-hover p {
			color: #fff;
			line-height: 96px;
			width: 100%;
			text-align: center;
		}
		.avatar {
			width: 96px;height: 96px;margin: 0 auto;position: relative;
		}
		.avatar:hover .avatar-hover {
			opacity: 1;
		}

		.add-new {
			position: absolute;
			top: 0;
			right: 0;
			line-height: 32px;
			height: 32px;
			color: #fff;
			background: #17b4bb;
			height: 100%;
			font-size: 18px;
			padding: 3px 24px;
			transition: height .3s;
			border-radius: 6px;
			cursor: pointer;
			overflow: hidden;
			z-index: 24;
		}
		.add-new:hover {
			height: calc(100% + 92px);
		}
		.add-new-options {
			width: 100%;
			color: #fff;
			padding: 8px;
			line-height: 24px;
			font-size: 16px;
			transition: background .3s;
			box-sizing: border-box;
			border-radius: 6px;
		}
		.add-new-options:hover {
			background: #199;
		}
		#notes {
			display: none; 
		}
		.note {
			width: 100%;
			box-sizing: border-box;
			padding: 12px 24px;
			border-left: 2px solid #17b3bb;
			margin-bottom: 24px;
			float: left;
		}
		.note h3 {
			margin-bottom: 12px;
		}
		h3 span {
			font-size: 16px;
			font-weight: normal;
			vertical-align: baseline;
			color: #666;
		}
		.modal-bg {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,.4);
			z-index: 26;
			display: none;
		}
		.modal {
			position: fixed;
			height: 300px;
			width: 400px;
			background: #fff;
			top: -300px;
			left: calc(50% - 200px);
			z-index: 27;
			border-radius: 6px;
			box-sizing: border-box;
			padding: 24px;
		}
		._fade-in {
			opacity: 1;
			animation: __fadeIn .3s;
		}
		@keyframes __fadeIn {
			from {
				opacity: 0;
			}
			to {
				opacity: 1;
			}
		}
		._fade-out {
			opacity: 0;
			animation: __fadeOut .3s;
		}
		@keyframes __fadeOut {
			from {
				opacity: 1;
			}
			to {
				opacity: 0;
			}
		}
		._modal-in {
			top: calc(50% - 150px);
			animation: __in .3s;
		}
		@keyframes __in {
			from {
				top: -300px;
			}
			to {
				top: calc(50% - 150px);
			}
		}
		._modal-out {
			top: -300px;
			animation: __out .3s;
		}
		@keyframes __out {
			from {
				top: calc(50% - 150px);
			}
			to {
				top: -300px;
			}
		}
		.modal textarea {
			box-sizing: border-box;
			border: 2px solid #17b4bb;
			width: 100%;
			height: calc(100%);
			outline: none;
			padding: 12px;
			border-radius: 6px;
			font-size: 18px;
			font-family: inherit;
			resize: none;
		}
		.modal div {
			position: absolute;
			left: 36px;
			bottom: 36px;
			right: 36px;
			height: 36px;
			line-height: 36px;
			font-size: 20px;
			text-align: center;
			color: #fff;
			background: #17b4bb;
			border-radius: 6px;
			transition: background .3s;
			cursor: pointer;
			display: none;
		}
		.modal div:hover {
			background: #199;
		}

		.map-container {
            width: 100%;
            height: 550px;
            margin: 0 auto;
            text-align : center;
        }
        .map-cover {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,1);
            display: none;
            box-sizing: border-box;
            padding: 24px;
            border-radius: 6px;
            z-index: 30;
        }
        .map-cover p {
        	font-size: 36px;
        	color: #333;
        	text-align: center;
        }
        .map-cover-img-wrapper {
        	position: relative;
        	width: 800px;
        	margin: 0 auto;
        	display: grid;
        	grid-template-columns: 1fr 1fr 1fr;
        	grid-gap: 24px;
        }
        .map-cover-img {
        	height: 160px;
        	background: url(img/img8.jpg) center;
        	background-size: cover;
        	position: relative;
        }
        ._fade-in-m {
            opacity: 1;
            animation: __in-m .5s;
        }
        @keyframes __in-m {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        ._fade-out-m {
            opacity: 0;
            animation: __out-m .5s;
        }
        @keyframes __out-m {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
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
<div class="modal-bg" id="modal-bg"></div>
<c:if test="${!empty sessionScope.user}">
<div class="modal" id="modal">
	<textarea placeholder="记录心情"></textarea>
	<div id='submit-note'>添加心情</div>
	<form  name="append_new_daily" id="append_new_daily" style="display: none;">
		<input type="text" name="content" id="new_daily_source">
		<input type="text" name="userId" value="${sessionScope.user.userId}">
	</form>
</div>
</c:if>
<header class="header">
	<div class="logo">
		<a href="/"><img src="/img/logo.png"></a>
	</div>
	<div class="header-link-wrapper">
<!-- 		<a href="">Home</a>
		<a href="">New</a>
		<a class="active" href="">Collections</a> -->
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
		<div class="main-avatar-wrapper">
			<div class="avatar">
				<img src=${user.avatar}>
                <c:if test="${!flag}">
                    <div class="avatar-hover" id="avatar-edit">
                        <p>更换头像</p>
						<form id='uploadNewAvatar' name="uploadNewAvatar" style="display: none;" method="post" enctype="multipart/form-data">
							<input type="file" name="file" id='avatar-input'>
						</form>
                    </div>
                </c:if>
			</div>
		</div>
		<div class="nickname-wrapper">
			<c:if test='${user.gender eq "男"}'>
				<img src="/svg/gender-boy.svg">
			</c:if>
			<c:if test='${user.gender eq "女"}'>
				<img src="/svg/gender-girl.svg">
			</c:if>
			<div class="nickname" id="nickname">
				<span>${user.nickname}</span>
                <c:if test="${!flag}">
					<input type="text" name="fake_nickname_input" id="fake_nickname_input" style="position: absolute;top: 0;left:0;width:100%;height:100%;border-bottom:2px solid #17b4bb;display: none;line-height: 48px;font-size: 24px;">
                </c:if>
			</div>
            <c:if test="${!flag}">
                <div id="edit" class="edit-icon">
                    <img src="/svg/edit.svg" title="修改昵称">
                </div>
                <div id="confirm" class="confirm-icon">
                    <img src="/svg/confirm.svg" title="确认修改">
                </div>
				<form id='uploadNewNickname'>
					<input type="text" name="nickname" id="nickname-input">
				</form>
            </c:if>
		</div>
		<div class="signature" style='overflow: hidden;'>
			<div class='signature-wrapper'>
				<span>${user.sign}</span>
                <c:if test="${!flag}">
					<form id='uploadNewSign'>
						<input type="text" name="sign" id="sign-input">
					</form>
                </c:if>
			</div>
            <c:if test="${!flag}">
                <div id="edit-s" class="edit-icon-s">
                    <img src="/svg/edit.svg" title="修改签名">
                </div>
                <div id="confirm-s" class="confirm-icon-s">
                    <img src="/svg/confirm.svg" title="确认修改">
                </div>
            </c:if>
		</div>
	</div>
	<div class="content" style="position: relative;overflow-x: hidden;">
		<div class="content-tab-my">
			<a id="tab1" class="active" onclick="show('articles');">游记</a>
			<a id='tab3' onclick="show('footprints');">足迹</a>
			<a id="tab2" onclick="show('notes');">心情</a>
            <c:if test="${!flag}">
                <div class="add-new">
                    <img src="/svg/pen.svg" style="width: 24px;height: 24px;vertical-align: text-top;">
                    添加
                    <div class="add-new-options" id="addArticle">新游记</div>
                    <div class="add-new-options" id="addNote">新心情</div>
                </div>
            </c:if>
		</div>
		<div id='footprints' class='content-slider' style='display: none;'>
			<div class="map-cover">
				<p></p>
				<div style='width: 100%;max-height: calc(100% - 96px);overflow-y: scroll;margin: 24px 0;'>
					<div class='map-cover-img-wrapper' id="map-cover-img-wrapper">

					</div>
				</div>
				<div id='close-map-cover' style='position: fixed;top: 36px;right: 36px;height: 36px;width: 36px;'>
					<img src='/svg/close.svg' style='display: block;width: 100%;height: 100%;'>
				</div>
			</div>
			<div class="map">
				<div class="map-container">
			<?xml version="1.0" encoding="utf-8" standalone="no"?>
			<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

			<svg version="1.1" height="550px" width="800px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			<desc>
			Map version: 1.1.2
			Copyright (c) 2015 Highsoft AS, Based on data from Natural Earth
			</desc>
			<title>China with Hong Kong, Macau, and Taiwan</title>
			<g id="admin1">

			<g id="TW">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <name>Taiwan</name>
			    <labelrank>3</labelrank>
			    <country-abbrev>Taiwan</country-abbrev>
			    <subregion>Eastern Asia</subregion>
			    <region-wb>East Asia &amp; Pacific</region-wb>
			    <iso-a3>TWN</iso-a3>
			    <iso-a2>TW</iso-a2>
			    <woe-id>23424971</woe-id>
			    <continent>Asia</continent>
			    <hc-key>tw</hc-key>
			    <hc-a2>TA</hc-a2>
			  </desc>
			</g>

			<g id="CN">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <name>China</name>
			    <labelrank>2</labelrank>
			    <country-abbrev>China</country-abbrev>
			    <subregion>Eastern Asia</subregion>
			    <region-wb>East Asia &amp; Pacific</region-wb>
			    <iso-a3>CHN</iso-a3>
			    <iso-a2>CN</iso-a2>
			    <woe-id>23424781</woe-id>
			    <continent>Asia</continent>
			    <hc-key>cn</hc-key>
			    <hc-a2>CH</hc-a2>
			  </desc>
			</g>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.PH" d="M546.9,462.4 L547.3,462.9 L546.6,463.1 L546.3,462.6 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.PH</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>22695856</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>PH</postal-code>
			    <name>Penghu</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>119.597</longitude>
			    <woe-name>Penghu County</woe-name>
			    <latitude>23.5724</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.41</hc-middle-y>
			    <hc-key>tw-ph</hc-key>
			    <hc-a2>PH</hc-a2>
			  </desc>
			</path>

			<path data-name="上海" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.SH" d="M571.7,347.5 L571.0,347.8 L564.1,345.0 L562.3,343.1 L563.3,342.3 L566.0,343.2 L568.5,344.8 L572.5,346.2 Z M564.5,347.3 L569.5,350.2 L571.5,352.7 L572.9,355.4 L572.1,356.3 L568.6,356.7 L564.2,359.0 L562.0,357.1 L560.5,357.2 L560.2,354.6 L559.4,354.6 L558.8,352.8 L561.3,352.4 L562.6,347.9 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>7</labelrank>
			    <hasc>CN.SH</hasc>
			    <alt-name>Shàngh?i</alt-name>
			    <woe-id>12578012</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH23</fips>
			    <postal-code>SH</postal-code>
			    <name>Shanghai</name>
			    <country>China</country>
			    <type-en>Municipality</type-en>
			    <region>East China</region>
			    <longitude>121.409</longitude>
			    <woe-name>Shanghai</woe-name>
			    <latitude>31.0909</latitude>
			    <woe-label>Shanghai, CN, China</woe-label>
			    <type>Zhíxiáshì</type>
			    <hc-middle-x>0.96</hc-middle-x>
			    <hc-middle-y>0.82</hc-middle-y>
			    <hc-key>cn-sh</hc-key>
			    <hc-a2>SH</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.KM" d="M531.1,449.8 L531.2,451.1 L529.0,451.4 L529.0,450.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.FK.KM</hasc>
			    <alt-name>Chinmen|Jinmen</alt-name>
			    <woe-id>28760735</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>KM</postal-code>
			    <name>Kinmen</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Fujian Province</region>
			    <longitude>118.368</longitude>
			    <woe-name>Kinmen</woe-name>
			    <latitude>24.454</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.51</hc-middle-x>
			    <hc-middle-y>0.50</hc-middle-y>
			    <hc-key>tw-km</hc-key>
			    <hc-a2>KM</hc-a2>
			  </desc>
			</path>

			<path data-name='浙江' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.ZJ" d="M578.7,368.8 L578.8,370.4 L576.9,370.9 L578.6,370.1 Z M575.9,365.0 L574.6,364.4 L576.3,363.5 L576.0,367.1 L577.9,368.0 L577.6,369.4 L576.2,368.6 L574.2,368.7 L573.5,367.7 L572.5,369.0 L572.3,367.6 L574.4,365.7 L575.6,366.8 Z M559.4,354.6 L560.2,354.6 L560.5,357.2 L562.0,357.1 L564.2,359.0 L560.6,361.4 L560.2,363.2 L558.3,365.1 L557.2,363.7 L553.8,363.9 L556.6,364.2 L557.7,366.0 L559.8,366.9 L562.9,364.4 L565.8,364.3 L567.5,365.8 L569.8,368.9 L573.7,370.3 L575.7,370.3 L573.6,371.4 L570.4,375.1 L568.3,376.1 L567.2,375.9 L568.1,377.7 L568.8,376.6 L573.1,373.9 L573.9,376.7 L573.2,377.6 L573.7,382.3 L571.8,381.6 L571.8,377.9 L571.2,380.4 L570.0,380.7 L569.2,379.2 L566.9,382.0 L569.7,381.8 L570.6,384.6 L568.2,384.2 L570.5,385.9 L569.8,387.4 L567.9,388.0 L570.1,390.6 L569.7,391.5 L570.7,393.0 L568.3,393.2 L567.4,393.9 L567.1,395.7 L565.9,395.1 L566.1,396.6 L564.4,397.6 L563.9,396.2 L565.5,394.2 L564.6,392.6 L563.9,395.0 L562.1,398.5 L558.7,398.3 L560.4,399.0 L560.1,400.8 L557.6,404.7 L558.6,405.7 L558.2,407.4 L557.0,407.1 L556.8,410.1 L555.5,410.0 L554.4,407.6 L551.9,407.4 L550.8,408.2 L547.1,408.8 L545.9,406.0 L544.1,403.7 L543.0,405.9 L540.5,407.4 L536.0,406.8 L535.5,403.3 L534.5,400.6 L533.6,399.7 L534.1,395.8 L533.3,394.6 L530.3,395.6 L529.6,395.3 L529.9,394.6 L529.2,389.4 L526.5,385.7 L524.4,384.3 L523.6,383.0 L524.2,381.1 L525.2,380.7 L525.7,379.1 L528.2,378.4 L530.4,375.8 L532.5,374.2 L532.7,372.8 L534.6,370.5 L534.0,368.0 L534.3,365.5 L538.9,365.7 L540.7,364.7 L539.7,362.5 L538.7,362.1 L540.4,360.1 L541.2,360.7 L542.8,357.6 L543.3,353.4 L544.7,352.8 L547.1,353.1 L547.3,354.0 L549.7,356.0 L552.6,355.9 L553.7,356.6 L554.3,358.4 L557.0,356.4 L556.7,355.2 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.ZJ</hasc>
			    <alt-name>Zhèji?ng</alt-name>
			    <woe-id>12577992</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH02</fips>
			    <postal-code>ZJ</postal-code>
			    <name>Zhejiang</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>East China</region>
			    <longitude>119.97</longitude>
			    <woe-name>Zhejiang</woe-name>
			    <latitude>29.1084</latitude>
			    <woe-label>Zhejiang, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.48</hc-middle-x>
			    <hc-middle-y>0.51</hc-middle-y>
			    <hc-key>cn-zj</hc-key>
			    <hc-a2>ZJ</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.LK" d="M549.8,425.4 L550.2,425.4 L549.7,425.7 L549.5,425.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.FK.LK</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>28760734</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>LK</postal-code>
			    <name>Lienchiang</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Fujian Province</region>
			    <longitude>119.938</longitude>
			    <woe-name>Lienchiang</woe-name>
			    <latitude>26.1519</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.21</hc-middle-y>
			    <hc-key>tw-lk</hc-key>
			    <hc-a2>LK</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.3664" d="M433.6,575.7 L433.4,575.7 L433.5,575.6 L433.6,575.6 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>CN</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>12497556</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Paracel Islands</name>
			    <country>China</country>
			    <type-en>NULL</type-en>
			    <region>NULL</region>
			    <longitude>111.201</longitude>
			    <woe-name>Paracel Islands</woe-name>
			    <latitude>15.7833</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.50</hc-middle-y>
			    <hc-key>cn-3664</hc-key>
			    <hc-a2>PI</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.3681" d="M466.7,484.3 L467.0,484.8 L466.5,485.1 L466.3,484.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>MO</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>20070017</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Macau</name>
			    <country>Macau S.A.R</country>
			    <type-en>NULL</type-en>
			    <region>NULL</region>
			    <longitude>113.56</longitude>
			    <woe-name>Macau</woe-name>
			    <latitude>22.1349</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.30</hc-middle-x>
			    <hc-middle-y>0.41</hc-middle-y>
			    <hc-key>cn-3681</hc-key>
			    <hc-a2>MA</hc-a2>
			  </desc>
			</path>

			<path data-name='福建' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.FJ" d="M543.9,427.9 L545.1,427.1 L546.9,428.0 L545.4,430.4 L545.5,432.4 L543.7,432.4 L545.5,435.6 L542.5,434.5 L542.3,436.1 L541.1,435.5 L539.3,436.4 L540.3,437.8 L541.7,437.6 L542.6,438.9 L541.9,439.7 L539.4,439.6 L537.8,438.4 L536.3,439.3 L537.6,439.7 L536.3,441.2 L538.2,443.2 L534.5,444.9 L533.8,443.3 L533.2,444.9 L535.2,446.2 L533.7,448.9 L530.8,448.0 L527.8,449.2 L527.3,450.9 L526.0,449.8 L525.2,450.8 L522.5,450.7 L524.1,451.8 L525.9,451.5 L527.0,453.5 L524.9,455.0 L524.0,456.9 L522.7,457.3 L522.2,456.3 L520.8,458.7 L520.1,461.2 L519.9,459.0 L518.8,459.2 L518.2,461.1 L519.2,461.1 L516.6,463.6 L517.5,462.1 L516.1,460.5 L515.5,463.2 L514.6,463.0 L512.8,461.3 L511.2,456.5 L511.7,454.9 L510.5,451.9 L508.7,449.7 L509.0,448.0 L505.8,448.8 L503.7,445.6 L500.3,445.6 L497.4,444.6 L496.7,440.6 L498.5,438.3 L499.1,434.2 L500.8,432.1 L500.4,430.9 L502.9,429.6 L504.1,426.7 L503.8,424.7 L506.6,421.7 L505.1,418.9 L505.5,416.3 L507.1,414.6 L510.4,414.0 L511.9,412.7 L513.3,410.3 L512.6,409.3 L512.7,406.1 L514.9,403.1 L514.8,401.9 L517.7,400.2 L518.9,401.6 L520.8,402.4 L521.7,400.6 L524.8,399.9 L525.6,399.0 L528.7,398.0 L528.4,396.3 L529.6,395.3 L530.3,395.6 L533.3,394.6 L534.1,395.8 L533.6,399.7 L534.5,400.6 L535.5,403.3 L536.0,406.8 L540.5,407.4 L543.0,405.9 L544.1,403.7 L545.9,406.0 L547.1,408.8 L550.8,408.2 L551.9,407.4 L554.4,407.6 L555.5,410.0 L554.8,411.6 L553.3,411.2 L553.9,414.0 L551.9,414.2 L550.6,415.2 L552.0,416.1 L551.4,418.3 L549.9,418.9 L549.0,420.2 L548.7,418.9 L550.2,418.2 L551.3,416.3 L549.3,416.3 L548.5,418.3 L547.7,417.8 L547.7,415.6 L546.5,419.0 L548.1,421.2 L547.4,421.9 L546.0,420.6 L546.4,423.2 L548.2,421.6 L549.0,423.2 L546.3,423.8 L545.3,425.5 L546.1,426.7 L544.7,426.5 Z M543.9,427.9 L543.4,428.1 L543.4,428.1 L543.4,428.1 L543.4,428.1 L541.1,428.0 L542.3,428.8 L543.4,428.1 L543.4,428.1 L543.4,428.1 L543.4,428.1 L543.7,428.2 Z M547.4,432.9 L549.3,434.1 L547.9,436.3 L547.0,435.9 L548.1,434.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.FJ</hasc>
			    <alt-name>Fújiàn</alt-name>
			    <woe-id>12577997</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH07</fips>
			    <postal-code>FJ</postal-code>
			    <name>Fujian</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>NULL</region>
			    <longitude>118.178</longitude>
			    <woe-name>Fujian</woe-name>
			    <latitude>26.408</latitude>
			    <woe-label>Fujian, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.56</hc-middle-x>
			    <hc-middle-y>0.36</hc-middle-y>
			    <hc-key>cn-fj</hc-key>
			    <hc-a2>FJ</hc-a2>
			  </desc>
			</path>

			<path data-name='广东' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.GD" d="M426.4,501.3 L423.6,500.4 L422.2,500.8 L422.6,499.4 L425.8,499.3 Z M475.6,478.7 L474.7,478.6 L473.7,479.1 L472.1,478.9 L471.1,480.2 L469.2,475.7 L468.0,475.8 L467.4,473.7 L467.7,471.8 L466.4,472.3 L467.0,470.9 L465.7,471.5 L466.9,474.7 L463.9,473.9 L467.7,477.2 L466.7,481.2 L468.0,480.4 L465.8,484.2 L464.9,484.0 L462.6,480.8 L461.4,478.4 L461.4,479.8 L464.6,484.1 L462.8,485.4 L461.8,487.1 L460.3,483.6 L459.6,484.6 L459.6,487.2 L458.0,488.7 L456.9,487.1 L454.4,488.7 L453.9,489.8 L451.7,489.0 L450.6,490.4 L449.0,490.7 L448.1,489.2 L445.9,489.3 L444.3,487.5 L444.5,489.1 L445.8,489.7 L444.3,491.4 L445.5,492.1 L443.3,492.7 L444.0,490.5 L441.7,489.9 L442.8,491.1 L440.7,493.2 L438.2,493.1 L433.5,493.9 L428.3,495.6 L426.3,498.9 L424.3,497.9 L424.4,495.1 L423.7,496.1 L424.0,498.1 L421.4,499.2 L420.7,502.6 L423.6,502.6 L422.6,505.4 L425.0,506.7 L425.7,508.0 L423.8,510.5 L420.1,511.2 L418.8,510.4 L417.2,511.1 L416.6,508.8 L418.1,509.6 L418.7,508.7 L417.5,507.4 L416.3,507.4 L415.5,502.8 L414.1,501.3 L414.6,497.8 L415.7,497.2 L415.6,495.2 L417.8,495.1 L418.1,493.2 L416.2,493.5 L415.5,492.0 L417.8,490.5 L418.5,487.9 L424.0,487.5 L423.5,483.4 L425.3,484.0 L427.7,483.6 L428.1,482.4 L429.5,482.2 L428.3,479.3 L429.3,477.9 L432.9,477.1 L433.5,475.7 L435.0,475.6 L437.3,473.3 L438.2,471.0 L437.6,470.0 L438.0,465.8 L439.1,463.2 L440.8,462.6 L441.6,460.0 L443.2,460.1 L444.9,457.7 L444.5,454.4 L445.9,453.8 L446.8,452.3 L446.3,449.8 L445.4,449.1 L446.2,447.2 L448.2,446.4 L447.9,444.1 L448.8,441.2 L452.4,441.1 L455.1,441.8 L456.9,444.3 L459.3,444.0 L459.1,440.9 L459.7,440.0 L458.0,440.0 L458.3,438.9 L462.3,436.2 L467.1,438.8 L470.3,438.4 L471.6,437.1 L472.7,437.3 L472.9,439.7 L474.1,439.1 L476.2,439.3 L478.2,438.0 L480.0,437.7 L481.8,439.3 L482.2,441.6 L478.0,443.8 L476.5,447.0 L474.8,448.3 L478.2,450.7 L479.1,449.9 L482.3,448.9 L483.9,449.4 L486.3,447.7 L487.6,448.0 L491.2,446.6 L495.0,450.0 L496.2,449.7 L495.7,445.9 L497.4,444.6 L500.3,445.6 L503.7,445.6 L505.8,448.8 L509.0,448.0 L508.7,449.7 L510.5,451.9 L511.7,454.9 L511.2,456.5 L512.8,461.3 L514.6,463.0 L513.4,464.0 L513.2,462.5 L511.8,464.1 L511.1,462.5 L510.6,465.5 L509.4,467.0 L506.0,466.1 L506.9,467.5 L509.0,467.3 L507.7,469.7 L507.3,468.6 L506.2,470.5 L506.7,471.8 L505.8,472.9 L503.2,472.6 L500.5,474.6 L500.8,473.6 L496.9,475.8 L495.0,473.8 L492.9,475.9 L493.6,477.0 L490.9,476.6 L491.5,475.6 L489.0,475.3 L489.9,474.5 L486.8,475.2 L484.3,478.6 L482.6,478.2 L483.0,474.9 L480.1,476.1 L479.8,478.5 L480.8,479.3 L479.5,480.1 L477.8,477.8 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.GD</hasc>
			    <alt-name>Gu?ngd?ng</alt-name>
			    <woe-id>12578019</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH30</fips>
			    <postal-code>GD</postal-code>
			    <name>Guangdong</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>South Central China</region>
			    <longitude>113.72</longitude>
			    <woe-name>Guangdong</woe-name>
			    <latitude>23.7924</latitude>
			    <woe-label>Guangdong, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.46</hc-middle-x>
			    <hc-middle-y>0.32</hc-middle-y>
			    <hc-key>cn-gd</hc-key>
			    <hc-a2>GD</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.TW" d="M572.5,441.5 L571.8,441.6 L570.4,439.5 L571.6,438.2 L573.0,440.8 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TP.TC</hasc>
			    <alt-name>Taibei Shi</alt-name>
			    <woe-id>20070568</woe-id>
			    <subregion>NULL</subregion>
			    <fips>TW03</fips>
			    <postal-code>TW</postal-code>
			    <name>Taipei City</name>
			    <country>Taiwan</country>
			    <type-en>Special Municipality</type-en>
			    <region>Special Municipalities</region>
			    <longitude>121.559</longitude>
			    <woe-name>Taipei City</woe-name>
			    <latitude>25.0904</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Zhixiashi</type>
			    <hc-middle-x>0.55</hc-middle-x>
			    <hc-middle-y>0.55</hc-middle-y>
			    <hc-key>tw-tw</hc-key>
			    <hc-a2>TW</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.CS" d="M557.2,463.3 L558.1,463.1 L558.9,463.9 L558.1,464.2 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.CS</hasc>
			    <alt-name>Jiayi Shi|Chiai City</alt-name>
			    <woe-id>28751583</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>CS</postal-code>
			    <name>Chiayi City</name>
			    <country>Taiwan</country>
			    <type-en>Provincial City</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.441</longitude>
			    <woe-name>Chiayi City</woe-name>
			    <latitude>23.4822</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Shi</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.43</hc-middle-y>
			    <hc-key>tw-cs</hc-key>
			    <hc-a2>CS</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6657" d="M475.9,483.1 L475.4,483.9 L474.1,482.8 L474.3,482.8 L474.7,482.9 L474.9,482.9 L475.1,482.9 L475.7,483.0 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703130</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Southern</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Hong Kong Island</region>
			    <longitude>114.204</longitude>
			    <woe-name>Southern</woe-name>
			    <latitude>22.2402</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.47</hc-middle-x>
			    <hc-middle-y>0.22</hc-middle-y>
			    <hc-key>cn-6657</hc-key>
			    <hc-a2>SO</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6663" d="M477.5,480.2 L476.7,482.4 L475.8,482.5 L475.8,482.1 L475.7,481.9 L475.6,481.5 L475.8,481.2 L475.9,481.0 L476.8,480.6 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703139</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Sai Kung</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>114.249</longitude>
			    <woe-name>Sai Kung</woe-name>
			    <latitude>22.3463</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.43</hc-middle-x>
			    <hc-middle-y>0.46</hc-middle-y>
			    <hc-key>cn-6663</hc-key>
			    <hc-a2>SK</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6665" d="M474.4,482.2 L474.3,482.1 L474.4,482.1 Z M474.5,481.9 L474.1,481.6 L474.1,481.5 L474.4,481.4 L474.6,481.4 L474.6,481.6 L474.7,481.7 L474.6,481.8 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703132</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Kwai Tsing</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>114.14</longitude>
			    <woe-name>Kwai Tsing</woe-name>
			    <latitude>22.351</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.51</hc-middle-x>
			    <hc-middle-y>0.38</hc-middle-y>
			    <hc-key>cn-6665</hc-key>
			    <hc-a2>KT</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6666" d="M474.6,481.4 L474.4,481.4 L474.1,481.5 L473.6,481.4 L472.8,481.6 L472.9,481.3 L473.1,481.2 L473.5,481.0 L474.4,480.7 L474.6,480.7 L474.9,480.7 L474.9,481.0 Z M472.5,482.1 L473.5,481.6 L473.0,482.1 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703140</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Tsuen Wan</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>114.12</longitude>
			    <woe-name>Tsuen Wan</woe-name>
			    <latitude>22.3869</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.57</hc-middle-x>
			    <hc-middle-y>0.40</hc-middle-y>
			    <hc-key>cn-6666</hc-key>
			    <hc-a2>TW</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6667" d="M473.1,481.2 L472.9,481.3 L472.8,481.6 L470.9,481.1 L471.8,480.5 L472.4,480.9 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703141</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Tuen Mun</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>113.991</longitude>
			    <woe-name>Tuen Mun</woe-name>
			    <latitude>22.3846</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.52</hc-middle-x>
			    <hc-middle-y>0.43</hc-middle-y>
			    <hc-key>cn-6667</hc-key>
			    <hc-a2>TM</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6669" d="M473.7,479.1 L473.7,479.1 L474.7,478.6 L475.6,478.7 L476.4,478.7 L477.0,479.3 L475.4,479.5 L474.4,479.9 L473.9,479.9 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703142</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>North</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>114.148</longitude>
			    <woe-name>North</woe-name>
			    <latitude>22.5063</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.49</hc-middle-x>
			    <hc-middle-y>0.37</hc-middle-y>
			    <hc-key>cn-6669</hc-key>
			    <hc-a2>NO</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6670" d="M477.5,480.2 L476.8,480.6 L475.9,481.0 L475.9,480.7 L475.9,480.5 L476.9,479.8 Z M474.9,480.7 L474.6,480.7 L474.4,480.7 L474.3,480.2 L474.4,479.9 L475.4,479.5 L477.0,479.3 L476.0,480.2 L475.3,480.6 L475.0,480.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703144</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Tai Po</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>114.154</longitude>
			    <woe-name>Tai Po</woe-name>
			    <latitude>22.4447</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.43</hc-middle-x>
			    <hc-middle-y>0.35</hc-middle-y>
			    <hc-key>cn-6670</hc-key>
			    <hc-a2>TP</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6671" d="M472.5,482.1 L473.0,482.1 L472.8,483.4 L470.5,483.8 L471.1,482.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703127</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Islands</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>113.954</longitude>
			    <woe-name>Islands</woe-name>
			    <latitude>22.2597</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>cn-6671</hc-key>
			    <hc-a2>IS</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.KH" d="M558.1,478.0 L557.0,477.5 L555.7,475.6 L554.6,471.7 L557.0,472.1 L558.1,471.5 L560.9,467.2 L561.6,466.2 L564.8,463.5 L565.4,463.6 L565.6,464.0 L565.3,465.0 L566.1,465.9 L564.4,466.9 L563.8,472.4 L562.2,472.0 L558.7,472.9 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.KH.KC</hasc>
			    <alt-name>Gaoxiong Shi</alt-name>
			    <woe-id>20070571</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>KH</postal-code>
			    <name>Kaohsiung City</name>
			    <country>Taiwan</country>
			    <type-en>Special Municipality</type-en>
			    <region>Special Municipalities</region>
			    <longitude>120.609</longitude>
			    <woe-name>Kaohsiung City</woe-name>
			    <latitude>23.0157</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Zhixiashi</type>
			    <hc-middle-x>0.22</hc-middle-x>
			    <hc-middle-y>0.74</hc-middle-y>
			    <hc-key>tw-kh</hc-key>
			    <hc-a2>KH</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.HS" d="M562.9,445.2 L563.3,444.2 L563.4,443.7 L565.1,444.7 L564.0,445.6 L563.8,445.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.HS</hasc>
			    <alt-name>Xinzhu Shi</alt-name>
			    <woe-id>28751582</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>HS</postal-code>
			    <name>Hsinchu City</name>
			    <country>Taiwan</country>
			    <type-en>Provincial City</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.959</longitude>
			    <woe-name>Hsinchu City</woe-name>
			    <latitude>24.7757</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Shi</type>
			    <hc-middle-x>0.43</hc-middle-x>
			    <hc-middle-y>0.58</hc-middle-y>
			    <hc-key>tw-hs</hc-key>
			    <hc-a2>HS</hc-a2>
			  </desc>
			</path>

			<path data-name='云南' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.YN" d="M269.0,388.0 L270.6,387.3 L271.7,385.2 L273.9,387.0 L276.1,384.6 L275.8,381.0 L277.0,379.9 L277.2,376.7 L278.7,376.5 L279.3,379.2 L281.7,375.7 L281.6,373.8 L283.2,373.7 L282.6,381.1 L283.1,382.7 L282.8,385.1 L285.2,389.0 L285.9,383.8 L287.3,383.4 L289.2,380.2 L290.4,379.9 L290.4,381.3 L291.7,383.5 L295.2,387.6 L295.3,389.1 L293.7,389.7 L293.7,391.5 L297.1,396.4 L297.9,395.3 L301.2,394.9 L303.6,399.6 L303.4,400.6 L304.8,403.1 L304.8,405.0 L307.0,405.3 L306.4,407.4 L308.8,410.1 L309.5,412.2 L310.6,412.6 L309.4,414.5 L311.0,415.7 L312.1,417.9 L311.3,419.9 L313.5,420.5 L314.4,422.6 L315.4,421.8 L317.9,422.2 L319.9,420.2 L324.1,418.4 L325.3,420.6 L328.1,418.8 L329.1,419.2 L330.6,416.5 L329.9,412.2 L329.0,410.8 L329.2,405.5 L330.4,404.2 L332.3,404.0 L333.7,401.8 L337.7,397.8 L337.4,393.8 L339.8,392.0 L340.6,392.9 L342.9,391.4 L342.0,388.4 L342.9,386.4 L344.1,387.3 L350.0,387.3 L350.3,387.8 L347.8,388.7 L347.9,391.6 L349.2,392.4 L350.0,395.1 L348.5,395.8 L348.9,397.1 L351.8,398.9 L355.6,398.3 L356.6,396.3 L357.8,395.7 L360.6,397.2 L359.8,399.2 L360.6,401.2 L359.0,405.8 L357.6,405.5 L354.8,406.9 L351.2,406.6 L349.3,406.0 L348.1,404.6 L345.8,406.9 L343.4,404.9 L342.5,404.9 L338.1,409.2 L339.4,409.6 L340.4,411.1 L339.6,412.5 L340.1,416.6 L343.1,417.7 L344.9,415.8 L347.6,416.0 L348.6,415.1 L348.9,416.6 L350.1,417.1 L351.5,420.1 L349.7,421.6 L348.9,425.0 L347.4,426.1 L347.7,427.4 L346.0,430.1 L348.9,432.6 L349.2,434.4 L351.9,436.3 L351.1,437.0 L350.6,440.0 L348.4,442.5 L348.3,443.6 L347.7,445.9 L348.8,448.5 L350.5,449.1 L350.9,447.7 L355.6,448.8 L356.3,450.3 L356.1,452.3 L359.7,454.4 L360.7,453.3 L364.2,454.8 L367.3,453.7 L369.0,455.8 L369.4,457.3 L368.3,462.0 L366.3,462.9 L364.6,462.1 L360.0,467.0 L357.4,463.9 L356.0,465.3 L351.3,466.5 L350.3,467.5 L350.5,469.9 L349.2,471.0 L346.9,470.9 L343.9,472.9 L342.3,470.8 L339.7,472.2 L339.0,474.9 L337.5,474.1 L334.8,470.7 L332.8,473.6 L331.5,471.4 L330.3,470.6 L327.8,474.0 L325.7,475.3 L323.9,473.1 L318.7,470.1 L317.7,472.2 L315.4,475.0 L312.7,474.3 L310.7,475.1 L309.7,473.6 L307.9,473.9 L307.1,476.1 L305.9,476.9 L306.8,480.7 L308.5,483.0 L308.1,484.4 L309.0,485.8 L308.0,486.7 L307.6,490.3 L308.7,491.1 L307.3,492.7 L304.5,490.9 L301.4,491.7 L300.6,490.6 L301.1,488.9 L300.3,488.3 L300.6,486.4 L300.0,483.1 L296.7,484.1 L294.2,486.2 L290.8,486.8 L289.1,485.6 L287.1,486.9 L286.0,485.3 L286.9,483.6 L284.3,482.4 L284.1,480.5 L284.6,477.7 L283.0,478.0 L282.0,477.2 L278.0,476.0 L275.5,476.1 L274.1,475.2 L275.8,471.9 L277.4,470.6 L277.1,467.0 L278.7,464.4 L280.4,464.7 L280.0,462.7 L277.7,461.5 L276.3,462.4 L273.9,460.7 L271.7,460.2 L272.6,458.6 L272.4,457.0 L271.2,455.0 L272.3,454.1 L271.5,451.7 L270.0,451.1 L270.2,448.6 L272.9,447.3 L273.1,446.4 L269.4,447.0 L268.3,446.3 L264.1,445.9 L260.1,446.9 L256.6,448.8 L255.1,447.5 L257.9,445.2 L258.3,443.0 L257.5,440.6 L255.9,440.5 L256.6,436.1 L259.8,434.8 L259.1,433.2 L261.1,429.1 L261.8,429.9 L265.0,427.6 L265.7,424.5 L268.1,425.3 L270.8,421.7 L272.1,422.3 L273.2,421.3 L272.0,419.7 L271.7,417.9 L273.8,417.1 L273.1,415.9 L274.3,413.7 L275.1,410.7 L274.9,407.2 L275.4,404.6 L274.8,402.7 L275.4,400.9 L275.4,396.9 L272.1,395.0 L271.6,396.8 L270.4,397.0 L269.5,394.1 L269.4,391.6 L268.7,390.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.YN</hasc>
			    <alt-name>Yúnnán</alt-name>
			    <woe-id>12578018</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH29</fips>
			    <postal-code>YN</postal-code>
			    <name>Yunnan</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Southwest China</region>
			    <longitude>101.661</longitude>
			    <woe-name>Yunnan</woe-name>
			    <latitude>24.4603</latitude>
			    <woe-label>Yunnan, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.42</hc-middle-x>
			    <hc-middle-y>0.59</hc-middle-y>
			    <hc-key>cn-yn</hc-key>
			    <hc-a2>YN</hc-a2>
			  </desc>
			</path>

			<path data-name='西藏' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.XZ" d="M283.2,373.7 L281.6,373.8 L281.7,375.7 L279.3,379.2 L278.7,376.5 L277.2,376.7 L277.0,379.9 L275.8,381.0 L276.1,384.6 L273.9,387.0 L271.7,385.2 L270.6,387.3 L269.0,388.0 L266.1,384.4 L264.6,384.1 L263.9,382.2 L262.3,381.6 L260.8,383.7 L260.7,384.9 L259.0,385.9 L256.6,383.5 L254.6,383.8 L251.6,379.7 L249.8,379.6 L248.8,381.9 L248.3,379.0 L250.5,377.8 L250.4,376.4 L248.0,371.9 L245.9,372.7 L245.8,371.5 L247.7,370.8 L248.1,369.3 L246.4,369.4 L245.8,367.7 L240.7,367.5 L240.2,369.3 L238.6,368.6 L237.4,370.2 L234.8,369.8 L234.4,371.0 L230.4,368.8 L228.2,368.6 L226.6,366.2 L225.2,367.3 L223.5,367.4 L221.7,368.8 L222.5,370.0 L219.6,371.5 L212.7,373.9 L210.4,373.6 L206.4,375.7 L205.4,377.4 L202.0,379.5 L199.3,380.4 L199.8,381.5 L198.6,383.1 L194.2,384.4 L191.3,383.9 L189.9,384.7 L185.6,383.6 L186.2,381.4 L183.4,379.8 L181.9,378.2 L179.2,379.6 L174.2,377.2 L171.5,377.0 L173.3,374.9 L169.0,372.4 L164.2,372.6 L162.6,374.0 L160.1,374.3 L156.6,377.7 L155.1,378.4 L153.4,380.7 L152.4,380.9 L150.7,383.2 L151.1,384.7 L149.7,384.7 L148.4,383.2 L148.3,381.1 L150.4,377.1 L150.3,374.9 L147.9,372.9 L144.7,374.1 L141.3,374.1 L141.1,375.3 L137.5,374.1 L136.0,375.3 L133.6,374.5 L131.5,374.6 L128.8,373.8 L127.5,371.9 L124.0,370.1 L123.3,368.7 L121.7,368.7 L120.0,371.0 L117.2,369.2 L117.0,366.9 L115.7,367.9 L115.9,370.1 L114.1,370.4 L113.1,366.2 L112.1,365.3 L111.6,363.3 L110.4,364.3 L108.2,363.3 L107.0,363.6 L103.8,362.2 L104.1,360.5 L105.6,358.6 L104.3,357.5 L102.4,358.7 L99.5,357.2 L98.9,355.7 L97.0,354.8 L96.1,352.7 L94.7,351.9 L95.0,350.1 L94.0,346.6 L91.4,345.6 L89.2,345.9 L88.2,346.8 L86.5,346.0 L85.0,341.4 L83.3,339.0 L82.1,339.4 L81.1,338.0 L79.3,337.7 L76.4,333.2 L74.8,331.7 L71.9,330.1 L72.4,328.6 L72.0,326.3 L68.2,325.1 L66.1,323.8 L64.5,324.7 L63.4,323.9 L61.9,327.1 L59.9,328.6 L58.8,328.2 L58.0,324.5 L55.8,323.1 L55.2,321.9 L50.8,318.6 L49.0,318.1 L50.2,315.8 L48.3,314.5 L46.0,311.4 L42.8,311.1 L40.9,309.4 L39.9,307.7 L39.4,304.5 L38.1,302.6 L36.6,304.0 L33.8,303.1 L33.8,300.5 L35.6,299.5 L34.3,296.7 L35.9,294.2 L33.2,289.6 L33.8,286.9 L33.2,285.1 L36.4,285.1 L37.6,284.4 L37.8,287.1 L39.1,289.0 L41.2,289.2 L42.0,287.9 L44.0,288.1 L46.9,286.4 L47.5,285.0 L46.2,281.5 L47.4,278.7 L42.9,275.5 L41.4,271.5 L42.2,268.8 L42.5,263.8 L45.9,262.4 L46.0,260.6 L49.3,259.8 L53.1,260.2 L56.4,261.5 L59.1,258.2 L59.0,254.7 L61.2,253.7 L61.0,252.6 L63.5,250.6 L66.0,247.2 L67.7,249.2 L71.9,250.9 L73.2,252.0 L74.5,250.8 L76.0,252.3 L77.8,252.4 L79.8,254.0 L81.8,254.5 L85.5,254.2 L86.9,252.5 L89.6,251.6 L91.6,249.8 L94.9,251.0 L97.6,251.2 L97.5,254.0 L98.8,255.4 L100.6,255.6 L104.3,257.2 L108.0,257.7 L109.4,257.4 L112.1,258.3 L116.8,256.6 L119.4,256.5 L121.4,255.5 L124.3,255.1 L127.1,255.5 L128.9,257.4 L131.1,256.2 L133.6,256.6 L135.8,255.3 L137.9,252.0 L141.1,251.0 L150.1,251.3 L152.1,250.5 L154.7,251.6 L159.0,251.6 L160.0,251.0 L165.5,251.6 L168.3,253.3 L169.7,253.4 L171.1,255.0 L174.2,255.8 L179.2,259.3 L177.2,259.4 L176.1,260.3 L176.5,261.9 L180.0,263.3 L178.1,267.8 L178.4,268.8 L175.2,269.9 L174.6,271.7 L175.7,274.0 L175.3,275.7 L177.9,276.5 L178.2,277.8 L176.8,279.1 L177.4,284.8 L176.3,287.2 L174.2,288.4 L175.1,291.3 L176.6,292.8 L177.3,295.8 L179.2,296.9 L179.6,299.6 L180.8,301.4 L182.2,301.7 L184.7,304.0 L186.4,304.5 L188.4,303.3 L190.6,303.4 L191.5,302.3 L193.6,302.6 L195.3,306.6 L198.4,308.7 L200.2,310.8 L202.9,310.8 L203.0,312.7 L206.0,312.7 L208.3,313.5 L212.6,314.1 L212.8,315.2 L215.1,315.6 L218.4,318.1 L221.3,317.7 L222.9,319.0 L225.8,319.6 L228.4,319.0 L231.9,317.5 L235.9,321.6 L235.9,322.9 L237.1,324.2 L239.5,324.7 L241.3,327.2 L240.2,329.1 L240.6,331.3 L241.6,332.4 L244.5,332.7 L249.0,333.9 L249.7,336.2 L250.6,335.8 L250.5,333.5 L249.8,332.8 L251.6,331.1 L253.9,333.6 L257.7,334.6 L257.4,330.9 L261.0,330.4 L262.3,330.8 L264.0,330.0 L264.2,328.1 L265.6,327.4 L266.0,323.9 L269.2,325.1 L270.4,323.7 L274.0,325.3 L276.2,327.1 L276.2,328.6 L278.8,332.8 L278.2,335.3 L279.9,338.6 L283.2,342.5 L281.6,344.2 L280.1,342.9 L279.5,344.8 L281.7,347.7 L281.2,348.9 L283.3,351.4 L282.6,352.6 L283.0,355.6 L282.9,360.2 L283.4,363.6 L282.2,367.3 L282.8,368.7 L282.7,372.4 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.XZ</hasc>
			    <alt-name>Tibet|X?zàng</alt-name>
			    <woe-id>12578004</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH14</fips>
			    <postal-code>XZ</postal-code>
			    <name>Xizang</name>
			    <country>China</country>
			    <type-en>Autonomous Region</type-en>
			    <region>Southwest China</region>
			    <longitude>88.41370000000001</longitude>
			    <woe-name>Xizang</woe-name>
			    <latitude>31.4515</latitude>
			    <woe-label>Tibet, CN, China</woe-label>
			    <type>Zìzhìqu</type>
			    <hc-middle-x>0.40</hc-middle-x>
			    <hc-middle-y>0.50</hc-middle-y>
			    <hc-key>cn-xz</hc-key>
			    <hc-a2>XZ</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.HH" d="M564.0,445.6 L565.1,444.7 L563.4,443.7 L563.8,442.9 L564.0,442.2 L564.9,442.2 L568.5,444.7 L568.4,446.3 L570.1,447.1 L569.8,448.2 L568.9,449.4 L568.8,449.4 L568.2,449.5 L567.4,448.3 L565.6,448.6 L565.7,447.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.HH</hasc>
			    <alt-name>Xinzhu</alt-name>
			    <woe-id>2347334</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>HH</postal-code>
			    <name>Hsinchu</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>121.163</longitude>
			    <woe-name>Hsinchu County</woe-name>
			    <latitude>24.6748</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.43</hc-middle-x>
			    <hc-middle-y>0.54</hc-middle-y>
			    <hc-key>tw-hh</hc-key>
			    <hc-a2>HH</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.CL" d="M573.3,438.7 L573.5,438.8 L574.3,439.0 L574.5,440.1 L572.6,439.1 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.CL</hasc>
			    <alt-name>Jilong Shi|Chilung City</alt-name>
			    <woe-id>22695855</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>CL</postal-code>
			    <name>Keelung City</name>
			    <country>Taiwan</country>
			    <type-en>Provincial City</type-en>
			    <region>Taiwan Province</region>
			    <longitude>121.704</longitude>
			    <woe-name>Keelung City</woe-name>
			    <latitude>25.1131</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Shi</type>
			    <hc-middle-x>0.60</hc-middle-x>
			    <hc-middle-y>0.39</hc-middle-y>
			    <hc-key>tw-cl</hc-key>
			    <hc-a2>CL</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.ML" d="M564.0,445.6 L565.7,447.3 L565.6,448.6 L567.4,448.3 L568.2,449.5 L565.4,451.5 L564.1,451.0 L562.9,451.8 L559.7,449.6 L560.7,447.3 L562.9,445.2 L563.8,445.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.ML</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>2347338</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>ML</postal-code>
			    <name>Miaoli</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.942</longitude>
			    <woe-name>Miaoli County</woe-name>
			    <latitude>24.5253</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.49</hc-middle-x>
			    <hc-middle-y>0.60</hc-middle-y>
			    <hc-key>tw-ml</hc-key>
			    <hc-a2>ML</hc-a2>
			  </desc>
			</path>

			<path data-name='宁夏' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.NX" d="M396.9,253.6 L396.2,254.9 L395.0,254.9 L392.6,257.4 L391.5,261.7 L392.5,264.0 L391.9,265.2 L390.8,264.5 L387.7,264.5 L386.1,263.2 L384.3,263.2 L384.1,266.0 L383.3,266.9 L384.1,268.4 L383.5,270.0 L382.3,270.2 L381.9,276.8 L383.2,276.7 L385.7,277.8 L387.2,279.9 L385.8,282.7 L386.6,284.2 L384.3,285.7 L382.7,284.9 L380.7,285.2 L381.5,287.4 L380.8,290.7 L379.0,291.5 L377.8,289.6 L374.1,289.3 L376.0,288.5 L374.6,287.5 L373.2,287.9 L371.7,285.0 L368.6,283.8 L367.4,281.0 L367.9,279.2 L369.0,278.5 L369.2,276.3 L367.3,271.8 L366.8,269.7 L368.1,268.4 L366.6,265.5 L363.6,263.4 L362.9,261.6 L360.1,260.9 L361.4,259.6 L361.1,258.5 L358.4,257.9 L357.1,258.5 L358.0,257.0 L364.2,256.7 L366.0,255.1 L369.3,253.9 L372.9,254.3 L374.5,253.3 L375.1,250.4 L374.4,248.4 L375.3,247.0 L375.7,241.8 L376.5,239.4 L378.6,235.8 L379.4,233.7 L381.4,233.2 L381.7,231.2 L384.0,231.4 L385.5,230.4 L387.5,230.4 L387.6,232.9 L389.5,235.4 L388.9,237.2 L386.0,241.3 L385.2,244.0 L383.0,246.4 L387.2,248.7 L389.9,249.4 L391.1,249.1 L393.0,250.3 L393.9,252.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.NX</hasc>
			    <alt-name>Ningxia Hui|Níngxià Húizú</alt-name>
			    <woe-id>12578010</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH21</fips>
			    <postal-code>NX</postal-code>
			    <name>Ningxia</name>
			    <country>China</country>
			    <type-en>Autonomous Region</type-en>
			    <region>Northwest China</region>
			    <longitude>106.038</longitude>
			    <woe-name>Ningxia</woe-name>
			    <latitude>37.1762</latitude>
			    <woe-label>Ningxia, CN, China</woe-label>
			    <type>Zìzhìqu</type>
			    <hc-middle-x>0.51</hc-middle-x>
			    <hc-middle-y>0.43</hc-middle-y>
			    <hc-key>cn-nx</hc-key>
			    <hc-a2>NX</hc-a2>
			  </desc>
			</path>

			<path data-name='陕西' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.SA" d="M391.9,265.2 L392.5,264.0 L391.5,261.7 L392.6,257.4 L395.0,254.9 L396.2,254.9 L396.9,253.6 L400.1,254.8 L401.3,257.1 L404.8,257.2 L410.0,256.7 L410.3,253.3 L411.0,252.1 L412.4,253.1 L413.3,250.3 L412.5,249.0 L412.9,246.9 L415.1,243.9 L417.0,242.7 L418.3,240.5 L419.7,240.3 L421.4,237.0 L423.1,236.3 L424.9,234.5 L427.4,232.9 L426.7,230.8 L428.1,230.8 L429.4,232.5 L431.2,231.7 L432.9,233.7 L435.4,230.4 L437.4,228.9 L438.7,228.7 L437.7,231.1 L438.5,231.7 L439.8,232.8 L438.5,236.5 L437.0,237.4 L436.8,240.3 L435.4,243.2 L435.2,245.7 L431.0,249.4 L431.0,253.2 L433.7,256.1 L434.1,259.1 L432.2,261.6 L432.6,263.3 L430.9,265.3 L428.9,269.1 L429.7,271.6 L429.1,272.2 L430.2,273.6 L429.6,280.3 L430.3,284.1 L430.9,284.7 L431.5,288.5 L427.9,294.3 L426.9,298.1 L426.7,302.2 L427.7,303.0 L427.6,305.0 L429.4,307.3 L428.8,308.2 L431.0,309.7 L431.3,312.4 L430.6,313.9 L432.5,315.1 L433.0,316.5 L435.2,318.2 L435.7,321.5 L435.2,323.0 L433.2,324.1 L432.4,325.5 L430.5,324.6 L429.9,323.3 L428.4,324.3 L426.0,324.5 L424.3,323.6 L418.9,322.7 L417.1,323.1 L416.3,324.3 L420.0,325.4 L419.8,327.7 L421.7,327.9 L424.1,329.1 L425.0,332.3 L422.9,333.3 L421.4,332.7 L418.3,332.6 L417.3,335.3 L416.4,336.0 L417.7,338.1 L418.5,340.6 L417.7,342.3 L417.5,345.1 L414.2,345.5 L410.8,341.9 L407.6,340.3 L404.2,337.9 L403.8,337.1 L400.8,336.9 L398.5,337.3 L397.8,338.4 L395.9,337.2 L393.7,334.7 L391.2,334.3 L391.1,332.7 L388.0,333.6 L386.4,332.5 L386.5,329.7 L382.1,329.1 L380.7,330.0 L376.0,331.0 L374.0,329.1 L374.6,327.0 L371.8,327.0 L370.9,328.3 L367.9,328.5 L367.2,325.9 L368.9,326.3 L372.0,325.1 L372.6,321.4 L370.6,320.4 L370.3,319.0 L371.8,317.4 L374.8,315.8 L376.0,316.7 L378.8,316.0 L380.0,317.1 L380.8,316.4 L379.9,314.8 L379.3,311.9 L380.6,308.9 L381.5,308.4 L381.2,306.3 L382.4,306.8 L382.7,304.8 L380.7,302.7 L379.1,302.7 L378.5,301.7 L380.8,299.5 L381.6,297.7 L381.0,295.2 L381.9,294.5 L386.2,294.5 L387.8,295.4 L389.6,297.6 L391.0,296.9 L393.2,297.3 L394.1,296.7 L397.3,296.7 L395.5,292.9 L396.4,291.6 L399.0,293.1 L401.4,292.2 L405.5,292.6 L407.1,290.8 L407.0,288.5 L405.9,286.2 L405.8,283.5 L408.1,281.8 L408.4,280.0 L407.9,278.5 L408.6,276.5 L407.5,275.4 L405.5,274.9 L404.5,273.6 L400.7,272.6 L399.0,270.2 L396.7,269.1 L391.8,267.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.SA</hasc>
			    <alt-name>Sh?nx?</alt-name>
			    <woe-id>12578015</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH26</fips>
			    <postal-code>SA</postal-code>
			    <name>Shaanxi</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Northwest China</region>
			    <longitude>108.363</longitude>
			    <woe-name>Shaanxi</woe-name>
			    <latitude>33.7713</latitude>
			    <woe-label>Shaanxi, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.54</hc-middle-x>
			    <hc-middle-y>0.75</hc-middle-y>
			    <hc-key>cn-sa</hc-key>
			    <hc-a2>SA</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.TY" d="M570.1,447.1 L568.4,446.3 L568.5,444.7 L564.9,442.2 L564.0,442.2 L565.1,440.8 L568.1,439.6 L569.7,440.7 L568.7,441.7 L569.1,443.4 L570.4,444.2 L570.9,445.8 L570.7,446.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.TY</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>2347345</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>TY</postal-code>
			    <name>Taoyuan</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>121.227</longitude>
			    <woe-name>Taoyuan County</woe-name>
			    <latitude>24.961</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.66</hc-middle-x>
			    <hc-middle-y>0.46</hc-middle-y>
			    <hc-key>tw-ty</hc-key>
			    <hc-a2>TY</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.3682" d="M474.1,482.8 L474.4,482.5 L474.8,482.6 L474.7,482.9 L474.3,482.8 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703128</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Central and Western</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Hong Kong Island</region>
			    <longitude>114.144</longitude>
			    <woe-name>Central and Western</woe-name>
			    <latitude>22.2741</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.53</hc-middle-x>
			    <hc-middle-y>0.42</hc-middle-y>
			    <hc-key>cn-3682</hc-key>
			    <hc-a2>CA</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.CG" d="M555.1,458.6 L556.3,455.9 L558.0,453.2 L559.5,454.6 L560.6,455.8 L560.2,456.9 L560.5,459.3 L557.0,458.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.CG</hasc>
			    <alt-name>Zhanghua|Changhwa</alt-name>
			    <woe-id>20070572</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>CG</postal-code>
			    <name>Changhua</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.464</longitude>
			    <woe-name>Changhua County</woe-name>
			    <latitude>24.0016</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.56</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>tw-cg</hc-key>
			    <hc-a2>CG</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6655" d="M474.7,482.9 L474.8,482.6 L475.0,482.6 L475.2,482.7 L475.1,482.9 L474.9,482.9 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703129</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Wan Chai</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Hong Kong Island</region>
			    <longitude>114.178</longitude>
			    <woe-name>Wan Chai</woe-name>
			    <latitude>22.2699</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.50</hc-middle-y>
			    <hc-key>cn-6655</hc-key>
			    <hc-a2>WC</hc-a2>
			  </desc>
			</path>

			<path data-name='安徽' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.AH" d="M499.8,374.1 L498.9,371.5 L498.4,367.8 L496.3,365.4 L497.1,364.6 L494.9,361.1 L496.0,358.5 L498.2,356.6 L496.2,354.6 L493.5,353.3 L492.0,353.9 L489.8,350.5 L490.0,349.1 L491.7,345.8 L493.4,345.1 L496.3,344.9 L496.6,341.5 L495.8,334.1 L493.6,334.7 L492.1,336.0 L489.6,333.7 L487.5,333.3 L487.3,329.3 L484.0,327.9 L483.6,326.1 L484.6,325.5 L486.7,326.0 L488.5,325.1 L489.2,323.6 L489.1,319.9 L492.7,318.5 L492.0,316.2 L492.6,314.9 L491.8,314.0 L492.9,311.8 L493.9,311.5 L496.7,312.4 L496.8,313.8 L499.5,316.6 L502.4,315.4 L502.7,314.6 L505.1,313.0 L503.8,310.6 L503.9,308.1 L502.0,308.3 L499.0,305.8 L498.9,304.0 L500.3,303.9 L501.7,302.9 L506.9,306.4 L508.7,306.5 L509.8,309.9 L511.4,310.9 L515.7,311.4 L517.1,312.0 L518.7,313.8 L518.5,316.1 L523.4,315.4 L524.1,316.5 L523.4,319.6 L522.7,319.5 L521.2,323.3 L523.1,324.5 L524.8,324.0 L525.1,327.8 L525.9,329.9 L527.2,330.5 L531.2,330.4 L532.8,326.8 L534.5,326.9 L536.6,329.0 L537.2,332.2 L535.8,334.5 L533.4,332.3 L531.7,332.1 L529.2,332.8 L530.7,334.5 L530.5,337.7 L528.8,338.3 L527.3,340.5 L526.9,342.0 L528.6,343.3 L528.5,344.3 L531.2,345.5 L531.0,346.2 L533.4,346.5 L533.7,348.1 L532.2,350.5 L533.0,352.4 L536.3,352.1 L537.4,351.4 L539.7,351.3 L539.9,352.7 L543.3,353.4 L542.8,357.6 L541.2,360.7 L540.4,360.1 L538.7,362.1 L539.7,362.5 L540.7,364.7 L538.9,365.7 L534.3,365.5 L534.0,368.0 L534.6,370.5 L532.7,372.8 L532.5,374.2 L530.4,375.8 L528.2,378.4 L525.7,379.1 L524.9,377.5 L523.2,376.8 L519.7,377.1 L517.4,376.2 L515.7,374.0 L515.8,373.2 L513.5,373.0 L513.0,371.9 L511.5,373.2 L511.7,375.0 L509.3,377.3 L507.2,377.4 L506.2,376.3 L506.5,375.2 L508.1,374.4 L509.2,372.0 L507.9,370.6 L506.1,370.2 L504.2,372.6 L502.9,372.8 L500.9,374.2 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.AH</hasc>
			    <alt-name>?nhu?</alt-name>
			    <woe-id>12578022</woe-id>
			    <subregion>Central</subregion>
			    <fips>CH01</fips>
			    <postal-code>AH</postal-code>
			    <name>Anhui</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>East China</region>
			    <longitude>117.253</longitude>
			    <woe-name>Anhui</woe-name>
			    <latitude>31.9537</latitude>
			    <woe-label>Anhui, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.44</hc-middle-x>
			    <hc-middle-y>0.59</hc-middle-y>
			    <hc-key>cn-ah</hc-key>
			    <hc-a2>AH</hc-a2>
			  </desc>
			</path>

			<path data-name='湖北' data-pic='3' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.HU" d="M489.8,350.5 L492.0,353.9 L493.5,353.3 L496.2,354.6 L498.2,356.6 L496.0,358.5 L494.9,361.1 L497.1,364.6 L496.3,365.4 L498.4,367.8 L498.9,371.5 L499.8,374.1 L496.1,374.9 L494.2,373.1 L491.4,373.1 L490.6,375.3 L488.7,376.7 L486.4,376.1 L487.1,377.2 L483.8,378.1 L483.0,380.0 L478.6,381.1 L476.3,380.5 L475.7,382.1 L473.4,382.8 L471.3,384.8 L468.2,383.9 L467.3,381.5 L469.1,379.4 L468.1,375.9 L466.7,375.8 L467.4,372.9 L465.2,374.6 L461.5,379.0 L458.9,378.5 L459.1,375.6 L458.4,374.2 L455.4,376.6 L452.8,376.3 L450.7,377.8 L449.9,375.9 L446.2,373.1 L444.3,372.2 L439.8,372.0 L437.7,370.4 L431.3,369.4 L431.0,370.3 L428.8,369.9 L427.8,370.5 L428.2,372.7 L429.3,374.1 L427.2,374.7 L426.4,375.8 L423.1,373.7 L419.1,374.4 L417.8,376.2 L416.8,376.0 L414.5,377.2 L413.2,380.7 L411.5,383.3 L409.1,380.3 L407.9,379.6 L407.5,375.4 L405.3,374.5 L404.3,372.1 L403.0,374.0 L401.6,372.4 L403.3,371.7 L403.5,365.4 L401.6,364.1 L402.3,362.9 L404.1,362.8 L405.3,361.7 L406.1,362.5 L409.1,361.4 L411.8,362.0 L414.5,361.9 L417.6,360.0 L419.0,358.3 L420.6,357.6 L423.0,358.5 L423.8,357.4 L423.7,354.2 L424.5,353.3 L423.8,350.2 L421.6,348.4 L419.1,347.7 L419.1,346.6 L417.5,345.1 L417.7,342.3 L418.5,340.6 L417.7,338.1 L416.4,336.0 L417.3,335.3 L418.3,332.6 L421.4,332.7 L422.9,333.3 L425.0,332.3 L424.1,329.1 L421.7,327.9 L419.8,327.7 L420.0,325.4 L416.3,324.3 L417.1,323.1 L418.9,322.7 L424.3,323.6 L426.0,324.5 L428.4,324.3 L429.9,323.3 L430.5,324.6 L432.4,325.5 L433.2,324.1 L435.2,323.0 L436.8,324.8 L438.0,328.0 L441.6,331.8 L441.9,332.8 L444.1,333.0 L445.0,334.2 L448.4,335.2 L451.2,336.7 L454.3,336.4 L457.0,336.8 L460.7,335.7 L462.8,336.0 L464.3,337.4 L466.7,337.6 L469.2,335.9 L469.9,336.7 L469.5,340.0 L470.0,342.4 L472.2,345.7 L474.4,344.2 L477.1,345.9 L479.5,345.8 L479.4,348.2 L482.2,349.4 L485.1,349.6 L486.7,347.9 L487.8,348.6 L487.8,350.0 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.HU</hasc>
			    <alt-name>Húb?i</alt-name>
			    <woe-id>12578002</woe-id>
			    <subregion>Central</subregion>
			    <fips>CH12</fips>
			    <postal-code>HU</postal-code>
			    <name>Hubei</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>South Central China</region>
			    <longitude>112.264</longitude>
			    <woe-name>Hubei</woe-name>
			    <latitude>30.9857</latitude>
			    <woe-label>Hubei, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.55</hc-middle-x>
			    <hc-middle-y>0.52</hc-middle-y>
			    <hc-key>cn-hu</hc-key>
			    <hc-a2>HU</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.HL" d="M574.9,450.8 L573.0,454.4 L573.3,455.1 L572.1,460.5 L571.7,463.7 L569.9,467.7 L569.2,468.5 L566.1,465.9 L565.3,465.0 L565.6,464.0 L568.2,461.4 L568.0,459.1 L569.3,454.4 L569.3,453.2 L569.4,452.3 L570.5,451.0 L570.8,450.3 L572.8,450.8 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.HL</hasc>
			    <alt-name>Hualian</alt-name>
			    <woe-id>2347335</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>HL</postal-code>
			    <name>Hualien</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>121.381</longitude>
			    <woe-name>Hualien County</woe-name>
			    <latitude>23.7743</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.51</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>tw-hl</hc-key>
			    <hc-a2>HL</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.TH" d="M569.4,452.3 L567.1,452.6 L564.7,454.1 L562.7,454.4 L562.2,455.6 L560.6,455.8 L559.5,454.6 L558.0,453.2 L559.1,450.3 L559.7,449.6 L562.9,451.8 L564.1,451.0 L565.4,451.5 L568.2,449.5 L568.8,449.4 L568.9,449.4 L569.2,449.9 L570.8,450.3 L570.5,451.0 L569.4,452.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.TG</hasc>
			    <alt-name>Taizhong Shi</alt-name>
			    <woe-id>28751584</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>TH</postal-code>
			    <name>Taichung City</name>
			    <country>Taiwan</country>
			    <type-en>Special Municipality</type-en>
			    <region>Special Municipalities</region>
			    <longitude>120.966</longitude>
			    <woe-name>Taichung City</woe-name>
			    <latitude>24.238</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Zhixiashi</type>
			    <hc-middle-x>0.08</hc-middle-x>
			    <hc-middle-y>0.51</hc-middle-y>
			    <hc-key>tw-th</hc-key>
			    <hc-a2>TH</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6656" d="M475.1,482.9 L475.2,482.7 L475.0,482.6 L475.7,482.7 L475.9,483.1 L475.7,483.0 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703131</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Eastern</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Hong Kong Island</region>
			    <longitude>114.213</longitude>
			    <woe-name>Eastern</woe-name>
			    <latitude>22.2706</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.51</hc-middle-x>
			    <hc-middle-y>0.37</hc-middle-y>
			    <hc-key>cn-6656</hc-key>
			    <hc-a2>EA</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.NT" d="M568.0,459.1 L568.2,461.4 L565.6,464.0 L565.4,463.6 L564.8,463.5 L563.1,463.4 L563.0,461.9 L561.8,461.6 L560.4,461.2 L560.5,459.3 L560.2,456.9 L560.6,455.8 L562.2,455.6 L562.7,454.4 L564.7,454.1 L567.1,452.6 L569.4,452.3 L569.4,452.3 L569.5,452.6 L569.3,453.2 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.NT</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>2347339</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NT</postal-code>
			    <name>Nantou</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.988</longitude>
			    <woe-name>Nantou County</woe-name>
			    <latitude>23.7977</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.46</hc-middle-x>
			    <hc-middle-y>0.46</hc-middle-y>
			    <hc-key>tw-nt</hc-key>
			    <hc-a2>NT</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6658" d="M474.9,482.5 L474.8,482.3 L474.7,482.0 L474.9,482.0 L474.9,482.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703134</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Yau Tsim Mong</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Kowloon</region>
			    <longitude>114.169</longitude>
			    <woe-name>Yau Tsim Mong</woe-name>
			    <latitude>22.3128</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.84</hc-middle-x>
			    <hc-middle-y>0.42</hc-middle-y>
			    <hc-key>cn-6658</hc-key>
			    <hc-a2>YT</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6659" d="M475.4,482.2 L475.2,482.1 L474.9,482.5 L474.9,482.3 L474.9,482.0 L474.9,481.8 L474.8,481.7 L475.1,481.7 L475.2,481.9 L475.3,481.9 L475.4,482.0 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703135</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Kowloon City</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Kowloon</region>
			    <longitude>114.19</longitude>
			    <woe-name>Kowloon City</woe-name>
			    <latitude>22.3268</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.52</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>cn-6659</hc-key>
			    <hc-a2>KC</hc-a2>
			  </desc>
			</path>

			<path data-name='重庆' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.CQ" d="M411.5,383.3 L412.3,384.1 L411.3,390.2 L411.9,392.0 L410.5,393.0 L409.6,396.3 L405.0,395.6 L405.8,393.0 L403.9,392.4 L404.4,394.2 L403.2,393.6 L403.3,390.4 L400.1,389.0 L400.6,387.7 L399.7,383.3 L396.8,383.4 L394.4,384.5 L393.4,383.6 L393.4,382.2 L390.5,381.4 L389.8,380.5 L388.7,382.9 L389.7,384.2 L388.8,385.8 L386.3,386.7 L385.3,385.6 L383.6,385.4 L382.6,386.8 L381.2,387.0 L381.1,388.6 L379.0,391.1 L377.3,390.3 L378.3,388.8 L377.6,386.9 L376.3,386.1 L377.0,388.3 L376.5,390.1 L375.1,389.6 L374.1,388.1 L373.8,385.2 L370.6,383.6 L368.9,384.3 L367.3,383.1 L366.9,379.7 L363.3,377.8 L362.2,375.9 L362.0,374.2 L363.6,372.6 L365.4,372.2 L365.5,371.2 L367.5,370.4 L368.0,368.0 L365.8,366.2 L368.1,364.3 L369.0,362.4 L373.1,363.8 L374.5,365.6 L378.3,364.0 L379.3,365.1 L380.4,368.2 L384.4,368.4 L387.0,365.9 L388.9,362.2 L390.3,360.6 L390.2,358.4 L390.8,357.6 L393.6,356.7 L394.6,358.1 L396.2,357.0 L397.2,354.7 L397.7,352.0 L399.7,350.5 L400.2,348.5 L402.5,347.1 L404.0,345.1 L403.8,343.9 L401.2,341.9 L401.0,341.1 L403.0,339.3 L402.3,338.3 L404.2,337.9 L407.6,340.3 L410.8,341.9 L414.2,345.5 L417.5,345.1 L419.1,346.6 L419.1,347.7 L421.6,348.4 L423.8,350.2 L424.5,353.3 L423.7,354.2 L423.8,357.4 L423.0,358.5 L420.6,357.6 L419.0,358.3 L417.6,360.0 L414.5,361.9 L411.8,362.0 L409.1,361.4 L406.1,362.5 L405.3,361.7 L404.1,362.8 L402.3,362.9 L401.6,364.1 L403.5,365.4 L403.3,371.7 L401.6,372.4 L403.0,374.0 L404.3,372.1 L405.3,374.5 L407.5,375.4 L407.9,379.6 L409.1,380.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.CQ</hasc>
			    <alt-name>Chóngqìng</alt-name>
			    <woe-id>20070171</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH33</fips>
			    <postal-code>CQ</postal-code>
			    <name>Chongqing</name>
			    <country>China</country>
			    <type-en>Municipality</type-en>
			    <region>Southwest China</region>
			    <longitude>107.73</longitude>
			    <woe-name>Chongqing</woe-name>
			    <latitude>30.0173</latitude>
			    <woe-label>Chongqing, CN, China</woe-label>
			    <type>Zhíxiáshì</type>
			    <hc-middle-x>0.42</hc-middle-x>
			    <hc-middle-y>0.62</hc-middle-y>
			    <hc-key>cn-cq</hc-key>
			    <hc-a2>CQ</hc-a2>
			  </desc>
			</path>

			<path data-name='湖南' data-pic="1" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.HN" d="M411.9,392.0 L411.3,390.2 L412.3,384.1 L411.5,383.3 L413.2,380.7 L414.5,377.2 L416.8,376.0 L417.8,376.2 L419.1,374.4 L423.1,373.7 L426.4,375.8 L427.2,374.7 L429.3,374.1 L428.2,372.7 L427.8,370.5 L428.8,369.9 L431.0,370.3 L431.3,369.4 L437.7,370.4 L439.8,372.0 L444.3,372.2 L446.2,373.1 L449.9,375.9 L450.7,377.8 L452.8,376.3 L455.4,376.6 L458.4,374.2 L459.1,375.6 L458.9,378.5 L461.5,379.0 L465.2,374.6 L467.4,372.9 L466.7,375.8 L468.1,375.9 L469.1,379.4 L467.3,381.5 L468.2,383.9 L471.3,384.8 L471.4,386.4 L474.4,388.8 L474.0,391.3 L473.3,392.1 L474.8,392.9 L475.5,394.3 L474.9,396.0 L473.8,396.5 L472.8,398.7 L471.5,399.9 L469.2,400.5 L468.7,402.9 L466.9,406.2 L467.4,409.4 L468.3,409.9 L470.7,409.7 L469.4,412.6 L471.2,415.5 L470.4,417.2 L470.8,419.7 L473.7,420.8 L473.5,422.6 L471.6,426.7 L474.7,425.9 L475.4,426.7 L473.1,428.1 L472.8,430.1 L471.4,432.7 L472.3,435.2 L471.6,437.1 L470.3,438.4 L467.1,438.8 L462.3,436.2 L458.3,438.9 L458.0,440.0 L459.7,440.0 L459.1,440.9 L459.3,444.0 L456.9,444.3 L455.1,441.8 L452.4,441.1 L448.8,441.2 L447.9,444.1 L448.2,446.4 L446.2,447.2 L445.3,446.6 L441.9,446.5 L439.9,448.4 L438.8,447.9 L439.4,446.3 L438.8,441.7 L436.9,441.1 L434.9,442.6 L433.6,444.4 L432.6,442.8 L433.2,441.0 L434.8,439.8 L435.5,437.9 L437.5,436.0 L437.4,434.0 L439.3,429.9 L437.1,430.8 L436.0,429.4 L436.8,424.8 L432.9,423.1 L432.0,424.8 L430.0,424.7 L427.8,423.7 L427.5,425.4 L424.9,427.0 L423.7,428.9 L422.3,427.8 L420.9,428.0 L421.3,426.3 L419.6,425.6 L417.5,429.7 L416.2,430.0 L415.3,427.6 L413.4,427.7 L412.7,424.4 L411.4,423.7 L412.9,420.5 L411.6,417.7 L414.6,415.9 L413.6,415.3 L414.4,414.2 L413.6,412.0 L410.9,411.6 L409.9,412.6 L409.2,411.8 L407.3,413.3 L405.2,412.4 L410.7,407.3 L411.7,407.5 L413.5,405.8 L413.9,404.5 L412.8,402.8 L412.2,398.6 L413.0,395.5 L411.9,394.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.HN</hasc>
			    <alt-name>Húnán</alt-name>
			    <woe-id>12578001</woe-id>
			    <subregion>Central</subregion>
			    <fips>CH11</fips>
			    <postal-code>HN</postal-code>
			    <name>Hunan</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>South Central China</region>
			    <longitude>111.712</longitude>
			    <woe-name>Hunan</woe-name>
			    <latitude>27.6667</latitude>
			    <woe-label>Hunan, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.51</hc-middle-x>
			    <hc-middle-y>0.50</hc-middle-y>
			    <hc-key>cn-hn</hc-key>
			    <hc-a2>HN</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.YL" d="M560.5,459.3 L560.4,461.2 L561.8,461.6 L559.7,462.1 L557.2,461.6 L555.2,463.2 L553.7,463.3 L554.4,459.6 L555.1,458.6 L557.0,458.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.YL</hasc>
			    <alt-name>Yüanlin</alt-name>
			    <woe-id>2347346</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>YL</postal-code>
			    <name>Yunlin</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.427</longitude>
			    <woe-name>Yunlin County</woe-name>
			    <latitude>23.7253</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.44</hc-middle-x>
			    <hc-middle-y>0.38</hc-middle-y>
			    <hc-key>tw-yl</hc-key>
			    <hc-a2>YL</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6660" d="M474.4,482.1 L474.5,482.2 L474.4,482.2 Z M474.9,482.0 L474.7,482.0 L474.6,481.9 L474.5,481.9 L474.6,481.8 L474.7,481.7 L474.8,481.7 L474.9,481.8 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703133</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Sham Shui Po</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Kowloon</region>
			    <longitude>114.164</longitude>
			    <woe-name>Sham Shui Po</woe-name>
			    <latitude>22.3331</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.61</hc-middle-x>
			    <hc-middle-y>0.37</hc-middle-y>
			    <hc-key>cn-6660</hc-key>
			    <hc-a2>SS</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6661" d="M475.3,481.9 L475.2,481.9 L475.1,481.7 L475.6,481.5 L475.7,481.9 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703137</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Wong Tai Sin</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Kowloon</region>
			    <longitude>114.215</longitude>
			    <woe-name>Wong Tai Sin</woe-name>
			    <latitude>22.3432</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.66</hc-middle-y>
			    <hc-key>cn-6661</hc-key>
			    <hc-a2>WT</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6662" d="M475.8,482.5 L475.8,482.6 L475.4,482.2 L475.4,482.0 L475.3,481.9 L475.7,481.9 L475.8,482.1 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703136</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Kwun Tong</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>Kowloon</region>
			    <longitude>114.225</longitude>
			    <woe-name>Kwun Tong</woe-name>
			    <latitude>22.3159</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.61</hc-middle-x>
			    <hc-middle-y>0.47</hc-middle-y>
			    <hc-key>cn-6662</hc-key>
			    <hc-a2>KT</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6664" d="M475.9,481.0 L475.8,481.2 L475.6,481.5 L475.1,481.7 L474.8,481.7 L474.7,481.7 L474.6,481.6 L474.6,481.4 L474.9,481.0 L474.9,480.7 L475.0,480.7 L475.3,480.6 L475.5,480.9 L475.9,480.5 L475.9,480.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703138</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Sha Tin</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>114.2</longitude>
			    <woe-name>Sha Tin</woe-name>
			    <latitude>22.3807</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.52</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>cn-6664</hc-key>
			    <hc-a2>ST</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.6668" d="M474.4,480.7 L473.5,481.0 L473.1,481.2 L472.4,480.9 L471.8,480.5 L472.6,479.6 L473.7,479.1 L473.9,479.9 L474.4,479.9 L474.3,480.2 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>20</labelrank>
			    <hasc>HK.</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>24703143</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>NULL</postal-code>
			    <name>Yuen Long</name>
			    <country>Hong Kong S.A.R.</country>
			    <type-en>NULL</type-en>
			    <region>The New Territories</region>
			    <longitude>114.058</longitude>
			    <woe-name>Yuen Long</woe-name>
			    <latitude>22.4415</latitude>
			    <woe-label>NULL</woe-label>
			    <type>NULL</type>
			    <hc-middle-x>0.52</hc-middle-x>
			    <hc-middle-y>0.58</hc-middle-y>
			    <hc-key>cn-6668</hc-key>
			    <hc-a2>YL</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.PT" d="M564.5,481.3 L564.2,486.1 L562.3,485.5 L562.2,483.2 L560.3,479.5 L558.1,478.0 L558.7,472.9 L562.2,472.0 L563.8,472.4 L564.4,474.4 L562.6,476.2 L562.8,479.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.PT</hasc>
			    <alt-name>Pingdong</alt-name>
			    <woe-id>2347340</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>PT</postal-code>
			    <name>Pingtung</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.661</longitude>
			    <woe-name>Pingtung County</woe-name>
			    <latitude>22.5344</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.50</hc-middle-y>
			    <hc-key>tw-pt</hc-key>
			    <hc-a2>PT</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.TT" d="M564.5,481.3 L562.8,479.5 L562.6,476.2 L564.4,474.4 L563.8,472.4 L564.4,466.9 L566.1,465.9 L569.2,468.5 L569.9,467.7 L571.7,463.7 L570.9,467.9 L567.7,473.9 L566.1,475.3 L564.5,479.4 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.TT</hasc>
			    <alt-name>Taidong</alt-name>
			    <woe-id>2347344</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>TT</postal-code>
			    <name>Taitung</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>121.54</longitude>
			    <woe-name>Taitung County</woe-name>
			    <latitude>22.0499</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.10</hc-middle-x>
			    <hc-middle-y>0.72</hc-middle-y>
			    <hc-key>tw-tt</hc-key>
			    <hc-a2>TT</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.TN" d="M560.9,467.2 L558.1,471.5 L557.0,472.1 L554.6,471.7 L553.1,468.6 L553.7,466.2 L554.8,466.4 L556.4,465.0 L558.0,464.6 L559.3,465.8 L559.6,467.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.TN</hasc>
			    <alt-name>Tainan Shi</alt-name>
			    <woe-id>28751581</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>TN</postal-code>
			    <name>Tainan City</name>
			    <country>Taiwan</country>
			    <type-en>Special Municipality</type-en>
			    <region>Special Municipalities</region>
			    <longitude>120.182</longitude>
			    <woe-name>Tainan City</woe-name>
			    <latitude>23.0464</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Zhixiashi</type>
			    <hc-middle-x>0.42</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>tw-tn</hc-key>
			    <hc-a2>TN</hc-a2>
			  </desc>
			</path>

			<path data-name='北京' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.BJ" d="M510.6,220.8 L507.6,221.7 L505.0,222.1 L505.3,224.0 L507.0,225.3 L506.4,227.1 L505.8,228.1 L505.5,228.4 L503.2,228.3 L501.2,229.7 L500.7,230.9 L498.6,228.9 L495.5,228.9 L493.3,230.0 L491.6,228.5 L489.8,228.0 L489.6,225.9 L490.9,225.4 L489.3,223.1 L491.1,221.0 L494.2,220.0 L495.4,218.0 L492.8,214.2 L494.5,213.1 L495.9,213.3 L498.3,210.9 L501.2,210.3 L500.0,208.6 L501.2,208.6 L503.4,206.6 L503.7,207.9 L506.5,210.8 L508.3,211.9 L513.3,212.0 L512.4,213.0 L510.5,213.5 L509.8,214.6 L510.6,217.1 L511.9,218.3 L511.4,220.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>7</labelrank>
			    <hasc>CN.BJ</hasc>
			    <alt-name>B?ij?ng</alt-name>
			    <woe-id>12578011</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH22</fips>
			    <postal-code>BJ</postal-code>
			    <name>Beijing</name>
			    <country>China</country>
			    <type-en>Municipality</type-en>
			    <region>North China</region>
			    <longitude>116.389</longitude>
			    <woe-name>Beijing</woe-name>
			    <latitude>39.9488</latitude>
			    <woe-label>Beijing, CN, China</woe-label>
			    <type>Zhíxiáshì</type>
			    <hc-middle-x>0.48</hc-middle-x>
			    <hc-middle-y>0.54</hc-middle-y>
			    <hc-key>cn-bj</hc-key>
			    <hc-a2>BJ</hc-a2>
			  </desc>
			</path>

			<path data-name="河北" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.HB" d="M506.4,227.1 L507.0,225.3 L505.3,224.0 L505.0,222.1 L507.6,221.7 L510.6,220.8 L509.5,223.0 L510.8,224.3 L509.7,228.1 Z M514.6,243.1 L516.8,246.7 L518.2,248.3 L516.5,251.3 L515.1,251.7 L513.4,254.8 L506.0,255.0 L501.6,260.6 L500.7,258.4 L499.2,260.8 L499.6,262.0 L496.3,263.0 L494.8,267.0 L492.2,271.0 L490.4,271.6 L488.0,275.8 L490.2,280.5 L488.3,281.6 L487.6,280.4 L486.0,280.1 L484.4,282.0 L483.4,281.1 L479.2,280.8 L476.7,279.3 L474.5,279.2 L472.4,277.6 L469.2,277.6 L467.0,275.7 L466.0,271.9 L467.9,271.4 L468.7,269.9 L469.9,269.6 L469.6,266.2 L473.2,260.5 L473.8,257.5 L472.9,256.7 L470.1,250.6 L467.1,249.1 L467.0,244.8 L470.5,240.7 L469.7,239.2 L470.8,236.7 L472.7,236.0 L475.1,236.8 L477.2,235.2 L477.5,233.3 L478.9,229.7 L477.3,227.8 L477.1,224.7 L473.6,223.9 L471.8,222.4 L473.6,219.8 L478.6,217.6 L475.9,216.8 L475.6,214.2 L474.4,211.2 L472.8,208.5 L470.5,205.8 L472.2,204.9 L471.5,202.8 L471.7,200.8 L472.9,199.1 L474.9,198.1 L475.5,194.0 L477.4,192.5 L478.1,190.7 L479.5,189.7 L481.9,189.1 L483.2,192.8 L482.7,194.8 L482.9,197.9 L486.8,198.2 L488.1,197.7 L488.1,196.1 L490.8,195.0 L494.0,192.9 L495.0,192.9 L496.1,194.8 L500.0,191.5 L502.6,192.8 L505.6,191.3 L505.7,188.2 L505.1,186.8 L505.8,185.4 L507.7,184.4 L511.8,184.3 L513.1,181.8 L513.9,182.8 L516.1,181.9 L518.9,185.4 L518.5,187.9 L519.7,188.4 L520.3,190.9 L521.8,190.1 L522.5,193.3 L522.1,195.0 L520.7,195.6 L522.6,197.8 L523.1,201.4 L527.5,201.1 L532.4,201.5 L533.3,202.1 L532.6,203.6 L530.1,206.1 L529.2,209.2 L531.7,211.7 L533.1,210.9 L533.2,212.1 L534.4,213.5 L537.6,213.2 L538.6,218.2 L539.9,218.3 L539.9,219.9 L541.2,221.6 L537.6,223.1 L535.4,225.9 L534.5,229.3 L535.1,230.2 L531.8,234.0 L530.0,233.8 L529.2,234.7 L526.1,234.8 L526.5,237.0 L526.0,238.3 L525.4,235.6 L524.0,236.7 L522.7,236.3 L521.5,234.6 L519.9,233.9 L519.9,232.0 L518.5,231.2 L518.4,228.7 L515.2,228.4 L514.1,225.9 L513.7,222.3 L516.8,222.6 L516.6,221.1 L511.9,218.3 L510.6,217.1 L509.8,214.6 L510.5,213.5 L512.4,213.0 L513.3,212.0 L508.3,211.9 L506.5,210.8 L503.7,207.9 L503.4,206.6 L501.2,208.6 L500.0,208.6 L501.2,210.3 L498.3,210.9 L495.9,213.3 L494.5,213.1 L492.8,214.2 L495.4,218.0 L494.2,220.0 L491.1,221.0 L489.3,223.1 L490.9,225.4 L489.6,225.9 L489.8,228.0 L491.6,228.5 L493.3,230.0 L495.5,228.9 L498.6,228.9 L500.7,230.9 L501.2,229.7 L503.2,228.3 L505.5,228.4 L506.2,232.3 L506.1,234.6 L506.8,235.9 L504.7,237.4 L504.7,240.3 L506.7,242.1 L508.4,241.9 L509.3,243.3 L511.4,244.1 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.HB</hasc>
			    <alt-name>Héb?i</alt-name>
			    <woe-id>12578000</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH10</fips>
			    <postal-code>HB</postal-code>
			    <name>Hebei</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>North China</region>
			    <longitude>115.314</longitude>
			    <woe-name>Hebei</woe-name>
			    <latitude>38.5205</latitude>
			    <woe-label>Hebei, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.29</hc-middle-x>
			    <hc-middle-y>0.70</hc-middle-y>
			    <hc-key>cn-hb</hc-key>
			    <hc-a2>HB</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.IL" d="M568.9,449.4 L569.8,448.2 L570.1,447.1 L570.7,446.7 L570.9,445.8 L572.4,444.2 L574.6,442.9 L575.5,441.6 L577.1,441.1 L575.1,443.8 L575.8,448.5 L574.9,450.8 L572.8,450.8 L570.8,450.3 L569.2,449.9 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.IL</hasc>
			    <alt-name>Ilan</alt-name>
			    <woe-id>2347336</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>IL</postal-code>
			    <name>Yilan</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>121.644</longitude>
			    <woe-name>Yilan County</woe-name>
			    <latitude>24.5913</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.57</hc-middle-x>
			    <hc-middle-y>0.47</hc-middle-y>
			    <hc-key>tw-il</hc-key>
			    <hc-a2>IL</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.TP" d="M574.3,439.0 L576.0,439.3 L577.1,441.1 L575.5,441.6 L574.6,442.9 L572.4,444.2 L570.9,445.8 L570.4,444.2 L569.1,443.4 L568.7,441.7 L569.7,440.7 L568.1,439.6 L569.7,439.0 L569.9,437.8 L572.0,437.3 L573.3,438.7 L572.6,439.1 L574.5,440.1 Z M572.5,441.5 L573.0,440.8 L571.6,438.2 L570.4,439.5 L571.8,441.6 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.TP</hasc>
			    <alt-name>Xinbei Shi</alt-name>
			    <woe-id>20070569</woe-id>
			    <subregion>NULL</subregion>
			    <fips>TW03</fips>
			    <postal-code>TP</postal-code>
			    <name>New Taipei City</name>
			    <country>Taiwan</country>
			    <type-en>Special Municipality</type-en>
			    <region>Special Municipalities</region>
			    <longitude>121.646</longitude>
			    <woe-name>Taipei County</woe-name>
			    <latitude>24.911</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Zhixiashi</type>
			    <hc-middle-x>0.43</hc-middle-x>
			    <hc-middle-y>0.39</hc-middle-y>
			    <hc-key>tw-tp</hc-key>
			    <hc-a2>TP</hc-a2>
			  </desc>
			</path>

			<path data-name="山东" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.SD" d="M501.7,302.9 L500.3,303.9 L498.9,304.0 L498.1,303.3 L494.8,304.0 L491.5,304.0 L490.1,302.5 L490.1,301.0 L487.4,300.2 L486.9,298.6 L484.8,297.6 L482.8,297.5 L483.0,295.1 L484.1,294.5 L485.6,292.1 L487.5,291.5 L490.7,287.6 L492.2,286.8 L495.2,283.9 L497.2,283.3 L497.7,281.2 L495.9,282.4 L490.1,284.3 L488.7,286.2 L488.7,283.9 L489.8,282.9 L490.2,280.5 L488.0,275.8 L490.4,271.6 L492.2,271.0 L494.8,267.0 L496.3,263.0 L499.6,262.0 L499.2,260.8 L500.7,258.4 L501.6,260.6 L506.0,255.0 L513.4,254.8 L515.1,251.7 L516.5,251.3 L518.2,248.3 L521.2,250.2 L522.8,250.1 L526.7,251.1 L528.0,249.9 L530.2,249.8 L533.7,254.2 L535.2,255.4 L535.4,256.8 L532.8,256.2 L532.1,257.9 L531.8,261.4 L532.2,262.8 L534.3,264.3 L537.9,265.0 L541.9,264.4 L543.3,262.9 L542.8,261.3 L545.2,260.0 L547.9,257.5 L548.0,256.5 L553.0,253.7 L555.3,253.9 L556.6,255.4 L557.9,255.5 L558.6,257.4 L560.8,256.8 L562.1,258.8 L563.5,259.4 L567.6,258.6 L569.7,257.0 L570.6,259.2 L576.6,259.0 L575.3,260.0 L576.1,262.3 L574.7,262.9 L573.6,265.2 L575.2,264.8 L575.1,266.1 L572.7,268.0 L571.0,267.7 L572.0,266.9 L569.2,265.8 L564.5,268.3 L564.5,269.6 L562.3,269.5 L558.8,271.0 L557.4,272.2 L555.1,271.4 L556.5,274.2 L555.5,275.5 L554.0,274.3 L552.8,276.4 L553.6,279.1 L549.5,280.8 L548.7,280.5 L549.5,278.5 L546.5,278.4 L546.4,280.1 L547.6,282.3 L545.8,283.9 L545.4,285.6 L544.6,285.1 L544.3,287.2 L543.2,286.9 L541.2,287.9 L540.1,291.0 L538.7,291.9 L537.9,295.2 L537.0,295.6 L535.7,295.2 L534.5,296.1 L532.0,296.3 L530.8,300.6 L529.8,301.6 L527.4,301.6 L526.4,305.3 L523.7,306.0 L523.4,303.8 L522.1,302.3 L519.0,302.4 L518.8,304.3 L515.1,305.1 L513.4,303.5 L511.6,305.5 L510.0,301.7 L508.5,299.2 L507.1,298.1 L502.8,299.1 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.SD</hasc>
			    <alt-name>Sh?nd?ng</alt-name>
			    <woe-id>12578014</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH25</fips>
			    <postal-code>SD</postal-code>
			    <name>Shandong</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>East China</region>
			    <longitude>118.114</longitude>
			    <woe-name>Shandong</woe-name>
			    <latitude>36.3271</latitude>
			    <woe-label>Shandong, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.37</hc-middle-x>
			    <hc-middle-y>0.52</hc-middle-y>
			    <hc-key>cn-sd</hc-key>
			    <hc-a2>SD</hc-a2>
			  </desc>
			</path>

			<path fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="TW.CH" d="M564.8,463.5 L561.6,466.2 L560.9,467.2 L560.9,467.2 L559.6,467.3 L559.3,465.8 L558.0,464.6 L556.4,465.0 L554.8,466.4 L553.7,466.2 L554.3,465.5 L553.7,463.3 L555.2,463.2 L557.2,461.6 L559.7,462.1 L561.8,461.6 L563.0,461.9 L563.1,463.4 Z M557.2,463.3 L558.1,464.2 L558.9,463.9 L558.1,463.1 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>9</labelrank>
			    <hasc>TW.TW.CH</hasc>
			    <alt-name>Jiayi|Chiai</alt-name>
			    <woe-id>7153409</woe-id>
			    <subregion>NULL</subregion>
			    <fips>NULL</fips>
			    <postal-code>CH</postal-code>
			    <name>Chiayi</name>
			    <country>Taiwan</country>
			    <type-en>County</type-en>
			    <region>Taiwan Province</region>
			    <longitude>120.26</longitude>
			    <woe-name>Chiayi County</woe-name>
			    <latitude>23.4465</latitude>
			    <woe-label>NULL</woe-label>
			    <type>Hsien</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.50</hc-middle-y>
			    <hc-key>tw-ch</hc-key>
			    <hc-a2>CH</hc-a2>
			  </desc>
			</path>

			<path data-name="天津" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.TJ" d="M514.6,243.1 L511.4,244.1 L509.3,243.3 L508.4,241.9 L506.7,242.1 L504.7,240.3 L504.7,237.4 L506.8,235.9 L506.1,234.6 L506.2,232.3 L505.5,228.4 L505.8,228.1 L506.4,227.1 L509.7,228.1 L510.8,224.3 L509.5,223.0 L510.6,220.8 L511.4,220.5 L511.9,218.3 L516.6,221.1 L516.8,222.6 L513.7,222.3 L514.1,225.9 L515.2,228.4 L518.4,228.7 L518.5,231.2 L519.9,232.0 L519.9,233.9 L518.5,234.2 L516.5,235.6 L517.9,237.5 L516.8,237.8 L515.0,240.2 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>7</labelrank>
			    <hasc>CN.TJ</hasc>
			    <alt-name>Ti?nj?n</alt-name>
			    <woe-id>12578017</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH28</fips>
			    <postal-code>TJ</postal-code>
			    <name>Tianjin</name>
			    <country>China</country>
			    <type-en>Municipality</type-en>
			    <region>North China</region>
			    <longitude>117.347</longitude>
			    <woe-name>Tianjin</woe-name>
			    <latitude>39.3708</latitude>
			    <woe-label>Tianjin, CN, China</woe-label>
			    <type>Zhíxiáshì</type>
			    <hc-middle-x>0.80</hc-middle-x>
			    <hc-middle-y>0.63</hc-middle-y>
			    <hc-key>cn-tj</hc-key>
			    <hc-a2>TJ</hc-a2>
			  </desc>
			</path>

			<path data-name="海南" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.HA" d="M418.1,516.0 L420.5,513.8 L421.9,514.3 L423.5,513.7 L425.9,515.1 L426.4,513.3 L427.5,512.6 L429.0,514.8 L431.0,515.0 L431.7,519.5 L430.1,521.6 L427.2,523.8 L424.9,530.6 L423.8,531.7 L423.7,533.8 L421.5,533.9 L419.2,535.7 L418.4,537.8 L417.6,537.0 L414.2,537.6 L413.9,538.9 L411.6,540.8 L410.0,539.0 L406.2,539.0 L401.3,535.9 L399.9,535.6 L400.0,532.5 L399.1,530.8 L399.5,529.6 L399.1,527.0 L399.3,524.5 L404.8,520.0 L407.4,518.4 L408.8,518.6 L408.4,517.4 L406.9,518.3 L406.9,517.2 L408.8,515.6 L411.0,516.9 L411.9,515.2 L414.5,514.4 L416.0,515.6 L417.5,514.8 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.HA</hasc>
			    <alt-name>H?inán</alt-name>
			    <woe-id>12578020</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH31</fips>
			    <postal-code>HA</postal-code>
			    <name>Hainan</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>South Central China</region>
			    <longitude>109.825</longitude>
			    <woe-name>Hainan</woe-name>
			    <latitude>19.1865</latitude>
			    <woe-label>Hainan, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.38</hc-middle-x>
			    <hc-middle-y>0.58</hc-middle-y>
			    <hc-key>cn-ha</hc-key>
			    <hc-a2>HA</hc-a2>
			  </desc>
			</path>

			<path data-name="吉林" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.JL" d="M668.9,158.4 L669.4,159.7 L667.7,165.2 L668.2,167.2 L667.0,168.3 L664.4,168.3 L660.5,170.8 L662.8,173.2 L659.7,172.2 L658.6,170.9 L658.3,168.4 L656.7,168.3 L656.9,167.3 L653.8,167.9 L653.1,171.4 L652.9,176.1 L651.6,176.2 L651.1,177.5 L648.8,176.5 L647.7,177.6 L647.6,180.1 L644.4,183.4 L642.2,183.3 L639.8,184.3 L637.0,184.0 L634.4,184.9 L634.6,186.6 L636.2,189.1 L638.1,190.9 L636.5,194.2 L634.7,192.9 L633.0,193.7 L630.6,193.9 L629.4,193.1 L626.2,193.1 L624.1,191.6 L621.9,188.9 L620.4,190.6 L618.5,191.3 L617.4,194.9 L615.0,199.6 L613.8,200.5 L612.4,203.4 L608.9,204.5 L607.3,203.7 L608.6,202.2 L609.3,200.1 L608.8,198.5 L607.8,198.0 L605.4,193.7 L605.0,192.1 L603.4,192.2 L602.9,187.9 L604.8,184.8 L603.1,184.7 L601.4,181.1 L600.1,179.8 L600.0,178.5 L598.3,177.4 L598.5,176.3 L596.9,173.9 L597.0,170.7 L595.6,170.5 L594.2,172.9 L592.6,174.7 L591.2,172.3 L591.7,171.2 L590.0,169.0 L586.8,167.9 L583.7,165.6 L583.2,167.5 L579.5,166.1 L579.8,163.5 L580.7,163.9 L580.9,162.2 L578.3,156.9 L578.6,155.2 L577.4,154.4 L575.6,151.3 L575.3,149.4 L571.2,152.7 L567.4,154.7 L566.0,154.4 L566.2,151.5 L563.3,147.4 L562.6,140.7 L564.5,139.3 L564.9,137.9 L563.7,135.4 L562.5,134.9 L561.3,131.7 L559.0,131.9 L558.0,131.0 L559.8,128.2 L559.2,126.7 L561.7,127.0 L564.6,129.6 L566.2,127.3 L567.4,129.2 L569.9,130.8 L570.6,129.6 L570.6,124.8 L573.6,124.3 L574.5,122.5 L581.1,121.5 L583.2,120.8 L584.4,125.1 L583.8,126.2 L584.8,127.5 L584.5,129.2 L586.0,131.2 L586.9,131.1 L588.8,133.8 L590.9,134.4 L591.2,133.7 L594.3,133.6 L594.5,132.3 L596.0,132.7 L597.0,134.3 L600.0,134.0 L600.6,132.7 L603.5,131.9 L603.7,134.4 L605.4,136.2 L609.0,137.4 L613.4,135.4 L616.1,136.8 L618.0,136.9 L619.6,139.9 L618.7,141.7 L619.7,145.2 L620.8,144.2 L622.2,144.8 L623.4,144.1 L625.5,145.1 L625.0,147.8 L627.8,151.5 L629.5,153.0 L631.7,151.7 L631.3,148.3 L632.5,148.0 L633.0,146.6 L634.6,145.5 L635.4,146.2 L636.1,150.8 L640.0,156.0 L640.3,157.5 L641.9,159.7 L643.4,159.9 L645.8,158.6 L645.7,155.8 L648.8,154.1 L651.3,153.8 L652.9,151.3 L653.9,151.8 L654.5,153.8 L655.3,153.9 L657.1,151.8 L657.8,152.3 L659.1,156.3 L661.1,156.7 L663.7,158.3 L664.2,159.2 L665.9,158.1 L667.8,159.0 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.JL</hasc>
			    <alt-name>Jílín</alt-name>
			    <woe-id>12577995</woe-id>
			    <subregion>Northeast</subregion>
			    <fips>CH05</fips>
			    <postal-code>JL</postal-code>
			    <name>Jilin</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Northeast China</region>
			    <longitude>126.466</longitude>
			    <woe-name>Jilin</woe-name>
			    <latitude>43.2978</latitude>
			    <woe-label>Jilin, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.47</hc-middle-x>
			    <hc-middle-y>0.52</hc-middle-y>
			    <hc-key>cn-jl</hc-key>
			    <hc-a2>JL</hc-a2>
			  </desc>
			</path>

			<path data-name="青海" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.QH" d="M179.2,259.3 L181.4,259.9 L182.8,259.5 L183.6,257.4 L185.2,259.5 L190.6,260.6 L193.4,262.6 L196.4,262.0 L196.8,261.1 L196.0,255.5 L193.8,254.3 L192.7,252.0 L193.2,250.2 L194.5,249.1 L197.6,249.0 L200.5,248.4 L201.0,246.9 L200.2,245.6 L199.0,241.0 L192.0,235.5 L192.6,232.3 L190.4,227.0 L190.1,225.3 L192.1,225.1 L196.3,223.3 L196.6,222.6 L200.8,222.8 L204.3,222.6 L206.7,221.8 L211.4,221.6 L216.0,220.5 L217.1,219.7 L224.3,219.1 L228.4,219.1 L231.2,218.2 L233.9,218.0 L236.0,218.6 L238.5,218.3 L242.7,218.9 L249.2,222.3 L252.2,222.1 L253.8,224.4 L254.9,225.0 L256.5,227.3 L259.7,229.6 L260.1,230.7 L263.1,231.9 L265.2,233.3 L265.2,234.5 L268.9,236.6 L270.1,236.7 L271.7,227.2 L271.5,225.5 L272.4,224.2 L276.3,225.3 L280.0,228.3 L284.5,231.3 L287.4,228.4 L288.7,229.5 L290.6,229.8 L292.9,228.2 L296.4,230.2 L296.4,231.3 L300.6,236.0 L301.2,237.4 L303.9,239.9 L306.2,240.9 L308.0,242.7 L307.3,239.8 L308.1,238.5 L310.4,241.4 L312.7,242.4 L313.5,244.7 L318.2,247.2 L320.9,249.9 L326.5,254.6 L328.5,251.5 L329.9,254.4 L329.4,255.4 L333.9,258.8 L335.2,260.6 L333.9,263.6 L336.3,266.1 L335.4,268.2 L337.1,270.7 L337.6,273.3 L340.1,275.1 L338.7,277.0 L339.4,278.5 L338.9,280.8 L335.6,280.5 L335.6,283.8 L335.1,285.3 L333.3,284.8 L331.9,286.2 L330.2,286.5 L329.7,288.4 L331.0,289.6 L329.5,291.7 L326.3,293.2 L325.0,295.4 L322.9,296.4 L323.3,297.5 L324.8,297.2 L325.2,298.8 L327.5,299.9 L328.1,302.1 L324.4,305.0 L322.5,305.8 L320.6,303.9 L313.7,301.1 L312.5,300.3 L310.9,301.6 L310.5,303.6 L312.1,307.1 L314.2,308.4 L314.4,311.2 L316.7,311.8 L318.6,310.9 L319.8,313.9 L321.8,313.8 L320.2,316.7 L320.9,317.6 L319.7,319.5 L317.4,317.8 L313.8,319.1 L313.2,321.8 L314.3,323.1 L313.4,325.5 L310.0,326.1 L307.2,325.1 L306.1,328.4 L305.1,329.0 L304.5,327.8 L305.7,326.7 L303.9,323.7 L302.1,324.0 L301.6,325.3 L300.3,324.7 L301.0,323.1 L299.8,320.7 L297.6,319.2 L296.3,320.6 L295.2,323.1 L293.0,321.6 L290.4,320.6 L289.7,318.9 L285.4,315.9 L284.6,313.9 L284.4,311.1 L283.2,309.1 L283.5,308.3 L281.5,305.6 L279.6,305.4 L278.6,303.9 L276.5,303.4 L272.8,304.4 L272.4,302.3 L271.2,303.3 L268.3,303.9 L268.0,307.7 L269.6,310.2 L271.8,311.1 L268.7,313.9 L268.5,316.4 L266.6,318.1 L267.1,321.1 L270.4,323.7 L269.2,325.1 L266.0,323.9 L265.6,327.4 L264.2,328.1 L264.0,330.0 L262.3,330.8 L261.0,330.4 L257.4,330.9 L257.7,334.6 L253.9,333.6 L251.6,331.1 L249.8,332.8 L250.5,333.5 L250.6,335.8 L249.7,336.2 L249.0,333.9 L244.5,332.7 L241.6,332.4 L240.6,331.3 L240.2,329.1 L241.3,327.2 L239.5,324.7 L237.1,324.2 L235.9,322.9 L235.9,321.6 L231.9,317.5 L228.4,319.0 L225.8,319.6 L222.9,319.0 L221.3,317.7 L218.4,318.1 L215.1,315.6 L212.8,315.2 L212.6,314.1 L208.3,313.5 L206.0,312.7 L203.0,312.7 L202.9,310.8 L200.2,310.8 L198.4,308.7 L195.3,306.6 L193.6,302.6 L191.5,302.3 L190.6,303.4 L188.4,303.3 L186.4,304.5 L184.7,304.0 L182.2,301.7 L180.8,301.4 L179.6,299.6 L179.2,296.9 L177.3,295.8 L176.6,292.8 L175.1,291.3 L174.2,288.4 L176.3,287.2 L177.4,284.8 L176.8,279.1 L178.2,277.8 L177.9,276.5 L175.3,275.7 L175.7,274.0 L174.6,271.7 L175.2,269.9 L178.4,268.8 L178.1,267.8 L180.0,263.3 L176.5,261.9 L176.1,260.3 L177.2,259.4 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.QH</hasc>
			    <alt-name>NULL</alt-name>
			    <woe-id>12577996</woe-id>
			    <subregion>Western</subregion>
			    <fips>NULL</fips>
			    <postal-code>QH</postal-code>
			    <name>Qinghai</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Northwest China</region>
			    <longitude>96.2377</longitude>
			    <woe-name>Qinghai</woe-name>
			    <latitude>35.2652</latitude>
			    <woe-label>Qinghai, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.49</hc-middle-y>
			    <hc-key>cn-qh</hc-key>
			    <hc-a2>QH</hc-a2>
			  </desc>
			</path>

			<path data-name="新疆" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.XJ" d="M224.3,219.1 L217.1,219.7 L216.0,220.5 L211.4,221.6 L206.7,221.8 L204.3,222.6 L200.8,222.8 L196.6,222.6 L196.3,223.3 L192.1,225.1 L190.1,225.3 L190.4,227.0 L192.6,232.3 L192.0,235.5 L199.0,241.0 L200.2,245.6 L201.0,246.9 L200.5,248.4 L197.6,249.0 L194.5,249.1 L193.2,250.2 L192.7,252.0 L193.8,254.3 L196.0,255.5 L196.8,261.1 L196.4,262.0 L193.4,262.6 L190.6,260.6 L185.2,259.5 L183.6,257.4 L182.8,259.5 L181.4,259.9 L179.2,259.3 L174.2,255.8 L171.1,255.0 L169.7,253.4 L168.3,253.3 L165.5,251.6 L160.0,251.0 L159.0,251.6 L154.7,251.6 L152.1,250.5 L150.1,251.3 L141.1,251.0 L137.9,252.0 L135.8,255.3 L133.6,256.6 L131.1,256.2 L128.9,257.4 L127.1,255.5 L124.3,255.1 L121.4,255.5 L119.4,256.5 L116.8,256.6 L112.1,258.3 L109.4,257.4 L108.0,257.7 L104.3,257.2 L100.6,255.6 L98.8,255.4 L97.5,254.0 L97.6,251.2 L94.9,251.0 L91.6,249.8 L89.6,251.6 L86.9,252.5 L85.5,254.2 L81.8,254.5 L79.8,254.0 L77.8,252.4 L76.0,252.3 L74.5,250.8 L73.2,252.0 L71.9,250.9 L67.7,249.2 L66.0,247.2 L63.5,250.6 L61.0,252.6 L61.2,253.7 L59.0,254.7 L59.1,258.2 L56.4,261.5 L53.1,260.2 L49.3,259.8 L46.0,260.6 L42.5,256.7 L39.9,255.6 L38.9,254.2 L38.5,248.0 L37.7,244.6 L38.9,242.1 L36.8,241.9 L36.1,240.8 L34.3,240.9 L31.4,240.1 L27.3,237.4 L25.7,236.9 L22.4,233.7 L22.5,231.4 L20.7,232.0 L17.8,231.7 L17.2,228.7 L15.6,226.7 L17.5,225.1 L17.9,221.7 L16.5,217.9 L14.2,216.1 L12.2,215.9 L12.2,213.3 L9.5,211.4 L7.2,211.3 L4.6,209.3 L3.1,209.4 L1.6,207.4 L3.2,206.3 L6.2,205.9 L6.6,207.2 L10.3,206.7 L11.7,205.7 L9.3,202.0 L10.7,199.7 L10.1,198.4 L10.7,196.2 L9.9,194.7 L10.4,191.5 L11.5,190.4 L11.3,188.3 L6.8,184.7 L4.2,184.2 L2.7,185.9 L0.4,184.1 L0.0,180.1 L2.0,178.4 L1.0,176.8 L0.5,174.2 L1.7,171.2 L3.9,171.5 L5.6,169.9 L5.2,166.5 L8.2,163.3 L10.2,163.1 L12.5,163.6 L17.2,161.3 L19.0,161.8 L18.5,160.2 L19.3,159.0 L21.4,160.6 L23.2,161.0 L27.1,159.3 L28.2,159.6 L28.6,162.2 L28.2,164.6 L30.9,165.0 L35.1,163.9 L35.5,165.6 L37.3,164.9 L40.1,162.2 L40.5,160.7 L42.6,159.0 L42.8,157.8 L45.9,157.0 L49.5,158.2 L51.0,159.2 L55.7,159.0 L58.0,159.9 L62.1,156.9 L62.4,155.5 L65.6,154.7 L66.4,153.9 L70.2,153.1 L74.4,151.8 L75.6,152.2 L78.2,151.3 L79.7,151.5 L81.2,149.9 L85.1,150.4 L86.1,149.6 L86.8,147.3 L86.6,141.2 L88.1,138.8 L92.1,137.9 L90.5,135.5 L93.1,134.6 L95.5,135.0 L95.4,132.4 L94.5,131.6 L95.7,129.8 L94.6,122.3 L93.7,119.0 L94.6,116.5 L94.6,114.1 L95.7,110.5 L97.3,109.6 L94.7,107.7 L92.1,107.5 L91.0,105.5 L93.6,104.2 L97.6,104.4 L101.0,103.7 L102.7,104.4 L113.1,103.1 L113.4,105.6 L114.8,106.6 L118.9,106.1 L120.5,108.2 L121.9,107.5 L123.1,103.5 L120.4,102.3 L119.8,101.3 L121.3,98.3 L123.1,96.0 L124.9,91.5 L126.5,89.6 L129.5,83.6 L131.8,80.6 L132.9,76.7 L134.4,76.7 L138.0,79.8 L141.9,82.1 L144.7,82.3 L150.1,83.5 L150.8,86.3 L152.5,86.1 L156.2,83.7 L159.4,84.0 L160.4,82.1 L161.6,81.9 L162.2,79.1 L161.6,76.7 L162.1,75.1 L162.1,70.2 L163.5,66.8 L166.4,62.9 L170.8,63.5 L172.5,62.6 L175.1,62.4 L177.5,59.9 L178.4,57.8 L178.2,55.2 L180.2,53.6 L182.7,53.7 L185.6,55.1 L190.3,54.3 L190.3,57.6 L189.0,58.2 L189.2,60.2 L191.6,62.6 L190.1,63.7 L190.7,64.8 L193.0,66.0 L196.1,69.0 L196.0,71.1 L198.1,73.2 L199.5,73.6 L200.4,75.5 L202.5,76.0 L203.6,75.3 L205.9,75.7 L207.6,79.4 L211.0,79.0 L211.1,81.0 L213.7,83.0 L214.3,85.8 L214.2,88.8 L216.2,93.9 L217.4,94.6 L218.7,98.8 L218.8,101.6 L216.5,105.6 L217.0,110.2 L213.2,114.0 L211.9,118.0 L212.8,118.9 L213.7,123.2 L216.6,123.4 L217.7,124.6 L220.1,124.9 L222.2,126.4 L226.1,126.7 L228.0,127.9 L231.1,128.6 L234.3,128.4 L238.8,129.5 L242.7,130.9 L244.7,132.4 L246.7,135.8 L249.6,136.5 L251.0,138.9 L253.6,140.5 L254.7,142.1 L258.3,143.9 L262.2,143.9 L261.1,148.2 L263.1,148.9 L265.8,158.2 L266.3,161.3 L270.2,166.1 L270.6,169.5 L267.3,171.2 L266.6,172.5 L265.6,178.1 L265.6,180.3 L263.4,182.2 L262.3,182.5 L259.1,181.7 L254.0,182.2 L248.1,184.6 L240.7,191.2 L234.7,198.4 L231.0,199.8 L227.1,199.2 L226.1,204.5 L224.0,207.5 L223.8,208.9 L225.1,214.6 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.XJ</hasc>
			    <alt-name>Xinjiang Uygur|X?nji?ng Wéiwú?r</alt-name>
			    <woe-id>12578003</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH13</fips>
			    <postal-code>XJ</postal-code>
			    <name>Xinjiang</name>
			    <country>China</country>
			    <type-en>Autonomous Region</type-en>
			    <region>Northwest China</region>
			    <longitude>85.42529999999999</longitude>
			    <woe-name>Xinjiang</woe-name>
			    <latitude>41.122</latitude>
			    <woe-label>Xinjiang, CN, China</woe-label>
			    <type>Zìzhìqu</type>
			    <hc-middle-x>0.54</hc-middle-x>
			    <hc-middle-y>0.55</hc-middle-y>
			    <hc-key>cn-xj</hc-key>
			    <hc-a2>XJ</hc-a2>
			  </desc>
			</path>

			<path data-name="内蒙古" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.NM" d="M280.1,169.5 L305.9,175.5 L312.3,174.3 L325.8,177.8 L328.0,177.7 L330.6,178.4 L331.7,179.3 L333.2,182.3 L334.8,183.8 L346.5,187.5 L353.7,191.8 L362.8,190.6 L362.6,193.8 L367.2,194.4 L368.5,195.2 L370.8,193.0 L378.7,189.6 L389.3,185.5 L405.6,183.6 L412.7,184.7 L415.0,184.0 L418.0,184.5 L420.7,184.2 L422.8,182.7 L425.6,181.5 L427.5,181.3 L431.4,179.5 L433.7,176.8 L434.6,175.0 L437.6,171.5 L439.4,170.3 L445.2,167.9 L447.0,165.8 L449.1,165.3 L449.2,163.9 L448.0,161.5 L445.7,159.4 L443.1,155.0 L444.8,151.0 L445.0,149.5 L447.1,145.2 L450.2,143.3 L455.0,144.0 L456.7,146.0 L458.5,147.0 L462.5,148.1 L468.5,148.9 L471.3,146.3 L473.2,145.8 L477.3,141.7 L478.6,138.7 L480.8,138.1 L483.1,138.9 L487.6,138.5 L490.9,137.7 L495.1,133.9 L496.8,133.4 L497.7,131.9 L497.3,130.2 L498.8,127.1 L501.5,123.8 L503.7,122.5 L509.3,123.0 L510.2,119.4 L512.0,118.9 L513.6,120.3 L519.5,116.8 L524.9,117.3 L525.9,116.0 L527.6,116.2 L528.7,117.4 L531.5,118.2 L535.6,118.3 L538.0,116.4 L537.7,113.2 L536.3,111.8 L535.5,109.2 L530.7,105.2 L531.0,104.2 L529.3,103.6 L528.4,101.3 L524.9,99.8 L522.3,96.5 L518.4,95.6 L514.3,96.1 L512.9,96.9 L509.5,101.9 L506.2,99.4 L503.9,98.4 L500.0,99.1 L497.2,98.7 L495.4,99.6 L494.2,101.2 L492.9,101.3 L489.7,97.6 L489.1,94.6 L491.9,92.9 L492.3,92.0 L492.2,87.8 L494.6,83.9 L494.7,82.2 L501.5,66.4 L505.5,68.8 L507.6,69.6 L510.0,69.7 L513.1,71.3 L517.5,68.5 L522.5,63.7 L527.3,63.0 L529.6,61.2 L529.9,56.9 L527.6,56.5 L528.7,55.3 L529.1,52.7 L531.2,50.3 L531.3,47.5 L533.7,44.4 L534.3,41.1 L535.3,40.2 L535.8,37.5 L537.1,34.4 L541.8,30.1 L542.6,30.0 L543.9,26.4 L543.6,24.4 L542.1,22.6 L543.0,19.2 L539.8,17.7 L537.2,18.7 L536.0,18.5 L535.6,15.7 L538.1,13.8 L539.8,11.3 L544.0,6.4 L547.4,6.3 L549.6,5.5 L551.7,6.7 L553.8,10.4 L550.9,14.8 L547.7,18.1 L551.1,20.5 L553.2,21.4 L554.8,23.3 L556.7,23.0 L558.2,19.5 L560.0,19.9 L561.8,22.7 L564.3,23.2 L564.8,24.0 L563.4,25.9 L564.9,30.0 L564.6,32.5 L567.4,37.7 L570.9,39.5 L573.3,39.5 L574.1,40.4 L576.4,39.8 L577.1,38.4 L580.3,37.9 L582.3,38.6 L583.8,37.1 L585.6,37.5 L587.2,36.8 L590.1,32.4 L592.3,32.8 L594.1,34.0 L596.8,38.1 L599.8,40.4 L600.7,42.4 L598.5,46.2 L597.8,46.4 L598.6,49.6 L596.0,52.4 L594.9,56.0 L593.4,57.6 L593.8,59.1 L592.7,60.3 L593.4,61.5 L593.4,64.9 L592.4,65.2 L594.2,68.7 L594.0,72.3 L593.3,73.5 L590.1,73.3 L589.8,75.3 L587.3,83.5 L587.3,86.8 L587.9,89.0 L587.2,91.1 L585.2,87.6 L584.8,85.0 L584.0,84.4 L582.4,85.8 L578.8,90.3 L577.3,92.6 L574.3,94.6 L573.5,96.8 L566.7,101.7 L565.1,105.1 L567.2,108.2 L569.7,109.7 L572.1,112.6 L574.3,113.8 L576.3,111.5 L577.6,112.7 L578.4,111.7 L578.9,113.3 L576.7,116.3 L573.4,116.1 L572.4,116.7 L572.4,119.6 L574.5,122.5 L573.6,124.3 L570.6,124.8 L570.6,129.6 L569.9,130.8 L567.4,129.2 L566.2,127.3 L564.6,129.6 L561.7,127.0 L559.2,126.7 L559.8,128.2 L558.0,131.0 L559.0,131.9 L561.3,131.7 L562.5,134.9 L563.7,135.4 L564.9,137.9 L564.5,139.3 L562.6,140.7 L563.3,147.4 L566.2,151.5 L566.0,154.4 L567.4,154.7 L571.2,152.7 L575.3,149.4 L575.6,151.3 L577.4,154.4 L578.6,155.2 L578.3,156.9 L580.9,162.2 L580.7,163.9 L579.8,163.5 L579.5,166.1 L583.2,167.5 L582.5,171.8 L577.7,174.2 L577.2,176.0 L574.6,177.5 L572.7,177.6 L569.7,176.1 L568.5,176.9 L569.3,178.8 L567.8,179.5 L564.9,178.4 L563.5,179.6 L563.1,181.3 L560.5,182.7 L559.3,181.5 L557.3,182.2 L553.6,186.1 L552.2,185.5 L549.0,187.8 L547.6,188.0 L547.2,189.8 L545.8,190.9 L542.4,195.1 L542.3,192.7 L539.6,188.8 L539.7,187.4 L537.4,186.8 L536.6,185.0 L534.0,186.4 L533.0,187.9 L534.5,189.3 L533.9,194.3 L535.1,199.0 L534.8,200.5 L533.3,202.1 L532.4,201.5 L527.5,201.1 L523.1,201.4 L522.6,197.8 L520.7,195.6 L522.1,195.0 L522.5,193.3 L521.8,190.1 L520.3,190.9 L519.7,188.4 L518.5,187.9 L518.9,185.4 L516.1,181.9 L513.9,182.8 L513.1,181.8 L511.8,184.3 L507.7,184.4 L505.8,185.4 L505.1,186.8 L505.7,188.2 L505.6,191.3 L502.6,192.8 L500.0,191.5 L496.1,194.8 L495.0,192.9 L494.0,192.9 L490.8,195.0 L488.1,196.1 L488.1,197.7 L486.8,198.2 L482.9,197.9 L482.7,194.8 L483.2,192.8 L481.9,189.1 L479.5,189.7 L478.1,190.7 L477.4,192.5 L475.5,194.0 L474.9,198.1 L472.9,199.1 L471.7,200.8 L471.5,202.8 L472.2,204.9 L470.5,205.8 L472.8,208.5 L474.4,211.2 L472.9,212.9 L473.1,215.1 L468.8,216.0 L466.9,217.3 L464.8,217.7 L463.6,216.2 L460.4,217.1 L458.6,219.5 L457.4,219.9 L453.8,218.1 L452.4,219.0 L450.3,222.4 L448.1,227.2 L446.2,228.5 L443.0,227.7 L441.2,230.8 L438.5,231.7 L437.7,231.1 L438.7,228.7 L437.4,228.9 L435.4,230.4 L432.9,233.7 L431.2,231.7 L429.4,232.5 L428.1,230.8 L426.7,230.8 L427.4,232.9 L424.9,234.5 L423.1,236.3 L421.4,237.0 L419.7,240.3 L418.3,240.5 L417.0,242.7 L415.1,243.9 L412.9,246.9 L412.5,249.0 L413.3,250.3 L412.4,253.1 L411.0,252.1 L410.3,253.3 L410.0,256.7 L404.8,257.2 L401.3,257.1 L400.1,254.8 L396.9,253.6 L393.9,252.5 L393.0,250.3 L391.1,249.1 L389.9,249.4 L387.2,248.7 L383.0,246.4 L385.2,244.0 L386.0,241.3 L388.9,237.2 L389.5,235.4 L387.6,232.9 L387.5,230.4 L385.5,230.4 L384.0,231.4 L381.7,231.2 L381.4,233.2 L379.4,233.7 L378.6,235.8 L376.5,239.4 L375.7,241.8 L375.3,247.0 L374.4,248.4 L375.1,250.4 L374.5,253.3 L372.9,254.3 L369.3,253.9 L366.0,255.1 L364.2,256.7 L358.0,257.0 L357.1,258.5 L355.9,258.6 L354.2,257.4 L349.3,252.3 L346.5,251.1 L346.2,247.2 L347.8,246.7 L347.5,242.2 L351.5,240.1 L353.8,237.7 L354.7,236.0 L356.3,234.9 L357.1,232.9 L355.3,229.5 L355.4,227.7 L351.8,227.5 L346.2,229.1 L342.2,231.5 L337.9,230.3 L335.6,229.2 L328.7,231.4 L330.9,234.3 L328.4,237.0 L325.4,236.8 L322.3,235.3 L321.1,231.4 L319.5,231.6 L317.4,228.9 L317.4,225.6 L314.1,224.9 L311.5,222.6 L310.3,220.2 L308.6,219.6 L304.6,217.0 L301.6,216.7 L304.2,214.0 L307.6,212.2 L309.2,209.3 L311.6,206.2 L311.5,204.4 L309.8,201.8 L305.8,201.3 L303.7,202.0 L299.8,201.8 L295.8,203.1 L293.5,205.3 L291.9,205.7 L288.6,205.2 L290.2,200.6 L286.2,196.1 L283.8,192.3 L283.2,190.6 L285.8,188.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.NM</hasc>
			    <alt-name>Nei Mongol|Nèim?ngg?</alt-name>
			    <woe-id>12578009</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH20</fips>
			    <postal-code>NM</postal-code>
			    <name>Inner Mongol</name>
			    <country>China</country>
			    <type-en>Autonomous Region</type-en>
			    <region>North China</region>
			    <longitude>111.623</longitude>
			    <woe-name>Inner Mongol</woe-name>
			    <latitude>41.5938</latitude>
			    <woe-label>Nei Mongol, CN, China</woe-label>
			    <type>Zìzhìqu</type>
			    <hc-middle-x>0.68</hc-middle-x>
			    <hc-middle-y>0.61</hc-middle-y>
			    <hc-key>cn-nm</hc-key>
			    <hc-a2>NM</hc-a2>
			  </desc>
			</path>

			<path data-name="黑龙江" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.HL" d="M668.9,158.4 L667.8,159.0 L665.9,158.1 L664.2,159.2 L663.7,158.3 L661.1,156.7 L659.1,156.3 L657.8,152.3 L657.1,151.8 L655.3,153.9 L654.5,153.8 L653.9,151.8 L652.9,151.3 L651.3,153.8 L648.8,154.1 L645.7,155.8 L645.8,158.6 L643.4,159.9 L641.9,159.7 L640.3,157.5 L640.0,156.0 L636.1,150.8 L635.4,146.2 L634.6,145.5 L633.0,146.6 L632.5,148.0 L631.3,148.3 L631.7,151.7 L629.5,153.0 L627.8,151.5 L625.0,147.8 L625.5,145.1 L623.4,144.1 L622.2,144.8 L620.8,144.2 L619.7,145.2 L618.7,141.7 L619.6,139.9 L618.0,136.9 L616.1,136.8 L613.4,135.4 L609.0,137.4 L605.4,136.2 L603.7,134.4 L603.5,131.9 L600.6,132.7 L600.0,134.0 L597.0,134.3 L596.0,132.7 L594.5,132.3 L594.3,133.6 L591.2,133.7 L590.9,134.4 L588.8,133.8 L586.9,131.1 L586.0,131.2 L584.5,129.2 L584.8,127.5 L583.8,126.2 L584.4,125.1 L583.2,120.8 L581.1,121.5 L574.5,122.5 L572.4,119.6 L572.4,116.7 L573.4,116.1 L576.7,116.3 L578.9,113.3 L578.4,111.7 L577.6,112.7 L576.3,111.5 L574.3,113.8 L572.1,112.6 L569.7,109.7 L567.2,108.2 L565.1,105.1 L566.7,101.7 L573.5,96.8 L574.3,94.6 L577.3,92.6 L578.8,90.3 L582.4,85.8 L584.0,84.4 L584.8,85.0 L585.2,87.6 L587.2,91.1 L587.9,89.0 L587.3,86.8 L587.3,83.5 L589.8,75.3 L590.1,73.3 L593.3,73.5 L594.0,72.3 L594.2,68.7 L592.4,65.2 L593.4,64.9 L593.4,61.5 L592.7,60.3 L593.8,59.1 L593.4,57.6 L594.9,56.0 L596.0,52.4 L598.6,49.6 L597.8,46.4 L598.5,46.2 L600.7,42.4 L599.8,40.4 L596.8,38.1 L594.1,34.0 L592.3,32.8 L590.1,32.4 L587.2,36.8 L585.6,37.5 L583.8,37.1 L582.3,38.6 L580.3,37.9 L577.1,38.4 L576.4,39.8 L574.1,40.4 L573.3,39.5 L570.9,39.5 L567.4,37.7 L564.6,32.5 L564.9,30.0 L563.4,25.9 L564.8,24.0 L564.3,23.2 L561.8,22.7 L560.0,19.9 L558.2,19.5 L556.7,23.0 L554.8,23.3 L553.2,21.4 L551.1,20.5 L547.7,18.1 L550.9,14.8 L553.8,10.4 L551.7,6.7 L549.6,5.5 L554.4,3.3 L556.4,3.2 L559.0,2.0 L560.4,2.4 L564.4,2.0 L567.4,1.2 L568.4,0.1 L571.5,0.9 L572.2,0.0 L573.4,1.0 L576.0,1.7 L577.6,3.3 L578.8,2.8 L580.7,5.2 L583.6,5.6 L585.9,6.9 L585.7,5.9 L588.2,5.2 L592.5,7.7 L593.5,7.3 L594.8,8.6 L594.3,10.4 L596.0,9.8 L597.6,12.1 L598.5,11.8 L598.7,13.5 L597.8,14.4 L600.4,15.9 L601.9,18.2 L601.7,19.6 L603.1,20.2 L601.9,21.5 L604.2,22.2 L603.6,25.1 L606.0,29.1 L606.7,29.3 L606.5,31.6 L608.0,32.4 L608.0,34.4 L609.1,34.6 L608.3,36.6 L610.1,36.1 L609.5,37.4 L609.9,40.3 L612.4,42.8 L614.1,45.2 L615.2,48.4 L614.5,50.0 L615.2,52.2 L618.0,53.8 L617.3,57.1 L617.8,60.5 L619.3,61.3 L620.3,63.2 L621.6,64.0 L623.3,63.7 L624.5,64.6 L627.5,63.7 L632.0,63.4 L631.6,64.9 L634.5,65.5 L635.4,66.7 L636.5,66.0 L638.4,66.5 L638.7,65.1 L639.8,65.3 L640.8,67.4 L642.3,67.4 L644.8,71.0 L648.8,73.5 L650.2,72.8 L653.3,72.9 L652.2,76.9 L653.6,79.4 L654.7,79.0 L655.9,81.5 L654.8,86.3 L657.6,88.7 L658.2,91.4 L659.2,91.9 L663.4,90.4 L665.2,91.4 L671.6,90.4 L673.4,89.4 L675.5,89.6 L676.7,86.8 L676.7,85.5 L678.3,85.4 L680.9,82.4 L681.9,82.0 L685.0,82.2 L686.0,81.7 L687.5,79.4 L691.0,77.6 L694.4,76.2 L696.1,76.4 L698.1,77.7 L698.1,79.8 L697.1,81.5 L700.0,86.5 L699.3,88.7 L697.4,91.5 L695.4,92.1 L694.2,94.7 L695.3,96.9 L694.2,97.8 L693.6,101.7 L693.6,105.1 L692.4,107.6 L693.5,109.2 L693.4,111.0 L691.3,113.2 L691.8,114.1 L691.4,116.5 L689.9,117.6 L690.0,120.9 L689.5,122.4 L687.1,123.8 L686.6,125.1 L686.5,128.2 L686.9,130.1 L685.3,131.9 L684.0,131.5 L682.3,128.6 L678.8,127.6 L676.3,128.0 L674.2,129.9 L672.1,128.5 L671.2,130.4 L670.2,130.8 L670.1,132.6 L668.3,134.9 L664.2,136.1 L663.0,137.3 L664.8,139.6 L668.1,149.2 L667.6,149.9 L667.5,153.6 L667.9,157.7 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.HL</hasc>
			    <alt-name>H?ilóngji?ng</alt-name>
			    <woe-id>12577998</woe-id>
			    <subregion>Northeast</subregion>
			    <fips>CH08</fips>
			    <postal-code>HL</postal-code>
			    <name>Heilongjiang</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Northeast China</region>
			    <longitude>127.97</longitude>
			    <woe-name>Heilongjiang</woe-name>
			    <latitude>46.8451</latitude>
			    <woe-label>Heilongjiang, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.54</hc-middle-x>
			    <hc-middle-y>0.68</hc-middle-y>
			    <hc-key>cn-hl</hc-key>
			    <hc-a2>HL</hc-a2>
			  </desc>
			</path>

			<path data-name="四川" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.SC" d="M360.6,401.2 L359.8,399.2 L360.6,397.2 L357.8,395.7 L356.6,396.3 L355.6,398.3 L351.8,398.9 L348.9,397.1 L348.5,395.8 L350.0,395.1 L349.2,392.4 L347.9,391.6 L347.8,388.7 L350.3,387.8 L350.0,387.3 L344.1,387.3 L342.9,386.4 L342.0,388.4 L342.9,391.4 L340.6,392.9 L339.8,392.0 L337.4,393.8 L337.7,397.8 L333.7,401.8 L332.3,404.0 L330.4,404.2 L329.2,405.5 L329.0,410.8 L329.9,412.2 L330.6,416.5 L329.1,419.2 L328.1,418.8 L325.3,420.6 L324.1,418.4 L319.9,420.2 L317.9,422.2 L315.4,421.8 L314.4,422.6 L313.5,420.5 L311.3,419.9 L312.1,417.9 L311.0,415.7 L309.4,414.5 L310.6,412.6 L309.5,412.2 L308.8,410.1 L306.4,407.4 L307.0,405.3 L304.8,405.0 L304.8,403.1 L303.4,400.6 L303.6,399.6 L301.2,394.9 L297.9,395.3 L297.1,396.4 L293.7,391.5 L293.7,389.7 L295.3,389.1 L295.2,387.6 L291.7,383.5 L290.4,381.3 L290.4,379.9 L289.2,380.2 L287.3,383.4 L285.9,383.8 L285.2,389.0 L282.8,385.1 L283.1,382.7 L282.6,381.1 L283.2,373.7 L282.7,372.4 L282.8,368.7 L282.2,367.3 L283.4,363.6 L282.9,360.2 L283.0,355.6 L282.6,352.6 L283.3,351.4 L281.2,348.9 L281.7,347.7 L279.5,344.8 L280.1,342.9 L281.6,344.2 L283.2,342.5 L279.9,338.6 L278.2,335.3 L278.8,332.8 L276.2,328.6 L276.2,327.1 L274.0,325.3 L270.4,323.7 L267.1,321.1 L266.6,318.1 L268.5,316.4 L268.7,313.9 L271.8,311.1 L269.6,310.2 L268.0,307.7 L268.3,303.9 L271.2,303.3 L272.4,302.3 L272.8,304.4 L276.5,303.4 L278.6,303.9 L279.6,305.4 L281.5,305.6 L283.5,308.3 L283.2,309.1 L284.4,311.1 L284.6,313.9 L285.4,315.9 L289.7,318.9 L290.4,320.6 L293.0,321.6 L295.2,323.1 L296.3,320.6 L297.6,319.2 L299.8,320.7 L301.0,323.1 L300.3,324.7 L301.6,325.3 L302.1,324.0 L303.9,323.7 L305.7,326.7 L304.5,327.8 L305.1,329.0 L306.1,328.4 L307.2,325.1 L310.0,326.1 L313.4,325.5 L314.3,323.1 L313.2,321.8 L313.8,319.1 L317.4,317.8 L319.7,319.5 L320.9,317.6 L320.2,316.7 L321.8,313.8 L323.2,313.6 L323.5,315.7 L322.2,317.6 L322.3,319.8 L327.8,316.5 L330.4,315.4 L330.5,314.3 L329.0,313.1 L329.0,311.4 L327.1,308.1 L329.6,307.7 L330.6,306.6 L332.8,306.4 L332.3,305.5 L335.0,303.7 L336.8,303.5 L339.0,305.5 L339.5,310.7 L340.5,311.6 L344.0,311.2 L343.5,312.6 L346.2,313.3 L350.5,313.7 L351.3,316.4 L353.7,318.9 L352.4,319.7 L353.8,322.8 L352.2,325.9 L353.6,326.6 L355.4,328.4 L359.5,329.8 L361.9,330.1 L364.1,329.6 L366.3,328.2 L365.8,326.3 L367.2,325.9 L367.9,328.5 L370.9,328.3 L371.8,327.0 L374.6,327.0 L374.0,329.1 L376.0,331.0 L380.7,330.0 L382.1,329.1 L386.5,329.7 L386.4,332.5 L388.0,333.6 L391.1,332.7 L391.2,334.3 L393.7,334.7 L395.9,337.2 L397.8,338.4 L398.5,337.3 L400.8,336.9 L403.8,337.1 L404.2,337.9 L402.3,338.3 L403.0,339.3 L401.0,341.1 L401.2,341.9 L403.8,343.9 L404.0,345.1 L402.5,347.1 L400.2,348.5 L399.7,350.5 L397.7,352.0 L397.2,354.7 L396.2,357.0 L394.6,358.1 L393.6,356.7 L390.8,357.6 L390.2,358.4 L390.3,360.6 L388.9,362.2 L387.0,365.9 L384.4,368.4 L380.4,368.2 L379.3,365.1 L378.3,364.0 L374.5,365.6 L373.1,363.8 L369.0,362.4 L368.1,364.3 L365.8,366.2 L368.0,368.0 L367.5,370.4 L365.5,371.2 L365.4,372.2 L363.6,372.6 L362.0,374.2 L362.2,375.9 L363.3,377.8 L366.9,379.7 L367.3,383.1 L368.9,384.3 L370.6,383.6 L373.8,385.2 L374.1,388.1 L375.1,389.6 L374.5,390.9 L370.2,386.7 L368.9,388.8 L366.2,389.0 L365.3,390.4 L365.6,392.5 L368.3,393.8 L368.5,395.4 L371.3,395.2 L373.7,397.8 L374.1,400.3 L372.8,401.1 L371.0,400.8 L364.8,402.0 L363.0,400.4 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.SC</hasc>
			    <alt-name>Sìchu?n</alt-name>
			    <woe-id>12578016</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH32</fips>
			    <postal-code>SC</postal-code>
			    <name>Sichuan</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Southwest China</region>
			    <longitude>102.384</longitude>
			    <woe-name>Sichuan</woe-name>
			    <latitude>30.5431</latitude>
			    <woe-label>Sichuan, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.47</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>cn-sc</hc-key>
			    <hc-a2>SC</hc-a2>
			  </desc>
			</path>

			<path data-name="贵州" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.GZ" d="M348.3,443.6 L348.4,442.5 L350.6,440.0 L351.1,437.0 L351.9,436.3 L349.2,434.4 L348.9,432.6 L346.0,430.1 L347.7,427.4 L347.4,426.1 L348.9,425.0 L349.7,421.6 L351.5,420.1 L350.1,417.1 L348.9,416.6 L348.6,415.1 L347.6,416.0 L344.9,415.8 L343.1,417.7 L340.1,416.6 L339.6,412.5 L340.4,411.1 L339.4,409.6 L338.1,409.2 L342.5,404.9 L343.4,404.9 L345.8,406.9 L348.1,404.6 L349.3,406.0 L351.2,406.6 L354.8,406.9 L357.6,405.5 L359.0,405.8 L360.6,401.2 L363.0,400.4 L364.8,402.0 L371.0,400.8 L372.8,401.1 L374.1,400.3 L373.7,397.8 L371.3,395.2 L368.5,395.4 L368.3,393.8 L365.6,392.5 L365.3,390.4 L366.2,389.0 L368.9,388.8 L370.2,386.7 L374.5,390.9 L375.1,389.6 L376.5,390.1 L377.0,388.3 L376.3,386.1 L377.6,386.9 L378.3,388.8 L377.3,390.3 L379.0,391.1 L381.1,388.6 L381.2,387.0 L382.6,386.8 L383.6,385.4 L385.3,385.6 L386.3,386.7 L388.8,385.8 L389.7,384.2 L388.7,382.9 L389.8,380.5 L390.5,381.4 L393.4,382.2 L393.4,383.6 L394.4,384.5 L396.8,383.4 L399.7,383.3 L400.6,387.7 L400.1,389.0 L403.3,390.4 L403.2,393.6 L404.4,394.2 L403.9,392.4 L405.8,393.0 L405.0,395.6 L409.6,396.3 L410.5,393.0 L411.9,392.0 L411.9,394.7 L413.0,395.5 L412.2,398.6 L412.8,402.8 L413.9,404.5 L413.5,405.8 L411.7,407.5 L410.7,407.3 L405.2,412.4 L407.3,413.3 L409.2,411.8 L409.9,412.6 L410.9,411.6 L413.6,412.0 L414.4,414.2 L413.6,415.3 L414.6,415.9 L411.6,417.7 L412.9,420.5 L411.4,423.7 L412.7,424.4 L413.4,427.7 L412.6,428.3 L411.2,431.9 L409.7,431.0 L406.7,431.3 L406.0,433.0 L407.7,432.2 L407.8,434.7 L404.3,434.9 L403.3,433.7 L401.5,436.3 L398.0,434.4 L395.8,436.6 L395.7,438.3 L392.1,439.9 L389.8,438.9 L389.4,437.5 L387.4,438.7 L386.3,436.4 L384.3,433.6 L382.1,434.0 L380.7,435.2 L380.9,437.8 L379.4,438.6 L376.5,438.8 L375.4,439.8 L371.7,441.4 L369.7,441.6 L369.8,444.2 L367.7,446.1 L366.4,444.8 L364.7,444.9 L363.2,443.7 L361.1,443.2 L360.3,441.6 L358.3,441.4 L357.0,440.2 L355.1,441.7 L354.6,443.1 L352.7,443.6 L350.7,445.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.GZ</hasc>
			    <alt-name>Gùizh?u</alt-name>
			    <woe-id>12578007</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH18</fips>
			    <postal-code>GZ</postal-code>
			    <name>Guizhou</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Southwest China</region>
			    <longitude>106.559</longitude>
			    <woe-name>Guizhou</woe-name>
			    <latitude>26.8033</latitude>
			    <woe-label>Guizhou, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.55</hc-middle-x>
			    <hc-middle-y>0.58</hc-middle-y>
			    <hc-key>cn-gz</hc-key>
			    <hc-a2>GZ</hc-a2>
			  </desc>
			</path>

			<path data-name="广西" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.GX" d="M360.0,467.0 L364.6,462.1 L366.3,462.9 L368.3,462.0 L369.4,457.3 L369.0,455.8 L367.3,453.7 L364.2,454.8 L360.7,453.3 L359.7,454.4 L356.1,452.3 L356.3,450.3 L355.6,448.8 L350.9,447.7 L350.5,449.1 L348.8,448.5 L347.7,445.9 L348.3,443.6 L350.7,445.3 L352.7,443.6 L354.6,443.1 L355.1,441.7 L357.0,440.2 L358.3,441.4 L360.3,441.6 L361.1,443.2 L363.2,443.7 L364.7,444.9 L366.4,444.8 L367.7,446.1 L369.8,444.2 L369.7,441.6 L371.7,441.4 L375.4,439.8 L376.5,438.8 L379.4,438.6 L380.9,437.8 L380.7,435.2 L382.1,434.0 L384.3,433.6 L386.3,436.4 L387.4,438.7 L389.4,437.5 L389.8,438.9 L392.1,439.9 L395.7,438.3 L395.8,436.6 L398.0,434.4 L401.5,436.3 L403.3,433.7 L404.3,434.9 L407.8,434.7 L407.7,432.2 L406.0,433.0 L406.7,431.3 L409.7,431.0 L411.2,431.9 L412.6,428.3 L413.4,427.7 L415.3,427.6 L416.2,430.0 L417.5,429.7 L419.6,425.6 L421.3,426.3 L420.9,428.0 L422.3,427.8 L423.7,428.9 L424.9,427.0 L427.5,425.4 L427.8,423.7 L430.0,424.7 L432.0,424.8 L432.9,423.1 L436.8,424.8 L436.0,429.4 L437.1,430.8 L439.3,429.9 L437.4,434.0 L437.5,436.0 L435.5,437.9 L434.8,439.8 L433.2,441.0 L432.6,442.8 L433.6,444.4 L434.9,442.6 L436.9,441.1 L438.8,441.7 L439.4,446.3 L438.8,447.9 L439.9,448.4 L441.9,446.5 L445.3,446.6 L446.2,447.2 L445.4,449.1 L446.3,449.8 L446.8,452.3 L445.9,453.8 L444.5,454.4 L444.9,457.7 L443.2,460.1 L441.6,460.0 L440.8,462.6 L439.1,463.2 L438.0,465.8 L437.6,470.0 L438.2,471.0 L437.3,473.3 L435.0,475.6 L433.5,475.7 L432.9,477.1 L429.3,477.9 L428.3,479.3 L429.5,482.2 L428.1,482.4 L427.7,483.6 L425.3,484.0 L423.5,483.4 L424.0,487.5 L418.5,487.9 L417.8,490.5 L415.5,492.0 L415.4,493.4 L413.6,491.9 L413.1,489.3 L412.1,490.1 L413.1,491.8 L412.5,493.1 L407.2,494.3 L405.9,493.5 L407.3,492.7 L407.3,491.4 L405.1,491.2 L403.6,490.1 L402.1,490.5 L399.8,488.1 L400.7,487.1 L398.2,487.3 L398.9,488.4 L399.0,491.2 L397.6,491.7 L397.6,490.2 L396.4,489.5 L395.8,491.8 L394.9,490.6 L394.4,492.0 L392.9,491.5 L392.2,492.8 L388.6,489.9 L386.8,490.6 L383.3,490.6 L382.3,488.8 L381.0,488.8 L378.6,486.8 L379.0,485.7 L374.2,484.5 L374.5,481.2 L372.8,478.2 L373.5,476.1 L375.0,476.1 L376.0,473.8 L375.0,472.0 L372.6,471.0 L370.3,471.9 L368.9,470.5 L366.2,470.0 L364.2,470.9 L362.1,468.8 L360.3,468.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.GX</hasc>
			    <alt-name>Guangxi Zhuang|Guangxi Zhuàngzú</alt-name>
			    <woe-id>12578006</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH16</fips>
			    <postal-code>GX</postal-code>
			    <name>Guangxi</name>
			    <country>China</country>
			    <type-en>Autonomous Region</type-en>
			    <region>South Central China</region>
			    <longitude>108.756</longitude>
			    <woe-name>Guangxi</woe-name>
			    <latitude>23.7451</latitude>
			    <woe-label>Guangxi, CN, China</woe-label>
			    <type>Zìzhìqu</type>
			    <hc-middle-x>0.56</hc-middle-x>
			    <hc-middle-y>0.49</hc-middle-y>
			    <hc-key>cn-gx</hc-key>
			    <hc-a2>GX</hc-a2>
			  </desc>
			</path>

			<path data-name="辽宁" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.LN" d="M533.3,202.1 L534.8,200.5 L535.1,199.0 L533.9,194.3 L534.5,189.3 L533.0,187.9 L534.0,186.4 L536.6,185.0 L537.4,186.8 L539.7,187.4 L539.6,188.8 L542.3,192.7 L542.4,195.1 L545.8,190.9 L547.2,189.8 L547.6,188.0 L549.0,187.8 L552.2,185.5 L553.6,186.1 L557.3,182.2 L559.3,181.5 L560.5,182.7 L563.1,181.3 L563.5,179.6 L564.9,178.4 L567.8,179.5 L569.3,178.8 L568.5,176.9 L569.7,176.1 L572.7,177.6 L574.6,177.5 L577.2,176.0 L577.7,174.2 L582.5,171.8 L583.2,167.5 L583.7,165.6 L586.8,167.9 L590.0,169.0 L591.7,171.2 L591.2,172.3 L592.6,174.7 L594.2,172.9 L595.6,170.5 L597.0,170.7 L596.9,173.9 L598.5,176.3 L598.3,177.4 L600.0,178.5 L600.1,179.8 L601.4,181.1 L603.1,184.7 L604.8,184.8 L602.9,187.9 L603.4,192.2 L605.0,192.1 L605.4,193.7 L607.8,198.0 L608.8,198.5 L609.3,200.1 L608.6,202.2 L607.3,203.7 L608.9,204.5 L608.7,205.9 L607.3,205.8 L605.7,208.2 L603.9,208.6 L601.3,210.0 L601.4,211.2 L599.9,210.9 L597.9,213.7 L597.1,214.0 L594.0,217.3 L593.3,219.8 L591.4,221.4 L589.9,221.8 L586.8,221.7 L585.6,220.7 L585.3,222.5 L583.2,223.4 L582.9,222.6 L580.8,223.5 L580.5,224.6 L578.5,224.5 L578.1,225.6 L576.7,225.5 L573.8,228.0 L571.6,229.0 L568.4,232.3 L568.6,233.2 L565.6,236.4 L564.5,235.2 L562.4,236.5 L563.8,237.5 L561.2,238.6 L559.6,238.6 L557.4,240.0 L556.8,236.8 L559.4,236.3 L563.3,234.3 L562.2,232.8 L564.3,229.9 L561.6,230.2 L560.5,228.6 L559.9,230.2 L558.6,229.9 L558.8,228.2 L557.7,227.9 L558.6,226.8 L561.4,225.5 L560.3,224.4 L561.1,222.6 L565.0,220.5 L566.2,217.4 L569.6,212.4 L567.6,210.6 L566.4,208.8 L564.1,207.6 L563.7,205.9 L562.8,207.4 L560.8,207.6 L558.3,206.2 L556.1,206.6 L552.2,210.6 L552.0,211.7 L549.1,214.9 L548.8,217.2 L548.0,218.1 L542.4,220.4 L541.2,221.6 L539.9,219.9 L539.9,218.3 L538.6,218.2 L537.6,213.2 L534.4,213.5 L533.2,212.1 L533.1,210.9 L531.7,211.7 L529.2,209.2 L530.1,206.1 L532.6,203.6 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.LN</hasc>
			    <alt-name>Liáoníng</alt-name>
			    <woe-id>12578008</woe-id>
			    <subregion>Northeast</subregion>
			    <fips>CH19</fips>
			    <postal-code>LN</postal-code>
			    <name>Liaoning</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Northeast China</region>
			    <longitude>123.07</longitude>
			    <woe-name>Liaoning</woe-name>
			    <latitude>41.386</latitude>
			    <woe-label>Liaoning, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.63</hc-middle-x>
			    <hc-middle-y>0.44</hc-middle-y>
			    <hc-key>cn-ln</hc-key>
			    <hc-a2>LN</hc-a2>
			  </desc>
			</path>

			<path data-name="江苏" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.JS" d="M537.0,295.6 L536.0,296.7 L536.1,300.9 L537.9,299.9 L539.4,300.3 L539.3,301.3 L541.7,303.2 L545.4,304.5 L549.3,306.5 L550.9,310.5 L551.5,313.1 L552.6,314.6 L552.5,316.1 L554.4,318.6 L554.9,320.6 L556.0,321.6 L557.2,325.1 L558.0,325.3 L558.3,327.8 L557.8,330.3 L561.1,332.6 L564.5,334.2 L564.4,336.4 L565.4,338.2 L568.1,338.8 L570.2,340.3 L571.6,343.1 L570.4,344.1 L568.6,343.7 L563.6,341.5 L561.5,343.0 L559.8,342.8 L557.6,339.9 L553.5,339.2 L550.8,341.2 L549.1,341.4 L547.4,340.4 L545.0,336.1 L546.2,339.4 L547.6,341.3 L550.4,341.8 L553.2,340.6 L553.1,340.1 L556.8,340.5 L557.9,342.7 L556.9,343.1 L562.0,344.6 L564.5,347.3 L562.6,347.9 L561.3,352.4 L558.8,352.8 L559.4,354.6 L556.7,355.2 L557.0,356.4 L554.3,358.4 L553.7,356.6 L552.6,355.9 L549.7,356.0 L547.3,354.0 L547.1,353.1 L544.7,352.8 L543.3,353.4 L539.9,352.7 L539.7,351.3 L537.4,351.4 L536.3,352.1 L533.0,352.4 L532.2,350.5 L533.7,348.1 L533.4,346.5 L531.0,346.2 L531.2,345.5 L528.5,344.3 L528.6,343.3 L526.9,342.0 L527.3,340.5 L528.8,338.3 L530.5,337.7 L530.7,334.5 L529.2,332.8 L531.7,332.1 L533.4,332.3 L535.8,334.5 L537.2,332.2 L536.6,329.0 L534.5,326.9 L532.8,326.8 L531.2,330.4 L527.2,330.5 L525.9,329.9 L525.1,327.8 L524.8,324.0 L523.1,324.5 L521.2,323.3 L522.7,319.5 L523.4,319.6 L524.1,316.5 L523.4,315.4 L518.5,316.1 L518.7,313.8 L517.1,312.0 L515.7,311.4 L511.4,310.9 L509.8,309.9 L508.7,306.5 L506.9,306.4 L501.7,302.9 L502.8,299.1 L507.1,298.1 L508.5,299.2 L510.0,301.7 L511.6,305.5 L513.4,303.5 L515.1,305.1 L518.8,304.3 L519.0,302.4 L522.1,302.3 L523.4,303.8 L523.7,306.0 L526.4,305.3 L527.4,301.6 L529.8,301.6 L530.8,300.6 L532.0,296.3 L534.5,296.1 L535.7,295.2 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.JS</hasc>
			    <alt-name>Ji?ngs?</alt-name>
			    <woe-id>12577994</woe-id>
			    <subregion>NULL</subregion>
			    <fips>CH04</fips>
			    <postal-code>JS</postal-code>
			    <name>Jiangsu</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>East China</region>
			    <longitude>119.942</longitude>
			    <woe-name>Jiangsu</woe-name>
			    <latitude>32.9844</latitude>
			    <woe-label>Jiangsu, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.53</hc-middle-x>
			    <hc-middle-y>0.39</hc-middle-y>
			    <hc-key>cn-js</hc-key>
			    <hc-a2>JS</hc-a2>
			  </desc>
			</path>

			<path data-name="甘肃" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.GS" d="M321.8,313.8 L319.8,313.9 L318.6,310.9 L316.7,311.8 L314.4,311.2 L314.2,308.4 L312.1,307.1 L310.5,303.6 L310.9,301.6 L312.5,300.3 L313.7,301.1 L320.6,303.9 L322.5,305.8 L324.4,305.0 L328.1,302.1 L327.5,299.9 L325.2,298.8 L324.8,297.2 L323.3,297.5 L322.9,296.4 L325.0,295.4 L326.3,293.2 L329.5,291.7 L331.0,289.6 L329.7,288.4 L330.2,286.5 L331.9,286.2 L333.3,284.8 L335.1,285.3 L335.6,283.8 L335.6,280.5 L338.9,280.8 L339.4,278.5 L338.7,277.0 L340.1,275.1 L337.6,273.3 L337.1,270.7 L335.4,268.2 L336.3,266.1 L333.9,263.6 L335.2,260.6 L333.9,258.8 L329.4,255.4 L329.9,254.4 L328.5,251.5 L326.5,254.6 L320.9,249.9 L318.2,247.2 L313.5,244.7 L312.7,242.4 L310.4,241.4 L308.1,238.5 L307.3,239.8 L308.0,242.7 L306.2,240.9 L303.9,239.9 L301.2,237.4 L300.6,236.0 L296.4,231.3 L296.4,230.2 L292.9,228.2 L290.6,229.8 L288.7,229.5 L287.4,228.4 L284.5,231.3 L280.0,228.3 L276.3,225.3 L272.4,224.2 L271.5,225.5 L271.7,227.2 L270.1,236.7 L268.9,236.6 L265.2,234.5 L265.2,233.3 L263.1,231.9 L260.1,230.7 L259.7,229.6 L256.5,227.3 L254.9,225.0 L253.8,224.4 L252.2,222.1 L249.2,222.3 L242.7,218.9 L238.5,218.3 L236.0,218.6 L233.9,218.0 L231.2,218.2 L228.4,219.1 L224.3,219.1 L225.1,214.6 L223.8,208.9 L224.0,207.5 L226.1,204.5 L227.1,199.2 L231.0,199.8 L234.7,198.4 L240.7,191.2 L248.1,184.6 L254.0,182.2 L259.1,181.7 L262.3,182.5 L263.4,182.2 L265.6,180.3 L265.6,178.1 L266.6,172.5 L267.3,171.2 L270.6,169.5 L271.9,169.5 L280.1,169.5 L285.8,188.3 L283.2,190.6 L283.8,192.3 L286.2,196.1 L290.2,200.6 L288.6,205.2 L291.9,205.7 L293.5,205.3 L295.8,203.1 L299.8,201.8 L303.7,202.0 L305.8,201.3 L309.8,201.8 L311.5,204.4 L311.6,206.2 L309.2,209.3 L307.6,212.2 L304.2,214.0 L301.6,216.7 L304.6,217.0 L308.6,219.6 L310.3,220.2 L311.5,222.6 L314.1,224.9 L317.4,225.6 L317.4,228.9 L319.5,231.6 L321.1,231.4 L322.3,235.3 L325.4,236.8 L328.4,237.0 L330.9,234.3 L328.7,231.4 L335.6,229.2 L337.9,230.3 L342.2,231.5 L346.2,229.1 L351.8,227.5 L355.4,227.7 L355.3,229.5 L357.1,232.9 L356.3,234.9 L354.7,236.0 L353.8,237.7 L351.5,240.1 L347.5,242.2 L347.8,246.7 L346.2,247.2 L346.5,251.1 L349.3,252.3 L354.2,257.4 L355.9,258.6 L357.1,258.5 L358.4,257.9 L361.1,258.5 L361.4,259.6 L360.1,260.9 L362.9,261.6 L363.6,263.4 L366.6,265.5 L368.1,268.4 L366.8,269.7 L367.3,271.8 L369.2,276.3 L369.0,278.5 L367.9,279.2 L367.4,281.0 L368.6,283.8 L371.7,285.0 L373.2,287.9 L374.6,287.5 L376.0,288.5 L374.1,289.3 L377.8,289.6 L379.0,291.5 L380.8,290.7 L381.5,287.4 L380.7,285.2 L382.7,284.9 L384.3,285.7 L386.6,284.2 L385.8,282.7 L387.2,279.9 L385.7,277.8 L383.2,276.7 L381.9,276.8 L382.3,270.2 L383.5,270.0 L384.1,268.4 L383.3,266.9 L384.1,266.0 L384.3,263.2 L386.1,263.2 L387.7,264.5 L390.8,264.5 L391.9,265.2 L391.8,267.5 L396.7,269.1 L399.0,270.2 L400.7,272.6 L404.5,273.6 L405.5,274.9 L407.5,275.4 L408.6,276.5 L407.9,278.5 L408.4,280.0 L408.1,281.8 L405.8,283.5 L405.9,286.2 L407.0,288.5 L407.1,290.8 L405.5,292.6 L401.4,292.2 L399.0,293.1 L396.4,291.6 L395.5,292.9 L397.3,296.7 L394.1,296.7 L393.2,297.3 L391.0,296.9 L389.6,297.6 L387.8,295.4 L386.2,294.5 L381.9,294.5 L381.0,295.2 L381.6,297.7 L380.8,299.5 L378.5,301.7 L379.1,302.7 L380.7,302.7 L382.7,304.8 L382.4,306.8 L381.2,306.3 L381.5,308.4 L380.6,308.9 L379.3,311.9 L379.9,314.8 L380.8,316.4 L380.0,317.1 L378.8,316.0 L376.0,316.7 L374.8,315.8 L371.8,317.4 L370.3,319.0 L370.6,320.4 L372.6,321.4 L372.0,325.1 L368.9,326.3 L367.2,325.9 L365.8,326.3 L366.3,328.2 L364.1,329.6 L361.9,330.1 L359.5,329.8 L355.4,328.4 L353.6,326.6 L352.2,325.9 L353.8,322.8 L352.4,319.7 L353.7,318.9 L351.3,316.4 L350.5,313.7 L346.2,313.3 L343.5,312.6 L344.0,311.2 L340.5,311.6 L339.5,310.7 L339.0,305.5 L336.8,303.5 L335.0,303.7 L332.3,305.5 L332.8,306.4 L330.6,306.6 L329.6,307.7 L327.1,308.1 L329.0,311.4 L329.0,313.1 L330.5,314.3 L330.4,315.4 L327.8,316.5 L322.3,319.8 L322.2,317.6 L323.5,315.7 L323.2,313.6 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.GS</hasc>
			    <alt-name>G?nsù</alt-name>
			    <woe-id>12578005</woe-id>
			    <subregion>Western</subregion>
			    <fips>CH15</fips>
			    <postal-code>GS</postal-code>
			    <name>Gansu</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>Northwest China</region>
			    <longitude>100.735</longitude>
			    <woe-name>Gansu</woe-name>
			    <latitude>38.7393</latitude>
			    <woe-label>Gansu, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.24</hc-middle-x>
			    <hc-middle-y>0.23</hc-middle-y>
			    <hc-key>cn-gs</hc-key>
			    <hc-a2>GS</hc-a2>
			  </desc>
			</path>

			<path data-name="山西" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.SX" d="M427.7,303.0 L426.7,302.2 L426.9,298.1 L427.9,294.3 L431.5,288.5 L430.9,284.7 L430.3,284.1 L429.6,280.3 L430.2,273.6 L429.1,272.2 L429.7,271.6 L428.9,269.1 L430.9,265.3 L432.6,263.3 L432.2,261.6 L434.1,259.1 L433.7,256.1 L431.0,253.2 L431.0,249.4 L435.2,245.7 L435.4,243.2 L436.8,240.3 L437.0,237.4 L438.5,236.5 L439.8,232.8 L438.5,231.7 L441.2,230.8 L443.0,227.7 L446.2,228.5 L448.1,227.2 L450.3,222.4 L452.4,219.0 L453.8,218.1 L457.4,219.9 L458.6,219.5 L460.4,217.1 L463.6,216.2 L464.8,217.7 L466.9,217.3 L468.8,216.0 L473.1,215.1 L472.9,212.9 L474.4,211.2 L475.6,214.2 L475.9,216.8 L478.6,217.6 L473.6,219.8 L471.8,222.4 L473.6,223.9 L477.1,224.7 L477.3,227.8 L478.9,229.7 L477.5,233.3 L477.2,235.2 L475.1,236.8 L472.7,236.0 L470.8,236.7 L469.7,239.2 L470.5,240.7 L467.0,244.8 L467.1,249.1 L470.1,250.6 L472.9,256.7 L473.8,257.5 L473.2,260.5 L469.6,266.2 L469.9,269.6 L468.7,269.9 L467.9,271.4 L466.0,271.9 L467.0,275.7 L469.2,277.6 L468.6,279.6 L468.8,282.1 L467.7,285.8 L467.8,288.2 L465.6,290.5 L460.6,292.9 L459.2,294.2 L456.5,293.1 L454.6,294.4 L448.9,294.2 L448.6,297.0 L446.1,296.4 L444.3,297.5 L442.7,299.6 L437.2,300.9 L434.4,302.4 L430.1,303.5 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.SX</hasc>
			    <alt-name>Sh?nx?</alt-name>
			    <woe-id>12578013</woe-id>
			    <subregion>Central</subregion>
			    <fips>CH24</fips>
			    <postal-code>SX</postal-code>
			    <name>Shanxi</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>North China</region>
			    <longitude>112.389</longitude>
			    <woe-name>Shanxi</woe-name>
			    <latitude>37.7586</latitude>
			    <woe-label>Shanxi, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.50</hc-middle-x>
			    <hc-middle-y>0.44</hc-middle-y>
			    <hc-key>cn-sx</hc-key>
			    <hc-a2>SX</hc-a2>
			  </desc>
			</path>

			<path data-name="河南" fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.HE" d="M427.7,303.0 L430.1,303.5 L434.4,302.4 L437.2,300.9 L442.7,299.6 L444.3,297.5 L446.1,296.4 L448.6,297.0 L448.9,294.2 L454.6,294.4 L456.5,293.1 L459.2,294.2 L460.6,292.9 L465.6,290.5 L467.8,288.2 L467.7,285.8 L468.8,282.1 L468.6,279.6 L469.2,277.6 L472.4,277.6 L474.5,279.2 L476.7,279.3 L479.2,280.8 L483.4,281.1 L484.4,282.0 L486.0,280.1 L487.6,280.4 L488.3,281.6 L490.2,280.5 L489.8,282.9 L488.7,283.9 L488.7,286.2 L490.1,284.3 L495.9,282.4 L497.7,281.2 L497.2,283.3 L495.2,283.9 L492.2,286.8 L490.7,287.6 L487.5,291.5 L485.6,292.1 L484.1,294.5 L483.0,295.1 L482.8,297.5 L484.8,297.6 L486.9,298.6 L487.4,300.2 L490.1,301.0 L490.1,302.5 L491.5,304.0 L494.8,304.0 L498.1,303.3 L498.9,304.0 L499.0,305.8 L502.0,308.3 L503.9,308.1 L503.8,310.6 L505.1,313.0 L502.7,314.6 L502.4,315.4 L499.5,316.6 L496.8,313.8 L496.7,312.4 L493.9,311.5 L492.9,311.8 L491.8,314.0 L492.6,314.9 L492.0,316.2 L492.7,318.5 L489.1,319.9 L489.2,323.6 L488.5,325.1 L486.7,326.0 L484.6,325.5 L483.6,326.1 L484.0,327.9 L487.3,329.3 L487.5,333.3 L489.6,333.7 L492.1,336.0 L493.6,334.7 L495.8,334.1 L496.6,341.5 L496.3,344.9 L493.4,345.1 L491.7,345.8 L490.0,349.1 L489.8,350.5 L487.8,350.0 L487.8,348.6 L486.7,347.9 L485.1,349.6 L482.2,349.4 L479.4,348.2 L479.5,345.8 L477.1,345.9 L474.4,344.2 L472.2,345.7 L470.0,342.4 L469.5,340.0 L469.9,336.7 L469.2,335.9 L466.7,337.6 L464.3,337.4 L462.8,336.0 L460.7,335.7 L457.0,336.8 L454.3,336.4 L451.2,336.7 L448.4,335.2 L445.0,334.2 L444.1,333.0 L441.9,332.8 L441.6,331.8 L438.0,328.0 L436.8,324.8 L435.2,323.0 L435.7,321.5 L435.2,318.2 L433.0,316.5 L432.5,315.1 L430.6,313.9 L431.3,312.4 L431.0,309.7 L428.8,308.2 L429.4,307.3 L427.6,305.0 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.HE</hasc>
			    <alt-name>Hénán</alt-name>
			    <woe-id>12577999</woe-id>
			    <subregion>Central</subregion>
			    <fips>CH09</fips>
			    <postal-code>HE</postal-code>
			    <name>Henan</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>South Central China</region>
			    <longitude>113.484</longitude>
			    <woe-name>Henan</woe-name>
			    <latitude>33.9055</latitude>
			    <woe-label>Henan, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.51</hc-middle-x>
			    <hc-middle-y>0.46</hc-middle-y>
			    <hc-key>cn-he</hc-key>
			    <hc-a2>HE</hc-a2>
			  </desc>
			</path>

			<path data-name="江西" data-pic='' fill="#CEE3F5" stroke="#6E6E6E" stroke-width="0.4" id="CN.JX" d="M471.6,437.1 L472.3,435.2 L471.4,432.7 L472.8,430.1 L473.1,428.1 L475.4,426.7 L474.7,425.9 L471.6,426.7 L473.5,422.6 L473.7,420.8 L470.8,419.7 L470.4,417.2 L471.2,415.5 L469.4,412.6 L470.7,409.7 L468.3,409.9 L467.4,409.4 L466.9,406.2 L468.7,402.9 L469.2,400.5 L471.5,399.9 L472.8,398.7 L473.8,396.5 L474.9,396.0 L475.5,394.3 L474.8,392.9 L473.3,392.1 L474.0,391.3 L474.4,388.8 L471.4,386.4 L471.3,384.8 L473.4,382.8 L475.7,382.1 L476.3,380.5 L478.6,381.1 L483.0,380.0 L483.8,378.1 L487.1,377.2 L486.4,376.1 L488.7,376.7 L490.6,375.3 L491.4,373.1 L494.2,373.1 L496.1,374.9 L499.8,374.1 L500.9,374.2 L502.9,372.8 L504.2,372.6 L506.1,370.2 L507.9,370.6 L509.2,372.0 L508.1,374.4 L506.5,375.2 L506.2,376.3 L507.2,377.4 L509.3,377.3 L511.7,375.0 L511.5,373.2 L513.0,371.9 L513.5,373.0 L515.8,373.2 L515.7,374.0 L517.4,376.2 L519.7,377.1 L523.2,376.8 L524.9,377.5 L525.7,379.1 L525.2,380.7 L524.2,381.1 L523.6,383.0 L524.4,384.3 L526.5,385.7 L529.2,389.4 L529.9,394.6 L529.6,395.3 L528.4,396.3 L528.7,398.0 L525.6,399.0 L524.8,399.9 L521.7,400.6 L520.8,402.4 L518.9,401.6 L517.7,400.2 L514.8,401.9 L514.9,403.1 L512.7,406.1 L512.6,409.3 L513.3,410.3 L511.9,412.7 L510.4,414.0 L507.1,414.6 L505.5,416.3 L505.1,418.9 L506.6,421.7 L503.8,424.7 L504.1,426.7 L502.9,429.6 L500.4,430.9 L500.8,432.1 L499.1,434.2 L498.5,438.3 L496.7,440.6 L497.4,444.6 L495.7,445.9 L496.2,449.7 L495.0,450.0 L491.2,446.6 L487.6,448.0 L486.3,447.7 L483.9,449.4 L482.3,448.9 L479.1,449.9 L478.2,450.7 L474.8,448.3 L476.5,447.0 L478.0,443.8 L482.2,441.6 L481.8,439.3 L480.0,437.7 L478.2,438.0 L476.2,439.3 L474.1,439.1 L472.9,439.7 L472.7,437.3 Z">
			  <desc xmlns="http://www.highcharts.com/svg/namespace">
			    <labelrank>2</labelrank>
			    <hasc>CN.JX</hasc>
			    <alt-name>Ji?ngx?</alt-name>
			    <woe-id>12577993</woe-id>
			    <subregion>Central</subregion>
			    <fips>CH03</fips>
			    <postal-code>JX</postal-code>
			    <name>Jiangxi</name>
			    <country>China</country>
			    <type-en>Province</type-en>
			    <region>East China</region>
			    <longitude>116.017</longitude>
			    <woe-name>Jiangxi</woe-name>
			    <latitude>27.6397</latitude>
			    <woe-label>Jiangxi, CN, China</woe-label>
			    <type>Sh?ng</type>
			    <hc-middle-x>0.36</hc-middle-x>
			    <hc-middle-y>0.48</hc-middle-y>
			    <hc-key>cn-jx</hc-key>
			    <hc-a2>JX</hc-a2>
			  </desc>
			</path>
			</g>
			</svg>
		</div>
			</div>
		</div>
		<div id="articles" class="content-slider">
			<div class="_2-col-grid" id='article-grid'>
                <c:forEach items="${nList}" var="note">
                    <div class='figure'>
                        <div class="figure-inner">
                            <div class="figure-image" style="background: url(${note.cover}) center;	background-size: cover;"></div>
                            <div class="figure-text" onclick="location.href='/note/nid/${note.noteId}'" data-noteId=${note.noteId}>
                                <span style="font-size: 12px;"><fmt:formatDate value="${note.createTime}" pattern="yyyy年MM月dd日"/></span>
                                <h1 style="font-size: 20px;margin-top: 3px;">${note.title}</h1>
                            </div>
                        </div>
                    </div>
                </c:forEach>
			</div>
		</div>
		<div id="notes" class="content-slider" style='display: none;'>
            <c:forEach items="${dList}" var="daily">
                <div class="note">
                    <h3><span><fmt:formatDate value="${daily.createTime}" pattern="yyyy年MM月dd日"/></span></h3>
                    <p>${daily.content}</p>
                </div>
            </c:forEach>
		</div>
		<div class='see-more' id='see-more'>
			<a>查看更多</a>
		</div>
	</div>
</div>
</body>
</html>
<script src='/js/jQuery.js'></script>
<script src="/js/jQuery.form.js"></script>
<script>
	var userId="${user.userId}";
	var notePage=2;
	var dailyPage=2;
	var requestURL=null;


	var seeMore=$("#see-more");
	var articles=document.getElementById('articles');
	var notes=document.getElementById('notes');
	var footprints=document.getElementById('footprints');
	function show(str){
		if('articles'==str){
			articles.style.display='block';
			notes.style.display='none';
			footprints.style.display='none';
			document.getElementById('tab1').className='active';
			document.getElementById('tab2').className='';
			document.getElementById('tab3').className='';
			seeMore.show();
		}else if('notes'==str){
			articles.style.display='none';
			notes.style.display='block';
			footprints.style.display='none';
			document.getElementById('tab1').className='';
			document.getElementById('tab2').className='active';
			document.getElementById('tab3').className='';
			seeMore.show();
		}else{
			articles.style.display='none';
			notes.style.display='none';
			footprints.style.display='block';
			document.getElementById('tab1').className='';
			document.getElementById('tab2').className='';
			document.getElementById('tab3').className='active';
			seeMore.hide();
		}
	}

	document.getElementById('addArticle').onclick=function(){
		location.href='/note/insert';
	};



	seeMore.click(function(){
		var ind=null;
		var sliders=document.getElementsByClassName('content-slider');
		for(var sls=0;sls<sliders.length;sls++) {
			if (sliders[sls].style.display != 'none') {
				ind = sliders[sls].id;
			}
		}
		console.log(ind);
		if(ind=="articles"){
			$.ajax({
				url: '/note/uid/'+userId+'/p/'+notePage,
				type: 'GET',
				success: function(resp){
					var obj=resp;
					if(obj.message=='SUCCESS'){
						var datas=obj.data;
						notePage++;
						for (var d = 0; d < datas.length; d++) {
							var time1=new Date(datas[d].createTime).format("yyyy年MM月dd日");
							var newArticle = '<div class="figure">'+
												'<div class="figure-inner">'+
													'<div class="figure-image" style="background:url(' + datas[d].cover + ') center;background-size: cover;"></div>'+
													'<div class="figure-text" onclick="location.href=\'/note/nid/\' + datas[d].noteId">'+
														'<span style="font-size: 12px;">' + time1 + '</span>\
														<h1 style="font-size: 20px;margin-top: 3px;">' + datas[d].title + '</h1>\
													</div>\
												</div>\
											</div>';
							document.getElementById('article-grid').innerHTML += newArticle;
						}
					}else{
						console.log(obj.error);
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		}else{
			$.ajax({
				url: '/daily/uid/'+userId+'/p/'+dailyPage,
				type: 'GET',
				success: function(resp){
					var obj=resp;
					if(obj.message=='SUCCESS'){
						var datas=obj.data;
						dailyPage++;
						for (var d = 0; d < datas.length; d++) {
							var time2=new Date(datas[d].createTime).format("yyyy年MM月dd日");
							var newNote = '<div class="note">\
											<h3><span>' + time2 + '</span></h3>\
											<p>' + datas[d].content + '</p>\
										</div>';
							document.getElementById('notes').innerHTML += newNote;
						}
					}else{
						console.log(obj.error);
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	});


</script>
<script>
	Date.prototype.format=function(format){
		var o = {
			"M+" : this.getMonth()+1, //month
			"d+" : this.getDate(), //day
			"h+" : this.getHours(), //hour
			"m+" : this.getMinutes(), //minute
			"s+" : this.getSeconds(), //second
			"q+" : Math.floor((this.getMonth()+3)/3), //quarter
			"S" : this.getMilliseconds() //millisecond
		}

		if(/(y+)/.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
		}

		for(var k in o) {
			if(new RegExp("("+ k +")").test(format)) {
				format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
			}
		}
		return format;
	};
	//map对象
	var map={
		//初始化省份边界颜色以及填充色
		initProvince:function(){
			var paths=[];
			var s = [];
			<% List list = (List)request.getAttribute("lList");
               for(int i = 0;i<list.size();i++){
                   String obj = (String)list.get(i);
            %>
			s.push("<%=obj%>");
			<%
               }
            %>
			paths=$("path");
			for(var p=0;p<paths.length;p++){
				var thisPro=paths.eq(p);
				for(var i=0;i<s.length;i++){
					if(thisPro.attr('data-name')==s[i]){
						thisPro.attr('data-pic',s[i]);
						thisPro.attr('fill','#17b4bb');
						break;
					}
				}
				thisPro.attr('stroke','#333');
			}
		},
		//为有图片的省份绑定点击事件
		provinceBind:function(){
			var paths=[];
			paths=$("path");
			for(var p=0;p<paths.length;p++){
				var thisPro=paths.eq(p);
				if(thisPro.attr('data-pic')!=""){
					thisPro.click(function(event) {
						var mapCover=$(".map-cover").eq(0);
						mapCover.css({display:'block'});
						mapCover.attr('class','map-cover _fade-in');
						mapCover.children('p').eq(0).text($(this).attr('data-name'));
						var requestURL=null;
						requestURL='/note/uid/'+userId+'/l/'+$(this).attr('data-name');
						console.log(requestURL);
						var ajaxFetchImagesViaProvince= $.ajax({
							url: requestURL,
							type: 'GET',
							success: function(resp){
								if(resp.message=="SUCCESS"){
									$("#map-cover-img-wrapper").html('');
									console.log(resp.data);
									var datas=resp.data;
									var newMapCoverImage="";
									for(var ds=0;ds<datas.length;ds++){
										newMapCoverImage+='<div class="map-cover-img"\
											style="background:url('+datas[ds]+') center; background-size: cover;position: relative;">\
										</div>';
									}
									console.log(newMapCoverImage);
									$("#map-cover-img-wrapper").append(newMapCoverImage);
								}
							},
							error: function(err){
								console.log(err);
							}
						});
					});
				}
			}
			var mapCover=$(".map-cover").eq(0);
			var closeMapCover=$("#close-map-cover");
			closeMapCover.click(function(){
				mapCover.attr('class','map-cover _fade-out-m');
				setTimeout(function(){
					mapCover.css({display:'none'});
				},350);
			});
		}
	};
	map.initProvince();
	map.provinceBind();
	//添加心情对话框
	var modalAdd={
		modal:$("#modal"),
		modalBg:$("#modal-bg"),
		modalTextarea:$("#modal").children().eq(0),
		appendNewDailyForm:$("#append_new_daily"),
		submitDailyBtn:$("#submit-note"),
		eventBind:function(){
			var self=this;
			var addNote=$("#addNote");
			addNote.click(function() {
				self.modalIn();
				$("#tab2").click();
			});
			self.modalBg.click(function() {
				self.modalOut();
			});
			self.modalTextarea.focus(function(event){
				var sendBtn=$(this).next();
				sendBtn.css({display:'block'});
				sendBtn.attr('class','_fade-in');
			});
			self.submitDailyBtn.click(function(){
				$("#new_daily_source").val(self.modalTextarea.val());
				//self.appendNewDailyForm.submit();
				var ajaxAppendDaily= $.ajax({
					url: '/daily/insert',
					type: 'POST',
					data: self.appendNewDailyForm.serialize(),
					success: function(resp){
						console.log(resp);
						self.modal.attr('class','modal _modal-out');
						self.modalBg.attr('class','modal-bg _fade-out');
						setTimeout(function(){
							self.modal.css({display:'none'});
							self.modalBg.css({display:'none'});
						},300);
						//追加新的心情
						var cur = new Date();
						var time=cur.format("yyyy年MM月dd日");
						var newNote='<div class="note">\
                                        <h3><span>'+time+'</span></h3>\
                                        <p>'+self.modal.children().eq(0).val()+'</p>\
                                    </div>';
						var notes=$("#notes");
						var html=notes.html();
						html=newNote + "" + html;
						notes.html(html);
						self.modal.children().eq(0).val("");
					},
					error:function(err){
						console.log(err);
					}
				});
			});
		},
		modalIn:function(){
			var self=this;
			self.modal.css({display:'block'});
			self.modalBg.css({display:'block'});
			self.modal.attr('class','modal _modal-in');
			self.modalBg.attr('class','modal-bg _fade-in');
		},
		modalOut:function(){
			var self=this;
			self.modal.attr('class','modal _modal-out');
			self.modalBg.attr('class','modal-bg _fade-out');
			setTimeout(function(){
				self.modal.css({display:'none'});
				self.modalBg.css({display:'none'});
			},300);
		}
	};
	modalAdd.eventBind();
	//修改头像、昵称和个性签名
	var changeAvatarNickSign={
		avatarEdit: $('#avatar-edit'),
		avatarInput: $('#avatar-input'),
		nicknameEdit: $("#edit"),
		nickConfirm: $('#confirm'),
		nickInput: $('#fake_nickname_input'),
		nickname: $("#nickname"),
		signEdit: $("#edit-s"),
		signConfirm: $('#confirm-s'),
		signInput: $('#sign-input'),
		sign: $(".signature-wrapper").eq(0),
		eventBind: function(){
			var self=this;
			//因为avatar-input是avatar-edit的一部分为avatar-edit绑定click事件会导致一直触发click事件而导致溢出 所以为p标签绑定事件
			self.avatarEdit.children().eq(0).click(function(){
				self.avatarInput.click();
			});
			self.nicknameEdit.click(function(){
				$(this).attr('class','edit-icon _up1');
				self.nickConfirm.attr('class','confirm-icon _up2');
				self.nickInput.css({display:'block'});
				self.nickInput.val(self.nickname.children().eq(0).text());
				self.nickInput.focus();
			});
			self.nickInput.blur(function(){
				self.nickConfirm.click();
			});
			self.signEdit.click(function(){
				$(this).attr('class','edit-icon-s _up1');
				self.signConfirm.attr('class','confirm-icon-s _up2');
				self.signInput.css({display:'block'});
				self.signInput.val(self.sign.children().eq(0).text());
				self.signInput.focus();
			});
			self.signInput.blur(function(){
				self.signConfirm.click();
			});
		},
		eventHandler: function(){
			var self=this;
			//修改头像start
			self.avatarInput.on('change',function(){
				console.log('change avatar');
				//修改头像
				$(this).parent().submit();
			});
			self.avatarInput.parent().on('submit',function(e){
				e.preventDefault();
				var serializeData=$(this).serialize();
				$(this).ajaxSubmit({
					type: 'POST',
					url: '/user/updateAvatar',
					dataType: 'json',
					data: serializeData,
					contentType: false,
					cache: false,
					processData: false,
					success: function(resp){
						if(resp.message=='SUCCESS'){
							$(".avatar").eq(0).children('img').attr('src',resp.data);
						}
					},
					error: function(err){
						console.log(err);
					}
				});
			});
			//修改头像end

			self.nickInput.on('input',function(){
				self.nickname.children().eq(0).text(self.nickInput.val());
				if($(this).val().length==0){
					alert('用户名不能为空');
				}
			});
			self.nickConfirm.click(function(){
				$("#nickname-input").val(self.nickInput.val())
				//ajax修改昵称
				var nicknameAjax=$.ajax({
					url: '/user/updateName',
					type: 'POST',
					data: $("#uploadNewNickname").serialize(),
					success: function(resp){
						console.log(resp);
						self.nickname.children().eq(0).text(resp.data);
					},
					error:function(err){
						console.log(err);
					}
				});
				//成功修改之后的处理
				$(this).attr('class','confirm-icon _down2');
				self.nicknameEdit.attr('class','edit-icon _down1');
				self.nickInput.css({display:'none'});
				self.nickname.children().eq(0).text(self.nickInput.val());
			});
			self.signInput.on('input',function(){
				self.sign.children().eq(0).text(self.signInput.val());
			});
			self.signConfirm.click(function(){
				//ajax修改签名
				var signatureAjax=$.ajax({
					url: '/user/updateSign',
					type: 'POST',
					data: $("#uploadNewSign").serialize(),
					success: function(resp){
						console.log(resp);
						self.sign.children().eq(0).text(resp.data);
					},
					error:function(err){
						console.log(err);
					}
				});
				//成功修改之后的处理
				$(this).attr('class','confirm-icon-s _down2');
				self.signEdit.attr('class','edit-icon-s _down1');
				self.signInput.css({display:'none'});
				self.sign.children().eq(0).text(self.signInput.val());
			});
		}
	};
	changeAvatarNickSign.eventBind();
	changeAvatarNickSign.eventHandler();
</script>