<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	.banner {
		height: 600px;
		width: 730px;
		display: flex;
		justify-content: center;
		margin: auto;
	}
	.slide > a > img {
		opacity: 50%;
		transition: 0.5s;
		height: 600px;
	}
	.slide > a {
		height: 600px;
		width: 730px;
		text-align: center;
	}
	.slide {
		position: absolute;
		left: 50%;
		transform: translate(-50%);
	}
	.slide_wrap {
		position: relative;
	}
	.wrap {
		height: 600px;
		width: 730px;
		overflow: hidden;
		position: relative;
	}
	.prev, .next {
		padding: 10px;
		font-size: 70px;
		cursor: pointer;
		font-family: cursive;
		color: white;
		position: absolute;
		top: 250px;
		text-shadow: 10px 10px 10px #000;
	}
	.prev:hover, .next:hover {
		text-shadow: 5px 5px 5px #000;
		transition: 0.3s;
	}
	.prev {
		left: 15px;
	}
	.next {
		right: 15px;
	}
	
</style>

<script src="${cpath }/resources/js/home.js"></script>

<!-- 개최중 및 다가오는 축제 배너 -->
<div class="banner">
	<div class="wrap">
		<div class="prev">&lt;</div>
		<div class="slide_wrap">
			<c:forEach var="dto" items="${comming_list }">
				<div class="slide">
					<a href="${cpath }/board/board_view.jsp">
						<img alt="${dto.file_name }" src="${cpath }/resources/img/${dto.file_path }">
					</a>
				
					<!-- 개최중인지 상태 -->
					<div class="hold ${dto.is_hold ? 'holding' : 'not_yet' }">
						${dto.is_hold ? "개최중" : dto.remain}
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="next">&gt;</div>
	</div>
</div>

<h3>축제 순위</h3>

<div class="banner">
	<div class="wrap">
		<div class="prev">&lt;</div>
		<div class="slide_wrap">
			<c:forEach var="dto" items="${top10_list }">
				<div class="slide">
					<div class="rank">${dto.rank }위</div>
					<a href="${cpath }/board/board_view.jsp">
						<img alt="${dto.file_name }" src="${cpath }/resources/img/${dto.file_path }">
					</a>
					
					<!-- 개최중인지 상태 -->
					<div class="hold ${dto.is_hold ? 'holding' : 'not_yet' }">
						${dto.is_hold ? "개최중" : dto.remain}
					</div>
				</div>	
			</c:forEach>
		</div>
		<div class="next">&gt;</div>
	</div>
</div>

<script>

</script>

</body>
</html>