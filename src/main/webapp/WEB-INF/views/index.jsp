<%--
  Created by IntelliJ IDEA.
  User: chlwl
  Date: 2022-07-20
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>

</head>
<body>
<h3>shop</h3>
<a href="/member/list">멤버목록</a>
<c:if test="${empty sessionScope.id }">
    <a href="/member/login">로그인</a>
    <a href="/member/join">회원가입</a>
</c:if>
<c:if test="${not empty sessionScope.id }">
    ${sessionScope.id }님 로그인중 /
    <c:if test="${sessionScope.type==false }">
        당신은 구매자입니다
    </c:if>
    <c:if test="${sessionScope.type}">
        당신은 판매자입니다
    </c:if>
    <a href="/member/detail">내정보확인</a>
    <a href="/member/Logout">로그아웃</a>
    <a href=/member/out">탈퇴</a><br/>
</c:if>

<jsp:include page="/board/"></jsp:include>
</body>
</html>
