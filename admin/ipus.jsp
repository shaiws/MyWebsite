<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ipus</title>
</head>
<body>

	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		application.setAttribute("g", null);
		application.setAttribute("VeryGood", 0);
		application.setAttribute("Good", 0);
		application.setAttribute("Enough", 0);
		application.setAttribute("Bad", 0);
		response.sendRedirect("sekerWithCookies.jsp");
	} else {
		out.print("<h1>גישה חסומה</h1>");
	}
	%>
</body>
</html>