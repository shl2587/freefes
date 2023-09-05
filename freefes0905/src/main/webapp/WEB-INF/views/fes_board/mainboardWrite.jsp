<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const memberIdx = ${sessionScope.login.idx}
</script>

<style>
	.write_body {
		text-align: center;
	}
	select {
	    width: 220px;
	    padding: .8em 1.1em;
	    font-family: inherit;
	    background: url('https://img.icons8.com/fluency/96/sort-down.png') no-repeat 95% 50%;
	    background-size: 15px;
	    border: 3px solid #2797F4;
	    border-radius: 0px;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	}
	select:focus {
		 border-color: #66afe9;
		 -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
		 box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
	}
	p > input {
		width: 300px;
		padding-bottom: 10px;
		padding-top: 13px;
		border: 3px solid #2797F4;
		text-align: center;
		border-radius: 5px;
	}
	textarea {
		width: 500px;
		padding: 16px 13px;
		min-height: 200px;
		border: 3px solid #2797F4;
		border-radius: 5px;
	}
	#temp_load {
		border: 1px solid #eee;
		background-color: #eee;
		display: inline;
		box-sizing: border-box;
		border-radius: 5px;
		padding: 5px 10px;
	}
	
	#load_temp_save {
		display: inline;
	}
	#load_temp_save:hover {
		cursor: default;
	}
	input[type="file"] {
		position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
		border: 0;
	}
	label {
		display: inline-block;
		padding: 10px 20px;
		color: #162136;
		vertical-align: middle;
		background-color: #fbfbfb;
		cursor: pointer;
		border: 2px solid #2797F4;
		border-radius: 5px;
	}
	.photo-name, .poster-name {
		display: inline-block;
		height: 35px;
		font-size:18px; 
		padding: 3.5px 42px;
		vertical-align: middle;
		background-color: #f0f0f0;
		border: 2px solid #2797F4;
		border-radius: 5px;
	}
	input[type="date"]::-webkit-calendar-picker-indicator,
 	input[type="date"]::-webkit-inner-spin-button {
     	display: none;
     	appearance: none;
	}
	input[type="date"] {
		width: 200px;
		height: 40px;
		text-align: right;
		font-size: 14px;
	}
	
	input[type="date"]::-webkit-calendar-picker-indicator {
		color: rgba(0, 0, 0, 0);
		opacity: 1;
		display: block;
		background: url('https://img.icons8.com/color-glass/96/calendar-plus.png') no-repeat 50% 60%;
		background-size: 20px;
		width: 20px;
		height: 20px;
		border-width: thin;
	}

</style>

<div class="write_body">
	<div id="load_temp_save">
		<div id="temp_load">임시저장글 불러오기</div>
		<div class="block" style="display: none;">
			<c:if test="${empty list }">
				<div style="padding-top: 5px;" id="no_save">임시저장글이 없습니다.</div>
			</c:if>
			<c:forEach var="dto" items="${list }" varStatus="status">
				<div style="display: flex;" class="temp_entry">
					<div class="temp_button">
						<strong class="temp_save_title">${dto.title }</strong>
						<span>
							<fmt:formatDate value="${dto.write_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초에 저장된 글" />
						</span>
						<input type="hidden" class="temp_board_idx" value="${dto.idx }">
					</div>
					<div><button class="temp_delete" value="${dto.idx }">X</button></div>
				</div>
			</c:forEach>
		</div>
	</div>
	<form method="POST" enctype="multipart/form-data" id="form">
		<p>
			<select id="local_gov" name="region" required>
				<option value="">=== 시 / 도 선택 ===</option>
				<option id="seoul" value="서울">서울특별시</option>
				<option id="busan" value="부산">부산광역시</option>
				<option id="incheon" value="인천">인천광역시</option>
				<option id="daejeon" value="대전">대전광역시</option>
				<option id="gwangju" value="광주">광주광역시</option>
				<option id="deagu" value="대구">대구광역시</option>
				<option id="ulsan" value="울산">울산광역시</option>
				<option id="jeju" value="제주">제주특별자치도</option>
				<option id="gyeonggi" value="경기">경기도</option>
				<option id="gangwon" value="강원">강원도</option>
				<option id="chungcheong_bukdo" value="충청북도">충청북도</option>
				<option id="chungcheong_namdo" value="충청남도">충청남도</option>
				<option id="gyeongsang_bukdo" value="경상북도">경상북도</option>
				<option id="gyeongsang_namdo" value="경상남도">경상남도</option>
				<option id="jeonla_bukdo" value="전라북도">전라북도</option>
				<option id="jeonla_namdo" value="전라남도">전라남도</option>
			</select>
			<select id="region_section" name="region_section" required>
				<option value="">=== 시 / 군 / 구 선택 ===</option>
			</select>
		</p>
		<p>
			<select name="festival_category" required>
				<option value="">=== 축제 유형 선택 ===</option>
				<option value="경연사업">경연사업</option>
				<option value="관광특산">관광특산</option>
				<option value="문화예술">문화예술</option>
				<option value="생태자원">생태자원</option>
				<option value="전통역사">전통역사</option>
				<option value="지역특산물">지역특산물</option>
				<option value="etc">기타</option>
			</select>
			<input type="text" name="title" placeholder="제목작성" required>
		</p>
		<div>
			<span>축제 시작일</span>
			<input type="date" name="start_date" required>
			<span style="padding-left: 70px;">축제 종료일</span>
			<input type="date" name="end_date" required>
		</div>
		<p><input type="text" name="place" placeholder="개최 장소" required></p>
		<p><input type="text" name="time" placeholder="축제 시간"></p>
		<p><input type="text" name="url" placeholder="참고 주소(url)"></p>
		<p><input type="text" name="fee" placeholder="참가 비용" required></p>
		<p><input type="text" name="age_limit" placeholder="연령 제한"></p>
		<p><input type="text" name="host_org" placeholder="주최자"></p>
		<p><input type="text" name="inquire" placeholder="축제 문의"></p>
		<p><input type="text" name="way_to_come" placeholder="오시는길"></p>

		<p><textarea name="content" placeholder="게시글 작성" required></textarea></p>
		<div>
			<p>포스터 사진(필수)</p>
			<label for="poster">업로드</label>
			<input type="file" id="poster" name="poster" required>
			<input class="poster-name" value="파일 선택" readonly>
		</div>
		<div>
			<p>축제 사진(선택)</p>
			<label for="photo">업로드</label>
			<input type="file" id="photo" name="file_list" multiple>
			<input class="photo-name" value="파일 선택" readonly>
		</div>
		<p><input type="submit" value="저장"></p>
	</form>
		<p><button id="temp_save">임시저장</button></p>
</div>

<script src="${cpath }/resources/js/fes_board_list.js"></script>
<script src="${cpath }/resources/js/temp_board.js"></script>


<script>
	// 시/군/구 불러오는 코드
	local_gov_list()
</script>

</body>
</html>