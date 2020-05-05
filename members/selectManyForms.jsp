<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
<jsp:include page="../menu.jsp"></jsp:include>

</head>

<body>

	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");

		String[][] result = null;
		PreparedStatement pst = null;
		if (request.getParameter("f2") != null) {
			String FullName = request.getParameter("FullName");
			pst = db.preparedStatement("select FullName,DateOfBirth,Gender,Email from family where FullName=?");
			pst.setString(1, FullName);
			result = db.select(pst);
		} else if (request.getParameter("f3") != null) {
			String FullName = request.getParameter("FullName");
			String DateOfBirth = request.getParameter("DateOfBirth");
			if (DateOfBirth.equals(""))
		DateOfBirth = "33333";
			pst = db.preparedStatement(
			"select FullName,DateOfBirth,Gender,Email from family where FullName=? or DateOfBirth=?");
			pst.setString(1, FullName);
			pst.setString(2, DateOfBirth);
			result = db.select(pst);
		} else if (request.getParameter("f4") != null) {
			String minborn = request.getParameter("minborn");
			String maxborn = request.getParameter("maxborn");
			if (minborn.equals(""))
		minborn = "33333";
			if (maxborn.equals(""))
		maxborn = "33333";
			pst = db.preparedStatement(
			"select FullName,DateOfBirth,Gender,Email from family where DateOfBirth>=? and DateOfBirth<=?");
			pst.setString(1, minborn);
			pst.setString(2, maxborn);
			result = db.select(pst);
		} else if (request.getParameter("f5") != null) {
			result = db.select(
			db.preparedStatement("select FullName,DateOfBirth,Gender,Email from family order by DateOfBirth desc"));
		} else if (request.getParameter("f6") != null) {
			result = db
			.select(db.preparedStatement("select FullName,DateOfBirth,Gender,Email from family order by FullName"));
		} else if (request.getParameter("f7") != null) {
			String FullName = request.getParameter("FullName");
			pst = db.preparedStatement("select FullName,DateOfBirth,Gender,Email from family where FullName like %?%");
			pst.setString(1, FullName);
			result = db.select(pst);
		} else
			result = db.select(db.preparedStatement("select FullName,DateOfBirth,Gender,Email from family"));
	%>
	<table width=100% border="2">
		<tr>
			<td>
				<h3>Type the values for search</h3> <br />
			<br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit" value="�� �������">
					</form>
				</div> <br />
			<br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						�� ����:<input type="text" name="FullName"><br />
						<input type="submit" value="���" name="f2"><br />
					</form>
				</div> <br />
			<br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						�� ���� :<input type="text" name="FullName"> <br />
						�� <br /> ��� ���� :<input type="text"
							name="DateOfBirth"><br /> <input type="submit"
							value="���" name="f3"><br />

					</form>
				</div> <br />
			<br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						��� �����:<input type="text" name="minborn"><br />
						<br /> ��� ����:<input type="text" name="maxborn"><br />
						<input type="submit" value="���" name="f4"><br />
					</form>
					<br />
					<br />
				</div> <br />
			<br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit"
							value="���� ��-�� ��� ����"
							name="f5"><br />
					</form>
				</div> <br />
			<br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit" value="���� ��� ��"
							name="f6"><br />
					</form>
				</div> <br />
			<br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						����� �� �� ��� ������:<input
							type="text" name="FullName"><br /> <input type="submit"
							value="���" name="f7">
					</form>
				</div>
			</td>
			<td valign="top">
				<h1>The table of clients</h1>
				<table border="1">
					<tr>
						<th>�� ���</th>
						<th>��� ����</th>
						<th>���</th>
						<th>���"�</th>

					</tr>

					<%
						int j, i;
					for (i = 0; i < result.length; i++) {

						out.println("<tr>");
						for (j = 0; j < 3; j++) {

							for (j = 0; j < result[i].length; j++) {

						out.println("<td>" + result[i][j] + "</td>");
							}
						}
						out.println("</tr>");
					}
					%>
				</table>
			</td>
		</tr>
	</table>
	<%
		} else {
		out.print("<h1>���� ���� �� ��� ����� ��� ��</h1>");
	}
	%>
</body>

</body>
</html>