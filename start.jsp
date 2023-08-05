<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈송이의 빛나는 여행:태양을 피해라_시작화면</title>
<!-- CSS 스타일링 -->
<style>
    /* 화면 스타일링 */
    /* 기본 스타일 */
    body {
        background-image: url("first.png");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        width: 1200px;
        height: 800px;
        /* 추가적인 스타일 요소들 */
    }

    /* 버튼 컨테이너 스타일 */
    .button-container {
        position:absolute; /* 버튼 컨테이너에 상대적인 위치 적용 */
        top:410px; /* y 좌표: 400px */
    }

    /* 버튼 스타일 */
    .button {
        position:absolute;
        width: 250px; /* 버튼의 가로 크기 */
        height:40px; /* 버튼의 세로 크기 */
        background-color: #fff; /* 버튼 배경색: 흰색 */
        color: #337ab7; /* 글자색: 하늘색 */
        text-decoration: none;
        border-radius: 20px; /* 버튼 모서리 둥글기 */
        border-color:#A9E2F3;
        border:solid;
        cursor: pointer;
        text-align:center; /* 글자 가운데 정렬 */
        line-height:40px;
        font-size:23px; /* 글자 크기 */
        font-weight:bold; /* 글자 굵기 */
        
    }

    /* 로그인 버튼 위치 */
    .login-button {
   
    left:450px; /* x 좌표: 500px */
    }

    /* 회원가입 버튼 위치 */
    .signup-button {
    left:830px; /* x 좌표: 700px */
    }
    
     /* 버튼에 마우스 오버 시 배경색 변화 */
    .button:hover {
        background-color:#55B6FF; /* 마우스 오버 시 버튼 배경색: 하늘색 */
        color:#fff; /* 마우스 오버 시 글자색: 흰색 */
        transform:scale(1.1,1.1);
    }
</style>

</head>
<body>
    <div class="button-container">
        <a href="login.jsp" class="button login-button">로그인</a>
        <a href="register.jsp" class="button signup-button">회원가입</a>
    </div>
</body>
</html>
