<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALL_LIST</title>
<link rel="stylesheet" type="text/css" href="res_reserve.css" media="screen">
</head>
<body>

	<jsp:useBean id="res" class="res.reserve.ReserveDAO"/>

	<div id="header">
	
		<div id="rest"><a href="Main.html">REST</a></div>
		
			<!-- 마우스 올릴시 이미지 이벤트 -->
			<div id="menu1"><a href="reserve_Index.jsp">Reservation</a></div>
			<div id="menu2"><a href="Menu.html">Menu</a></div>
			<div id="menu3"><a href="Aboutus.html">About Us</a></div>
	</div>





	<div align="center" id="reserve">
	<table border="1">
		<tr>
			<th colspan="5">&hearts; 전체 예약내역 &hearts;
		<tr>
			<th>아이디<th>예약날짜<th>예약인원<th>예약시간<th>요청사항
			<% for(int i =0; i<res.getDBList().size(); i++){ %>
		<tr>
			<td><%= res.getDBList().get(i).getId() %>
			<td><%= res.getDBList().get(i).getDate() %>
			<td><%= res.getDBList().get(i).getNumber() %>
			<td><%= res.getDBList().get(i).getTime() %>
			<td><%= res.getDBList().get(i).getAskfor() %>				
			<% } %>	
			
	</table>
	</div>
</body>
</html>