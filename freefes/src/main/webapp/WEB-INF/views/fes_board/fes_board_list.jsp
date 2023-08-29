<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	div.festival_list {
		display: flex;
		justify-content: center;
	}
	div.paging {
		text-align: center;
	}
</style>



<div>
	<div>
		<c:forEach var="board_list" items="${fes_boardList }">
			<div class="festival_list">
				<div>${board_list.idx }</div>
				<div>${board_list.title }</div>
				<div>${board_list.count }</div>
			</div>
		</c:forEach>
	</div>
	<div class="fes_board_paging">
		<c:if test="${fes_paging_dto.prev }">
			<a href="${cpath }/fes_board/fes_board_list?request_page=
				${fes_paging_dto.page_begin - fes_paging_dto.per_page}">
				◀이전
			</a>
		</c:if>
		<c:forEach var="page_number" begin="${fes_paging_dto.page_begin }" end="${fes_paging_dto.page_end }">
			<a href="${cpath }/fes_board/fes_board_list?request_page=${page_number}">[${page_number }]</a>
		</c:forEach>
		<c:if test="${fes_paging_dto.next }">
			<a href="${cpath }/fes_board/fes_board_list?reqeust_page=${fes_paging_dto.page_end + 1 }">다음▶</a>
		</c:if>
	</div>
</div>




</body>
</html>