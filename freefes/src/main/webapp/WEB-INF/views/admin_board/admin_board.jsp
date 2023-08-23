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
	<span style="color: #537188; font-size:27px;"> 공지사항</span>
</h3>
</div>

<hr>
<div class="admin_board_btn">
<c:if test="${sessionScope.role == 0}">
    <h3><a href="${cpath }/admin_board/admin_write">
    <button>
    	<i class="fa-solid fa-pen-nib" style="color: #5398a2;"></i>
    	<span class="write-icon-text">글 쓰기</span>
    </button>
    </a></h3>
</c:if>
</div>


<table>
<c:forEach var="dto" items="${list }">
	<tr>
	  <td><a href="${cpath }/view/${dto.idx }">${dto.title }</a></td>
	  <td><fmt:formatDate value="${dto.write_date }" pattern="yyyy-MM-dd" /></td>
	</tr>
</c:forEach>
</table>

</main>

</body>
</html>