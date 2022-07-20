<%--
  Created by IntelliJ IDEA.
  User: chlwl
  Date: 2022-07-20
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>멤버리스트</h3>
<a href="/">메뉴로 이동</a><br/>
<table border="1">
    <tr><th>id</th><th>pwd</th><th>mem_type</th><th>tel</th><th>addr</th></tr>
    <c:forEach var="m" items="${list}">
        <tr><td>${m.id}</td><td>${m.pwd}</td><td>${m.mem_type}</td>
        <td>${m.tel}</td><td>${m.addr}</td></tr>
    </c:forEach>
</table>
</body>
</html>
