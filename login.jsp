<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈송이의 빛나는 여행:태양을 피해라_로그인</title>
<!-- jQuery CDN을 사용하기 위한 스크립트 태그 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--화면 스타일링 -->
<style>
    /* 화면 스타일링 */
    /* 기본 스타일 */
    
    strong{
      color:#fff;    
    }
    body {
        background-image: url("login.png");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        width: 1200px;
        height: 800px;
        /* 추가적인 스타일 요소들 */
    } 
    .button:hover {
        background-color:#55B6FF; /* 마우스 오버 시 버튼 배경색: 하늘색 */
        color:#fff; /* 마우스 오버 시 글자색: 흰색 */
        transform:scale(1.1,1.1);
    }   
    
    /* 회원가입 폼 스타일 */
    .login-form{
        width:400px; /* 폼의 가로 크기 */
        height:55px;
        padding:30px;
        background-color:#55B6FF; /* 폼 배경색: 흰색 */
        border-radius: 10px; /* 폼 모서리 둥글게 */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        display: flex;
        flex-direction: column;
        align-items: center;
        position:absolute;
        top:260px;
        left:370px;
        border: 2px solid #fff; /* 테두리 선 스타일 */
    }  
    
     /* 입력 필드 스타일 */
    .loginform-input{
        width:270px;
        padding:15px;
        margin-bottom:40px;
        border: 1px solid #ccc; /* 테두리 선 스타일 */
        border-radius: 5px;
        font-size: 16px;
        
    }
    
    .login-button{
        position:absolute;
        padding: 10px;
        background-color: #fff; /* 버튼 배경색: 흰색 */
        color: #337ab7; /* 글자색: 하늘색 */
        border: none;
        border-radius:20px;
        border-color:#A9E2F3; 
        border:solid;
        
        cursor: pointer;
        text-align:center; /* 글자 가운데 정렬 */
        top:420px;
        left:280px;
        width:264px; /* 버튼의 가로 크기 */
        height:44px;
        line-height:23px;
        font-size:22px; /* 글자 크기 */
        font-weight:bold; /* 글자 굵기 */
    }
    
    .back-button2{
     padding: 10px;
     background-color: #fff; /* 버튼 배경색: 흰색 */
     color: #337ab7; /* 글자색: 하늘색 */
     border: none;
     border-radius:20px;
     border-color:#A9E2F3;
     border:solid;
     
     text-align:center; /* 글자 가운데 정렬 */
     cursor: pointer;
     position:absolute;
     top:420px;
     left:650px;
     width:254px; /* 버튼의 가로 크기 */
     height:20px;
     line-height:22px;
     font-size:22px; /* 글자 크기 */
     font-weight:bold; /* 글자 굵기 */
    }
    </style>
    </head>
    <body>
    <div class="login-form">
        <!-- 폼에서 submit 이벤트 발생 시, JavaScript 함수를 호출하도록 변경 -->
        <form id="loginForm" onsubmit="submitForm(); return false;" method="post">
            <label for="studentID"><strong>학번:</strong>&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="studentID" name="studentID" class="loginform-input" required>
        </form>
    </div>
    <!-- 화면 돌아가기 버튼 -->
    <a href="start.jsp" class="button back-button2">화면 돌아가기</a>
    <!-- 수동으로 폼 제출하는 버튼 -->
    <button type="button" class="button login-button" onclick="submitForm()">로그인</button>
   
    <!-- 스크립트 함수 정의 -->
    <script>
        function submitForm() {
            // 폼을 가져와서 수동으로 submit
            var form = document.getElementById("loginForm");

            // 폼 데이터를 서버로 전송
            var formData = new FormData(form);
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "loginProcess.jsp", true);
            xhr.send(formData);

            // 이후 처리를 원하면 여기에 추가
            window.location.href = "start_des.jsp";
        }
    </script>
</body>
</html>
    
