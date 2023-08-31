<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>

<table>
    <thead>
        <tr>
            <th>제목</th>
            <th>장소</th>
            <th>지역</th>
            <th>내용</th>
            <th>축제 카테고리</th>
        </tr>
    </thead>

    <c:forEach var="dto" items="${list}">
        <tr class="favorites-row">
            <td>
                <div class="item">${dto.title}</div>
            </td>
            <td>
                <div class="item">${dto.region}</div>
            </td>
            <td>
                <div class="item">${dto.period}</div>
            </td>
            <td>
                <div class="item">${dto.content}</div>
            </td>
            <td>
                <div class="item">${dto.festival_category}</div>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
