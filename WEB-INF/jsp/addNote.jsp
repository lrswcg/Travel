<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>editor</title>
	<meta charset='utf-8'>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=e92kooPaukaGRChn9GSz3kpiOYcGrbKS"></script>
	<link rel="stylesheet" type="text/css" href="/css/scrollbar.css">
	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
			color: #333;
		}
		a {
			text-decoration: none;
			cursor: pointer;
		}
		#editor-header {
			width: 100%;
			height: 60px;
			line-height: 60px;
			box-sizing: border-box;
			padding: 0 24px;
			font-size: 24px;
		}
		#editor-header p {
			text-align: center;
		}
		#editor-header span {
			position: absolute;
			left: 24px;
			display: inline-block;
			line-height: 60px;
			font-size: 18px;
		}
		#editor-header img {
			width: 32px;
			height: 32px;
			vertical-align: middle;
		}
		.con {
			width: 800px;
			height: 500px;
			box-sizing: border-box;
			color: #333;
			padding: 12px;
			overflow-y: scroll;
			margin: 0 auto;
			outline: none;
		}
		.con img {
			display: block;
			width: 100%;
			margin: 12px 0;
		}
		#cover_image_preview img{
			width: 100%;
			margin: 12px 0;
		}
		.div-btn {
			padding: 6px 24px;
			margin-top: 12px;
			color: #fff;
			background: #17b4bb;
			width: 400px;
			box-sizing: border-box;
			text-align: center;
		}
		input[type='submit'] {
			width: 400px;
		}
		#images {
			display: none;
		}
		.con-header {
			position: relative;
			height: 48px;
			width: 800px;
			margin: 0 auto;
			box-shadow: 0 0 3px rgba(0,0,0,.4);
		}
		.con-header img {
			height: 32px;
			width: 32px;
			float: left;
			margin: 8px 12px;
		}
		.con-wrapper {
			border: 1px solid #17b4bb;
			border-radius: 6px;
			width: 800px;
			margin: 24px auto;
			box-sizing: border-box;
			overflow: hidden;
		}
		.upload-article {
			height: 48px;
			line-height: 48px;
			float: right;
			overflow: hidden;
		}
		.upload-article span {
			float: right;
			margin: 7.5px 12px 0 0;
			line-height: 33px;
			height: 33px;
			font-size: 16px;
			background: #17b3bb;
			color: #fff;
			padding: 0 16px;
			box-sizing: border-box;
			border-radius: 6px;
			cursor: pointer;
			transition: background .3s;
		}
		.upload-article span:hover {
			background: #199;
		}
		input {
			outline: none;
			border: none;
			display: block;
			width: 100%;
			height: 48px;
			line-height: 48px;
			font-size: 20px;
			box-sizing: border-box;
			padding: 6px 12px;
			border-radius: 6px;
			margin-bottom: 24px;
		}
		.con-footer {
			width: 100%;
			line-height: 48px;
			height: 48px;
			box-shadow: 0 0 3px rgba(0,0,0,.4);
			position: relative;
		}
		.con-footer span {
			float: right;
			margin: 7.5px 12px 0 0;
			line-height: 33px;
			height: 33px;
			font-size: 16px;
			background: #17b3bb;
			color: #fff;
			padding: 0 16px;
			box-sizing: border-box;
			border-radius: 6px;
			cursor: pointer;
			transition: background .3s;
		}
		.con-footer span:hover {
			background: #199;
		}
		.con-footer p {
			height: 48px;
			line-height: 48px;
			width: calc(100% - 216px);
			box-sizing: border-box;
			font-size: 20px;
			float: left;
			text-align: center;
		}
		.province-select {
			position: absolute;
			bottom: 60px;
			right: 120px;
			width: 264px;
			border-radius: 6px;
			background: #17b4bb;
			box-sizing: border-box;
			padding: 12px;
			overflow: hidden;
		}
		.province-select span {
			display: inline-block;
			width: 33.3%;
			line-height: 32px;
			height: 32px;
			font-size: 16px;
			text-align: center;
			color: #fff;
			margin: 0;
			float: left;
			padding: 0;
		}
	</style>
</head>
<body>
<div id='editor-header'>
	<a href="/user">
		<span><img src="/svg/back333.svg">&nbsp;返回</span>
	</a>
	<p>添加新的游记</p>
</div>
<div style='width:800px;margin:0 auto;'>
	<form  method='post' name='editForm' id="editForm">
		<input type='text' id="title" name="title" placeholder='标题' style="border: 1px solid #17b4bb;">
		<div style="display: none">
			<input type="text" id="noteId" name="noteId">
			<input type='text' id='text' name='content'>
			<input type="text" id="cover_image" name="cover">
			<input type="text" id="location" name="location">
			<input type='submit' id='submit-all'>
		</div>
	</form>
