<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>����� ����� �������</title>
<jsp:include page="../menu.jsp"></jsp:include>
</head>
<body>


	<br />
	<br />
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");

		String values[] = request.getParameterValues("id");
		if (request.getMethod().equals("POST")) {
			if (values != null) {
		PreparedStatement pst = null;
		for (int k = 0; k < values.length; k++) {
			pst = db.preparedStatement("delete from users where id=?");
			pst.setString(1, values[k]);
			db.insertUpdateDelete(pst);

		}
		if (values.length == 1)
			out.print("<h5 >���� ���� ���</h5>");
		else
			out.print("<h5 >������  " + values.length + " �����</h5>");
			}
		}
	%>
	<form action="deleteWithCheckBoxes.jsp" method="post">
		<input type="submit" value="��� ������"><br />

		<h1>�������</h1>
		<table border="2">
			<tr>

				<th>�� ����</th>
				<th>���</th>
				<th>��� ����</th>
				<th>������</th>
				<th>�� �����</th>
				<th>�����</th>
				<th>�����</th>
				<th>ID</th>
				<th>��� ������</th>
			</tr>
			<%
				String[][] result = db.select(db.preparedStatement("select * from users"));
			int j, i;
			for (i = 0; i < result.length; i++) {

				out.println("<tr>");
				for (j = 0; j < result[i].length; j++) {
					if (j == 6)
				out.println("<td align='center'><img src='../img/" + result[i][j] + "' width='200'/></td>");
					else
				out.println("<td>" + result[i][j] + "</td>");
				}
				out.println("<td align='center'><input type='checkbox' name='id' id='id' value='" + result[i][7] + "' /></td>");
				out.println("</tr>");
			}
			%>
		</table>





	</form>
	<form action="ipusMember.jsp">
		<input type="submit" value="�����">
	</form>
	<%
		} else {
		out.print("<h1>���� �����</h1>");
	}
	%>
</body>
</html>