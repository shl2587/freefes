<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<form method="POST">
	<p>
		<input type="text" name="name" placeholder="이름" required autofocus>
	</p>
	<p>
		<input type="email" name="email" placeholder="email" required>
	</p>
	<p>
		<input type="submit" value="아이디 찾기" id="checkId">
	</p>
</form>

<script>
	
document.getElementById('checkId').addEventListener('click', function() {
    const emailInput = document.querySelector('input[name="email"]')
    const hiddenEmailInput = document.getElementById('hidden_email')
    
    hiddenEmailInput.value = emailInput.value
});
	
</script>

</body>
</html>