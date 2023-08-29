<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freefes</title>
</head>
<body>

<div class="search_bar">
	<div class="header_left">
		<div class="search"><img alt="검색" src=""></div>
		<div class="search_trend"></div>
	</div>
	<div class="header_right">
		<c:if test="${empty login}">
			<div class="login"><a href="${cpath }/member/login">로그인</a></div>
		</c:if>	
		<c:if test="${not empty login}">			
			<div class="logout"><a href="${cpath }/member/mypage">마이페이지</a></div>
			<div class="logout"><a href="${cpath }/member/logout">로그아웃</a></div>
		</c:if>	
	</div>
</div>

<div class="hamburger">
	<div class="menu hidden"></div>
</div>

</body>
</html>