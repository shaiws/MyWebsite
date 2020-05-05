<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE jsp:useBean PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<%@ page import="java.sql.*"%>

<head>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">

<title>חברה</title>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>
	<jsp:include page="../menu.jsp"></jsp:include>
	<form action="UpdateDetails.jsp" method="post">
		<table>

			<tr>
				<td>סיסמה חדשה :<input type="password" id="password"
					name="password"></td>
				<td>מספר משתמש: <input type="text" id="id" name="id"></td>
				<td><input type="submit" value="שנה סיסמה" name="f1"></td>

			</tr>
		</table>
	</form>
	<form action="UpdateDetails.jsp" method="post">
		<table>
			<tr>
				<td>Email חדש: <input type="text" id="Email" name="Email"></td>
				<td>מספר משתמש: <input type="text" id="id" name="id"></td>
				<td><input type="submit" value="שנה אימייל" name="f2">
				</td>
			</tr>
		</table>
	</form>


	<form action="UpdateDetails.jsp" method="post">
		<table>
			<tr>
				<td>שם חדש: <input type="text" id="name" name="firstname">
				</td>
				<td>מספר משתמש: <input type="text" id="id" name="id"></td>
				<td><input type="submit" value="שנה שם ושם משפחה" name="f3"></td>
			</tr>
		</table>
	</form>

	<%
		if (request.getMethod().equals("POST")) {
		PreparedStatement pst = null;
		if (request.getParameter("f1") != null) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			pst = db.preparedStatement("update users set Password=? where id=?");
			pst.setString(1, password);
			pst.setString(2, id);
			db.insertUpdateDelete(pst);
			session.setAttribute("password", password);
		} else if (request.getParameter("f2") != null) {
			String id = request.getParameter("id");

			String Email = request.getParameter("Email");
			pst = db.preparedStatement("update users set Email=? where id=?");
			pst.setString(1, Email);
			pst.setString(2, id);
			db.insertUpdateDelete(pst);

		} else if (request.getParameter("f3") != null) {
			String id = request.getParameter("id");

			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			pst = db.preparedStatement("update users set FullName=? where id=?");
			pst.setString(1, firstname);
			pst.setString(2, id);
			db.insertUpdateDelete(pst);
			int rows = db.insertUpdateDelete(pst);

		}
	}
	%>
	<table border="2">
		<tr>
			<th>שם פרטי</th>
			<th>שנת לידה</th>
			<th>מין</th>
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
