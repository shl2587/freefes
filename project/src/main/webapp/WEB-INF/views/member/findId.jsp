<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<h1>아이디 찾기</h1>
<hr>

<form id="find_Id" method="POST">
	<p>
		<input type="text" name="name" placeholder="이름" required autofocus>
		<input type="email" name="email" placeholder="email" required>
			<input type="hidden" id="send_Auth_Number" >
		<input type="submit" value="이메일 보내기" >
	</p>
</form>
	<p>
		<input type="text" name="authNumber" placeholder="인증번호 입력">
		<button id="check_Auth_Number">확인</button>
		<span id="authMessage"></span>
	</p>
	<p>
		<button id="find_Id_page">아이디 찾기</button>
	</p>

<script> 
	const sendAuthNumber = document.getElementById('send_Auth_Number')
	const checkAuthNumber = document.getElementById('check_Auth_Number')
	
	// 1) 이름이랑 패스워드 입력하면 실행되는 함수
	async function find_IdHandler(event){
		event.preventDefault()
		const ob = {
			name: event.target.querySelector('input[name="name"]').value,
			email: event.target.querySelector('input[name="email"]').value,
		}
		const url = '${cpath}/getEmail'
		const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers:{
					'Content-Type': 'application/json; charset=utf-8'
				}
		}
		alert('난 정병학')
		const result = await fetch(url, opt).then(resp => resp.json())
		if(result.status == false){
			alert('계정 정보를 다시 확인해주세요')
			return
		}
		else{
			const email = event.target.querySelector('input[name="email"]').value
			const url = '${cpath}/sendAuthNumber/' + email + '/'
			const json = await fetch(url).then(resp => resp.json())
			alert("인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.")
		}
	}
	
	async function loginFinal() {
		const ob = {
			name: document.querySelector('input[name="name"]').value,
			email: document.querySelector('input[name="email"]').value,
			authNumber: +document.querySelector('input[name="authNumber"]').value,
		}
		const url = '${cpath}/login'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const result = await fetch(url, opt).then(resp => resp.text())
		if(result) {
			location.href = '${cpath}'
		}
	}
	
	
	async function checkAuthNumberHandler() {
		const authNumber = document.querySelector('input[name="authNumber"]')
		if(authNumber.value == '')  {
			alert('인증번호를 입력하세요')
			return
		}
		const url = '${cpath}/checkAuthNumber/' + authNumber.value
		const row = await fetch(url).then(resp => resp.text())
		const authMessage = document.getElementById('authMessage')
		if(row != 0) {
			loginFinal()
		}
		else {
			alert('인증 번호가 일치하지 않습니다')
		}
	}
		

</script>



</body>
</html>