<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
<jsp:useBean id="db" class="jdbc.ForDataBase" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
</head>
<body>
	<%
		request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");
	String c = request.getParameter("c");
	%>
	<form method="post" action="addComment2.jsp">
		<input type="hidden" name="c" id="c" value=<%=c%>>
		<table>
			<tr>
				<td>שם</td>
				<td><input type="text" name="name" id="name"
					readonly="readonly" value="<%=session.getAttribute("username")%>"></td>
			</tr>
			<tr>
				<td>תגובה</td>
				<td><textarea autofocus rows="10" cols="20"
						style="width: 194px;" name="comment" id="comment"></textarea></td>
			</tr>


			<%
				Calendar cal = Calendar.getInstance();
			String comment = request.getParameter("comment");

			String name = request.getParameter("name");
			SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
			String date = sdf.format(cal.getTime());
			sdf = new SimpleDateFormat("h:mm");
			String time = sdf.format(cal.getTime());
			%><tr>
				<td>תאריך ושעה</td>
				<td>
					<%
						out.print(date + " , " + time);
					%>
				</td>
			</tr>
			<%
				if (request.getMethod().equals("POST")) {
				if (!comment.equals("") && comment != null) {
					PreparedStatement pst = null;
					String query = "insert into forum values(null,?,?,?,?,?);";
					pst = db.preparedStatement(query);
					pst.setString(1, c);
					pst.setString(2, comment);
					pst.setString(3, session.getAttribute("username").toString());
					pst.setString(4, date);
					pst.setString(5, time);
					db.insertUpdateDelete(pst);
					response.sendRedirect("forum.jsp?id=" + c + "");
				} else {
			%>
			<script type="text/javascript">
				alert("הכניס הודעה!");
			</script>
			<%
				}
			}
			%>
		</table>
		<input type="submit">
	</form>
</body>
</html>