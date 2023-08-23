<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<style>
		.hidden {
		display: none;
	}
	
	#modal-overlay {
		width: 100%;
		height: 100%;
		position: fixed;
		background-color: rgba(0, 0, 0, 0.3);
		top: 0;
		left: 0;
		z-index: 1;
	}
	#modal-content {
		width: fit-content;
		height: fit-content;
		position: fixed;
		top: 50%;
		left: 50%;
		z-index: 2;
		transform: translate(-50%, -50%);
		box-shadow: 5px 5px 5px grey;
		border-radius: 10px;
		background-color: white;
	}
	.center {
		width: 600px;;
		height: 200px;
		position: fixed;
		top: 50%;
		left: 50%;
		z-index: 2;
		transform: translate(-50%, -50%);
		box-shadow: 5px 5px 5px grey;
		border-radius: 10px;
		background-color: white;
	}
	.center > h4 {
		text-align: center;
		
	}
	.qqqq {
		display: flex;
		justify-content: space-around;
	}	
	.closebnt{
		display: flex;
		align-items: center;
		text-align: center;
		justify-content: center;
	}
	
</style>

<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="submit" value="완료"></p>
</form>

<p>
	<a href="${cpath }/member/findId"><button>아이디 찾기</button></a>
	<button id="pw">비밀번호 재설정</button>	
</p>

<div id="modal" class="hidden">
	<div id="modal-overlay"></div>
	<div id="modal-content"></div>
</div>

<div id="repw" class="hidden">
	<div class="center">
		<h4>비밀번호 재설정</h4>
		<div class="qqqq">
			<p><a href="${cpath }/member/repw_email">이메일</a></p>
			<p><a href="${cpath }/member/verify">질문</a></p>
		</div>
		<div>
			<button id="cc" class="closebnt">닫기</button>
		</div>
	</div>
</div>

<p id="successMessage" style="display: none; color: green;">성공!</p>

<script>
	const pw = document.getElementById('pw')
	const repw = document.getElementById('repw')
	const cc = document.getElementById('cc')
	const modal = document.getElementById('modal')
	
	function hiddenOpen(){
		modal.classList.remove('hidden')
		repw.classList.remove('hidden')
	}
	function hiddencc(){
		modal.classList.add('hidden')
		repw.classList.add('hidden')
	}
	pw.onclick = hiddenOpen
	cc.onclick = hiddencc
	
</script>

</body>
</html>