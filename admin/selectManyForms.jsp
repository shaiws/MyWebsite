<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<%@ page import="java.sql.*"%>
<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>מיון טבלת משתמשים</title>
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
			pst = db.preparedStatement("select * from users where FullName=?");
			pst.setString(1, FullName);
			result = db.select(pst);
		} else if (request.getParameter("f3") != null) {
			String FullName = request.getParameter("FullName");
			String DateOfBirth = request.getParameter("DateOfBirth");
			if (DateOfBirth.equals(""))
		DateOfBirth = "33333";
			pst = db.preparedStatement("select * from users where FullName=? or DateOfBirth=?");
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
			pst = db.preparedStatement("select * from users where DateOfBirth>=? and DateOfBirth<=?");
			pst.setString(1, minborn);
			pst.setString(2, maxborn);
			result = db.select(pst);
		} else if (request.getParameter("f5") != null)
			result = db.select(db.preparedStatement("select * from users order by DateOfBirth desc"));
		else if (request.getParameter("f6") != null)
			result = db.select(db.preparedStatement("select * from users order by FullName"));
		else if (request.getParameter("f7") != null) {
			String FullName = request.getParameter("FullName");
			pst = db.preparedStatement("select * from users where FullName like %?%");
			pst.setString(1, FullName);
			result = db.select(pst);
		} else if (request.getParameter("f8") != null)
			result = db.select(db.preparedStatement("select * from users order by Password"));
		else if (request.getParameter("f9") != null) {
			result = db.select(db.preparedStatement("select * from users"));
			int temp;
			for (int j = 0; j < result.length; j++) {
		for (int i = 0; i < result.length - 1; i++) {
			if (Integer.parseInt(result[i][5]) > Integer.parseInt(result[i + 1][5])) {
				temp = Integer.parseInt(result[i][5]);
				result[i][5] = result[i + 1][5];
				result[i + 1][5] = Integer.toString(temp);
			}
		}
			}
		} else {
			result = db.select(db.preparedStatement("select * from users"));
	%>

	<table width=100% border="2">
		<tr>
			<td>
				<h3>Type the values for search</h3> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit" value="כל הלקוחות">
					</form>
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						שם פרטי:<input type="text" name="FullName"><br /> <input
							type="submit" value="חפש" name="f2"><br />
					</form>
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						שם פרטי :<input type="text" name="FullName"> <br /> או <br />
						שנת לידה :<input type="text" name="DateOfBirth"><br /> <input
							type="submit" value="חפש" name="f3"><br />

					</form>
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						שנת התחלה:<input type="text" name="minborn"><br /> <br />
						שנת סיום:<input type="text" name="maxborn"><br /> <input
							type="submit" value="חפש" name="f4"><br />
					</form>
					<br /> <br />
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit" value="מיין על-פי שנת לידה" name="f5"><br />
					</form>
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit" value="מיין לפי שם" name="f6"><br />
					</form>
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						חיפוש על פי חלק מהשם:<input type="text" name="FullName"><br />
						<input type="submit" value="חפש" name="f7">
					</form>
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit" name="f8" value="מיון עפ סיסמה - סדר עולה"><br />
					</form>
				</div> <br /> <br />
				<div>
					<form action="selectManyForms.jsp" method="post">
						<input type="submit" name="f9" value="מיון עפ סיסמה - סדר יורד"><br />
					</form>
				</div>
			<td>
				<h1>משפחה</h1>
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
						int j, i;
					for (i = 0; i < result.length; i++) {
						out.println("<tr>");
						for (j = 0; j < result[i].length; j++) {
							if (j == 6)
						out.println("<td align='center'><img src='../img/" + result[i][j] + "' width='200'/></td>");
							else
						out.println("<td style='max-width: 2000px;'  style='max-height: 100000000px;'>" + result[i][j] + "</td>");
						}
						out.println("</tr>");
					}
					}
					}
		else{
			out.println("<h1>גישה חסומה!</h1>");
		}
					%>
				
</body>
</html>