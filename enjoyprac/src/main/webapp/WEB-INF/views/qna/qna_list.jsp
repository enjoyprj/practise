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
		<h3>qnalist</h3>
	<form action="" method="post">
		
		<table border="1 solid #333">

			<tr>
				<td>글번호</td>
				<td>제목</td>		
				<td>작성자</td>

			</tr>
			<c:forEach items="${qnalist }" var="dto">
				<tr>

					<td>${dto.qanum }</td>
					<td><a href="qnacontent_view?num=${dto.qanum }">${dto.qatitle }</a></td>
					<td>${dto.cuid }</td>

				</tr>
			</c:forEach>
			<tr>
			<td colspan="3"><a href="qna_write_view?sbcode=${sbcode	 }">QnA 작성하기</a></td>
			</tr>
		</table>



	</form>
</body>
</html>