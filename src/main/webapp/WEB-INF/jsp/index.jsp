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
			font-family:'Lato', 'Noto Sans KR', 'Noto Sans KR Local','Malgun Gothic','맑은 고딕','NotoSans','돋움',Dotum,Helvetica,Verdana,Arial,sans-serif;
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
        	display: flex !important;
        	align-items: center;
        	margin-top: 1em;
        }
        
        .menu li{
        	float: left;
        	padding-right: 20px; 
        }
        
        .menu span{
        	z-index: 800;
        }
        
        ul{
        	list-style: none;
        }
        
        h1{
        	display: inline-block;
        }
        
        .search {
        	padding:0em 0.5em;
        	position:absolute;
        	z-index:800;
        	display: flex;
        	align-items:center;
        	background-color: #4668D6;
        	border-radius: 3em;
        	height: 3.5em;
        	width: 26em;
        	margin: 20px;
        	color: white;
        	font-size: 1.4em;
        	margin-top: 30px;
        }
        
        li {
        	float: left;
        }
        
        .search input[type=text] {
        	vertical-align:-webkit-baseline-middle;
        	background-color: rgba(0,0,0,0.2);
        	color: white;
        	border: 0px;
        	height: 2.5em;
        	width: 13em;
        	margin-right: 1em;
        	padding-left: 1em;
        }
        
        input[type=radio] {
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
        	width: 9em;
        	height: 80%;
        	margin-right: 0.5em;
        }
        
        .search_radio li {
        	width: 4em;
        	text-align: center;
        	height: 2.5em;
        	display: flex;
		    justify-content: center;
		    align-items: center;
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
        	margin-bottom: 1em;
        }
        
        .box input[type=button] {
        	border-radius: 2em;
        	color:white;
        	width: 20em;
        	font-size: 1em;
        	border: 0px;
        	background-color: #D2D5DA;
        	height: 3.5em;
        	margin: 0 auto;
        	display: block;
        }
        
        .box h4{
        	font-size: 1.2em;
        	margin-bottom: 1em;
        }
        
        .box_gray {
       		background-color: #EDF0F4;
       		display: flex;
       		align-items: center;
       		height: 3em;
       		padding-left: 1.5em;
       		border-radius: 0.5em;
        }
        
        #marketing_search {
        	cursor: pointer;
        }
        
        strong {
        	display: block;
        }
        
        .map_wrap {
        	top: -48.5em;
        }
        
        .map_search {
        	position: absolute;
        	top:1em;
        	z-index: 800;
        	right: 15em;
        }
        
        .map_search input[type=text]{
        	padding: 0.5em;
        } 
        
        .icon ul li {
        	float: left;
        	margin: 1.5em 0.9em;
        }
        
        .icon i {
        	font-size:1.5em;
        	text-align: center;
        }
        
        .icon input[type=radio] {
        	position: absolute;
        	left:0;
        	top:0;
        	opacity: 0;
        }
        
        .icon label{
        	position: relative;
        	white-space: nowrap;
		    display: flex;
		    align-content: center;
		    justify-content: center;
		    align-items: flex-end;
		    border: 1px dashed black;
		    border-radius: 0.5em;
		    width: 3.8em;
        	height: 3.8em;
        	flex-wrap: wrap;
        	cursor: pointer;
        }
        
        .icon_word{
        	position: absolute;
        	display: block;
        	top:4em;
        }
        
        .promotion, .guide{
        	position: relative;
        	display: flex;
        	align-items: center;
        }
        
        .promotion::before {
        	content:"";
        	position:inherit;
        	background-image: url(<c:url value='/images/tip/Group_482.svg'/>);
        	z-index: 800;
        }
        
        .promotion::after {
        	content:"";
        	background-color: #F83153;	
        	position: absolute;
        	left: 0;
        	border-radius: 1.4em;
        	transition: width 0.2s ease;
        }
        
        .guide::before {
        	content:"";
        	position:inherit;
        	background-image: url(<c:url value='/images/tip/Group_481.svg'/>);
        	z-index: 800;
        }
        
        .guide::after {
        	content:"";
        	background-color: #FFB900;
        	position: absolute;
        	left: 0;
        	border-radius: 1.4em;
        	transition: width 0.2s ease;
        }
        
        .promotion::before, .promotion::after, .guide::before, .guide::after {
        	display: inline-block;
        	width: 2em;
        	height: 2em;
        }
        
        .promotion:hover span{
        	color:#fff;
        }
        
        .guide:hover span{
        	color:#fff;
        }
        
        .promotion:hover:after, .guide:hover:after{
        	width: 110%;
        } 
        
        a:link {
        	text-decoration: none;
        	color: black;
        }
        
        a:visited {
        	color: black; 
        }
        
        .selected_btn{
        	display:block;
        	width:65px;
        	height:30px;
        	float:right;
        	text-align:center;
        	line-height:30px;
        	cursor:pointer;
        	color:#fff;
        	background:#425470;
        	background:linear-gradient(#425470, #5b6d8a);
        }
        
        .location{
        	display:flex;
        	align-items: center;
        	justify-content: center;
        	position: absolute;
        	top:2em;
        	background-color: #000;
        	z-index: 700;
        	left: 45%;
        	height: 4em;
        	border-radius: 2em;
        	color: white;
        	width: 25em;
        }
        
        .location span{
        	display:block;
        	color: white;
        	font-size: 2em;
        }
        
        .upjongSearch{
        	font-size:1.5em;
        	color:black;
        	display:block;
        	position: absolute;
        	background-color: white;
        	left: 30%;
        	top: 10%;
        	width: 46em;
        	border-radius:1em;
        	/* z-index: 1300; */
        }
        
        .upjongSearch input[type=button]{
        	background-color:#D2D5DA;
        	font-size:1em;
        	font-weight:bold;
        	color:white;
        	width: 6em;
        	height: 3.5em;
        	border: 0px;
        	border-radius: 0.5em;
        	cursor: pointer;
        	margin: 0 0.5em;
        }
        
        .upjongSearch li {
        	margin-left: 0.5em;
        }
        
        .upjongSearch li label{
        	background-color: #F3F4F6;
        	display: block;
        	padding:1em;
        	border-radius: 2em;
        	cursor: pointer;
        }
        
        .upjongSearch > .head{
        	font-size: 1.2em;
        	display: flex;
        	justify-content:space-between;
        }
        
        .head{
        	overflow:hidden;
        	padding:1.5em;
        	display:block;
        	border-bottom: 1px solid #D4D8DB;
        }
        
        .midd{
        	display:block;
        	height: calc(100% - 6em - 14.1em);
        }
        
        .midd .head{
        	height: 2em;
        	display:flex;
        	align-items:center;
        }
        
        .midd ul {
        	display:-webkit-box;
        	position: relative;
        	transition:left 1s;
        	left: 0em;
        }
        
        .footer{
        	display:flex;
        	justify-content:center;
        	align-items:center;	
        	height:6em;
        }
        
        .modal_back{
        	position:fixed;
        	display:block;
        	background-color: black;
        	width: 98.9vw;
        	height: 100vh;
        	/* z-index: 1200; */
        	opacity: 0.8;
        }
        
        .upjongSearchText{
        	padding: 1.3em 0;
        	height:2em;
        	display: flex;
        	justify-content: center;
        	border-bottom: 1px solid #D4D8DB;
        }
        
        .upjongSearchText input[type=text]{
        	width: 18em;
        	height: 100%;
        	background-color:#FBFBFB;
        	border:none;
        	padding:0 2em 0 1em;
        	border-radius:0.3em;
        	border: 1px solid #D4D8DB;
        }
        
        .btnPrev, .btnNext{
        	width: 2em;
        	height: 2em;
        	border-radius: 1em;
        	background-color:#D2D5DA;
        	position: absolute;
        	z-index:2000;
        }
        
        .btnNext{
        	right: 1.2em;
        }
        
        .btnPrev span{
        	width:100%;
        	height:100%;
        	display:block;
        	text-indent: -1000px;
        	background-image: url(<c:url value='/images/tip/search_slide_prev.svg'/>);
        	background-position:center center;
        	background-repeat: no-repeat; 
        }
        
        .btnNext span{
        	width:100%;
        	height:100%;
        	display:block;
	        text-indent: -1000px;
        	background-image: url(<c:url value='/images/tip/search_slide_next.svg'/>);
        	background-position:center center;
        	background-repeat: no-repeat;
        }
        
		/* 카카오 api */
        .map_wrap {position:relative;overflow:hidden;width:100%;height:700px;}
		.radius_border{border:1px solid #919191;border-radius:5px;}     
		.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
		.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
		.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
		.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
		.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
		.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
		.custom_typecontrol .selected_btn:hover {color:#fff;}   
		.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
		.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
		.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
		.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/b494d45b9b.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="upjongSearch">
		<div class="head">
			<strong>업종을 선택하세요.</strong>
			<a href="javascript:void(0)">
				<img src="<c:url value='/images/tip/icon_close_b.svg'/>"/>
			</a>
		</div>
		<div class="midd">
			<div class="head">
				<a href="javascript:void(0)" class="btnPrev" style="display: none;">
					<span>이전</span>
				</a>
				<a href="javascript:void(0)" class="btnNext" style="display: block;">
					<span>다음</span>
				</a>
				<ul>
					<li>
						<input type="radio" id="icon_list_big_1" value="Q"/>
						<label for="icon_list_big_1">
							<span>숙박·음식</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_2" value="F"/>
						<label for="icon_list_big_2">
							<span>수리·개인서비스</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_3" value="C"/>
						<label for="icon_list_big_3">
							<span>도·소매</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_4" value="M"/>
						<label for="icon_list_big_4">
							<span>예술·스포츠·여가</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_5" value="R"/>
						<label for="icon_list_big_5">
							<span>교육</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_6" value="L"/>
						<label for="icon_list_big_6">
							<span>시설관리·임대</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_7" />
						<label for="icon_list_big_7">
							<span>부동산</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_8"/>
						<label for="icon_list_big_8">
							<span>과학·기술</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_1"/>
						<label for="icon_list_big_1">
							<span>숙박·음식</span>
						</label>
					</li>
				</ul>
			</div>
			<div class="upjongSearchText">
				<input type="text"/>
			</div>
			<div>
				<strong>BEST 분석업종</strong>
			</div>
		</div>
		<div class="footer">
			<input type="button" class="close" value="취소"/>
			<input type="button" value="확인"/>
		</div>
	</div>
	<div class="modal_back">
	</div>
    <div class="nav">
        <h1>
	    	<img src="<c:url value='/images/logo/logo.svg'/>">
	    	<img class="logo" src="<c:url value='/images/logo/logo2.svg'/>">
	    	<img class="logo" src="<c:url value='/images/logo/logo3.svg'/>">
        </h1>
        <ul class="menu">
            <li>
            	<a href="" class="promotion">
            		<span>홍보 및 설명</span>
            	</a>
            </li>
            <li>
            	<a href="" class="guide">
            		<span>사용자 가이드</span>
            	</a>
            </li>
            <li>로그인</li>
            <li><i class="fas fa-bars" style="font-size: 1.5em;"></i></li>
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
   			<a href="javascript:void(0)" class="box_gray upjong_select">업종 선택</a>
   			<div class="icon">
   				<ul>
   					<li>
   						<input type="radio" name="" id="icon_list1">
   						<label for="icon_list1">
   							<i class="fas fa-utensils"></i>
   							<span class="icon_word">숙박·음식</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list2">
   						<label for="icon_list2">
   							<i class="fas fa-tools"></i>
   							<span class="icon_word">수리·개인서비스</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list3">
   						<label for="icon_list3">
   							<i class="fas fa-calculator"></i>
   							<span class="icon_word">도·소매</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list4">
   						<label for="icon_list4">
   							<i class="fas fa-table-tennis"></i>
   							<span class="icon_word">예술·스포츠·여가</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list5">
   						<label for="icon_list5">
   							<i class="fas fa-book-open"></i>
   							<span class="icon_word">교육</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list6">
   						<label for="icon_list6">
   							<i class="fas fa-building"></i>
   							<span class="icon_word">시설관리·임대</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list7">
   						<label for="icon_list7">
   							<i class="fas fa-laptop-house"></i>
   							<span class="icon_word">부동산</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list8">
   						<label for="icon_list8">
   							<i class="fas fa-robot"></i>
   							<span class="icon_word">과학·기술</span>
   						</label>
   					</li>
   				</ul>
   			</div>
   			<strong>
   				<img src="<c:url value='/images/tip/tip_icon_2.svg'/>">
   				지도에서 위치를 선택하세요.
   			</strong>
   			<div class="box_gray" style="margin-bottom: 1em;">위치 선택</div>
   			<input type="button" id="marketing_search" value="분석하기"/>
   			<%-- <form action="<c:url value='/excelFileUpload'/>" method="post" enctype="multipart/form-data">
	   			<input type="file" id="" name="excelFile"/>
   				<button type="submit">업로드</button>
   			</form> --%>
   			<input type="button" value="csv파일 DB입력" onclick="javascript:location.href='<c:url value="/csvToDB"/>'" style="display: none;"/>
   			<!-- 새로고침시 실행되는 에러 해결 -->
    	</div>
    	<!-- <div>상권현황</div>
    	<div>상권분석</div> -->
		<div class="map_wrap">
    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    		<!-- 지도타입 컨트롤 div 입니다 -->
    		<div class="location">
    			<span id="centerAddr"></span>
    		</div>
    		<div class="map_search">
	    		<input type="text" id="juso" placeholder="주소로 검색하세요."/>
	    		<input type="button" class="selected_btn" id="juso_btn" value="검색"/>
    		</div>
    		<div class="custom_typecontrol radius_border">
        		<span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        		<span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
    		</div>
    		<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    		<div class="custom_zoomcontrol radius_border"> 
        		<span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        		<span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    		</div>
		</div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7de00601de043a9aec7c057e4dd0afe6&libraries=services"></script>
	<script>
		var infowindow = new kakao.maps.InfoWindow({zIndex:1}); // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(36.30389555611207, 127.33729130896266), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

		// 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
	    	});
		}
		
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
		
		// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
		function setMapType(maptype) { 
		    var roadmapControl = document.getElementById('btnRoadmap');
		    var skyviewControl = document.getElementById('btnSkyview'); 
		    if (maptype === 'roadmap') {
		        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
		        roadmapControl.className = 'selected_btn';
		        skyviewControl.className = 'btn';
		    } else {
		        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
		        skyviewControl.className = 'selected_btn';
		        roadmapControl.className = 'btn';
		    }
		}
		
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    }else{
		    	alert("검색 결과가 없습니다");
		    } 
		}		

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">법정동 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';

		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
	
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');

		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}

		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomIn() {
		    map.setLevel(map.getLevel() - 1);
		}

		// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomOut() {
		    map.setLevel(map.getLevel() + 1);
		}
		
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];
		
		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(null);
		    }            
		}
		
		let jusoBtn = document.getElementById("juso_btn");
		
		let jusoFuc = () => {
			let juso = document.getElementById("juso").value;
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(juso, placesSearchCB);
		}
		
		jusoBtn.addEventListener("click", jusoFuc);
		
		let marketing = document.getElementById("marketing_search");
		
		let searchFuc = () => {
			centerAddr = document.getElementById("centerAddr").innerText;
			$.ajax({
				url:"<c:url value='/search'/>",
				type:"post",
				dataType:"json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:{
					key : centerAddr
				},
				success:function(data, textStatus){
					var positions = [];					

					setMarkers(map);
					
					markers = [];
					
					for(key in data) {
					    //alert(data[key].bizesNm);
					    positions.push({
					    	content: '<div>' + data[key].bizesNm +'</div>'
					    			+ '<div>' + data[key].lnoAdr +'</div>',
					    	latlng : new kakao.maps.LatLng(data[key].lat, data[key].lon) 
					    });
					}
					
					//마커 배열 생성 예제
					//{
				    //    content: '<div>카카오</div>', 
				    //    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
				    //},
				    
					for (var i = 0; i < positions.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng // 마커의 위치
					    });
					    
					    markers.push(marker);

					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: positions[i].content // 인포윈도우에 표시할 내용
					    });

					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}

					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
					    return function() {
					        infowindow.open(map, marker);
					    };
					}

					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
					    return function() {
					        infowindow.close();
					    };
					}
					
				},
				error:function(data, textStatus, errorThrown){
					alert(textStatus);
					alert(errorThrown);
					alert("실패" + data);
				}
			});
		}
		
		marketing.addEventListener("click", searchFuc);
		
		let showModal = () => {
			document.querySelector(".upjongSearch").style.setProperty("z-index","1300");
			document.querySelector(".modal_back").style.setProperty("z-index","1200");
		};
		
		document.querySelectorAll(".box input[type=radio]").forEach(
			(icon) => {
				icon.addEventListener('click', function(){
					showModal();
				})
			}		
		);
		
		document.querySelector(".upjong_select").addEventListener('click', function(){
			showModal();
		});
		
		let closeModal = () =>{
			document.querySelector(".upjongSearch").style.removeProperty("z-index");
			document.querySelector(".modal_back").style.removeProperty("z-index");
		}
		
		document.querySelector(".close").addEventListener('click', function(){
			closeModal();
		});
		
		let slideMenu = (direction) => {
			if(direction === "next"){
				document.querySelector(".btnPrev").style.setProperty("display","block");
				document.querySelector(".btnNext").style.setProperty("display","none");
				document.querySelector(".head ul").style.setProperty("left","-30em");
			}else{
				document.querySelector(".btnPrev").style.setProperty("display","none");
				document.querySelector(".btnNext").style.setProperty("display","block");
				document.querySelector(".head ul").style.setProperty("left","0em");
			}
		}
		
		document.querySelector(".btnNext").addEventListener('click',function(){
			slideMenu("next");
		});
		
		document.querySelector(".btnPrev").addEventListener('click',function(){
			slideMenu("prev");
		});
		
		let upJongList = (upJongCode) => {
			$.ajax({
				url:"<c:url value='/upJongCodeList'/>",
				data:{
					upJongCode : upJongCode
				},
				method:"get",
				success:function(data){
					
				},
				error:function(data){
					
				}
			})
		};
		
		document.querySelectorAll(".head ul input[type=radio]").forEach(
				(upJongRadio) => {
					upJongRadio.addEventListener('click',function(evnet){
						upJongList(event.target.value);
					})
				}	
		);
    </script>
</body>
</html>