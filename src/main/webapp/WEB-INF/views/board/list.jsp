<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
const a = (num) => {
	//1. 비동기 요청 객체 생성
	const xhttp = new XMLHttpRequest();
	
	//핸들러 등록: 요청에 대한 응답이 왔을때 자동 호출될 함수 등록
	xhttp.onload = function() {
	  // 응답 처리 내용  
	  if(xhttp.status==200){
		  let resVal = xhttp.responseText;//텍스트 응답 {"num":3, "w_date":2022-03-02, "writer":"aaa", "title":...}
		  //alert(resVal);
		  let obj = JSON.parse(resVal);//응답 값을 json으로 파싱
		  let div = document.getElementById("detail");
		  let html = num+"번글 상세내용<br/>";
		  html += "num:"+obj.num+"<br/>";
		  html += "w_date:"+obj.w_date+"<br/>";
		  html += "writer:"+obj.writer+"<br/>";
		  html += "title:"+obj.title+"<br/>";
		  html += "content:"+obj.content+"<br/>";
		  div.innerHTML = html;
	  }else{
		  alert(xhttp.status);//응답코드. 200이 정상.
	  }
	}
	//2. 요청 객체 오픈. 요청 설정. 서버 페이지경로. 비동기(true)/동기(false)
	xhttp.open("GET", "/board/getByNum?num="+num, true);
	//3. 요청 전송
	xhttp.send();
}

const b = () => {
	let div = document.getElementById("detail");
	div.innerHTML = "";
}

const del = (num) =>{
    location.href = "/board/delete?num="+num;
}

const search = (x) => {
    document.f2.action = "/board/getby"+x ;
    document.f2.submit();
}
</script>
</head>
<body>
<h3>글목록</h3>
<c:if test="${not empty sessionScope.id }">
<a href="/board/add">글작성</a><br/>
</c:if>

<form action="" method="post" name="f2">
    <table border="2">
        <tr>
            <th>검색</th><td>
            <select name="s1">
                <option value="title">제목으로 검색</option>
                <option value="writer">작성자로 검색</option>
            </select></td>
        </tr>
        <tr>
            <th>내용</th><td><input type="text" name="val"></td><td><input type="button" value="검색" onclick="search(this.form.s1.value)"></td>
        </tr>
    </table>
</form>

<table border="1">
<tr><th>num</th><th>title</th><th>writer</th></tr>
<c:forEach var="b" items="${list }">
<tr>
<td>${b.num }</td>
    <td onmouseover="a('${b.num}')" onmouseout="b()">
        <c:if test="${sessionScope.id==b.writer}"><a href="/board/detail?num=${b.num}"></c:if>${b.title }
            <c:if test="${sessionScope.id==b.writer}"></a></c:if> </td>
    <td>${b.writer }</td>
    <c:if test="${sessionScope.id==b.writer}"><td><input type="button" onclick="del('${b.num}')" value="삭제"></td></c:if>
</tr>
</c:forEach>
</table>
<div id="detail" style="position:absolute;top:250px;left:300px"></div>
</body>
</html>