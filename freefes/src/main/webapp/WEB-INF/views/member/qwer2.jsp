<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

  <style>
.puzzle {
    display: grid;
    grid-template-columns: repeat(3, 100px);
    grid-template-rows: repeat(3, 100px);
    gap: 5px;
    margin-top: 20px;
  }
  .tile {
    width: 100px;
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 24px;
    cursor: pointer;
  }
  .red {
    background-color: red;
  }
  
   .blue {
    background-color: blue;
  }

</style>

</head>
<body>

<div class="puzzle" id="puzzle">
  <div class="tile" id="tile1"></div>
  <div class="tile" id="tile2"></div>
  <div class="tile" id="tile3"></div>
  <div class="tile" id="tile4"></div>
  <div class="tile" id="tile5"></div>
  <div class="tile" id="tile6"></div>
  <div class="tile" id="tile7"></div>
  <div class="tile" id="tile8"></div>
  <div class="tile" id="tile9"></div>
<p>확인 : <span id="score">0</span>/5</p>
</div>
<!-- 점수 표시 -->
<!-- 성공 메시지 -->
<p id="successMessage" style="display: none; color: green;">성공!</p>

<script>
// 퍼즐 타일 요소들을 가져옴
const tiles = document.querySelectorAll('.tile');
// 점수와 점수를 표시하는 요소를 가져옴
const scoreElement = document.getElementById('score');
let score = 0;
let isPuzzleSolved = false; // 퍼즐 해결 여부 확인

// 랜덤한 타일 인덱스 반환 함수
function getRandomTileIndex() {
  return Math.floor(Math.random() * 9);
}

const colors = ['blue', 'green', 'yellow', 'purple', 'orange', 'pink'];
//초기 빨간색 타일 설정
const initialRedTileIndex = getRandomTileIndex();
alert(initialRedTileIndex)
tiles[initialRedTileIndex].classList.add('red');
tiles.forEach((tile, index) => {
	  if (index !== initialRedTileIndex) {
	    const randomColorIndex = Math.floor(Math.random() * colors.length);
	    const randomColor = colors[randomColorIndex];
	    tile.style.backgroundColor = randomColor;
	  }
	});

// 빨간색 타일 이동 함수
function moveRedTile() {
	
  const redTile = document.querySelector('.red');
  const randomTileIndex = getRandomTileIndex();

  redTile.classList.remove('red');
  tiles[randomTileIndex].classList.add('red');
  
}

// 퍼즐 클릭 이벤트 핸들러
tiles.forEach(tile => {
  tile.addEventListener('click', () => {
    if (!isPuzzleSolved) {
      if (tile.classList.contains('red')) {
        // 올바른 선택 시 점수 증가 및 빨간색 타일 이동
        score += 1;
        scoreElement.textContent = score;

        if (score >= 5) {
          // 5점 이상일 경우 성공 메시지 표시 및 퍼즐 단색으로 변경
          showSuccessMessage();
          changeTileColors();
          isPuzzleSolved = true; // 퍼즐 해결 플래그 설정
        }

        moveRedTile();
      } else {
        // 잘못된 선택 시 점수 감소
        score = 0;
        alert('사람이 맞습니까?')
        scoreElement.textContent = score;
      }
    }
  });
});

// 성공 메시지 표시 함수
function showSuccessMessage() {
  const successMessage = document.getElementById('successMessage');
  successMessage.style.display = 'block';
}

// 퍼즐 단색으로 변경 함수
function changeTileColors() {
  tiles.forEach(tile => {
    tile.style.backgroundColor = 'gray'; // 원하는 단색으로 변경 가능
  });
}
</script>
</body>
</html>