<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.UserDTO"%>
<%@ page import="users.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
    // 사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
    request.setCharacterEncoding("UTF-8");
    String studentID = request.getParameter("studentID");

    if (studentID == null || studentID.isEmpty()) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('학번을 입력해주세요.')");
        script.println("location.href='login.jsp';");
        script.println("</script>");
        script.close();
        return;
    }

    UserDAO userDAO = new UserDAO();
    String nickname = userDAO.getNicknameByStudentID(studentID);

    if (nickname == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('해당 학번의 닉네임이 없습니다.')");
        script.println("location.href='login.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
%>

<!-- 닉네임을 팝업 창으로 띄우는 JavaScript 코드 -->
<script>
    alert('로그인 성공! 환영합니다. 닉네임: <%= nickname %>');
</script>

<%-- 로그인 성공 시 팝업 창을 띄우고 다시 login.jsp로 리다이렉트 --%>
<%
    response.sendRedirect("login.jsp");
%>
