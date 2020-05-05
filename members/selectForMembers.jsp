<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:useBean id="db" class="jdbc.ForDataBase" />

<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>ן¿½ן¿½ן¿½ן¿½ן¿½ ן¿½ן¿½ן¿½ן¿½ן¿½ן¿½ן¿½</title>
<jsp:include page="../menu.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("member")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>
	<h1>רשימת משתמשים</h1>
	<table border="2">
		<tr>
			<th>שם מלא</th>
			<th>שנת לידה</th>
			<th>אימייל</th>


		</tr>
		<%
			String[][] result = db.select(db.preparedStatement("select FullName ,DateOfBirth ,Email  from users"));
		int j, i;
		for (i = 0; i < result.length; i++) {

			out.println("<tr>");
			for (j = 0; j < result[i].length; j++) {
				out.println("<td>" + result[i][j] + "</td>");
			}
			out.println("</tr>");
		}
		%>
	</table>
	<%
		} else {
		out.print("<h1>הרשם לאתר על מנת להכנס לדף זה</h1>");
	}
	%>
</body>
</html>