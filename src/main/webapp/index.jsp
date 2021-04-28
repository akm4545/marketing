<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        
        .nav{
        	height:3rem;
        	width:100%;
        	display:inline-block;
            background-color: white;
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
    </style>
</head>
<body>
    <div class="nav">
        <h1>상권정보</h1>
        <ul class="menu">
            <li>홍보 및 설명</li>
            <li>사용자 가이드</li>
            <li>로그인</li>
        </ul>
    </div>
    <div class="content">
    	<div class="search">
    		<div>
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
    		<input type="text" name="" placeholder="동단위로 검색하세요."/>
    		<input type="button" value="검색" />
    	</div>
    	<div>
    		<h4>간단분석</h4>
    		<div>
    			<strong>업종을 선택하세요.</strong>
    			<a href="">업종 선택</a>
    			<div>
    				<ul>
    					<li>
    						<input type="radio" name="" id="icon_list1">
    						<label for="icon_list1">숙박-음식</label>
    					</li>
    					<li>
    						<input type="radio" name="" id="icon_list2">
    						<label for="icon_list2">수리-개인서비스</label>
    					</li>
    					<li>
    						<input type="radio" name="" id="icon_list3">
    						<label for="icon_list3">도-소매</label>
    					</li>
    					<li>
    						<input type="radio" name="" id="icon_list4">
    						<label for="icon_list4">예술-스포츠-여가</label>
    					</li>
    					<li>
    						<input type="radio" name="" id="icon_list5">
    						<label for="icon_list5">교육</label>
    					</li>
    					<li>
    						<input type="radio" name="" id="icon_list6">
    						<label for="icon_list6">시설관리-임대</label>
    					</li>
    					<li>
    						<input type="radio" name="" id="icon_list7">
    						<label for="icon_list7">부동산</label>
    					</li>
    					<li>
    						<input type="radio" name="" id="icon_list8">
    						<label for="icon_list8">과학-기술</label>
    					</li>
    				</ul>
    			</div>
    			<strong>지도에서 위치를 선택하세요.</strong>
    			<div>위치 선택</div>
    			<input type="button" value="분석하기"/>
    		</div>
    	</div>
    	<div>상권현황</div>
    	<div>상권분석</div>
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