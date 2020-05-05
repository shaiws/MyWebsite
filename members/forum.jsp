<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
<jsp:include page="../menu.jsp"></jsp:include>
</head>
<body>

	<%
		request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");
	%>

	<a href='addComment.jsp'>הוסף הודעה</a>
	<table border="1" width="100%">
		<tr>

			<th>הודעה</th>
			<th>שם</th>
			<th>תאריך</th>
			<th>שעה</th>
			<th>לחץ</th>

		</tr>
		<%
			String id = request.getParameter("id");
		String[][] result = db.select(db.preparedStatement("select * from forum where nMes=0"));
		int j, i;
		for (i = 0; i < result.length; i++) {

			out.println("<tr>");
			for (j = 2; j < result[i].length; j++) {

				out.println("<td style='max-width: 100px'>" + result[i][j] + "</td>");
			}
			out.println("<td><a href='forum.jsp?id=" + result[i][0] + "' >לחץ פה על מנת להגיב להודעה</a></td>");
			out.println("</tr>");

			if (id != null && id.equals(result[i][0])) {

				out.println("<tr><td>");
				out.println("<a href='addComment2.jsp?c=" + result[i][0] + "'>הוסף תגובה להודעה</a><br/><br/>");
				PreparedStatement pst = db.preparedStatement("select * from forum where nMes=?");
				pst.setString(1, id);
				String[][] result2 = db.select(pst);
				int k, v;
				for (k = 0; k < result2.length; k++) {

			for (v = 2; v < result2[k].length; v++) {
				if (v == 2) {
					out.println("תגובה:    " + result2[k][v] + "<br/>");

				}
				if (v == 3) {
					out.println("שם משתמש:    " + result2[k][v] + "<br/>");

				}
				if (v == 4) {
					out.println("תאריך:    " + result2[k][v] + "<br/>");

				}
				if (v == 5) {
					out.println("שעה:    " + result2[k][v] + "");

				}
			}
			out.print("<br/>______________________________________________<br/><br/>");

				}
				out.println("</td></tr>");

			}
		}
		%>
	</table>
</body>
</html>