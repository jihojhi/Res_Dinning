<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RESERVE_LIST</title>
<link rel="stylesheet" type="text/css" href="res_reserve.css" media="screen">
<script type="text/javascript">

	function check(){
		
		admin = prompt("관리자 코드를 입력해주세요");
		document.location.href="res_control.jsp?action=adminlist&admin="+admin;
		
	}
	
	function idcheck(){
		
		id = prompt("예약하신 아이디를 입력해주세요");
		document.location.href="res_control.jsp?action=edit&id="+id;
		
	}

</script>
</head>
<body>

<div id="header">
	
		<div id="rest"><a href="Main.html">REST</a></div>
		
			<!-- 마우스 올릴시 이미지 이벤트 -->
			<div id="menu1"><a href="reserve_Index.jsp">Reservation</a></div>
			<div id="menu2"><a href="Menu.html">Menu</a></div>
			<div id="menu3"><a href="Aboutus.html">About Us</a></div>
	</div>
	
	
	<form action="reserve_form.jsp" name="frm">
	<div id="reserve" align="center">
	
		<label><input type="submit" value="예약 하기"></label>
		<!-- 예약한 아이디 입력 후 조회 -->
		<label><input type="button" value="예약 조회" onclick="idcheck()"></label>
		<br><br>
		<label><input type="button" value="전체 예약 조회(관리자)" onclick="check()"></label>
	</div>
	</form>


</body>
</html>