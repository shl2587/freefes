<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	.banner {
		height: 100vh;
		width: 100%;
		display: flex;
		justify-content: center;
		margin: auto;
	}
	.slide > a > img {
		height: 100vh;
	}
	.slide > a {
		height: 100vh;
	}
	.slide {
		width: 100%;
		position: absolute;
		left: 50%;
		transform: translate(-50%);
		text-align: center;
		animation: fade 4s;
	}
	.active {
		transition: 1s;
		opacity: 100%;
		animation: fade 4s;
		"src/main/webapp/resources/img/개쩌는 축제.jpg"
	}
	.hidden {
		display: none;
	}
	
	@keyframes fade {
		0%, 100% {opacity: 0}
		10%, 90% {opacity: 1}
	}
	.wrap {
		height: 100vh;
		width: 100%;
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
		top: 50%;
		transform: translate(-50%);
		text-shadow: 10px 10px 10px #000;
		z-index: 11;
	}
	.prev:hover, .next:hover {
		text-shadow: 5px 5px 5px #000;
		transition: 0.3s;
		animation: rainbow 5s;
		animation-iteration-count: infinite;
	}
	@keyframes rainbow {
		0% {color: red;}
		14% {color: orange;}
		28% {color: yellow;}
		42% {color: green;}
		56% {color: blue;}
		70% {color: navy;}
		84% {color: purple;}
		100% {color: red;}
	}
	
	.prev {
		left: 80px;
	}
	.next {
		right: 15px;
	}
	body {
		margin: 0;
		padding: 0;
	}
	.banner_page {
		color: white;
		opacity: 0.5;
		transition: 0.3s;
		z-index: 11;
		padding-left: 10px;
	}
	.banner_page:hover {
		opacity: 1;
		transition: 0.3s;
		cursor: pointer;
		
	}
	.banner_page_wrap {
		display: flex;
		position: absolute;
		bottom: 40px;
		left: 50%;
		transform: translate(-50%);
		text-shadow: 2px 2px 2px #000;
	}
	.on {
		opacity: 1;
		transition: 0.3s;
	}
	.hold {
		z-index: 11;
		color: black;
		position: absolute;
		top: 20px;
		left: 80%;
		background-color: #fff1b9;
		padding: 8px 17px;
		box-sizing: border-box;
		border-radius: 10px;
		font-weight: bold;
		line-height: 28px;
		box-shadow: 4px 4px 4px #000;
		font-size: 22px;
		opacity: 0.7;
		
	}
	.holding {
		background-color: #75D701;
	}
</style>



<!-- 개최중 및 다가오는 축제 배너 -->
<div class="banner">
	<div class="wrap">
		<div class="prev">&lt;</div>
		<div class="next">&gt;</div>
		<c:forEach var="dto" items="${comming_list }" varStatus="status">
			<div class="slide ${status.index == 0 ? 'active' : 'hidden' }" >
				<a href="${cpath }/board/board_view/${dto.idx}">
					<img class="image" alt="${dto.file_name }" src="${cpath }/resources/img/${dto.file_path }">
				</a>
				
				<!-- 개최중인지 상태 -->
				<div class="hold ${dto.is_hold ? 'holding' : 'not_yet' }">
					${dto.is_hold ? "개최중" : dto.remain}
				</div>
			</div>
		</c:forEach>
		<div class="banner_page_wrap">
		<c:forEach var="dto" items="${comming_list }" varStatus="status">
			<div class="banner_page ${status.index == 0 ? 'on' : '' }" id="${status.index }">●</div>
		</c:forEach>
		</div>
	</div>
</div>

<%-- <h3>축제 순위</h3>

<div class="banner">
	<div class="wrap">
		<div class="prev">&lt;</div>
		<div class="slide_wrap">
			<c:forEach var="dto" items="${top10_list }">
				<div class="slide">
					<div class="rank">${dto.rank }위</div>
					<a href="${cpath }/board/board_view/${dto.idx}">
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
</div> --%>


<script src="${cpath }/resources/js/home.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/color-thief/2.3.0/color-thief.umd.js"></script>

<script>
	setInterval(move_slide, 4000)
	next.onclick = next_click
	prev.onclick = prev_click
	banner_color_change(slide[0])
</script>

</body>
</html>