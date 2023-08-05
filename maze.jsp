<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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
        left: 313px;
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
   <%-- JSP에서 랜덤한 좌표를 계산하는 함수를 추가합니다. --%>
    <%!
    private int getRandomPosition(int max) {
        return (int) (Math.random() * max);
    }
    %> 
    <%-- 아이템의 위치를 담을 리스트들을 선언합니다. --%>
    <%
    // 제네릭 타입을 사용하는 리스트를 선언하려면 ArrayList를 일반적으로 캐스팅해야 합니다.
    List snowLeftPositions = new ArrayList();
    List snowTopPositions = new ArrayList();
    List sunLeftPositions = new ArrayList();
    List sunTopPositions = new ArrayList();
    %>
    
    <h1></h1>
    <div id="game-board">
        <div id="player" class="player"></div>
        <!-- item_snow -->
        <% for(int i=0; i<10; i++){ %>
           <%-- snow 아이템 좌표 생성 및 리스트에 추가 --%>
           <% int snowLeft = getRandomPosition(1000); %>
           <% int snowTop = getRandomPosition(600); %>
           <% snowLeftPositions.add(snowLeft); %>
           <% snowTopPositions.add(snowTop); %>
           <div class="item_snow" style="left: <%= snowLeft %>px; top: <%= snowTop %>px;"></div>
        <% } %>
        <!-- item_sun -->
        <% for(int i=0; i<5; i++){ %>
           <%-- sun 아이템 좌표 생성 및 리스트에 추가 --%>
           <% int sunLeft = getRandomPosition(1000); %>
           <% int sunTop = getRandomPosition(600); %>
           <% sunLeftPositions.add(sunLeft); %>
           <% sunTopPositions.add(sunTop); %>
           <div class="item_sun" style="left: <%= sunLeft %>px; top: <%= sunTop %>px;"></div>
        <% } %>
        <!-- item_noteaten -->
        <% for(int i=0; i<10; i++){ %>
           <div class="item_noteaten" style="left: <%= 100 + (i * 50) %>px; top: 5px;"></div>
        <% } %>
    </div>
    <script>
        let player = document.getElementById('player');
        let speed = 50;  // 이동 속도를 조절합니다.
        let finishPoint = { x: 1150, y: 700 };  // 도착지점
        let gameBoardSize = { width: 1200, height: 800 }; // 게임 보드의 크기
        let playerSize = { width: 70, height: 55 }; // 플레이어의 크기
        
        // 플레이어의 위치 변수
        let playerX = 313;
        let playerY = 80;

        // player의 초기 위치 설정
        player.style.left = playerX + 'px';
        player.style.top = playerY + 'px';

        // 먹은 아이템의 개수
        let eatenCount = 0;

        // maze 배열
        let maze = [
            // 이 부분에 2차원 배열로 미로의 정보를 추가해야 합니다.
            // 예) [0, 0, 1, 0, ...], 
            // ...
        ];

        // 미로의 벽과 캐릭터가 충돌하는지 확인하는 함수
        function checkCollision(x, y) {
            // 미로의 각 셀 크기
            const cellSize = 50; // 가정

            // 캐릭터의 현재 위치를 셀 크기로 나누어서 미로의 배열 상에서의 위치를 구합니다.
            const mazeX = Math.floor(x / cellSize);
            const mazeY = Math.floor(y / cellSize);

            // 미로의 해당 위치가 벽(예를 들어 1)이면 충돌이 일어난 것으로 간주합니다.
            return maze[mazeY][mazeX] === 1;
        }

        function handleKeyPress(event) {
            let dx = 0;
            let dy = 0;
            if (event.keyCode === 37) dx = -speed; // 왼쪽 화살표 키
            else if (event.keyCode === 38) dy = -speed; // 위쪽 화살표 키
            else if (event.keyCode === 39) dx = speed; // 오른쪽 화살표 키
            else if (event.keyCode === 40) dy = speed; // 아래쪽 화살표 키

            // 화면을 넘어가지 않도록 위치를 제한
            let newX = playerX + dx;
            let newY = playerY + dy;
            if (newX < 0 || newX > gameBoardSize.width - playerSize.width) dx = 0;
            if (newY < 0 || newY > gameBoardSize.height - playerSize.height) dy = 0;

            // 벽과 충돌하는지 확인
            if (checkCollision(newX, newY)) {
                dx = 0;
                dy = 0;
            }

            playerX += dx;
            playerY += dy;

            // player의 위치 업데이트
            player.style.left = playerX + 'px';
            player.style.top = playerY + 'px';

            if (isFinished(playerX, playerY)) {
                alert('Finish!');
            }
        }

        
        // 플레이어의 현재 위치와 도착점 간의 거리가 50px 이하가 되면 게임이 끝나도록 수정
        function isFinished(x, y) {
            let dx = finishPoint.x - x;
            let dy = finishPoint.y - y;
            return Math.sqrt(dx * dx + dy * dy) <= 50;
        }


        // 키 입력 이벤트 리스너 등록
        document.addEventListener('keydown', handleKeyPress);
    </script>    
</body>
</html>