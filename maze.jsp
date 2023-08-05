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
        height: 80px;
        width: 65px;
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
    	height: 60px;
        width: 60px;
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
    <h1></h1>
    <div id="game-board">
        <div id="player" class="player"></div>
        <!-- item_snow -->
        <% for(int i=0; i<10; i++){ %>
        	<div class="item_snow" style="left : <%= getRandomPosition(1000) %>px; top: <%= getRandomPosition(600) %>px;"></div>
        <% } %>
        <!-- item_sun -->
        <% for(int i=0; i<5; i++){ %>
        	<div class="item_sun" style="left : <%= getRandomPosition(1000) %>px; top: <%= getRandomPosition(600) %>px;"></div>
        <% } %>
        <!-- item_noteaten -->
        <% for(int i=0; i<10; i++){ %>
        	<div class="item_noteaten" style="left: <%= 140 + (i * 70) %>px; top: 14px;"></div>
        <% } %>
    </div>
    <script>
	    let player = document.getElementById('player');
	    let speed = 20;  // 이동 속도를 조절합니다.
	    let finishPoint = { x: 1150, y: 700 };  // 도착지점
	    let gameBoardSize = { width: 1200, height: 800 }; // 게임 보드의 크기
	    let playerSize = { width: 70, height: 70 }; // 플레이어의 크기
        
     // 플레이어의 위치 변수
        let playerX = 310;
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

            if (isFinished(rect.left, rect.top)) {
                alert('Finish!');
            }
        }

     // 플레이어의 현재 위치와 도착점 간의 거리가 70px 이하가 되면 게임이 끝나도록 수정
        function isFinished(x, y) {
            let dx = finishPoint.x - x;
            let dy = finishPoint.y - y;
            return Math.sqrt(dx * dx + dy * dy) <= 70;
        }
        
     // 키 입력 이벤트 리스너 등록
        document.addEventListener("keydown", handleKeyPress);
    </script>
    <%-- JSP에서 랜덤한 좌표를 계산하는 함수를 추가합니다. --%>
    <%!
    private int getRandomPosition(int max) {
        return (int) (Math.random() * max);
    }
    %>    
</body>
</html>
