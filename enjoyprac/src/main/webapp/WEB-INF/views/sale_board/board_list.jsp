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
<script type="text/javascript">
	var d = new Date("YYYY-MM-DD");
	document.getElementById("date").innerHTML=d;

</script>

	<table border="1 solid #333">

		<tr>
			<td>SBCODE</td>
			<td>SBTITLE</td>
			<td>SBPIC</td>
			<td>BUID</td>
			<td>SBLOC</td>
			<td>SBPRICE</td>
			<td>Writing DATE</td>

		</tr>
		<c:forEach items="${boardlist }" var="dto">
			<tr>

				<td>${dto.sbcode }</td>
				<td>${dto.sbtitle }</td>
				<td><a href="sbcontent_view?id=${id }&wid=${dto.buid}&sbcode=${dto.sbcode}">${dto.sbpic }</a></td>
				<td>${dto.buid}</td>
				<td>${dto.sbloc}</td>
				<td>${dto.sbprice}</td>
				<td><a id="date">${dto.sbdate }</a></td>

			</tr>
		</c:forEach>


		<%-- <c:if test="${checkid == 1}">
			<tr>
				<td colspan="7"><a href="board_write_view?buid=bguest1">writing!!</a></td>
			</tr>
		</c:if> --%>
		
			<tr>
				<c:if test="${cookie.usr_bid != null }"> 
				<td colspan="7"><a href="/board_write_view?buid=${cookie.usr_bid.value }">You can write!!! ${cookie.usr_bid.value} 님</a></td>
				</c:if>
			</tr>
		

	</table>





</body>
</html>