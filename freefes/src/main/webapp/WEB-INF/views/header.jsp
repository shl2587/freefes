<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<!-- css -->
<link rel="stylesheet" href="${cpath }/resources/css/header.css" type="text/css" />
<link rel="stylesheet" href="${cpath }/resources/css/admin_board.css" type="text/css" />
<link rel="stylesheet" href="${cpath }/resources/css/qna_board.css" type="text/css" />
<link rel="stylesheet" href="${cpath }/resources/css/member.css" type="text/css" />
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
<!-- css 끝 -->
<meta charset="UTF-8">
<title>freefes</title>
</head>
<body>
<!-- js -->
<script>
	const cpath = "${cpath}";
</script>
<script defer src="${cpath }/resources/js/message.js"></script>
<script src="${cpath }/resources/js/qna_board.js"></script>
<script defer src="${cpath }/resources/js/admin_board.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--  js 끝 -->
<div class="header_wrap">
<header>
		<div id="homepage_logo">
			<a href="${cpath }"><input type="image" 
				src="${cpath }/resources/image/로고.png" height="130px"></a>
		</div>
		<div class="header1">
			<c:if test="${empty login}">
				<a href="${cpath }/member/login">login</a>
			</c:if>
			<c:if test="${not empty login}">
				<a href="${cpath }/member/logout">logout</a>
				<c:if test="${login.role > 0 }">
					<a href="${cpath }/member/mypage/mypage/${login.idx }">mypage</a>
				</c:if>
				<c:if test="${login.role == 0 }">
					<a href="${cpath }/admin_board/management_page">manager-page</a>
				</c:if>
			</c:if>
		</div>
		<div class="header2">
			<ul>
				<li><a href="${cpath }/">축제일정</a></li>
				<li><a href="${cpath }/fes_board/fes_board_list">축제게시판</a></li>
				<li><a href="${cpath }/admin_board/admin_board">고객센터</a></li>
			</ul>
		</div>
</header>
</div>


