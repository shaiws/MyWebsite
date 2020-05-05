
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seker</title>
<jsp:include page="../menu.jsp"></jsp:include>

</head>
<body>
	<h3>איך האתר?</h3>
	<form action="sekerWithCookies.jsp" method="post">
		מעולה <input type="radio" name="option" value="VeryGood"
			checked="checked"> טוב<input type="radio" name="option"
			value="Good"> טעון שיפור<input type="radio" name="option"
			value="Enough"> גרוע<input type="radio" name="option"
			value="Bad"> <input type="submit" value="הצבע"> <br />
		<br />
		<h1>The results</h1>
		<%
			if (request.getMethod().equals("POST")) {
			String n = request.getParameter("option");
			Cookie[] cookies = request.getCookies();
			boolean cookyExist = false;
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("voice") && cookies[i].getValue().equals("yes"))
				cookyExist = true;
				}
			}
			if (cookies == null || cookyExist == false) {
				int i = (Integer) application.getAttribute(n);
				i++;
				application.setAttribute(n, i);
				Cookie c = new Cookie("voice", "yes");
				c.setMaxAge(365 * 24 * 60 * 60);
				response.addCookie(c);
			} else
		%><script type="text/javascript">
				alert("כבר הצבעת");
			</script>
		<%
			}
		%>
		<table>
			<tr>
				<td>מעולה</td>
				<td>
					<%
						out.println(application.getAttribute("VeryGood"));
					%>קולות
				</td>
			</tr>
			<tr>
				<td>טוב</td>
				<td>
					<%
						out.println(application.getAttribute("Good"));
					%>קולות
				</td>
			</tr>
			<tr>
				<td>טעון שיפור</td>
				<td>
					<%
						out.println(application.getAttribute("Enough"));
					%>קולות
				</td>
			</tr>
			<tr>
				<td>גרוע</td>
				<td>
					<%
						out.println(application.getAttribute("Bad"));
					%>קולות
				</td>
			</tr>
		</table>
		<p>מעולה
		<hr align="center" color="#FF9900"
			style="height:1cm;background-color: #FF9900;width:<%=application.getAttribute("VeryGood")%>cm" />
		טוב
		<hr align="center" color="#AF1234"
			style="height: 1cm;background-color:#AF1234;width:<%=application.getAttribute("Good")%>cm" />
		טעון שיפור
		<hr align="center" color="#99FF00"
			style="height: 1cm;background-color:#99FF00;width:<%=application.getAttribute("Enough")%>cm" />
		גרוע
		<hr align="center" color="#FF66FF"
			style="height: 1cm;background-color:#FF66FF;width:<%=application.getAttribute("Bad")%>cm" />
	</form>
</body>
</html>