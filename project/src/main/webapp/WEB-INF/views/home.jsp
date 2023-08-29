<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<h1>멤버 계정</h1>
<hr>

<div id="loginInfo">
	<c:if test="${not empty login }">
		${login.userid } (${login.name })
	</c:if>
</div>
<nav>
	<ul>
		<li><a href="${cpath }/member/${empty login ? 'login' : 'logout'}">
			${empty login ? '로그인' : '로그아웃'}</a></li>
	</ul>
</nav>

<div><a href="${cpath }/member/terms">약관동의</a></div>
<div><a href="${cpath }/member/join">회원가입</a></div>
<div><a href="${cpath }/member/findId">아이디 찾기</a></div>
<div>	
	<c:if test="${not empty login }">
		<a href="${cpath }/mypage/mypage">나의 페이지</a>
	</c:if>
</div>


</body>
</html>