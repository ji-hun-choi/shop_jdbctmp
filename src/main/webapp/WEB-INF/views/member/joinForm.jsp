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
        const b = () => {
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                if (xhttp.status==200){
                    let resVal = xhttp.responseText;
                    let obj = JSON.parse(resVal);
                    let msg = "사용 불가능한 아이디";
                    alert(obj.flag);
                    if (obj.flag){
                        msg = "사용 가능한 아이디"
                    } else {
                        document.f1.id.value = "";
                    }
                    console.log(document.documentURI);
                    let res = document.getElementById("res");
                    res.innerHTML = msg;
                } else{
                    alert(xhttp.status);
                }
            }
            xhttp.open("POST", "${pageContext.request.contextPath}/member/IdCheck", true);
            xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded;charset=utf-8');

            let id = document.f1.id.value;
            let param = "id="+id;

            xhttp.send(param);
        }
    </script>
</head>
<body>
<h3>회원가입 페이지</h3>
<form action="/member/join" method="post" name="f1">
    <table style="border: solid 1px black">
        <tr><th>구매형태</th><td><input type="radio" name="type" value="false">구매자
            <input type="radio" name="type" value="true">판매자</td></tr>
        <tr><th>id</th>
            <td>
                <input type="text" name="id">
                <input type="button" value="중복체크" onclick="b()">
                <span id="res"></span>
            </td>
        </tr>
        <tr><th>pwd</th><td><input type="password" name="pwd"></td></tr>
        <tr><th>tel</th><td><input type="text" name="tel"></td></tr>
        <tr><th>addr</th><td><input type="text" name="addr"></td></tr>
        <tr><th>가입</th><td><input type="submit" value="가입"></td></tr>
    </table>
</form>
</body>
</html>
