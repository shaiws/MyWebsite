<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<%@ page import="java.sql.*"%>


<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>����� ����� �����</title>
<jsp:include page="../menu.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>

	<form action="UpdateFamilyDes.jsp" method="post">
		<table>
			<tr>
				<td>����� ���</td>
				<td><textarea rows="10" cols="20" style="width: 194px;"
						name="description" id="description"></textarea>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" id="id">
			</tr>
		</table>
		<input type="submit" value="����">
	</form>

	<%
		if (request.getMethod().equals("POST")) {

		String description = request.getParameter("description");
		String id = request.getParameter("id");
		PreparedStatement pst = db.preparedStatement("update family set Info = ? where id =?");
		pst.setString(1, description);
		pst.setString(2, id);
		db.insertUpdateDelete(pst);

	}
	%>
	<h1>����� �������</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>��</th>
			<th>�����</th>
			<th>�����</th>
			<th>��� ����</th>
			<th>�����</th>


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
		out.print("<h1>���� �����</h1>");
	}
	%>
</body>
</html>