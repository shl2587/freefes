<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${login.idx != favorites_result.member || empty login }">
	<style>
	#b_cancel_favorites {
		display: none;
	}
	
	/* 평점 */
	.starpoint_wrap{
		display: inline-block;
		height: 21.6px;
		margin: 19px 7px;
	}
	.starpoint_box{
		position: relative;
		background: url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0 no-repeat;
		font-size: 0;
		transition: 0.2s;
	}
	.starpoint_box .starpoint_bg{
		display: block;
		position: absolute;
		top: 0;
		left: 0;
		height: 18px;
		background: url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 -20px no-repeat;
		pointer-events:none;
		transition: 0.2s;
	}
	.starpoint_box .label_star{
		display: inline-block;
		width: 10px;
		height: 18px;
		box-sizing: border-box;
	}
	.starpoint_box .star_radio{
		opacity: 0;
		width: 0;
		height: 0;
		position: absolute;
	}
	.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
	.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
	.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
	.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
	.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
	.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
	.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
	.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
	.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
	.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}

	.blind{
		position: absolute;
		clip: rect(0 0 0 0);
		margin: -1px;
		width: 1px;
		height: 1px;
		overflow: hidden;
	}
	.flex {
		display: flex;
	}
	a {
		text-decoration: none;
		font-weight: bold;
		color: black;
	}

	</style>
</c:if>
<c:if test="${not empty login && login.idx == favorites_result.member }">
	<style>
#b_favorites {
	display: none;
}
</style>
</c:if>

<c:set var="filePath" value="${board_dto.file_path }" />
<c:set var="length" value="${fn:length(filePath)}" />
<c:set var="lastDotIndex" value="${fn:indexOf(filePath, 'poster.')}" />
<c:set var="fileExtension"
	value="${fn:substring(filePath, lastDotIndex + 7, length)}" />


<div class="">
	<div class="">
		<h3>${board_dto.title }</h3>
		<div>조회수 : ${board_dto.count }</div>
		<div>
			작성일 :
			<fmt:formatDate value="${board_dto.write_date }" pattern="yyyy-MM-dd" />
		</div>
		<div class="">
			<img
				src="${cpath }/upload/${board_dto.title}/poster.${fileExtension}">
			<div>
				<span>축제 기간</span>
				<fmt:formatDate value="${board_dto.start_date }"
					pattern="yyyy-MM-dd" />
				~
				<fmt:formatDate value="${board_dto.end_date }" pattern="yyyy-MM-dd" />
			</div>
			<label>축제 내용</label>
			<div>
				<span>개최 지역</span> ${board_dto.region }
			</div>
			<div>
				<span>개최 장소</span> ${board_dto.place }
			</div>
			<div>
				<span>축제 시간</span> ${board_dto.time }
			</div>
			<div>
				<span>축제 설명</span> ${board_dto.content } <br> 참고 사이트 :
				<a href="${board_dto.url }">${board_dto.url }</a>
			</div>
			<div>
				<span>참가 비용</span> <br> ${board_dto.fee}
			</div>
			<div>
				<span>연령 제한</span> ${board_dto.age_limit }
			</div>
			<div>
				<span>주최자</span> ${board_dto.host_org }
			</div>
			<div>
				<span>문의</span> ${board_dto.inquire }
			</div>
		</div>
		<c:if test="${empty login }">
			<div><a href="${cpath }/member/login">로그인하고 댓글 달기</a></div>
		</c:if>
		
		<c:if test="${not empty login }">
		<div>
			<button id="b_favorites">☆</button>
			<button id="b_cancel_favorites">★</button>
		</div>
		<div class="reply">
			<form method="post" action="${cpath }/member/mypage/reply_write">
				<p>
					<input type="hidden" value="${login.idx }" name="member">
				</p>
				<p>
					<input type="hidden" value="${board_dto.idx }" name="board">
				</p>
				<div class="flex">
					<p>기대감 점수 : </p>
					<div class="starpoint_wrap">
					  	<div class="starpoint_box">
					    	<label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
						    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
						    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
						    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
						    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
						    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
						    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
						    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
						    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
						    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
						    <input type="radio" name="grade" id="starpoint_1" class="star_radio" value="0.5" ${my_reply.starPoint == 1 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_2" class="star_radio" value="1" ${my_reply.starPoint == 2 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_3" class="star_radio" value="1.5" ${my_reply.starPoint == 3 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_4" class="star_radio" value="2" ${my_reply.starPoint == 4 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_5" class="star_radio" value="2.5" ${my_reply.starPoint == 5 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_6" class="star_radio" value="3" ${my_reply.starPoint == 6 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_7" class="star_radio" value="3.5" ${my_reply.starPoint == 7 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_8" class="star_radio" value="4" ${my_reply.starPoint == 8 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_9" class="star_radio" value="4.5" ${my_reply.starPoint == 9 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_10" class="star_radio" value="5" ${my_reply.starPoint == 10 ? 'checked' : '' }>
						    <span class="starpoint_bg"></span>
					  	</div>
					</div>
				</div>
				<div class="flex">
					<p>
						<textarea name="content" placeholder="기대감을 표현해주세요">${my_reply.content }</textarea>
					</p>
					<p><input type="submit" value="입력"></p>
				</div>
			</form>
		</div>
		</c:if>
		
		<c:forEach var="reply_dto" items="${reply_list }">
			<div>${reply_dto.write_date } | <span>${reply_dto.nickname }</span></div>
			<div class="grade">
				${reply_dto.starPoint }
			</div>
			<div>${reply_dto.content }</div>
			<c:if test="${reply_dto.member == login.idx }">
				<button id="delete_my_reply" onclick="confirm_delete()" value="${cpath}/member/mypage/reply_delete/${reply_dto.idx}">x</button>
			</c:if>
		</c:forEach>                                                                                                                                                                                                                                                                                                                 
	</div>
</div>

<script src="${cpath }/resources/js/reply.js"></script>

<script>
	const login_session = "${session.login}"
	const fes_board_idx = "${board_dto.idx}"
	const favorites_result = "${favorites_result}"
	
	console.log(favorites_result)

	$(document)
		.ready(
		function() {
			if (favorites_result && login_session) {
				if (favorites_dto.member === login_session.idx
						&& favorites_dto.board === fes_board_idx) {
					$("#b_favorites").hide()
					$("#b_cancel_favorites").show()
				} else {
					$("#b_favorites").show()
					$("#b_cancel_favorites").hide()
				}
			}

			$("#b_favorites")
				.click(
					function() {
					$
						.ajax({
							url : "${cpath}/fes_board/favorites/"
									+ fes_board_idx,
							type : "GET",
							success : function(data) {
								$("#b_favorites")
									.hide()
								$(
									"#b_cancel_favorites")
									.show()
								alert("축제 리스트에 추가되었습니다!!!")
							},
							error : function(error) {
								alert("이미 지난 축제이거나 없는 축제입니다. 다시 확인 부탁드립니다.")
							}
						})
					})

			$("#b_cancel_favorites")
				.click(
					function() {
						$
						.ajax({
							url : "${cpath}/fes_board/favorites_delete/"
								+ fes_board_idx,
							type : "GET",
							success : function(data) {
								$("#b_favorites")
									.show()
								$(
									"#b_cancel_favorites")
									.hide()
								alert("축제 리스트에서 제외 되었습니다. 다른 축제를 찾으러 가볼까요?")
							},
							error : function(error) {
								alert("이미 리스트에서 제외된 축제입니다.")
							}
						})
					})
				})
				

</script>

</body>
</html>