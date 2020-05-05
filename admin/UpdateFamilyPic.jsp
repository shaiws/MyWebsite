<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<%@ page import="java.sql.*"%>


<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>עדכון תמונה</title>
<jsp:include page="../menu.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>


	<form action="UpdateFamilyPic.jsp" method="post">
		<table>
			<tr>
				<td>תמונה חדשה</td>
				<td><input type="file" name="pic" id="pic">
			</tr>
			<tr>
				<td>מספר</td>
				<td><input type="text" name="id" id="id">
			</tr>
		</table>
		<input type="submit" value="עדכן">
	</form>
	<%
		if (request.getMethod().equals("POST")) {

		String Picture = request.getParameter("pic");
		String id = request.getParameter("id");
		PreparedStatement pst = db.preparedStatement("update family set Picture =? where id =?");
		pst.setString(1, Picture);
		pst.setString(2, id);
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
			out.println("<td align='center'><img src='../img/" + result[i][j] + "' width='100'/></td>");
				else
			out.println("<td style='max-width: 400px;'  style='max-height: 100000000px;'>" + result[i][j] + "</td>");
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