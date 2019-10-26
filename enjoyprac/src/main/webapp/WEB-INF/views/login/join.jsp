<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> this is join page</h3>
	<form action="joinProc" method="post">
		<label>아이디</label>
		<input type="text" name="cuid">
		<input type="button" value="중복확인"><br>
		<label>비밀번호</label>
		<input type="text" name="cupw"><br>
		<label>비밀번호 확인</label>
		<input type="text" name="cupw2"><br>
		<label>이름</label>
		<input type="text" name="cuname"><br>
		<label>성별</label>
		<input type="text" name="cugender"><br>
		<label>생년월일</label>
		<select name="cuyear">
			<option value="" selected>년도</option>
			<c:forEach var="i" begin="0" end="50">
			<c:forEach var="j" begin="99" end="99">
			<option value="${j-i}">${j-i}</option>
			</c:forEach>
			</c:forEach>
		</select>
		<select name="cumonth">
			<option value="" selected>월</option>
			<c:forEach var="i" begin="01" end="12">
			<option value="${i }">${i }</option>
			</c:forEach>
		</select>
		<select name="cuday">
			<option value="" selected>일</option>
			<option value="" selected>월</option>
			<c:forEach var="i" begin="01" end="30">
			<option value="${i }">${i }</option>
			</c:forEach>
		</select><br>
	
		<label>주소</label>
		<input type="text" name="cuaddr"><br>
		<label>연락처</label>
		<input type="tel" name="cutel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"><br>
		<label>이메일</label>
		<input type="email" name="cuemail"><br>
		
		<input type="submit" value="회원가입">
		
		<input type="button" value="취소">
	</form>
</body>
</html>