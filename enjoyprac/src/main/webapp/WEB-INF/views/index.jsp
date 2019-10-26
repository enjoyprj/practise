<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>this is index page</h3>
	<%-- <c:if test="${customer!=null }">
[${customer.cuname }]님 로그인 되셨습니다.	
</c:if>
	<c:if test="${business!=null }">
[${business.buname }]님 로그인 되셨습니다.	
</c:if> --%>
<c:if test="${cookie.usr_cid != null }">
[${cookie.usr_cid.value }]님 로그인 되셨습니다.	
</c:if>
	<c:if test="${cookie.usr_bid != null }">
[${cookie.usr_bid.value }]님 로그인 되셨습니다.	
</c:if>

<%-- 	<ul>
		<c:if test="${customer==null && business==null }">
			<li><a href="login">login</a></li>
		</c:if>
		<c:if test="${customer!=null }">
			<li><a href="login">logout</a></li>
		</c:if>
		<c:if test="${business!=null }">
			<li><a href="login">logout</a></li>
		</c:if>
		<c:if test="${customer==null && business == null}">
			<li><a href="board_list">BOARD without LOGIN</a></li>
		</c:if>
		<c:if test="${business!=null }">
			<li><a href="board_list?id=${business.buid }">BOARD</a></li>
		</c:if>
		<c:if test="${customer!=null }">
			<li><a href="board_list?id=${customer.cuid }">BOARD</a></li>
		</c:if>

		<li><a href="enjoy/notice/write">write</a></li>
	</ul> --%>
	<ul>
		<c:if test="${cookie.usr_cid == null && cookie.usr_bid == null }">
			<li><a href="login">login</a></li>
		</c:if>
		<c:if test="${cookie.usr_cid != null }">
			<li><a href="logout">logout</a></li>
		</c:if>
		<c:if test="${cookie.usr_bid != null }">
			<li><a href="logout">logout</a></li>
		</c:if>
		<c:if test="${cookie.usr_cid == null && cookie.usr_bid == null}">
			<li><a href="board_list">BOARD without LOGIN</a></li>
		</c:if>
		<c:if test="${cookie.usr_bid != null }">
			<li><a href="board_list">BOARD</a></li>
		</c:if>
		<c:if test="${cookie.usr_cid != null }">
			<li><a href="board_list">BOARD</a></li>
		</c:if>

		
	</ul>

</body>
</html>