</div>
<div style="width: 800px;margin: 0 auto;">
    <p>封面预览：</p>
    <div id="cover_image_preview"></div>
</div>
<div class='con-wrapper'>
	<div class='con-header'>
		<a title='Insert picture' onclick='$("#upload_image_source").click();'><img src="/svg/upload.svg"><span></span></a>
		<div class='upload-article'>
			<span id='upload_note_all'>提交游记</span>
			<span id='upload-cover' onclick="$('#cover_image_source').click();">选择封面</span>
            <form action="/" method="POST" style="display: none;" name="upload_cover_image" id="upload_cover_image" enctype="multipart/form-data">
                <input type='file' id="cover_image_source" name="image">
				<input type="text" id="cover_image_noteId" name="noteId">
            </form>
		</div>
	</div>
	<div class="con" contenteditable='true' id="con"></div>
	<div class='con-footer'>
		<p id='positionProvice'></p>
		<span onclick="getPosition();">获取定位</span>
		<span id='select_province'>选择地点</span>
		<div class="province-select" id='province_select' style='display: none;'>
			<span>北京</span>
			<span>天津</span>
			<span>河北</span>
			<span>山西</span>
			<span>内蒙古</span>
			<span>辽宁</span>
			<span>吉林</span>
			<span>黑龙江</span>
			<span>上海</span>
			<span>江苏</span>
			<span>浙江</span>
			<span>安徽</span>
			<span>福建</span>
			<span>江西</span>
			<span>山东</span>
			<span>河南</span>
			<span>湖北</span>
			<span>湖南</span>
			<span>广东</span>
			<span>广西</span>
			<span>海南</span>
			<span>重庆</span>
			<span>四川</span>
			<span>贵州</span>
			<span>云南</span>
			<span>西藏</span>
			<span>陕西</span>
			<span>甘肃</span>
			<span>宁夏</span>
			<span>青海</span>
			<span>新疆</span>
			<span>台湾</span>
			<span>香港</span>
			<span>澳门</span>
		</div>
	</div>
</div>
<div style='display: none;'>
	<!-- 规范化文本内容 -->
	<div class="div-btn" id='btn1'>button</div>
	<!-- 插入图片演示 -->
	<div class="div-btn" id='btn2'>button2</div>
	<form id='ajax_upload_image' enctype="multipart/form-data">
		<input type="file" name="image" id='upload_image_source'>
		<input type="text" name="noteId" id="upload_image_noteId">
	</form>
	<div id="preview"></div>
</div>

<div style="width:520px;height:340px;border:1px solid gray;display:none;" id="container"></div>
<div style="margin:10px 0;display:none;">
<input type="text" style="width:300px;margin-right:10px;" id="searchValue" />
<input type="button" value="搜索" onclick="search()" />
</div>
<div id="result">
<p id="demo"></p>
</div>
</body>
</html>
<script>

