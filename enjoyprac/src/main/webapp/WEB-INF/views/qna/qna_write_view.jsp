<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>qna_write_view</h3>
		<form action="qna_write" method="post">
		<input type="hidden" name="qid" value="${cookie.usr_cid.value }${cookie.usr_bid.value }">
	<table border="1 solid #fff">
			<tr>
				<td>아이디</td>
				<td><label >${cookie.usr_cid.value }${cookie.usr_bid.value }</label></td>

			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="qtitle"  ></td>

			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="qcontent" rows="10"></textarea></td>

			</tr>



	</table>
	<input type="submit" value="완료">
		</form>
	<a href="qna_list"> 취소</a>
</body>
</html>