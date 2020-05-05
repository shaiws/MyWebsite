<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<%@ page import="java.sql.*"%>
<html dir="rtl">
<head>
<style>
#eyes {
	position: absolute;
	top: 34%;
	left: 40%;
	width: 300px;
}
</style>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<link rel="stylesheet" href="../style.css" type="text/css"
	media="screen" />
<title>Insert title here</title>
<jsp:include page="../menu.jsp"></jsp:include>

</head>
<body>

	<%
		request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");

	String id = request.getParameter("id");
	PreparedStatement pst = null;
	if (id != null) {
		pst = db.preparedStatement("select * from family where id=?");
		pst.setString(1, id);
		String[][] result = db.select(pst);
	%>
	<div align="center">
		<h1>
			שם:
			<%=result[0][1]%></h1>
	</div>


	<div
		style="border-style: solid; border-color: rgb(62, 105, 140); width: 10cm;">
		תיאור:
		<%=result[0][3]%>
	</div>

	<br />

	<div
		style="border-style: solid; border-color: rgb(62, 105, 140); width: 10cm;">
		תפקיד במשפחה:
		<%=result[0][2]%>
	</div>

	<img id="eyes"
		style="border-color: rgb(62, 105, 140); border-style: solid;"
		src="../img/<%=result[0][5]%>" />
	<%
		}
	%>
</body>
</html>