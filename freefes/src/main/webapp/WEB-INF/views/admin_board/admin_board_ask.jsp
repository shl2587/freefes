<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<main id="wrap">
<div class="admin_board_menu">
	<ul>
		<li><a href="${cpath }/admin_board/admin_board">공지사항</a></li>
		<li><a href="${cpath }/qna/qna_list">1:1 문의함</a></li>
		<li><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></li>
		<li><a href="${cpath }/admin_board/surround">주위 시설</a></li>
	</ul>
</div>



<div class="admin_board_title">
<h3 style="color: black; font-size:23px;">고객센터   / 
	<span style="color: #537188; font-size:27px;"> 자주 묻는 질문</span>
</h3>
</div>

<hr>

<div id="answer_modal"></div>
<div id="modal" class="modalOverlay">
    <div class="modalWindow">
        <div class="title">
            <h2 id="modalTitle"></h2>
        </div>
        <div class="close">X</div>
        <div class="content">
            <p id="modalContent"></p>
        </div>
    </div>
</div>
</main>
   
</body>
</html>