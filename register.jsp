<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈송이의 빛나는 여행:태양을 피해라_회원가입</title>
<style>
    /* 화면 스타일링 */
    /* 기본 스타일 */
    strong{
      color:#fff;    
    }
    body {
        background-image: url("register.png");
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
    .signup-form {
        width:400px; /* 폼의 가로 크기 */
        height:146px;
        padding:30px;
        background-color:#55B6FF; /* 폼 배경색: 흰색 */
        border-radius: 10px; /* 폼 모서리 둥글게 */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        display: flex;
        flex-direction: column;
        align-items: center;
        position:absolute;
        top:214px;
        left:540px;
        border: 2px solid #fff;
    }

    /* 입력 필드 스타일 */
    .form-input {
        width:270px;
        padding:15px;
        margin-bottom:40px;
        border: 1px solid #ccc; /* 테두리 선 스타일 */
        border-radius: 5px;
        font-size: 16px;
        
    }

    /* 제출 버튼 스타일 */
    .submit-button {
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
        top:470px;
        left:480px;
        width:254px; /* 버튼의 가로 크기 */
        height:42px;
        line-height:19px;
        font-size:19px; /* 글자 크기 */
        font-weight:bold; /* 글자 굵기 */
        
        
    }
    
    /* 화면 돌아가기 버튼 스타일 */
    .back-button {
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
     top:470px;
     left:774px;
     width:244px; /* 버튼의 가로 크기 */
     height:18px;
     line-height:19px;
     font-size:19px; /* 글자 크기 */
     font-weight:bold; /* 글자 굵기 */
    }
</style>
</head>
<body>
    <div class="signup-form">
        
        <form action="registerProcess.jsp" method="post">
            <label for="studentID"><strong>학번:</strong></strong>&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="studentID" name="studentID" class="form-input" required>
            <br>
            <label for="nickname"><strong>닉네임:</strong>&nbsp;</label>
            <input type="text" id="nickname" name="nickname" class="form-input" required>
            </form>
    </div>
           
        
        <input type="submit" value="회원등록" class="button submit-button">
        <!-- 화면 돌아가기 버튼 -->
        <a href="start.jsp" class="button back-button">화면 돌아가기</a>
    
</body>
</html>