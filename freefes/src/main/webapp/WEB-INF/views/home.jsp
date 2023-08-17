<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- 개최중 및 다가오는 축제 배너 -->
<div class="banner">
	<c:forEach var="dto" items="${comming_list }">
		<img alt="${dto.file_name }" src="${cpath }/resources/img/${dto.file_path }">
		
		<!-- 개최중인지 상태 -->
		<div class="hold ${dto.is_hold ? 'holding' : 'not_yet' }">
			${dto.is_hold ? "개최중" : dto.remain}
		</div>
		
	</c:forEach>
</div>

<div class="title">축제 순위</div>

<div class="banner">
	<c:forEach var="dto" items="${top10_list }">
		<div class="rank">${dto.rank }위</div>
		<img alt="${dto.file_name }" src="${cpath }/resources/img/${dto.file_path }">
		
		<!-- 개최중인지 상태 -->
		<div class="hold ${dto.is_hold ? 'holding' : 'not_yet' }">
			${dto.is_hold ? "개최중" : dto.remain}
		</div>
		
	</c:forEach>
</div>

<script>

</script>

</body>
</html>