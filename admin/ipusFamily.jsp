<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<jsp:include page="../menu.jsp"></jsp:include>

<title>עדכון</title>
</head>
<body>

	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {
		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
		db.insertUpdateDelete(db.preparedStatement("ALTER TABLE family AUTO_INCREMENT = 1"));
		response.sendRedirect("InsertFamilyTable.jsp");
	} else {
		out.print("<h1>גישה חסומה</h1>");
	}
	%>
</body>
</html>