<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="res_reserve.css" media="screen">

<script type="text/javascript">

	function chk() {
		
		if(!frm.id.value){
			alert("회원번호를 입력해주세요");
			frm.id.focus();
			return false;
		}
		
		if(!frm.date.value){
			alert("날짜를 선택해주세요");
			frm.date.focus();
			return false;
		}

		return true;
		
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
	
	
	<form action="res_control.jsp" name="frm" onsubmit="return chk()">
	
	<input type="hidden" name="action" value="insert">	
	
	<div id="id" align="center">
	
		회원번호 : <input type="text" name="id">
	
	</div>
	
	<div id="reserve">
	
		<div class="box" align="center">
		
			<div id="date">예약 날짜</div>
			<div id="ex"><input type="date" name="date"></div>
		
		
		</div>
		<div class="box" align="center">
		
			<div id="num">예약 인원</div>
			<div id="ex">
		
				<select name="number" size="1">
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>		
				</select>
				
			</div>
				
		</div>
		<div class="box" align="center">
				
			<div id="time">예약 시간</div>
			<div id="ex">
				
				<select name="time" size="1">
					<option value="lunch">Lunch</option>
					<option value="dinner">Dinner</option>		
				</select>
			
			</div>
		
		</div>
		<div class="box" align="center">
			
			<div id="askfor">요청 사항</div>
			<div id="ex"><input type="text" name="askfor" value="없음"></div>
		
		</div>


	</div>
	
	<div id="btn" align="center">
	
		<label><input type="submit" value="예약 확인"></label>
		<label><input type="reset" value="예약 취소"></label>
		
	</div>
	</form>


</body>
</html>