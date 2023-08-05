<%@page import="java.awt.Image"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마지막 화면</title>
	<script type="text/javascript">
		function retry() {
			window.location.href = "maze.jsp"; /* 버튼 작동 확인을 위해 임의로 작성. 게임 화면 주소 수정 예정 */
		}
		function finish() {
			window.location.href = "start.jsp"; /* 버튼 작동 확인을 위해 임의로 작성. 메인 화면 주소 수정 예정 */
		}
	</script>
	<style type="text/css">   
		@font-face {
			font-family: 'yg-jalnan';
    		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    		font-weight: normal;
    		font-style: normal;
		}     
		body {
			background-image:url('마지막화면.png');
			font-family: 'yg-jalnan';
			letter-spacing: 3px; /* 글씨 간격 조정 */
			font-weight: lighter;
		}
		audio {
			/* display: none; */
		}
		.box {
			font-weight: bold;
			color: white;
			border: 1px solid white;
			background-color: rgba(47, 85, 151, 0.7);
            padding: 7px 15px 7px 15px;
            border-radius: 5px;
            position: absolute; /* 절대 위치 지정 */
		}
		.bigbox {
            width: 600px;
            height: 240px;
            background-color: #CCE3E8;
            border-radius: 30px;
            position: absolute; /* 절대 위치 지정 */
            top: 24%;
            left: 25.5%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        .circle {
        	position: absolute;
			top: 21%;
			left: 27%;
            width: 263px;
            height: 263px;
            border-radius: 50%;
            background-color: white;
            opacity: 0.3;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
		#number {
			font-size:20px;
            top: 17%;
            left: 47%; 
		}
		#home {
			position: absolute;
			top: 26%;
			left: 23.5%;
		}
		#textbox{
			position: absolute;
			top: 30%;
			left: 56%;
		}
		.text {
			font-family: 'yg-jalnan';
			position: absolute;
			top: 35%;
			left: 53%;
			font-size: 30px;
            letter-spacing: 2px; /* 글씨 간격을 2px로 조정 */
          	color: rgba(255,255,255, 1);
            text-shadow:
            	2px 2px 4px rgba(0, 0, 0, 0.3), /* 그림자 효과 */
                1px 1px 0 #777777, /* 검정색 테두리 효과 */
                -1px -1px 0 #777777, 
                1px -1px 0 #777777, 
                -1px 1px 0 #777777; 
            }
		button {
			font-family: 'yg-jalnan';
			font: bold 20px black;
			color: black;
			background-color: transparent;
            border-radius: 20px;
            padding: 7px 15px 7px 15px;
            position: absolute; /* 절대 위치 지정 */
            bottom: 23%;
		}
		button:hover { /* 마우스 올렸을 때 */
            background-color: white; /* 배경색을 흰색으로 변경 */
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2); /* 오른쪽과 아래로 그림자 추가 */
            transform: scale(1.1); /* 버튼 크기 확대 */
        }
        .newbox{
        	font-weight: bold;
			color: white;
			border: 1px solid white;
			background-color: rgba(47, 85, 151, 0.7);
            padding: 7px 15px 7px 15px;
            border-radius: 5px;
        }
        #rank{
        	font-size:20px;
        	position: absolute; /* 절대 위치 지정 */
            bottom: 36%;
            left: 35%;
        }
		#retry {
            left: 32%;
		}
		#finish {
            left: 61%;
		}
	</style>
</head>
<body>
	<!-- <audio autoplay loop controls="false">
        <source src="끝배경음악.mp3" type="audio/mpeg">
    </audio> -->
	<span class="box" id=number><%= request.getAttribute("눈의 개수") %>개</span>
	<div class="circle"></div>
    
     <!-- <img id=textbox src="말풍.png" alt="눈송이와 집" style="width:300px; height: 200px"> -->
	<% 
	String img = ""; 
	String text = "";
	
	int num = 7; /*사진 확인을 위해 임의로 설정. (int)request.getAttribute("눈의 개수")로 수정 예정  */
	
	if (num >= 0 && num <=2 ) {
        img = "눈송집1.png"; %>
        <span class=text>으악.. 다시 도전해요!</span> <% 
    } else if (num >= 3 && num <= 5) {
    	img = "눈송집2.png"; %>
    	<span class=text>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오! 이것은..<br>집도 아니고..&nbsp;뭐지!?</span> <%
    } else if (num >= 6 && num <= 8) {
    	img = "눈송집3.png"; %>
    	<span class=text>좋아!! 아늑한 집이 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;완성되었다!</span> <%
    } else if (num >=9 && num <= 10){
    	img = "눈송집4.png";%>
    	<span class=text>우왕! 다시 돌아온 <br>포근한 눈 왕국!!💙</span> <%
    } else
    	out.println("잘못된 숫자입니다."); /* 없어도 됨 */
    %>
	
    <%-- 이미지 출력 --%>
    <img id=home src="<%= img %>" alt="눈송이와 집" style="width:380px; height: 250px">
       
    <div id="rank"><span class="newbox"><%= request.getAttribute("아이디") %>님</span> 의 순위는 <span class="newbox" style="left: 56%;"><%= request.getAttribute("랭킹") %>위</span> 입니다.</div>
    <button id="retry" onclick="retry()">다시 시작</button>
    <button id="finish" onclick="finish()">끝내기</button>  <!-- 종료하기 -->
    
</body>
</html>