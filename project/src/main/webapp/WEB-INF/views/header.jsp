<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<style>
* {
  box-sizing: border-box;
}

html,
body {
  height: 100%;
}

body {
/*   display: flex; */
  margin: 0;
  background-color: #f5f6f7;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.wrap {
  margin: auto;
}

.wrap .logo {
  text-align: center;
  margin-bottom: 10px;
}

.wrap .logo h1 {
  margin: 0;
  font-size: 50px;
}

.wrap .contents {
  padding: 50px;
  background-color: #ffffff;
  border: 1px solid #dadada;
  border-radius: 5px;
  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
}

#formAll {
  margin: 0 auto;
  width: 460px;
  font-size: 14px;
    max-width: 460px;
    width: auto;
}

#formAll .termsCheckAll {
  display: flex;
  margin-bottom: 35px;
}

#formAll .termsCheckAll label {
  margin-left: 3px;
  text-decoration: underline;
}

.termsList .termsBox {
  margin: 20px 0;
}

.contents label {
  font-weight: 700;
}

 label.required::after { 
   margin-left: 4px; 
   font-size: 13px; 
   font-weight: 400; 
   line-height: 24px; 
   color: #0086ff; 
   content: "(필수)"; 
 } 
 label.required1::after { 
   margin-left: 4px; 
   font-size: 13px; 
   font-weight: 400; 
   line-height: 24px; 
   color: #808080; 
   content: "(선택)"; 
 } 
.termsList .termsContent {
  height: 88px;
  overflow: auto;
  margin-top: 8px;
  padding: 12px;
  border: 1px solid #dadada;
  background: #fff;
  font-size: 12px;
}

.nextBtn {
  width: 100%;
  height: 40px;
  outline: none;
  cursor: pointer;
  background-color: #242222;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  transition-duration: 0.2s;
}

.nextBtn:hover:enabled {
  background-color: #a3a2a2;
}

.nextBtn:disabled {
  opacity: 0.2;
  cursor: not-allowed;
}

@media (max-width: 768px) {
  .wrap {
    min-width: 280px;
    padding: 20px;
  }
}
.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}

</style>
</head>
<body>