</script>
<script>
//百度地图api
function getPosition(){
	var map = new BMap.Map("container");
    map.centerAndZoom(new BMap.Point(116.331398,39.897445), 11);
    var myGeo = new BMap.Geocoder();
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
            
            var pt = r.point;
            //alert(pt.lng+','+ pt.lat);
            myGeo.getLocation(pt, function(rs){
            	
            	var resultMap = rs.addressComponents;
            	console.log(resultMap.province);
            	document.getElementById('positionProvice').innerText="当前定位 "+resultMap.province.slice(0,-1);
                document.getElementById('location').value=resultMap.province.slice(0,-1);
            });
            //alert('您的位置：'+r.point.lng+','+r.point.lat);
        }
        else {
            alert('failed'+this.getStatus());
        }        
    },{enableHighAccuracy: true})
}
function search(){
    var myAddress = document.getElementById('searchValue').value;
    var myGeo = new BMap.Geocoder();
    myGeo.getPoint(myAddress, function(point){    
        //第一步getPoint是地址解析。
      	if (point) {
        map.centerAndZoom(point, 16);
        map.addOverlay(new BMap.Marker(point));
        //第二部getlocation()地址逆解析

        myGeo.getLocation(point, function(rs){ 
            var addComp = rs.addressComponents;
            //document.getElementById("test").innerHTML = addComp.province;
            alert('省份是：'+addComp.province);
        });
      }
    }, "中国");   //设置国家/城市(necessary)
}
</script>
<script src='/js/jQuery.js'></script>
<script src='/js/jQuery.form.js'></script>
<script>
	//用户id，由个人主页跳转链接时获得
	var userId=null;

	var editText=null;

	var noteId=randomStr('T',11);

	var provinceSelect=document.getElementById('province_select');
	var inputHandler = function(e) {
		if(e.target.id == "btn1") {
			var con = document.getElementsByClassName('con')[0];
			var conHTML = con.innerHTML;
			//解析输入文本，去除所有空行
			if(conHTML!=''){
				var HTMLsplit = conHTML.split('<div>');
				var firstP = HTMLsplit[0];
				firstP = '<p>' + firstP + '</p>';
				var n = 1;
				var newHtml=[];
				for(var i = 1;i < HTMLsplit.length; i++) {
					if(HTMLsplit[i]=='<br></div>' || HTMLsplit[i]==""){}
					else {
						newHtml[n] = HTMLsplit[i].substr(0,HTMLsplit[i].length-6);
						newHtml[n] = '<p>' + HTMLsplit[i] + '</p>';
						n=n+1;
					}
				}
				newHtml[0] = firstP;
				if(newHtml[0]=='<p></p>')newHtml.shift();
				document.getElementById('preview').innerHTML+=newHtml.join("");
				document.getElementById('text').value=document.getElementById('preview').innerHTML;
				var np=0;
				var imageInputs = document.getElementsByTagName('input');
				for(var is=0;is<imageInputs.length;is++) {
					if(imageInputs[is].type=='file' && imageInputs[is].value){
						np++;
					}
				}
				console.log((n-1)+" "+((n-1)<=1?'image':'images'));
			}
			document.getElementById('province_select').style.display='none';
		}else if(e.target.id=='btn2'){
			var newImg = document.createElement('img');
			newImg.src='img/editorTest.jpg';
			con = document.getElementsByClassName('con')[0];
			con.appendChild(newImg);
			provinceSelect.style.display='none';
		}else if(e.target.id=='select_province'){
			if(provinceSelect.style.display=='block'){
				provinceSelect.style.display='none';
			}else{
				provinceSelect.style.display='block';
			}
		}else if(e.target.id=='province_select'){

		}else{
			if(e.target.parentElement.id=='province_select'){
				document.getElementById('positionProvice').innerText="选择地点 "+(e.target.innerText);
				document.getElementById('location').value=(e.target.innerText);
				provinceSelect.style.display='none';
			}else if(e.target.id=='upload_note_all'){
				document.getElementById('btn1').click();
				document.getElementById('noteId').value=noteId;
				setTimeout(function(){
					if(document.getElementById('text').value=="" || document.getElementById('cover_image').value=="" || document.getElementById('location').value==""||document.getElementById('title')==""){
						alert('不可为空');
					}else{
						console.log('submit');
						document.getElementById('editForm').submit();
					}
				},10);
			}
			provinceSelect.style.display='none';
		}
	};
	document.body.onclick = inputHandler;
	//2017/06/30 更新ajax上传图片 废弃之前的逻辑
	$("#ajax_upload_image").on('submit',function(e){
		e.preventDefault();
		$("#upload_image_noteId").val(noteId);
		var serializeData=$(this).serialize();
		$(this).ajaxSubmit({
			type: 'POST',
			url: '/note/upload',
			dataType: 'json',
			data: serializeData,
			contentType: false,
            cache: false,
            processData: false,
            success: function(resp){
            	//创建新的img，src=resp，追加到输入框
				if (resp.message=='SUCCESS'){
					var newImage="<img src='"+resp.data+"'/>";
					$("#con").append(newImage);
				}
            },
            error: function(err){
            	console.log(err);
            }
		});
	});
    //封面图片上传
	$("#upload_image_source").on('change',function(){
		$(this).parent().submit();
	});
    $("#upload_cover_image").on('submit',function(e){
        e.preventDefault();
		$("#cover_image_noteId").val(noteId);
        var serializeData=$(this).serialize();
        $(this).ajaxSubmit({
            type: 'POST',
            url: '/note/cover',
            dataType: 'json',
            data: serializeData,
            contentType: false,
            cache: false,
            processData: false,
            success: function(resp){
                //创建新的img，src=resp，追加到封面预览
				if (resp.message=='SUCCESS'){
					var newImage="<img src='"+resp.data+"'/>";
					$("#cover_image_preview").html(newImage);
					$("#cover_image").val(resp.data);
				}
            },
            error: function(err){
                console.log(err);
            }
        });
    });
    $("#cover_image_source").on('change',function(){
        $(this).parent().submit();
    });

	function randomStr(flag,len) {
		var total='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		var temp;
		for(var i=0;i<len;i++){
			temp = Math.random() * total.length;
			temp = Math.floor(temp);
			flag += total.charAt(temp);
		}
		return flag;
	}
</script>