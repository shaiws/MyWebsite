<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="jdbc.ForDataBase" />

<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>התחברות</title>
</head>
<body>

	<%
		request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");

	session.setAttribute("status", "guest");
	String[][] result = null;

	if (request.getMethod().equals("GET")) {
	%>
	<jsp:include page="../menu.jsp"></jsp:include>
	<form action="Login.jsp" method="post" autocomplete="off">
		<table>
			<tr>
				<td>שם משתמש:</td>

				<td><input type="text" id="username" name="username"></td>

			</tr>
			<tr style="height: 2cm;">
				<td>סיסמה:</td>
				<td><input type="password" id="password" name="password"></td>

			</tr>

		</table>
		<input type="submit" value="התחבר">
	</form>

	<%
		}

	if (request.getMethod().equals("POST")) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username.equals("shaiws2") && password.equals("251296")) {
			session.setAttribute("status", "manager");
		} else {
			PreparedStatement pst = null;
			pst = db.preparedStatement("select * from users where UserName=? and Password=?");
			pst.setString(1, username);
			pst.setString(2, password);
			result = db.select(pst);
			if (result.length > 0) {
		session.setAttribute("status", "member");
		session.setAttribute("username", username);
		session.setAttribute("password", password);
			} else if (result.length == 0) {
	%>
	<script type="text/javascript">
		alert("שם משתמש או סיסמה שגויים");
	</script>
	<%
		}
	}
	%>
	<jsp:include page="../menu.jsp"></jsp:include>
	<%
		}
	%>
</body>
</html>