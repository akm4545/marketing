<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        
        html, body {
			width: 100%; height: 100%;
			font-size: 10px;
		}
		
		.content{
			height: 100%;
		}
        
        .nav{
        	height:5rem;
        	width:100%;
        	display:block;
            background-color: white;
            position: relative;
            font-size: 1.4em;
        }
        
        .nav h1{
        	margin-left: 1em;
        }
        
        .logo{
        	vertical-align: super;
        }
        
        .menu{
        	float: right;
        }
        
        .menu li{
        	float: left;
        	padding-right: 20px; 
        }
        
        ul{
        	list-style: none;
        }
        
        h1{
        	display: inline-block;
        }
        
        .search {
        	padding:0em 1em;
        	position:absolute;
        	z-index:800;
        	display: flex;
        	align-items:center;
        	background-color: #4668D6;
        	border-radius: 3em;
        	height: 3.5em;
        	width: 25.5em;
        	margin: 20px;
        	color: white;
        	font-size: 1.4em;
        	margin-top: 30px;
        }
        
        .search li {
        	float: left;
        }
        
        .search input[type=text] {
        	vertical-align:-webkit-baseline-middle;
        	background-color: rgba(0,0,0,0.2);
        	color: white;
        	border: 0px;
        	height: 2.5em;
        }
        
        .search input[type=radio] {
        	position: absolute;
        	left:0;
        	top:0;
        	opacity: 0;
        }
        
        .search input[type=text]::placeholder{
        	color: white;
        }
        
        .search button{
        	background-color: #4668D6;
        	border: 0px;
        	cursor: grap !important;
        }
        
        .search i {
        	font-size: 1.2em;
        	color: white;
        }
        
        .search_radio {
        	vertical-align:middle;
        	background-color: rgba(255,255,255,0.1);
        	display: inline-block;
        	border-radius: 2em;
        	width: 8em;
        	height: 70%;
        }
        
        .box {
        	padding: 1em 2em;
        	background-color: white;
        	display: inline-block;
        	position: relative;
        	z-index: 800;
        	width: 23em;
        	top:6.5em;
        	border-radius: 1em;
        	margin-left: 20px;
        	font-size: 1.4em;
        }
        
        .box strong {
        	clear: both;
        }
        
        .box input[type=button] {
        	border-radius: 2em;
        	width: 20em;
        	font-size: 0.8em;
        	border: 0px;
        	background-color: #EDF0F4;
        	height: 3em;
        }
        
        .box_gray {
       		background-color: #EDF0F4;
       		display: block;
       		height: 2em;
        }
        
        strong{
        	display: block;
        }
        
        #map{
        	top: -40em;
        }
        
        .icon ul li {
        	float: left;
        }
        
        .icon i {
        	font-size:1.5em;
        	width: 2.5em;
        	height: 2.5em;
        	border: 1px dashed black;
        	text-align: center;
        }
    </style>
    <script src="https://kit.fontawesome.com/b494d45b9b.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="nav">
        <h1>
	    	<img src="<c:url value='/images/logo/logo.svg'/>">
	    	<img class="logo" src="<c:url value='/images/logo/logo2.svg'/>">
	    	<img class="logo" src="<c:url value='/images/logo/logo3.svg'/>">
        </h1>
        <ul class="menu">
            <li>홍보 및 설명</li>
            <li>사용자 가이드</li>
            <li>로그인</li>
            <li><i class="fas fa-bars"></i></li>
        </ul>
    </div>
    <div class="content">
    	<div class="search">
    		<div class="search_radio">
    			<ul>
    				<li>
    					<input type="radio" name="" id="radio_search_1">
    					<label for="radio_search_1">지번</label>
    				</li>
    				<li>
    					<input type="radio" name="" id="radio_search_1">
    					<label for="radio_search_1">도로명</label>
    				</li>
    			</ul>
    		</div>
    		<div style="display:content !important;">
				<input type="text" name="dong" placeholder="동단위로 검색하세요."/>	
    		</div>
    		<div>
				<button type="button"><i class="fas fa-search"></i></button>
    		</div>
    	</div>
    	<div class="box">
    		<h4>
    			<img src="<c:url value='/images/tip/h4.svg'/>">
    			간단분석
    		</h4>
   			<strong>
   				<img src="<c:url value='/images/tip/tip_icon_1.svg'/>">
   				업종을 선택하세요.
   			</strong>
   			<a href="" class="box_gray">업종 선택</a>
   			<div class="icon">
   				<ul>
   					<li>
   						<input type="radio" name="" id="icon_list1">
   						<label for="icon_list1">
   							<i class="fas fa-utensils"></i>
   							숙박-음식
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list2">
   						<label for="icon_list2">
   							<i class="fas fa-tools"></i>
   							수리-개인서비스
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list3">
   						<label for="icon_list3">
   							<i class="fas fa-calculator"></i>도-소매
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list4">
   						<label for="icon_list4">
   							<i class="fas fa-table-tennis"></i>
   							예술-스포츠-여가
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list5">
   						<label for="icon_list5">
   							<i class="fas fa-book-open"></i>
   							교육
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list6">
   						<label for="icon_list6">
   							<i class="fas fa-building"></i>
   							시설관리-임대
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list7">
   						<label for="icon_list7">
   							<i class="fas fa-laptop-house"></i>부동산
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list8">
   						<label for="icon_list8">
   							<i class="fas fa-robot"></i>과학-기술
   						</label>
   					</li>
   				</ul>
   			</div>
   			<strong>
   				<img src="<c:url value='/images/tip/tip_icon_2.svg'/>">
   				지도에서 위치를 선택하세요.
   			</strong>
   			<div class="box_gray">위치 선택</div>
   			<input type="button" value="분석하기"/>
    	</div>
    	<!-- <div>상권현황</div>
    	<div>상권분석</div> -->
		<div id="map" style="width:100%;height:800px;"></div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7de00601de043a9aec7c057e4dd0afe6"></script>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    </script>
</body>
</html>