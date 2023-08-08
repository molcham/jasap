<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="users.UserDTO"%>
<%@ page import="users.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String studentID = null;
	String nickname = null;

	if (request.getParameter("studentID") != null) {
		studentID = (String) request.getParameter("studentID");
	}

	if (request.getParameter("nickname") != null) {
	    nickname= (String) request.getParameter("nickname");
	}

	if (studentID == null || nickname== null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("</script>");
		script.close();
		return;
	}

	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(studentID,nickname);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='register.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>
