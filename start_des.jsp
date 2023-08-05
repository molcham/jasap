<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈송이의 빛나는 여행:태양을 피해라_게임설명</title>
<style>
 body {
        background-image:url("start_des.png");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        width: 1200px;
        height: 800px;
        /* 추가적인 스타일 요소들 */
    } 
    
    .gamestart-button{
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
        top:330px;
        left:450px;
        width:254px; /* 버튼의 가로 크기 */
        height:20px;
        line-height:20px;
        font-size:20px; /* 글자 크기 */
        font-weight:bold; /* 글자 굵기 */
    }
    
    .gamedes-button{
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
     top:330px;
     left:810px;
     width:272px; /* 버튼의 가로 크기 */
     height:44px;
     line-height:20px;
     font-size:20px; /* 글자 크기 */
     font-weight:bold; /* 글자 굵기 */
    
     }
    
    
  .button:hover {
        background-color:#55B6FF; /* 마우스 오버 시 버튼 배경색: 하늘색 */
        color:#fff; /* 마우스 오버 시 글자색: 흰색 */
        transform:scale(1.1,1.1);
    }
    
   /* 모달 스타일 */
    .modal {
        display: none; /* 모달 창 기본은 숨겨진 상태 */
        position: fixed; /* 모달 창을 페이지 상단에 고정 */
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* 배경은 반투명 */
    }

    .modal-content {
        position: absolute; /* 모달 내용의 위치를 조정하기 위해 절대 위치로 설정 */
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%); /* 모달 창을 수평, 수직으로 가운데 정렬 */
        background-color: #fff; /* 모달 내용의 배경색: 흰색 */
        padding: 20px;
        border-radius: 10px;
    }
     
 
</style>
</head>
<body>
 <a href="maze.jsp" class="button gamestart-button"><strong>게임 시작</strong></a>
 <button class="button gamedes-button" onclick="showModal()" ><strong>게임 설명</strong></button>
 
 
  <!-- 게임 설명을 나타내는 모달 창 -->
    <div id="gameDescriptionModal" class="modal">
        <div class="modal-content">
            <h1>게임 설명</h1>
            <p>1. 포근한 눈 왕국에 '눈송이'가 살았어요! 눈송이는 세상에서 가장 화려하고 아름다운 눈송이 집을 가지고 있었습니다.<br> 
2. 하지만 갑작스런 해변의 여름이 왕국을 덮쳤고, 눈송이의 소중한 집은 순식간에 녹아버렸습니다!<br> 
3. 눈송이는 새로운 집을 만들기 위해 여행을 시작해야 했습니다! 눈송이는 별빛처럼 빛나는 눈을 수집해야 합니다.<br>
4.  하지만, 그 길엔 눈을 뺏는 무시무시한 해들이 많답니다. 눈송이는 해를 피하며 눈을 수집해야 해요.<br>
5. 해를 만났을 때 눈이 없다면, 게임오버가 되니 눈을 잘 챙기셔야 해요<br>
6. 눈 한 개당 10포인트를 얻을 수 있습니다.<br>
    이제, 눈송이의 모험을 도와서 잃어버린 집을 되찾아 주세요!</p>
            <button onclick="closeModal()">닫기</button>
        </div>
    </div>
 
 
  <script>
        function showModal() {
            var modal = document.getElementById("gameDescriptionModal");
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById("gameDescriptionModal");
            modal.style.display = "none";
        }
    </script>

</body>
</html>