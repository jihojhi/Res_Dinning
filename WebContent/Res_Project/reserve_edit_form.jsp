<%@page import="res.reserve.ReserveInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDIT_FORM</title>
<link rel="stylesheet" type="text/css" href="res_reserve.css" media="screen">
<script type="text/javascript">

   function deletechk() {
	   
      result = confirm("정말 삭제하시겠습니까?");
      
      if(result) {
    	  
         document.frm.action.value ="delete";
         
         document.frm.submit();
         
      }
   }
</script>

</head>
<body>
	
	<jsp:useBean id="res" class="res.reserve.ReserveDAO" scope="request"/>
	<jsp:useBean id="info" class="res.reserve.ReserveInfo" scope="request"/>

	<%
	Object obj = request.getAttribute("RES");
	ReserveInfo temp = (ReserveInfo)obj;
	
	System.out.println(temp.getId());
	
	%>
	
	<div id="header">
	
		<div id="rest"><a href="Main.html">REST</a></div>
		
			<!-- 마우스 올릴시 이미지 이벤트 -->
			<div id="menu1"><a href="reserve_Index.jsp">Reservation</a></div>
			<div id="menu2"><a href="Menu.html">Menu</a></div>
			<div id="menu3"><a href="Aboutus.html">About Us</a></div>
	</div>

<form action="res_control.jsp" name="frm" method="post" enctype="utf-8">

	<input type="hidden" name="id" value="<%= temp.getId()%>">
	<input type="hidden" name="action" value="update">

<div align="center" id="reserve">

	<table border="1">
			<tr>
				<th colspan="2">&hearts; <%= temp.getId() %>님의 예약정보 &hearts;
			<tr>
				<th>예약날짜
				<td><input type="date" name="date" value="<%= temp.getDate()%>">
			<tr>
				<th>예약인원
				<td><input type="text" name="number" value="<%= temp.getNumber()%>">
			<tr>
				<th>예약시간
				<td><input type="text" name="time" value="<%= temp.getTime()%>">
			<tr>
				<th>요청사항
				<td><input type="text" name="askfor" value="<%= temp.getAskfor()%>">
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
				<input type="button" value="삭제" onclick="deletechk()">
	
	</table>

</div>



</form>

</body>
</html>