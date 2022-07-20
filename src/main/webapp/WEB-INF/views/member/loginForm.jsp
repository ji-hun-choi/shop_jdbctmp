<%--
  Created by IntelliJ IDEA.
  User: chlwl
  Date: 2022-07-13
  Time: 오후 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>로그인</h3>
${msg}<br/>
<form action="/member/login" method="post">
    <table style="border: solid 1px black">
        <tr><th>id</th><td><input type="text" name="id"></td></tr>
        <tr><th>pwd</th><td><input type="password" name="pwd"></td></tr>
        <tr><th>로그인</th><td><input type="submit" value="로그인">
            <a href="join">회원가입</a> </td></tr>
    </table>
</form>
</body>
</html>
