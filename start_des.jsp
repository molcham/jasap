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
        cursor: pointer;
        text-align:center; /* 글자 가운데 정렬 */
        top:330px;
        left:265px;
        width:254px; /* 버튼의 가로 크기 */
        height:20px;
        line-height:20px;
        font-size:23px; /* 글자 크기 */
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
     text-align:center; /* 글자 가운데 정렬 */
     cursor: pointer;
     position:absolute;
     top:330px;
     left:655px;
     width:272px; /* 버튼의 가로 크기 */
     height:44px;
     line-height:23px;
     font-size:23px; /* 글자 크기 */
     font-weight:bold; /* 글자 굵기 */
    
     }
  .image-button:hover {
       
        transform:scale(1.1,1.1);
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
        position: absolute; 
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 700px;  /* 모달 창의 크기 조정 */
        height: 700px;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        background-image: url("gi1.png");  /* 초기 이미지 */
        background-size: cover;
        background-repeat: no-repeat;
    }

    .modal-nav-button {
        position: absolute;
        bottom: 10px;
        right: 10px;
        background-color: #fff;
        border: 2px solid #55B6FF;
        border-radius: 20px;
        color: black;
        padding: 10px 20px;
        cursor: pointer;
    }

    .modal-nav-button:hover {
        background-color: #55B6FF;
        color: #fff;
    }
    
     .image-button {
            background: transparent;
            border: none;
            cursor: pointer;
        }
 
</style>
</head>
<body>

<button class="image-button" style="position: absolute; top:110px; left:10px;" onclick="handleButton1()">
        <img src="homebutton.png" alt="Button 1">
    </button>

    <button class="image-button" style="position: absolute; top:96px; left:1044px;" onclick="handleButton2()">
        <img src="rankbutton.png" alt="Button 2">
 </button>
 <a href="maze.jsp" class="button gamestart-button"><strong>게임 시작</strong></a>
 <button class="button gamedes-button" onclick="showModal()" ><strong>게임 설명</strong></button>
 
 
  <!-- 게임 설명을 나타내는 모달 창 -->
    <div id="gameDescriptionModal" class="modal">
    <div class="modal-content">
        <!-- 버튼 추가 -->
        <button class="modal-nav-button" id="nextButton" onclick="nextImage()">다음</button>
    </div>
    </div>
     <script>
        function handleButton1() {
            window.location.href = "start.jsp";
        }

        function handleButton2() {
            // 버튼 2 클릭 동작 처리
            // ...
        }
     </script>
 
  <script>
        function showModal() {
            var modal = document.getElementById("gameDescriptionModal");
            modal.style.display = "block";
        }

        var currentImageIndex = 1;
        var images = ["gi1.png", "gi2.png", "gi3.png", "gi4.png", "gi5.png"];

        function showModal() {
            var modal = document.getElementById("gameDescriptionModal");
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById("gameDescriptionModal");
            modal.style.display = "none";
        }

        function nextImage() {
            currentImageIndex++;
            if (currentImageIndex > images.length) {
                currentImageIndex = 1;
            }

            var modalContent = document.querySelector(".modal-content");
            modalContent.style.backgroundImage = 'url("' + images[currentImageIndex - 1] + '")';

            // 마지막 이미지일 경우 버튼 변경
            if (currentImageIndex === 5) {
                document.getElementById("nextButton").innerHTML = "게임 시작";
                document.getElementById("nextButton").setAttribute("onclick", "location.href='maze.jsp'");
            } else {
                document.getElementById("nextButton").innerHTML = "다음";
                document.getElementById("nextButton").setAttribute("onclick", "nextImage()");
            }
        }
    </script>

</body>
</html>
