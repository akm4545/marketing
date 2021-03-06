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
        	left: 42%;
        	height: 4em;
        	border-radius: 2em;
        	color: white;
        	width: 33em;
        }
        
        .location span{
        	display:block;
        	color: white;
        	font-size: 2em;
        }
        
        #dongAvg{
        	display:none;
        	align-items: center;
        	justify-content: center;
        	position: absolute;
        	top:7em;
        	background-color: #EDF0F4;
        	z-index: 0;
        	left: 42%;
        	height: 4em;
        	border-radius: 2em;
        	color: white;
        	width: 35em;
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
        
        .upjongSearch li label:not(#upJongList li label){
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
        	z-index: 0;
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
        	/*z-index:2000; */
        }
        
        .btnNext{
        	right: 1.2em;
        }
        
        .btnPrev span{
        	width:100%;
        	height:100%;
        	display:block;
        	text-indent: -2000px;
        	background-image: url(<c:url value='/images/tip/search_slide_prev.svg'/>);
        	background-position:center center;
        	background-repeat: no-repeat; 
        }
        
        .btnNext span{
        	width:100%;
        	height:100%;
        	display:block;
	        text-indent: -2000px;
        	background-image: url(<c:url value='/images/tip/search_slide_next.svg'/>);
        	background-position:center center;
        	background-repeat: no-repeat;
        }
        
        #upJongList{
        	overflow: scroll;
        	height: auto;
        	padding: 1em;
        	max-height: 20em;
        }
        
        .loading_gif{
        	display: inline-block;
        	z-index: 0;
        	position: absolute;
        	top:30%;
        	left: 45%;
        }
        
        #jusoBtn{
        	cursor: pointer;
        }
        
        .report{
        	z-index: 800;
        	display: none;
        	background-color: white;
        	position: absolute;
        	top:9.5em;
        	font-size: 1.5em;
        	left: 28em;
        	height: auto;
        	padding: 1.5em;
        	border-radius: 1em;
        }
        
        .reportKeyword{
        	border: 1px solid black;
        	background: #FAFBFC;
        	display: inline-block;
        	padding: 1em; 
        	width: 93%;
        }
        
        .reportKeyword ul {
        	display:flex;
        	justify-content:space-around;
        	list-style: "▶";
        	list-style-position: inside;
        }
        
        .reportKeyword ul li::marker{
        	margin-left: 0.5em;
        }
        
        .avg{
        	margin: 1em 0;
        }
        
        .avgSpan{
        	font-size: 1.3em;
        	font-weight: 600;
        	border-bottom: 1px solid black;
        	margin-bottom: 1em;
        }
        
        .avgArrow{
        	display: flex;
        	justify-content:space-evenly;
        }
        
        .avgClose{
        	float: right;
        }
        
        .showReport{
        	display:none;
        	/* display: block; */
        	z-index: 800;
        	position: absolute;
        	background-color: white;
        	top:15em;
        	left: 42em;
        	border-radius: 1em;
        }
        
        .showReport img{
        	transform:rotate(180deg);
        }
        
		/* 카카오 api */
        .map_wrap {position:relative;overflow:hidden;width:100%;height:800px;}
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
			<a href="javascript:void(0)" class="close">
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
						<input type="radio" id="icon_list_big_6" value="U"/>
						<label for="icon_list_big_6">
							<span>시설관리·임대</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_7" value="L"/>
						<label for="icon_list_big_7">
							<span>부동산</span>
						</label>
					</li>
					<li>
						<input type="radio" id="icon_list_big_8" value="I"/>
						<label for="icon_list_big_8">
							<span>과학·기술</span>
						</label>
					</li>
				</ul>
			</div>
			<div class="upjongSearchText">
				<input type="text"/>
			</div>
			<div id="upJongList">
				
			</div>
		</div>
		<div class="footer">
			<input type="button" class="close" value="취소"/>
			<input type="button" class="keywordInput" value="확인" disabled/>
		</div>
	</div>
	<div class="loading_gif">
		<img src='<c:url value="/images/tip/Wedges.gif"/>'/>
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
            	<a href="<c:url value='/guideDownload'/>" class="guide">
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
				<input type="text" name="dong" id="juso" placeholder="동단위로 검색하세요."/>	
    		</div>
    		<div>
				<button type="button" id="jusoBtn"><i class="fas fa-search"></i></button>
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
   						<input type="radio" name="" id="icon_list1" value="Q">
   						<label for="icon_list1">
   							<i class="fas fa-utensils"></i>
   							<span class="icon_word">숙박·음식</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list2" value="F">
   						<label for="icon_list2">
   							<i class="fas fa-tools"></i>
   							<span class="icon_word">수리·개인서비스</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list3" value="C">
   						<label for="icon_list3">
   							<i class="fas fa-calculator"></i>
   							<span class="icon_word">도·소매</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list4" value="M">
   						<label for="icon_list4">
   							<i class="fas fa-table-tennis"></i>
   							<span class="icon_word">예술·스포츠·여가</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list5" value="R">
   						<label for="icon_list5">
   							<i class="fas fa-book-open"></i>
   							<span class="icon_word">교육</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list6" value="U">
   						<label for="icon_list6">
   							<i class="fas fa-building"></i>
   							<span class="icon_word">시설관리·임대</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list7" value="L">
   						<label for="icon_list7">
   							<i class="fas fa-laptop-house"></i>
   							<span class="icon_word">부동산</span>
   						</label>
   					</li>
   					<li>
   						<input type="radio" name="" id="icon_list8" value="I">
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
   			<%-- <input type="button" value="csv파일 DB입력" onclick="javascript:location.href='<c:url value="/csvToDB"/>'" style="display: none;"/> --%>
    	</div>
    	<div class="showReport">
    		<img src="<c:url value='/images/tip/color_arrow.svg'/>"/>
    	</div>
    	<div class="report">
    		<div>
    			<a href="javascript:void(0)" class="avgClose">
					<img src="<c:url value='/images/tip/icon_close_b.svg'/>"/>
				</a>
    		</div>
    		<div class="reportKeyword" id="reportKeyword">
    		</div>
    		<div class="avg">
    			<div class="avgSpan">
    				<i class="fas fa-money-bill"></i>
    				<span>월평균 추정매출은 </span> 
    				<span class="avgSales" style="color: red; font-size: 1.5em;"></span> 
    				<span> 만원 입니다.</span>
    			</div>
    			<div class="avgSpan avgArrow">
    				<div>
	    				<i class="fas fa-arrow-down"></i>
	    				<span>최저</span>    				
    				</div>
    				<div>
	    				<i class="fas fa-arrow-up"></i>
	    				<span>최고</span>    				
    				</div>
    			</div>
    			<div class="avgSpan avgArrow">
    				<div>
	    				<span class="minAmt" style="color: blue;"></span>    				
    				</div>
    				<div>
	    				<span class="maxAmt" style="color: red;"></span>    				
    				</div>
    			</div>
    		</div>
    		<div class="top">
    			<div class="avgSpan">
    				<i class="fas fa-balance-scale"></i>
    				<span class="si" style="color: red; font-size: 1.5em;"></span>
    				<span style="color: red; font-size: 1.5em;">주요 매출</span>
    				<span>정보입니다.</span>
    			</div>
    			<div class="topFive">
    			</div>
    		</div>
    	</div>
    	<a href="">
    		<img src="<c:url value='/images/tip/color_arrow.svg'/>"/>
    	</a>
    	<!-- <div>상권현황</div>
    	<div>상권분석</div> -->
		<div class="map_wrap">
    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    		<!-- 지도타입 컨트롤 div 입니다 -->
    		<div class="location">
    			<span id="centerAddr"></span>
    		</div>
    		<div id="dongAvg">
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
		
		let jusoBtn = document.getElementById("jusoBtn");
		
		let jusoFuc = () => {
			let juso = document.getElementById("juso").value;
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(juso, placesSearchCB);
		}
		
		document.getElementById("juso").addEventListener('keypress',function(e){
			if (e.key === 'Enter'){
				jusoFuc();
			}	
		});
		
		jusoBtn.addEventListener("click", jusoFuc);
		
		let marketing = document.getElementById("marketing_search");
		
		let loading = () => {
			document.querySelector(".modal_back").style.setProperty("z-index","1200");
			document.querySelector(".loading_gif").style.setProperty("z-index","1300");
		}
		
		let closeLoading = () => {
			document.querySelector(".modal_back").style.setProperty("z-index","0");
			document.querySelector(".loading_gif").style.setProperty("z-index","0");
		}
		
		let reportClose = () => {
			document.querySelector(".report").style.setProperty("display","none");
			document.querySelector(".showReport").style.setProperty("display","block");
		}
		
		let reportShow = () => {
			document.querySelector(".report").style.setProperty("display","block");
			document.querySelector(".showReport").style.setProperty("display","none");
		}
		
		let searchFuc = () => {
			let upJongKeyword = document.querySelector(".upjong_select").innerText;
			let upJongSmCode = document.querySelector(".upjong_select").dataset['keyword'];
			if(upJongKeyword !== "업종 선택"){
				loading();
				centerAddr = document.getElementById("centerAddr").innerText;
				$.ajax({
					url:"<c:url value='/search'/>",
					type:"post",
					dataType:"json",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:{
						key : centerAddr,
						code : upJongSmCode,
						upJongKey : upJongKeyword
					},
					success:function(data, textStatus){
						var positions = [];					

						setMarkers(map);
						markers = [];
						
						let storeListInDongJson = JSON.parse(data.storeListInDong);
						let dongAvg = JSON.parse(data.dongAvg);
						let topFive = JSON.parse(data.topFive);
												
						for(key in storeListInDongJson) {
						    positions.push({
						    	content: '<div>' + storeListInDongJson[key].bizesNm +'</div>'
						    			+ '<div>' + storeListInDongJson[key].lnoAdr +'</div>',
						    	latlng : new kakao.maps.LatLng(storeListInDongJson[key].lat, storeListInDongJson[key].lon) 
						    });
						}
						
						/* document.querySelector("#dongAvg").style.setProperty("display","flex");
						document.querySelector("#dongAvg").style.setProperty("z-index","800");
						let avgSpan = "<span style='display:block; color: black; font-size: 2em; font-weight:600;'>월평균 추정매출은 <span style='color:red;'> " + dongAvg.saleAmt + "</span> 만원 입니다.</span>"; 
						document.getElementById("dongAvg").innerHTML = avgSpan; */
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
						closeLoading();
						
						reportShow();
						
						let reportKeyword = "<ul>";
						reportKeyword += "<li>" + document.getElementById("centerAddr").innerText + "</li>";
						reportKeyword += "<li>" + document.querySelector(".upjong_select").innerText + "</li>";
						reportKeyword += "</ul>";
						
						document.querySelector(".reportKeyword").innerHTML = reportKeyword;
						document.querySelector(".avgSales").innerText = dongAvg.saleAmt;
						document.querySelector(".minAmt").innerText = dongAvg.minAmt + "만원";
						document.querySelector(".maxAmt").innerText = dongAvg.maxAmt + "만원";
						document.querySelector(".si").innerText = centerAddr.split(" ")[0];
						
						let row = 4;
						
						let avgTable = "<table style='border-spacing:5px 10px; border-collapse:collapse;'>";
						avgTable += "<tr style='font-weight:600;'>";
						avgTable += "<td style='padding:1em 1em; border-bottom:2px solid black;'>동</td>";
						avgTable += "<td style='padding:1em 1em; border-bottom:2px solid black;'>매출(만원)</td>";
						avgTable += "<td style='padding:1em 1em; border-bottom:2px solid black;'>업소수(개)</td>";
						avgTable += "<td style='padding:1em 1em; border-bottom:2px solid black;'>유동인구(명)</td>";
						avgTable += "</tr>";
						
						for(let j=0; j<topFive.length; j++){
							avgTable += "<tr>";
							avgTable += "<td style='color:#4568D5; border-bottom:1px solid #D2D5DA; padding:1em 0;'>" + topFive[j].megaNm + " " + topFive[j].ctyNm + " " + topFive[j].admiNm + "</td>";
							avgTable += "<td style='text-align:center; border-bottom:1px solid #D2D5DA; padding:1em 0;'>" + topFive[j].saleAmt + "</td>";
							avgTable += "<td style='text-align:center; border-bottom:1px solid #D2D5DA; padding:1em 0;'>" + topFive[j].storeCnt + "</td>";
							avgTable += "<td style='text-align:center; border-bottom:1px solid #D2D5DA; padding:1em 0;'>" + topFive[j].dayAvg + "</td>";
							avgTable += "</tr>";
						}
						
						avgTable += "</table>";
						document.querySelector(".topFive").innerHTML = avgTable;
						
						console.log(topFive);
					},
					error:function(data, textStatus, errorThrown){
						closeLoading();
						alert(textStatus);
						alert(errorThrown);
						alert("실패" + data);
					}
				});
			}else{
				alert("업종을 선택하세요.");
			}
		}
		
		marketing.addEventListener("click", searchFuc);
		
		let showModal = () => {
			document.querySelector(".upjongSearch").style.setProperty("z-index","1300");
			document.querySelector(".modal_back").style.setProperty("z-index","1200");
			document.querySelector(".btnNext").style.setProperty("z-index","2000");
			if(document.querySelector("#upJongList input[data-select='Y']") === null){
				document.querySelector(".keywordInput").style.setProperty("background-color","#D2D5DA");
				document.querySelector(".keywordInput").setAttribute("disabled",true);				
			}else{
				document.querySelector(".keywordInput").style.setProperty("background-color","#4668D6");
				document.querySelector(".keywordInput").removeAttribute("disabled");
			}
			
		};
		
		let upJongList = (upJongCode) => {
			document.querySelector(".keywordInput").style.setProperty("background-color","#D2D5DA");
			document.querySelector(".keywordInput").setAttribute("disabled",true);
			$.ajax({
				url:"<c:url value='/upJongCodeList'/>",
				dataType:"json",
				//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:{
					upJongCode : upJongCode
				},
				method:"get",
				success:function(data){
					let upJongHtml = "<ul style='display:block;'>";
					for(key in data){
						let jsonInnerArr = data[key];
						upJongHtml += "<li style='font-size:1.3em; font-weight:600; width:100%;'>" + key + "</li>";
						upJongHtml += "<li style='display:block; width:100%;'>";
						upJongHtml += "<div>";
						upJongHtml += "<ul style='display:block;'>";
						for(arrKey in jsonInnerArr){
							upJongHtml += "<li class='upJongCdLI' style='display:flex; justify-content:center; align-items:center; text-align:center; margin:0.5em 0.2em; height:2.6em; font-size:1.1em; border:1px solid #D4D8DB; width:calc((100% - 1px - (0.8em * 4)) / 5);'>";
							upJongHtml += "<input type='radio' id='" + JSON.stringify(jsonInnerArr[arrKey].indsSclsCd).replaceAll("\"","") + "' name='" + JSON.stringify(jsonInnerArr[arrKey].indsMclsCd).replaceAll("\"","") + "' value='" + JSON.stringify(jsonInnerArr[arrKey].indsSclsCd).replaceAll("\"","") + "' onclick='upJongListClick(this)'/>";
							upJongHtml += "<label for='" + JSON.stringify(jsonInnerArr[arrKey].indsSclsCd).replaceAll("\"","") + "' style='cursor:pointer;'>";
							upJongHtml += JSON.stringify(jsonInnerArr[arrKey].indsSclsNm).replaceAll("\"","");
							upJongHtml += "</label>";
							upJongHtml += "</li>";
						}
						upJongHtml += "</ul>";
						upJongHtml += "</div>";
						upJongHtml += "</li>";
						//alert(key);
						//alert(JSON.stringify(data[key]));
					}
					upJongHtml += "</ul>";
					document.getElementById("upJongList").innerHTML = upJongHtml;
				},
				error:function(data){
					console.log("에러가 발생했습니다.");
				}
			})
		};
		
		document.querySelectorAll(".box input[type=radio]").forEach(
			(icon) => {
				icon.addEventListener('click', function(e){
					showModal();
					upJongList(e.target.value);
				})
			}		
		);
		
		document.querySelector(".upjong_select").addEventListener('click', function(){
			showModal();
		});
		
		let closeModal = () =>{
			document.querySelector(".upjongSearch").style.removeProperty("z-index");
			document.querySelector(".modal_back").style.removeProperty("z-index");
			document.querySelector(".btnNext").style.setProperty("z-index","0");
			document.querySelector(".btnPrev").style.setProperty("z-index","0");
		}
		
		document.querySelectorAll(".close").forEach(
			(close) => {
				close.addEventListener('click', function(){
					closeModal();
				});	
			}		
		)
		
		let slideMenu = (direction) => {
			if(direction === "next"){
				document.querySelector(".btnPrev").style.setProperty("display","block");
				document.querySelector(".btnNext").style.setProperty("display","none");
				document.querySelector(".head ul").style.setProperty("left","-30em");
				document.querySelector(".btnNext").style.setProperty("z-index","0");
				document.querySelector(".btnPrev").style.setProperty("z-index","2000");
			}else{
				document.querySelector(".btnPrev").style.setProperty("display","none");
				document.querySelector(".btnNext").style.setProperty("display","block");
				document.querySelector(".head ul").style.setProperty("left","0em");
				document.querySelector(".btnNext").style.setProperty("z-index","2000");
				document.querySelector(".btnPrev").style.setProperty("z-index","0");
			}
		}
		
		document.querySelector(".btnNext").addEventListener('click',function(){
			slideMenu("next");
		});
		
		document.querySelector(".btnPrev").addEventListener('click',function(){
			slideMenu("prev");
		});
		
		let upJongListClick = (upJongObject) => {
			document.querySelectorAll(".upJongCdLI").forEach(
				(label) => {
					label.firstChild.dataset.select = "N";
					label.style.setProperty("background-color","white");
					label.style.setProperty("color","black");
				}	
			);
			document.querySelector("label[for=" + upJongObject.value + "]").previousSibling.dataset.select = "Y";
			document.querySelector("label[for=" + upJongObject.value + "]").parentNode.style.setProperty("background-color","#4668D6");
			document.querySelector("label[for=" + upJongObject.value + "]").parentNode.style.setProperty("color","white");
			document.querySelector(".keywordInput").style.setProperty("background-color","#4668D6");
			document.querySelector(".keywordInput").removeAttribute("disabled");
		}
		
		document.querySelectorAll(".head ul input[type=radio]").forEach(
				(upJongRadio) => {
					upJongRadio.addEventListener('click',function(evnet){
						upJongList(event.target.value);
					})
				}	
		);
		
		let keywordInput = () => {
			document.querySelector("#upJongList input[data-select='Y']").value;
			document.querySelector(".upjong_select").innerText = document.querySelector("#upJongList input[data-select='Y']").nextSibling.innerText;
			document.querySelector(".upjong_select").dataset.keyword = document.querySelector("#upJongList input[data-select='Y']").value;
			closeModal();
		}
		
		document.querySelector(".keywordInput").addEventListener("click", function(){
			keywordInput();
		});
		
		document.querySelector(".avgClose").addEventListener("click", function(){
			reportClose();
		});
		
		document.querySelector(".showReport").addEventListener("click",function(){
			reportShow();
		})
    </script>
</body>
</html>