
<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="rtl">
<head>
<script>
	var lul = null;
</script>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styles.css" type="text/css">
<jsp:include page="../menu.jsp"></jsp:include>

</head>
<%
	request.setCharacterEncoding("windows-1255");
response.setCharacterEncoding("windows-1255");

String nickName = "מנהל";
String app = (String) application.getAttribute("chat");

if (app == null)
	application.setAttribute("chat", "");
String newmass = request.getParameter("mess");
String x = request.getParameter("x");
if (x == null)
	x = "";
if (newmass != null && !newmass.equals("")) {
	String s = nickName + ":" + newmass + "\n" + app;
	application.setAttribute("chat", s);
}
%>

<body
	onload="lul=window.setInterval('document.forms[1].x.value=document.forms[0].mess.value; document.forms[1].submit()',10000)"
	onunload="lul=window.clearInterval(lul)">
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("manager")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");
	%>

	<form action="cleanChat.jsp" method="post">
		<table align="center" dir="rtl">
			<tr>
				<td><textarea cols="90" rows="25" readonly="readonly"><%=application.getAttribute("chat")%></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div style="color: blue"><%=nickName%>:
					</div>
					<input type="text" name="mess" value="<%=x%>" />
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="שלח" /></td>
			</tr>

		</table>
	</form>
	<form action="cleanChat.jsp" method="post">
		<input type="hidden" name="x" />
	</form>
	<form action="cleanChat1.jsp" method="post">

		<input type="submit" value="נקה צ'אט" />
	</form>
	<%
		} else {
		out.print("<h1>גישה חסומה</h1>");
	}
	%>

</body>
</html>