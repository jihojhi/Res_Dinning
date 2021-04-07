<%@page import="res.reserve.ReserveInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	request.setCharacterEncoding("utf-8");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONTROL</title>
</head>
<body>

	<jsp:useBean id="res" class="res.reserve.ReserveDAO" scope="page" />
	<jsp:useBean id="info" class="res.reserve.ReserveInfo" />
	<jsp:setProperty property="*" name="info" />

	<%
		String action = request.getParameter("action");

		// 예약 초기화면
		if (action.equals("list")) {

			// 예약하기, 예약조회 선택 창 (기본화면)
			pageContext.forward("reserve_list.jsp");

		}
		// 신규 예약 등록 : insertDB()
		else if (action.equals("insert")) {

			if (res.insertDB(info)) {

				response.sendRedirect("res_control.jsp?action=list");

			} else {

				throw new Exception("데이터 베이스 입력 오류");

			}

		}
		// 예약 수정 전 확인 : getDB()
		else if (action.equals("edit")) {

			String id = request.getParameter("id");
			info.setId(id);
			
			System.out.print(res.getDB(id));
			

			//입력된 아이디가  ArrayList에 존재 하지 않을경우
			if (res.getDB(id).getDate()==null) {

				out.print("<script>alert('해당 예약이 없습니다.'); history.go(-1);</script>");

			} else {

				ReserveInfo getinfo = res.getDB(id);
				request.setAttribute("RES", getinfo);
				pageContext.forward("reserve_edit_form.jsp");
			}

		}

		// 예약 내역 수정 : updateDB
		else if (action.equals("update")) {

					
			String id = request.getParameter("id");
			String date = request.getParameter("date");
			String number = request.getParameter("number");
			String time = request.getParameter("time");
			String askfor = request.getParameter("askfor");

			info.setId(id);
			info.setDate(date);
			info.setNumber(number);
			info.setTime(time);
			info.setAskfor(askfor);

			if (res.updateDB(info)) {

				response.sendRedirect("res_control.jsp?action=list");

			} else {

				throw new Exception("데이터 베이스 갱신 오류");

			}

		}
		// 예약 삭제 : deleteDB
		else if (action.equals("delete")) {

			String id = request.getParameter("id");

			if (res.deleteDB(id)) {

				response.sendRedirect("res_control.jsp?action=list");

			} else {

				throw new Exception("데이터 베이스 삭제 오류");

			}

		}
		// 모든 예약 내역 조회 (관리자 권한) : getDBList()
		else if (action.equals("adminlist")) {

			// 관리자 코드 : adminlogin 입력시에만 실행
			if (!request.getParameter("admin").equals("adminlogin")) {

				out.print("<script>alert('관리자 코드가 틀렸습니다.'); history.go(-1);</script>");
				out.print("아");

			} else {

				pageContext.forward("reserve_all_list.jsp");

			}

		}
	%>

</body>
</html>