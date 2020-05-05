<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="db" class="jdbc.ForDataBase" />
<html dir="rtl">
<head>
<link rel="stylesheet" type="text/css" href="tables.css">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>מחיקת בני משפחה</title>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>
	<jsp:include page="../menu.jsp"></jsp:include>
	<form action="deleteFamily.jsp" method="post">
		<table>
			<tr>
				<td>
				<td>ID</td>
				<td><input type="text" id="id" name="id"><br /></td>

			</tr>

		</table>
		<input type="submit" value="מחיקה">

	</form>

	<%
		if (request.getMethod().equals("POST")) {
		String id = request.getParameter("id");
		PreparedStatement pst = db.preparedStatement("delete from family where id=?");
		pst.setString(1, id);
		int num = db.insertUpdateDelete(pst);
		if (num > 0) {
	%>

	<script>
		alert("נמחק!");
	</script>

	<%
		} else {
	%>
	<script>
		alert("לא קיים ID זה!");
	</script>

	<%
		}
	}
	%>
	<h1>טבלת המשפחה</h1>
	<div class="CSS_Table_Example">
		<table border="1">
			<tr>
				<th>מספר</th>
				<th>שם</th>
				<th>תפקיד במשפחה</th>
				<th>תאריך לידה</th>
				<th>תיאור</th>
				<th>תאריך לידה</th>
				<th>תמונה</th>
			</tr>
			<%
				String[][] result = db.select(db.preparedStatement("select * from family"));
			int j, i;
			for (i = 0; i < result.length; i++) {

				out.println("<tr>");
				for (j = 0; j < result[i].length; j++) {
					if (j == 5)
				out.println("<td align='center'><img src='../img/" + result[i][j] + "' width='200'/></td>");
					else
				out.println("<td style='max-width: 2000px;'  style='max-height: 100000000px;'>" + result[i][j] + "</td>");
				}
				out.println("</tr>");
			}
			%>
		</table>
	</div>
	<form action="ipusFamily.jsp">
		<input type="submit" value="איפוס">
	</form>
	<%
		} else {
		out.print("<h1>גישה חסומה</h1>");
	}
	%>
</body>
</html>
