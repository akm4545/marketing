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
        
        .nav a{
        	display: block;
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
       		height: 3em;
        }
        
        strong {
        	display: block;
        }
        
        .map_wrap {
        	top: -40em;
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
        	width: 2.5em;
        	height: 2.5em;
        	border: 1px dashed black;
        	text-align: center;
        	border-radius: 0.5em;
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
        }
        
        .icon_word{
        	position: absolute;
        	display: block;
        	top:4em;
        }
        
        .promotion, .guide{
        	position: relative;
        }
        
        .promotion::before {
        	content:"";
        	position:inherit;
        	background-image: url(<c:url value='/images/tip/Group_481.svg'/>);
        	z-index: 800;
        }
        
        .promotion::after {
        	content:"";
        	background-color: #F83153;	
        	position: absolute;
        	left: 0;
        	border-radius: 1.4em;
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
        }
        
        .promotion::before, .promotion::after, .guide::before, .guide::after {
        	display: inline-block;
        	width: 2.3em;
        	height: 2.3em;
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
   			<div class="box_gray">위치 선택</div>
   			<input type="button" value="분석하기"/>
    	</div>
    	<!-- <div>상권현황</div>
    	<div>상권분석</div> -->
		<div class="map_wrap">
    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    		<!-- 지도타입 컨트롤 div 입니다 -->
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7de00601de043a9aec7c057e4dd0afe6"></script>
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
		
		let jusoBtn = document.getElementById("juso_btn");
		
		let jusoFuc = () => {
			let juso = document.getElementById("juso").value;
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(juso, placesSearchCB);
		}
		
		jusoBtn.addEventListener("click", jusoFuc);
    </script>
</body>
</html>