<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Maze Game</title>
<style>
    #game-board {
        position: relative;
        height: 800px;
        width: 1200px;
        border: 1px solid black;
        background-image: url("images/maze.png");
        background-repeat: no-repeat;
        background-size: cover;
    }
    .player {
        position: absolute;
        height: 70px;
        width: 55px;
        background-image: url("images/character.jpg");
        background-size: cover;
        left: 310px;
        top: 80px;
        z-index:1; /*캐릭터가 다른 아이템들보다 위에 표시되도록 값 조정(수가 높을수록 더 위에 표시됨)*/
    }
    .item_snow {
       position : absolute;
       height: 50px;
        width: 50px;
        background-image: url("images/snow.png");
        background-size: cover;
        z-index:0;
    }
    .item_sun {
       position : absolute;
       height: 55px;
        width: 55px;
        background-image: url("images/sun.png");
        background-size: cover;
        z-index:0;
    }
    .item_noteaten{
       position : absolute;
       height: 50px;
        width: 50px;
        background-image: url("images/empty_snow.jpg");
        background-size: cover;
        z-index:0;
    }
    .item_eaten{
       position : absolute;
       height: 50px;
        width: 50px;
        background-image: url("images/snow.png");
        background-size: cover;
        z-index:1;
    }
</style>
</head>
<body>
    <h1> </h1>
    <div id="game-board">
        <div id="player" class="player"></div>
        <!-- item_snow -->
        <div class="item_snow" id="snow1" style="left: 55px; top: 480px;"></div>
        <div class="item_snow" id="snow2" style="left: 290px; top: 360px;"></div>
        <div class="item_snow" id="snow3" style="left: 420px; top: 240px;"></div>
        <div class="item_snow" id="snow4" style="left: 450px; top: 710px;"></div>
        <div class="item_snow" id="snow5" style="left: 530px; top: 600px;"></div>
        <div class="item_snow" id="snow6" style="left: 640px; top: 200px;"></div>
        <div class="item_snow" id="snow7" style="left: 680px; top: 380px;"></div>
        <div class="item_snow" id="snow8" style="left: 850px; top: 265px;"></div>
        <div class="item_snow" id="snow9" style="left: 820px; top: 510px;"></div>
        <div class="item_snow" id="snow10" style="left: 900px; top: 710px;"></div>
        <!-- item_sun -->
        <div class="item_sun" id="sun1" style="left: 210px; top: 360px;"></div>
        <div class="item_sun" id="sun2" style="left: 260px; top: 480px;"></div>
        <div class="item_sun" id="sun3" style="left: 440px; top: 645px;"></div>
        <div class="item_sun" id="sun4" style="left: 615px; top: 360px;"></div>
        <div class="item_sun" id="sun5" style="left: 880px; top: 450px;"></div>
        <!-- item_noteaten -->
        <% 
        // noteatenCoords 배열을 생성하고 item_noteaten 요소들의 좌표를 배열에 추가합니다.
        String[] noteatenCoords = new String[10];
        for (int i = 0; i < 10; i++) {
            noteatenCoords[i] = "left: " + (140 + (i * 70)) + "px; top: 14px;";
        }
        %>
        <% for (String coord : noteatenCoords) { %>
            <div class="item_noteaten" style="<%= coord %>"></div>
        <% } %>
        
    </div>
    <script>
   // 캐릭터의 위치와 "눈" 요소들의 위치를 비교하여 눈이 사라지는 함수
    function checkSnowCollision(x, y) {
        let snowElements = document.getElementsByClassName('item_snow');
        let noteatenElements = document.querySelectorAll('.item_noteaten');
        let n = 0;

        for (let i = 0; i < snowElements.length; i++) {
            let snowElement = snowElements[i];

            // 캐릭터와 "눈" 사이의 거리를 계산합니다.
            let dx = x - parseInt(snowElement.style.left);
            let dy = y - parseInt(snowElement.style.top);
            let distance = Math.sqrt(dx * dx + dy * dy);

            // 거리가 특정 임계값 이내라면, 해당 "눈"을 DOM에서 제거합니다.
            if (distance <= 50) {
                snowElement.remove();
                n++;

                // "눈"이 사라질 때 해당 순서의 item_noteaten을 item_eaten으로 변경합니다.
                if (noteatenElements[n - 1]) {
                    noteatenElements[n - 1].classList.remove('item_noteaten');
                    noteatenElements[n - 1].classList.add('item_eaten');
                }
            }
        }
    }
   
    // 캐릭터의 위치와 "sun" 요소들의 위치를 비교하여 sun이 사라지는 함수
    function checkSunCollision(x, y) {
        let sunElements = document.getElementsByClassName('item_sun');
        let eatenElements = document.getElementsByClassName('item_eaten');

        for (let i = 0; i < sunElements.length; i++) {
            let sunElement = sunElements[i];

            // 캐릭터와 "sun" 사이의 거리를 계산합니다.
            let dx = x - parseInt(sunElement.style.left);
            let dy = y - parseInt(sunElement.style.top);
            let distance = Math.sqrt(dx * dx + dy * dy);

            // 거리가 특정 임계값 이내라면, 해당 "sun"을 DOM에서 제거합니다.
            if (distance <= 50) {
                sunElement.remove();

                // sun이 사라질 때 가장 마지막에 획득한 눈을 다시 empty_snow로 변경합니다.
                if (eatenElements.length > 0) {
                    let lastEatenElement = eatenElements[eatenElements.length - 1];
                    lastEatenElement.classList.remove('item_eaten');
                    lastEatenElement.classList.add('item_noteaten');
                }else {
                	alert('Finish!');
                }
            }
        }
    }
    
       let player = document.getElementById('player');
       let speed = 20;  // 이동 속도를 조절합니다.
       let finishPoint = { x: 1150, y: 700 };  // 도착지점
       let gameBoardSize = { width: 1200, height: 800 }; // 게임 보드의 크기
       let playerSize = { width: 70, height: 70 }; // 플레이어의 크기
        
     // 플레이어의 위치 변수
        let playerX = 313;
        let playerY = 80;

     // 방향키 입력 처리 함수
        function handleKeyPress(event) {
         let dx = 0;
          let dy = 0;
          
          if (event.keyCode === 37) dx = -10; // 왼쪽 화살표 키
          else if (event.keyCode === 38) dy = -10; // 위쪽 화살표 키
          else if (event.keyCode === 39) dx = 10; // 오른쪽 화살표 키
          else if (event.keyCode === 40) dy = 10; // 아래쪽 화살표 키
          
          // 화면을 넘어가지 않도록 위치를 제한
          let newX = playerX + dx;
          let newY = playerY + dy;
          if (newX < 0 || newX > 1200 - 65) dx = 0; // 캐릭터의 너비를 고려해야 합니다.
          if (newY < 0 || newY > 800 - 80) dy = 0; // 캐릭터의 높이를 고려해야 합니다.

          playerX += dx;
          playerY += dy;

          player.style.left = playerX + "px";
          player.style.top = playerY + "px";
         

          // 플레이어의 현재 위치와 도착점 간의 거리가 70px 이하가 되면 게임이 끝나도록 수정
             function isFinished(x, y) {
                 let dx = finishPoint.x - x;
                 let dy = finishPoint.y - y;
                 return Math.sqrt(dx * dx + dy * dy) <= 70;
             }
             
             // 눈과 해의 충돌을 확인하는 함수를 호출합니다.
             checkSnowCollision(playerX, playerY);
             checkSunCollision(playerX, playerY);

            if (isFinished(playerX, playerY)) {
                alert('Finish!');
                window.location.href = 'FinalPage.jsp';
            }
        }
        
     // 키 입력 이벤트 리스너 등록
        document.addEventListener("keydown", handleKeyPress);
     
    </script>  
</body>
</html>
