<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>review_list</h3>
	<form action="review_write_view" method="post">
		<table border="1">
			<tr>
				<td colspan="2"><a href="review_write_view">리뷰 작성</a></td>
			</tr>
			<c:forEach items="${review_list}" var="dto">
				<tr>
					<th>${dto.rvtitle }</th>
					<th>${dto.rvstar}</th>
					<%-- <th><c:set var="rvstar" value="1">
							<c:if test="${dto.rvstar eq '1'}">
								<c:out value="☆☆☆☆★" />
							</c:if>
						</c:set></th> --%>
				</tr>

				<tr>
					<th>${dto.cunum }|${dto.sbcode }</th>
					<th>${dto.rvdate }</th>
				</tr>
				<tr>
					<th colspan="2">${dto.rvcontent}</th>
				</tr>
				<tr>
					<th colspan="2">${dto.rvpic }</th>
				</tr>

				<tr>
					<td colspan="2"><a href="#">더보기</a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="2"><a href="reply_view">답변</a></td>
			</tr>

		</table>
	</form>
</body>
</html>