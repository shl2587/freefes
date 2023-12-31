<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${login.role == 0 }">
	<style>
		#b_favorites {
 			display: none;
 		}
		#b_cancel_favorites {
			display: none;
		}
	</style>
</c:if>
<c:if test="${login.idx != favorites_result.member || empty login }">
<style>
	#b_cancel_favorites {
		display: none;
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

<style>
  .b_grade {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  .b_grade input {
		width: 100%;
		height: 100%;
		position: absolute;
		left: 0;
		opacity: 0;
	}
  .b_star {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
</style>


<div class="">
	<div class="">
		<h3>${board_dto.title }</h3>
		<div>조회수 : ${board_dto.count }</div>
		<div>
			작성일 : 
			<fmt:formatDate value="${board_dto.write_date }" pattern="yyyy-MM-dd"/>
		</div>
		<div class="">
			<img src="">
			<div>
				<span>축제 기간</span>
				<fmt:formatDate value="${board_dto.start_date }" pattern="yyyy-MM-dd"/>
				 ~ 
				<fmt:formatDate value="${board_dto.end_date }" pattern="yyyy-MM-dd"/> 
			</div>
			<label>축제 내용</label>
			<div>
				<span>개최 지역</span>
				${board_dto.region }
			</div>
			<div>
				<span>개최 장소</span>
				${board_dto.place }
			</div>
			<div>
				<span>축제 시간</span>
				${board_dto.time }
			</div>
			<div>
				<span>축제 설명</span>
				${board_dto.content }
				<br>
				참고 사이트 : ${board_dto.url }
			</div>
			<div>
				<span>참가 비용</span>
				<br>
				${board_dto.fee}
			</div>
			<div>
				<span>연령 제한</span>
				${board_dto.age_limit }
			</div>
			<div>
				<span>주최자</span>
				${board_dto.host_org }
			</div>
			<div>
				<span>문의</span>
				${board_dto.inquire }
			</div>
		</div>
		<div>
			<button id="b_favorites">☆</button>
			<button id="b_cancel_favorites">★</button>
		</div>
	</div>

	<div class="b_grade">
		★★★★★
		<div class="b_star">★★★★★</div>
		<input type="range" oninput="draw_grade(this)" value="0" step="1" min="0" max="10">
	</div>
</div>

<script>

const fes_board_idx = "${board_dto.idx}"
const login_role = "${sessionScope.login.role}"		
console.log(login_role)

if (login_role != 0) {
	
	document.addEventListener("DOMContentLoaded", function() {
		const favorites_key = "favorites"
		const favorites = JSON.parse(localStorage.getItem(favorites_key)) || {}
		
			
		const update_favorites = () => {
			if (favorites[fes_board_idx]) {
				$("#b_favorites").hide()
				$("#b_cancel_favorites").show()
			} else {
				$("#b_favorites").show()
				$("#b_cancel_favorites").hide()
			}
		}
	
		
		update_favorites()
	
		$("#b_favorites").click(function() {
			$.ajax({
				url: "${cpath}/fes_board/favorites/" + fes_board_idx,
				type: "GET",
				success: function(data) {
					favorites[fes_board_idx] = true
					localStorage.setItem(favorites_key, JSON.stringify(favorites))
					update_favorites()
					alert("축제 리스트에 추가되었습니다!!!")
				},
				error: function(error) {
					alert("이미 지난 축제이거나 없는 축제입니다. 다시 확인 부탁드립니다.")
				}
			})
		})
			
		$("#b_cancel_favorites").click(function() {
			$.ajax({
				url: "${cpath}/fes_board/favorites_delete/" + fes_board_idx,
	            type: "GET",
	            success: function(data) {
	                delete favorites[fes_board_idx];
	                localStorage.setItem(favorites_key, JSON.stringify(favorites)); // 웹 스토리지에 저장
	                update_favorites(); // 별 아이콘 업데이트
	                alert("축제 리스트에서 제외되었습니다. 다른 축제를 찾으러 가볼까요?");
	            },
				error: function(error) {
					alert("이미 리스트에서 제외된 축제입니다.")
				}
			})
		})
	})
}
</script>
<script>
const draw_grade = (target) => {
    document.querySelector(".b_grade").style.width = "${target.value * 10}%"
  }
</script>
</body>
</html>