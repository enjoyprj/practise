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
	<script>		
		function del_auth() {
		var delnum=${numnum};
		if (${ty.cuid == cookie.usr_cid.value}) {			
			alert("삭제가능합니다.")
		 	location.href="qnadelete?num="+delnum;			 
		}else {
			alert("권한이 없습니다.")
			}
		}; 
		function modify_auth() {
			if (${ty.cuid == cookie.usr_cid.value}) {			
				alert("수정가능합니다.")
			 	/* location.href="qnadelete?num="+delnum; */	 	
			}else {
				alert("권한이 없습니다.")s
				}
			}; 
	</script>
	<table border="1 solid #fff" width="200px">
		<tr>
			<td>글번호</td>
			<td>${numnum }</td>

		</tr>
		<tr>
			<td>내용</td>
			<td>${ty.qacontent }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${ty.cuid }</td>
		</tr>
		<tr>
			<td colspan="2">
				<button  onclick="javascript:del_auth()">삭제하기</button> &nbsp;&nbsp;
				<button  onclick="javascript:modify_auth()">수정하기</button>
			</td>
		</tr>

	</table>
	<a href="answer">답글달기 </a>
	<a href="qna_list">QNA List</a>
</body>
</html>