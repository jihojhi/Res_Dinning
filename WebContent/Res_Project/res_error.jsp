<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background: whitesmoke;">

<div align="center">
	
	<h2>예약 처리 에러</h2>
	<hr>
	<table cellpadding="5" width="400">
		<tr width ="100%" bgcolor="#FFC0CB" > 
			<td align="center">
				예약 처리중에 에러가 발생하였습니다.<br>
				관리자에게 문의 바랍니다.<br>
				Tel : 02-0000-0000<br>
				<hr>
				에러내용 : <%= exception %> 
			</td>
		</tr>
	</table>

</div>

</body>
</html>