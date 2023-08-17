<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/style.css">
</head>
<body>
<h1><a href="${cpath }">Home</a></h1>


<div class="admin_board_header"><h2>고객센터</h2></div>
<div class="admin_board_menubar">
	<div><a href="${cpath }/admin_board">공지사항</a></div>
	<div><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></div>
	<div><a href="${cpath }/admin_board/surround">주위시설</a></div>
	<div><a href="${cpath }/qna/qna_list">1:1문의함</a></div>
</div>



<h3>version : ${version }</h3>