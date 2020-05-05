<%@page import="jdbc.ForDataBase"%>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE HTML>
<jsp:useBean id="db" class="jdbc.ForDataBase" />

<html dir="rtl">
<head>
<jsp:include page="../menu.jsp"></jsp:include>
<title>טבלת משפחה</title>
<body>
	<%
		request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");
	%>


	<h1>משפחה</h1>
	<table border="2" style="width: 100%">
		<tr>
			<th>ID</th>
			<th>שם</th>
			<th>סטטוס</th>
			<th>תיאור</th>
			<th>שנת לידה</th>
			<th>תמונה</th>


		</tr>
		<%
			String[][] result = db.select(db.preparedStatement("select * from family"));
		int j, i;
		for (i = 0; i < result.length; i++) {

			out.println("<tr>");
			for (j = 0; j < result[i].length; j++) {
				if (j == 1)
			out.println("<td><a href='pratim.jsp?id=" + result[i][0] + "' >" + result[i][j] + "</a></td>");

				else if (j == 5)
			out.println("<td align='center'><img src='../img/" + result[i][j] + "' width='200'/></td>");
				else

			out.println("<td style='max-width:200px;'  style='max-height: 100000000px;'>" + result[i][j] + "</td>");
			}
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>