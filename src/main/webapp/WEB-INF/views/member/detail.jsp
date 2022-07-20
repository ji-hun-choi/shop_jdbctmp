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
    <script>
        window.onload = () => {
            let radio = null;
            if(${m.mem_type}){
                radio = document.getElementById("mem2");
            }else{
                radio = document.getElementById("mem1");
            }
            radio.checked = true;
        }
    </script>
</head>
<body>
<h3>상세페이지</h3>
<form action="/member/edit" method="post">
    <table border="1">
        <tr><th>구매형태</th><td><input type="radio" id="mem1" name="type" value="false" disabled>구매자
            <input type="radio" name="type" id="mem2" value="true" disabled>판매자</td></tr>
        <tr><th>id</th><td><input type="text" name="id" value="${m.id}" readonly></td></tr>
        <tr><th>pwd</th><td><input type="text" name="pwd" value="${m.pwd}"></td></tr>
        <tr><th>tel</th><td><input type="text" name="tel" value="${m.tel}"></td></tr>
        <tr><th>addr</th><td><input type="text" name="addr" value="${m.addr}"></td></tr>
        <tr><th>수정</th><td colspan="2">
            <input type="submit" value="수정">
            <a href="/">메뉴로 돌아감</a></td> </tr>
    </table>
</form>
</body>
</html>
