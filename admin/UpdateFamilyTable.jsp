<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE HTML>
<%@ page import="java.sql.*"%>
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
	%>
	<form action="UpdateFamilyTable.jsp" method="post">
		<table>
			<tr>
				<th>שם:</th>
				<th><input type="text" name="name" id="name" size="27">
				</th>
			</tr>
			<tr>
				<th>תפקיד במשפחה:</th>
				<th><input type="text" name="status" id="status" size="27">
				</th>
			</tr>

			<tr>
				<th>תאריך לידה:</th>
				<td><input type="date" name="DateOfBirth" id="DateOfBirth"></td>
			</tr>

			<tr>
				<td>מספר</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
		</table>

		<input type="submit">
	</form>

	<%
		if (request.getMethod().equals("POST")) {
		String FullName = request.getParameter("name");
		String id = request.getParameter("id");
		String DateOfBirth = request.getParameter("DateOfBirth");
		String MonthOfBirth = request.getParameter("MonthOfBirth");
		String YearOfBirth = request.getParameter("YearOfBirth");
		String Status = request.getParameter("status");
		PreparedStatement pst = db.preparedStatement("update family set Name=?,Status=?,DateOfBirth=? where id =?");
		pst.setString(1, FullName);
		pst.setString(2, Status);
		pst.setString(3, DateOfBirth);
		pst.setString(4, id);
		db.insertUpdateDelete(pst);

	}
	%>
	<h1>משפחה מעודכנת</h1>
	<table border="1">
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
				if (j == 5)
			out.println("<td align='center'><img src='../img/" + result[i][j] + "' width='200'/></td>");
				else
			out.println("<td style='max-width: 2000px;'  style='max-height: 100000000px;'>" + result[i][j] + "</td>");
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