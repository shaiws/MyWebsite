<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<%@ page import="java.sql.*"%>

<html dir="rtl">
<head>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<jsp:include page="../menu.jsp"></jsp:include>
<title>עדכון פרטים</title>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("member")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>
	<form action="UpdateDetails.jsp" method="post">
		<table>

			<tr>
				<td>סיסמה חדשה :<input type="password" id="password"
					name="password"></td>

				<td><input type="submit" value="שנה סיסמה" name="f1"></td>

			</tr>
		</table>
	</form>






	<form action="UpdateDetails.jsp" method="post">
		<table>
			<tr>
				<td>Email חדש: <input type="text" id="Email" name="Email"></td>
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
				<td>
				<td><input type="submit" value="שנה שם ושם משפחה" name="f3"></td>
			</tr>
		</table>
	</form>

	<%
		if (request.getMethod().equals("POST")) {
		PreparedStatement pst = null;
		if (request.getParameter("f1") != null) {

			String password = request.getParameter("password");
			pst = db.preparedStatement("update users set Password= ? where UserName=? and password=?");
			pst.setString(1, password);
			pst.setString(2, session.getAttribute("username").toString());
			pst.setString(3, session.getAttribute("password").toString());
			db.insertUpdateDelete(pst);
			session.setAttribute("password", password);
		} else if (request.getParameter("f2") != null) {

			String Mail = request.getParameter("Email");
			pst = db.preparedStatement("update users set Email=? where UserName=? and password=?");
			pst.setString(1, Mail);
			pst.setString(2, session.getAttribute("username").toString());
			pst.setString(3, session.getAttribute("password").toString());
			db.insertUpdateDelete(pst);
		} else if (request.getParameter("f3") != null) {

			String firstname = request.getParameter("firstname");
			pst = db.preparedStatement("update users set FullName = ? where UserName=? and password=?");
			pst.setString(1, firstname);
			pst.setString(2, session.getAttribute("username").toString());
			pst.setString(3, session.getAttribute("password").toString());
			db.insertUpdateDelete(pst);

		}
	}
	%>
	<table border="2">
		<tr>
			<th>שם מלא</th>
			<th>שנת לידה</th>
			<th>מין</th>
			<th>כתובת מייל</th>
			<th>שם משתמש</th>
			<th>סיסמא</th>
			<th>תמונה</th>
			<th>מספר משתמש</th>
		</tr>
		<%
			PreparedStatement pst = db.preparedStatement("select * from users where UserName=? and password=?");
		pst.setString(1, session.getAttribute("username").toString());
		pst.setString(2, session.getAttribute("password").toString());
		String[][] result = db.select(pst);
		int j;

		out.println("<tr>");
		for (j = 0; j < result[0].length; j++) {
			if (j == 6)
				out.println("<td align='center'><img src='../img/" + result[0][j] + "' width='200'/></td>");
			else
				out.println("<td>" + result[0][j] + "</td>");
		}
		out.println("</tr>");
		%>
	</table>
	<%
		} else {
		out.print("<h1>הרשם לאתר על מנת להכנס לדף זה</h1>");
	}
	%>
</body>

</body>
</html>
