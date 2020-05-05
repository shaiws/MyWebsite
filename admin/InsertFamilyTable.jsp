<%@page import="jdbc.ForDataBase"%>

<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML>
<jsp:useBean id="db" class="jdbc.ForDataBase" />

<html dir="rtl">
<head>
<jsp:include page="../menu.jsp"></jsp:include>
<title>���� �����</title>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>
	<form action="InsertFamilyTable.jsp" method="post">
		<table>
			<tr>
				<th>��:</th>
				<th><input type="text" name="name" id="name" size="27">
				</th>
			</tr>
			<tr>
				<th>����� ������:</th>
				<th><input type="text" name="status" id="status" size="27">
				</th>
			</tr>
			<tr>
				<th>�����:</th>
				<th><textarea rows="10" cols="20" style="width: 194px;"
						name="description" id="description"></textarea></th>
			</tr>

			<tr>
				<th>����� ����:</th>
				<td><input type="date" name="DateOfBirth" id="DateOfBirth"></td>
			</tr>
			<tr>
				<th>�����:</th>
				<th><input type="text" name="Picture" id="Picture" size="27">
				</th>
			</tr>
		</table>

		<input type="submit">
	</form>

	<%
		if (request.getMethod().equals("POST")) {
		String FullName = request.getParameter("name");
		PreparedStatement pst = null;
		String query = "select * from family where Name=?";
		pst = db.preparedStatement(query);
		pst.setString(1, FullName);
		String[][] result = db.select(pst);
		if (result.length == 0) {
			String DateOfBirth = request.getParameter("DateOfBirth");
			String Status = request.getParameter("status");
			String description = request.getParameter("description");
			String info = request.getParameter("description");
			String Picture = request.getParameter("Picture");
			query = "insert into family values(null,?,?,?,?,?);";
			pst = db.preparedStatement(query);
			pst.setString(1, FullName);
			pst.setString(2, Status);
			pst.setString(3, info);
			pst.setString(4, DateOfBirth);
			pst.setString(5, Picture);
			db.insertUpdateDelete(pst);
		}
	}
	%>


	<h1>�����</h1>
	<table border="2">
		<tr>
			<th>ID</th>
			<th>��</th>
			<th>�����</th>
			<th>�����</th>
			<th>��� ����</th>
			<th>�����</th>


		</tr>
		<%
			PreparedStatement pst = null;
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
		out.print("<h1>���� �����</h1>");
	}
	%>
</body>
</html>