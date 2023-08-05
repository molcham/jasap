<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈송이의 빛나는 여행:태양을 피해라_로그인</title>
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
        top:250px;
        left:540px;
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
        font-size: 16px;
        cursor: pointer;
        text-align:center; /* 글자 가운데 정렬 */
        top:430px;
        left:480px;
        width:254px; /* 버튼의 가로 크기 */
        height:20px;
        line-height:20px;
        font-size:20px; /* 글자 크기 */
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
     font-size: 16px;
     text-align:center; /* 글자 가운데 정렬 */
     cursor: pointer;
     position:absolute;
     top:430px;
     left:804px;
     width:254px; /* 버튼의 가로 크기 */
     height:20px;
     line-height:20px;
     font-size:20px; /* 글자 크기 */
     font-weight:bold; /* 글자 굵기 */
    }
    </style>
    </head>
    <body>
      <div class="login-form">
       <form action="loginProcess.jsp" method="post">
          <label for="studentID"><strong>학번:</strong>&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="studentID" name="studentID" class="loginform-input" required>
       
        </form>
       
      </div>
        <a href="start.jsp" class="button back-button2">화면 돌아가기</a>
        <a href="start_des.jsp" class="button login-button">로그인</a>
        
        
        
      
    </body>
    
