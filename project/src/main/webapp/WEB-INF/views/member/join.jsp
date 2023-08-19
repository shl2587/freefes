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
	
	<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
	<p><input type="text" name="name" placeholder="이름" required></p>
	
	<p><input type="text" name="name" placeholder="Name" required></p>
	<p>생년월일<input type="date" name="birth" required></p>
	 <div class="select">
     <input type="radio" id="man" name="gender" value="남"><label for="man">남자</label>
     <input type="radio" id="woman" name="gender" value="여"><label for="woman">여자</label>
	</div>
	<p><input type="text" name="address" placeholder="주소" required></p>
	<p><input type="text" name="nickname" placeholder="닉네임" required></p>
	<p><input type="email" name="email" placeholder="E-Mail" required></p>
	<p><input type="text" name="phonenumber" placeholder="전화번호" required></p>
	
	<p><input type="submit" value="가입신청"></p>
</form>

</body>
</html>