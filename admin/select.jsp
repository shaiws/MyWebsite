<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:useBean id="db" class="jdbc.ForDataBase" />

<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Select</title>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>

	<jsp:include page="../menu.jsp"></jsp:include>
	<h1>משתמשים</h1>
	<table border="2">
		<tr>

			<th>שם פרטי</th>
			<th>מין</th>
			<th>שנת לידה</th>
			<th>אימייל</th>
			<th>שם משתמש</th>
			<th>סיסמה</th>
			<th>תמונה</th>
			<th>ID</th>

		</tr>
		<%
			String[][] result1 = db.select(db.preparedStatement("select * from users"));
		int j, i;
		for (i = 0; i < result1.length; i++) {
			out.println("<tr>");
			for (j = 0; j < result1[i].length; j++) {
				if (j == 6)
			out.println("<td align='center'><img src='../img/" + result1[i][j] + "' width='200'/></td>");
				else if (j == 10) {
			String m = "מורשה";
			if (result1[i][j].equals("0"))
				m = "לא מורשה";
			out.println("<td>" + m + "</td>");
				} else {
			out.println("<td>" + result1[i][j] + "</td>");

				}
			}
			out.println("</tr>");
		}
		%>


	</table>
	<%
		} else {
		out.print("<h1>גישה חסומה</h1>");
	}
	%>
</body>
</html>