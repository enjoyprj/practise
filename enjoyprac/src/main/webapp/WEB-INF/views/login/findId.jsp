<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>this is findId page</h3>
<form action="#">
<label>이름</label><br><input type="text" name="cuid"><br>
<label>연락처</label><br><input type="text" name="cutel"><br>
<label>주민번호(뒷자리 한자리까지)</label><br>
<input type="text" name="cubirth" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
<label>-</label><input type="text" 	
 style="width:20px"/>
<label>******</label><br>
<input type="submit" value="찾기">
</form>
</body>
</html>