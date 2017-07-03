<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>article</title>
	<link rel="stylesheet" type="text/css" href="/css/scrollbar.css">
	<style type="text/css">
		* {
			padding: 0;
			margin: 0;
			color: #333;
		}
		html {
			background: #333;
		}
		body {
			background: #fff;
		}
		*::selection {
			background: #17b4bb;
			color: #fff;
		}
		.a-header {
			position: relative;
			width: 100%;
			height: 280px;
		}
		.a-header-cover {
			position: absolute;
			box-sizing: border-box;
			top: 0;
			left: 0;
			bottom: 0;
			right: 0;
			background: rgba(0,0,0,.4);
			padding: 24px calc(50% - 400px);
		}
		.a-header-back {
			line-height: 36px;
			font-size: 20px;
			float: left;
			cursor: pointer;
		}
		.a-header-back img {
			width: 36px;
			height: 36px;
			vertical-align: middle;
		}
		.a-header-back span {
			color: #fff;
		}
		.a-header-title {
			position: absolute;
			bottom: 24px;
			left: calc(50% - 400px);
			right: 24px;
			
		}
		.a-header-title p {
			color: #fff;
			line-height: 60px;
			font-size: 42px;
		}

		.main {
			position: relative;
			margin: 0 auto;
			margin-top: 24px;
			width: 800px;
			max-width: 800px;
			overflow: hidden;
			padding-bottom: 12px;
			background: #fff;
		}
		@media(max-width: 848px){
			.main {
				width: calc(100% - 48px);
				position: relative;
				margin-left: 24px;
			}
			.a-header-back {
				margin-left: 24px;
			}
			.a-header-title {
				left: 24px;
			}
		}
		#article {
			border-bottom: 1px solid #ccc;
		}
		#article p {
			font-size: 18px;
			line-height: 24px;
			margin: 0 0 24px 0;
		}
		
		#article img {
			display: block;
			margin: 24px 0;
			width: 100%;
		}
		.comment {
			width: 100%;
			margin: 24px 0;
			border-bottom: 1px solid #ccc; 
			padding-bottom: 18px;
		}
		.comment a {
			text-decoration: none;
		}
		.comment img {
			width: 42px;
			height: 42px;
			display: inline-block;
			vertical-align: middle;
			border-radius: 50%;
		}
		.comment span {
			display: inline-block;
			line-height: 42px;
			height: 42px;
			font-size: 20px;
			margin-left: 12px;
		}
		.comment p {
			margin-top: 12px;
			font-size: 16px;
			line-height: 24px;
		}
		.comment time {
			margin-left: 12px;
			color: #777;
		}
		#add-comment {
			margin-top: 24px;
			width: 100%;
			position: relative;
			height: 120px;
			box-sizing: border-box;
		}
		#add-comment textarea {
			padding: 12px;
			font-size: 18px;
			font-family: inherit;
			resize: none;
			display: block;
			box-sizing: border-box;
			position: absolute;
			left: 0;
			width: 100%;
			height: calc(100%);
			right: 0;
			outline: none;
			border: 2px solid #17b4bb;
			border-radius: 6px;
		}
		#add-comment textarea:focus {
			/*focus difference*/
		}
		#add-comment span {
			position: absolute;
			right: 12px;
			bottom: 12px;
			padding: 6px 18px;
			background: #17b4bb;
			color: #fff;
			font-size: 16px;
			line-height: 20px;
			border-radius: 6px;
			cursor: pointer;
			display: none;
			transition: background .3s;
		}
		#add-comment span:hover {
			background: #199;
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

		._run-in {
			animation: __run-in 1s;
		}
		@keyframes __run-in {
			from {
				transform: translate(100%,0);
			}
			to {
				transform: translate(0,0);
			}
		}

		/*zzz*/
		._1 {
			position: fixed;
			width: 100%;
			height: 100%;
			overflow: hidden;
			transform: scale(.5,.5);
			animation: __1 .3s;
			cursor: pointer;
		}
		@keyframes __1 {
			from {
				transform: scale(1,1);
			}
			to {
				transform: scale(.5,.5);
			}
		}
		._2 {
			position: fixed;
			width: 100%;
			height: 100%;
			transform: scale(1,1);
			animation: __2 .3s;
		}
		@keyframes __2 {
			from {
				transform: scale(.5,.5);
			}
			to {
				transform: scale(1,1);
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
		.author-info-wrapper {
			position: absolute;
			right: 67px;
			bottom: 24px;
			color: #fff;
			height: 48px;
			overflow: hidden;
		}
		.author-info-wrapper img {
			width: 48px;
			height: 48px;
			border-radius: 50%;
			display: inline-block;
			float: left;
		}
		.author-info-wrapper span {
			height: 48px;
			display: inline-block;
			float: left;
			line-height: 48px;
			font-size: 22px;
			color: #fff;
			margin-left: 12px;
		}
	</style>
</head>
<body>
<div style="color: #fff;font-size: 20px;position: fixed;top: 0;left: 0;width: 60px;z-index: 20;cursor: pointer;" id="!">&nbsp;</div>
<div style="position: fixed;top: 0;width: 100%;height: 100%;left: 0;overflow-y: scroll;background: #fff;" id='?'>
	<header class="a-header" style="background: url(${note.cover}) center;background-size: cover;">
		<div class="a-header-cover" onclick="history.go(-1)">
			<div class="a-header-back">
				<img src="/img/back.svg">
				<span>返回</span>
			</div>
		</div>
		<div class="a-header-title">
			<p>${note.title}</p>
		</div>
		<div class='author-info-wrapper'>
			<img src="${note.user.avatar}">
			<span>${note.user.nickname}</span>
		</div>
	</header>
	<div class="main">
		<div id='article'>
			${note.content}
		</div>
		<div id="add-comment">
			<textarea id="comment-area" placeholder="添加评论"></textarea>
			<span id="release-comment">发布评论</span>
			<form id="upload_new_comment" name="upload_new_comment" style="display: none;">
				<input type="text" name="content" id="new_comment_source">
				<input type="text" name="id" id="id" >
				<input type="text" name="noteId" id="noteId" value="${note.noteId}">
			</form>
		</div>
		<div id="comments">
			<c:forEach items="${cList}" var="comment">
				<div class="comment">
					<a href="/user/${comment.user.userId}">
						<img src=${comment.user.avatar}>
						<span>${comment.user.nickname}</span>
					</a>
					<time><fmt:formatDate value="${comment.createTime}" pattern="yyyy年MM月dd日 HH:mm" timeZone="GMT+8"/></time>
					<p>${comment.content}</p>
				</div>
			</c:forEach>

			<c:if test="${fn:length(cList) == 12}">
				<div style='' class='see-more' id='more-comments'>
					<a id='see-more'>查看更多</a>
				</div>
			</c:if>
		</div>
		
	</div>
</div>

</body>
</html>
<script src="/js/jQuery.js"></script>
<script src="/js/jQuery.form.js"></script>
<script type="text/javascript">
	var userId="${sessionScope.user.userId}";
	var avatar="${sessionScope.user.avatar}";
	var nickname="${sessionScope.user.nickname}";

	var addCommentArea = document.getElementById('comment-area');

	addCommentArea.onfocus=function(){
		document.getElementById("release-comment").style.display='block';
		document.getElementById("release-comment").className="_fade-in";
	};
	addCommentArea.onblur=function(){
		var thisArea=this;
		document.getElementById("release-comment").className="_fade-out";
		setTimeout(function(){
			document.getElementById("release-comment").style.display='none';
		},300);
	};

	document.getElementById('release-comment').onclick=function(){
		var fullValue=this.previousElementSibling.value;
		var values=[];
		var newCommentText="";
		var newComment=null;
		values=fullValue.split('\n');
		for(var v=0;v<values.length;v++){
			values[v]=values[v]?'<p>' + values[v] + '</p>':"";
			newCommentText+=values[v];
		}
		var cur = new Date();
        var time=cur.format("yyyy年MM月dd日 hh:mm");
		document.getElementById('new_comment_source').value=newCommentText;
		console.log(randomStr('C',11));
		document.getElementById('id').value=randomStr('C',11);
        var serializeData=$("#upload_new_comment").serialize();
        var ajaxUploadComment= $.ajax({
            url: '/comment/insert',
            method: 'POST',
            data: serializeData,
            success: function(resp){
                console.log(resp);
				newComment='<div class="comment ">\
						<a href="/user/uid/'+userId+'">\
							<img src="'+avatar+'">\
							<span>'+nickname+'</span>\
						</a>\
						<time>'+ time +'</time>'
						+ newCommentText +'</div>';
                var con = document.getElementById('comments').innerHTML;
                document.getElementById('comments').innerHTML=newComment+con;
                this.previousElementSibling.value="";
                this.className="_fade-out";
            },
            error: function(err) {
                console.log(err);
            }
        });
	};
	document.getElementById('!').onclick=function(){
		if(document.body.className=='_1'){
			document.body.className='_2';
			document.getElementById('?').style.overflowY='scroll';
		}
		else {
			document.body.className='_1';
			document.getElementById('?').style.overflow='hidden';
		}
	};

	function randomStr(flag,len) {
		var total='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		var temp,ret=flag;
		for(var i=0;i<len;i++){
			temp = Math.random() * total.length;
			temp = Math.floor(temp);
			ret += total.charAt(temp);
		}
		return ret;
	}

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

	function getUrlVars() {
		var vars = {};
		var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&#]*)/gi,
			function(m,key,value) {
				vars[key] = value;
			}
		);
		return vars;
	}
	document.getElementsByClassName('a-header-cover')[0].children[0].href=getUrlVars()['from']+'.html';

	//ajax载入评论


	var page=2;
	var noteId="${note.noteId}";
	var seeMore=$("#more-comments");
	seeMore.click(function(){
		if(page<0){

		}else{
			var seeMoreAjax=$.ajax({
				url: '/comment/nid/'+noteId+'/p/'+page,
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
						for(var i=0;i<datas.length;i++){
							var time=new Date(datas[i].createTime).format("yyyy年MM月dd日 hh:mm");
							var newComment="<div class='comment'>\
											<a href='/user/uid/'"+datas[i].user.userId+">\
												<img src='"+datas[i].user.avatar+"'>\
												<span>"+datas[i].user.nickname+"</span>\
											</a>\
											<time>"+time+"</time>\
											<p>"+datas[i].content+"</p>\
										</div>";
							document.getElementById('comments').innerHTML+=newComment;
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