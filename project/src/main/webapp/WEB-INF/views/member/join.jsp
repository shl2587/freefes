<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<h1>회원가입</h1>
<hr>

<form method="POST">
	<p>
		<input type="text" name="userid" placeholder="아이디" required autofocus>
		<input id="dupCheckBtn" type="button" value="중복확인">
		<br>
		<span id="dupMessage"></span>
	</p>
	
	<p>
		<input type="password" name="userpw" placeholder="비밀번호" required>
		<input id="passCheckBtn" type="button" value="비밀번호 사용가능">
		<br>
		비밀번호는 영문과 특수문자 숫자를 포함하며 8자 이상이어야 합니다.
		<br>
		<span id="passCheckMessage"></span>
	</p>
	
	<p><input type="text" name="name" placeholder="이름" required></p>

	<p>생년월일<input type="date" name="birth" required></p>
	 <div class="select">
     <input type="radio" id="m" name="gender" value="m"><label for="m">남자</label>
     <input type="radio" id="w" name="gender" value="w"><label for="w">여자</label>
	</div>
	<p><input type="text" name="address" placeholder="주소" required></p>
	<p><input type="text" name="nickname" placeholder="닉네임" required></p>
	<p><input type="email" name="email" placeholder="E-Mail" required></p>
	<p><input type="text" name="phonenumber" placeholder="전화번호" required></p>
	<p>
		<select name="verify1">
			<option value="당신의 출신 도시는 어디인가요?">당신의 출신 도시는 어디인가요?</option>
			<option value="당신의 가장 친한 친구의 이름은 무엇인가요?">당신의 가장 친한 친구의 이름은 무엇인가요?</option>
			<option value="당신의 반려동물의 이름은 무엇인가요?">당신의 반려동물의 이름은 무엇인가요?</option>
			<option value="당신의 좋아하는 음식은 무엇인가요?">당신의 좋아하는 음식은 무엇인가요?</option>
			<option value="당신의 어릴 적 별명은 무엇인가요?">당신의 어릴 적 별명은 무엇인가요?</option>
		</select>
		<input type="text" name="answer1" placeholder="답변1">
	</p>
	<p>
		<select name="verify2">
			<option value="가장 기억에 남는 여행지는 어디인가요?">가장 기억에 남는 여행지는 어디인가요?</option>
			<option value="당신의 최애 도서나 영화는 무엇인가요?">당신의 최애 도서나 영화는 무엇인가요?</option>
			<option value="당신의 첫사랑 이름은 무엇인가요?">당신의 첫사랑 이름은 무엇인가요?</option>
			<option value="가장 기억에 남는 선물은 무엇인가요?">가장 기억에 남는 선물은 무엇인가요?</option>
			<option value="가장 기억에 남는 학창 시절의 순간은 무엇인가요?">가장 기억에 남는 학창 시절의 순간은 무엇인가요?</option>
		</select>
		<input type="text" name="answer2" placeholder="답변2">
	</p>
	<p><input type="submit" value="가입신청"></p>
</form>

<script>
	const dupCheckBtn = document.getElementById('dupCheckBtn')
	
	async function dupCheckHandler() {
		const dupMessage = document.getElementById('dupMessage')
		const userid = document.querySelector('input[name="userid"]')
		
		if(userid.value == '') {
			dupCheckBtn.focus()
			alert('먼저 사용할 ID를 입력해주세요')
			return
		}
		const url = '${cpath}/dupCheck/' + userid.value
		const count = await fetch(url).then(resp => resp.text())
		console.log(count)
		if(count == 0) {
			dupMessage.innerText = '사용 가능한 ID입니다'
			dupMessage.style.color = 'blue'
		}
		else {
			dupMessage.innerText = '이미 사용중인 ID입니다'
			dupMessage.style.color = 'red'
			userid.select()
		}
	}
	dupCheckBtn.addEventListener('click', dupCheckHandler)
// 	document.querySelector('input[name="userid"]').addEventListener('blur', dupCheckHandler)
	
	// onfocus : 마우스나 키보드에 의해 문서요소가 선택되었을 때 발생하는 이벤트 리스너
	// onblur : 포커스 상태에서 선택을 상실할 때 발생하는 이벤트 리스너 (다른 요소로 포커스가 넘어가버리면 발생)
</script>

<script>
	const passCheckBtn = document.getElementById('passCheckBtn')
	
	async function passCheckHandler(){
		const passCheckMessage = document.getElementById('passCheckMessage');
		const userpw = document.querySelector('input[name="userpw"]')
		
		if(userpw.value == ''){
			passCheckBtn.focus()
			alert('먼저 사용할 비밀번호를 입력해주세요')
			return
		}
		const url = '${cpath}/passCheck' + userpw.value
		const count = await fetch(url).then(resp => resp.text())
		console.log(count)
		if(count == 0) {
			passCheckMessage.innerText = '비밀번호는 영문과 특수문자 숫자를 포함하여야 합니다.'
			passCheckMessage.style.color = 'red'
		}
		else if(count < 0){
			passCheckMessage.innerText = '8자리 이상 20자리 이하의 비밀번호여야 합니다.'
			passCheckMessage.style.color = 'red'
		}
		else if (count > 0){
			passCheckMessage.innerText = '비밀번호 사용 가능합니다.'
			passCheckMessage.style.color = 'blue'
		}
	}
	passCheckBtn.addEventListener('click', passCheckHandler)
	
</script>
	
</body>
</html>