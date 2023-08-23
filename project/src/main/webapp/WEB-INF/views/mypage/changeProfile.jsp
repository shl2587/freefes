<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>
<%@include file="../header.jsp" %>

<h3>프로필 변경</h3>

<form method="POST" enctype="multipart/form-data" >

<img src="${login.profile_img }" width="200">

<p>
   <div class="img">
   <input type="file" name="upload" multiple> 
   <input type="hidden" name="upload" value="${login.upload }">
   <input type="hidden" name="profile_img" value="${login.profile_img }">
   </div>
</p>

</body>
</html>