<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="db" class="jdbc.ForDataBase" />
<html dir="rtl">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>����� �����</title>
<jsp:include page="../menu.jsp"></jsp:include>
</head>
<body>
	<%
		if (session.getAttribute("status") != null && session.getAttribute("status").equals("member")) {

		request.setCharacterEncoding("windows-1255");
		response.setCharacterEncoding("windows-1255");

		if (request.getMethod().equals("GET")) {
	%>

	<h5>����� �����</h5>
	<form action="deleteMember.jsp" method="post">
		�����?<br /> <br /> �� <input type="radio" id="delete" name="delete"
			value="yes"> <br /> �� <input type="radio" id="delete"
			name="delete" value="no"> <br /> <br /> <input
			type="submit" value="���">
	</form>

	<%
		}
	if (request.getMethod().equals("POST")) {

		String delete = request.getParameter("delete");
		if (delete.equals("yes")) {
	%><script type="text/javascript">
		var x;
		var r = confirm("?��� ��/� ����/� ���/� ���� ����� �� ������");
		if (r == true) {
	<%PreparedStatement pst = db.preparedStatement("delete from family  where UserName=?");
pst.setString(1, session.getAttribute("username").toString());
db.insertUpdateDelete(pst);
session.invalidate();%>
		alert("����");
		} else {
			alert("�� ����");
		}
	</script>
	<%
		}
	%>
	<jsp:include page="../menu.jsp"></jsp:include>
	<%
		}
	} else {
		out.print("<h1>���� ���� �� ��� ����� ��� ��</h1>");
	}
	%>

</body>
</html>
