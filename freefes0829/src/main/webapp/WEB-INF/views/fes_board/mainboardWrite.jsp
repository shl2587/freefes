<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div>
	<div id="load_temp_save">
		<div id="temp_load">임시저장글 불러오기</div>
		<div class="block" style="display: none;">
			<c:forEach var="dto" items="${list }" varStatus="status">
				<div style="display: flex;">
					<div class="temp_button">
						<strong class="temp_save_title">${dto.title }</strong>
						<span>
							<fmt:formatDate value="${dto.write_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초에 저장된 글" />
						</span>
						<input type="hidden" class="temp_board_idx" value="${dto.idx }">
					</div>
					<button class="temp_delete" value="${dto.idx }">X</button>
				</div>
			</c:forEach>
		</div>
	</div>
	<form method="POST" enctype="multipart/form-data" id="form" action="${cpath }/fes_board/mainboardWrite">
		<p>
			<select name="region">				
				<option value="" selected>=== 시/도 선택 ===</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
			</select>
<!-- 			<select> -->
<!-- 				<option value="" selected>=== 시/구/군 선택 ===</option> -->
<!-- 				<option value="서울특별시">서초구</option> -->
<!-- 				<option value="부산광역시">해운대구</option> -->
<!-- 			</select> -->
		</p>
		<p>
			<select name="festival_category">
				<option value="">=== 축제 카테고리 ===</option>
				<option value="nature">자연생태</option>
				<option value="tradition">전통/역사</option>
				<option value="specialties">지역특산물</option>
				<option value="culture">문화/예술</option>
				<option value="unity">주민화합</option>
				<option value="etc">기타</option>
			</select>			
			<input type="hidden" name="member" value="${login.idx }">
			<input type="text" name="title" placeholder="제목작성" required>
			<label>축제 시작일</label>
			<input type="date" name="start_date" required>
			<label>축제 종료일</label>
			<input type="date" name="end_date" required>
		</p>
		<p><textarea name="content" placeholder="게시글 작성" required></textarea></p>		
		<p>
			<input type="text" name="file_name" placeholder="파일 첨부">
			<input type="file" name="file_list" multiple>
		</p>
		<p><input type="submit" value="저장"></p>
	</form>
		<p><button id="temp_save">임시저장</button></p>
</div>




<script>
	// 로그인 상태 확인
	const cpath = "${cpath}"
	const memberIdx = ${sessionScope.login.idx}
		
	const temp_buttons = document.querySelectorAll('.temp_button')
	let temp_board_idx = null
	const temp_save = document.getElementById('temp_save')
	const load_temp_save = document.getElementById("load_temp_save")
	const block = document.querySelector(".block")
	
	const temp_deletes = document.querySelectorAll(".temp_delete")
	
	temp_save.addEventListener('click', saveTempBoard)
	
	// 임시저장글 X버튼 클릭
	temp_deletes.forEach(function(e) {
		e.addEventListener('click', function() {
			const deleteIdx = e.getAttribute("value")
			temp_delete(deleteIdx)
		})
	})
	
	// 임시저장글 삭제
	async function temp_delete(deleteIdx) {
		const url = cpath + "/fes_board/temp_delete/" + deleteIdx
		await fetch(url).then(resp => {
			if(resp.ok) {
                alert('삭제되었습니다.')
            } else {
                alert('삭제 실패!')
            }
		})
		.catch(err => {
			alert('에러발생!')
			console.log("에러 : ", err.message)
		})
	}
	
	// 임시저장글 목록 누르면 자동 입력
	temp_buttons.forEach(function(e) {
		e.addEventListener('click', function() {
			const idxInput = e.querySelector('.temp_board_idx')
			temp_board_idx = idxInput.value
			fetchData()
		})
	})
	
	// 마우스 올리면 목록나옴
	load_temp_save.addEventListener("mouseover", function() {
		if (block) {
			block.style.display = "block"
		}
	})
	
	// 마우스 벗어나면 목록 사라짐
	load_temp_save.addEventListener("mouseout", function() {
		if (block) {
			block.style.display = "none"
		}
	})
	
	// 임시저장글 불러오기
	async function fetchData() {
		
		if (temp_board_idx === null) {
			return alert("임시 저장 글을 선택하세요!")
		}
		
		await fetch(cpath + "/fes_board/load_temp_board/" + temp_board_idx, {
		    method: "GET",
		    cache: "no-cache"
		})
			.then((resp) => resp.json())
			.then((data) => {
				const form = document.getElementById('form')
				
				// 날짜 포맷하기
				const startDateTimestamp = data.start_date
				const endDateTimestamp = data.end_date
				
				const startDate = new Date(startDateTimestamp)
				const endDate = new Date(endDateTimestamp)
				
				const formattedStartDate = startDate.toISOString().split('T')[0]
				const formattedEndDate = endDate.toISOString().split('T')[0]
				
			    form.querySelector('select[name="region"]').value = data.region
			    form.querySelector('select[name="festival_category"]').value = data.festival_category
			    form.querySelector('input[name="title"]').value = data.title
			    form.querySelector('textarea[name="content"]').value = data.content
			    form.querySelector('input[name="start_date"]').value = formattedStartDate
				form.querySelector('input[name="end_date"]').value = formattedEndDate
			})
	}
	
	
	// 임시저장버튼
	async function saveTempBoard(event) {
		
		const form = document.getElementById('form')
		const ob = {
		    region: form.querySelector('select[name="region"]').value,
		    festival_category: form.querySelector('select[name="festival_category"]').value,
		    member: form.querySelector('input[name="member"]').value,
		    title: form.querySelector('input[name="title"]').value,
		    start_date: form.querySelector('input[name="start_date"]').value,
		    end_date: form.querySelector('input[name="end_date"]').value,
		    content: form.querySelector('textarea[name="content"]').value
		}
		
		

		
		// 빈 제목이면 기능을 끝낸다
		if(ob.title === '') {	
			return alert("제목을 입력해주세요!")
		}
		
		
		// DB에 저장
		await fetch(cpath + '/fes_board/temp_board_save', {
			method: 'POST',
			cache: 'no-cache',
			headers: {
		        'Content-Type': 'application/json'
		    },
			body: JSON.stringify(ob)
		})
		.then(
			block.innerHTML +=
			`<div style="display: flex;">
				<div class="temp_button">
					<strong class="temp_save_title">${dto.title }</strong>
					<span>
						<fmt:formatDate value="${dto.write_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초에 저장된 글" />
					</span>
					<input type="hidden" class="temp_board_idx" value="${dto.idx }">
				</div>
				<button class="temp_delete" value="${dto.idx }">X</button>
			</div>`
		)
		.catch(err => console.error("에러 : ", err))
	}
</script>

</body>
</html>