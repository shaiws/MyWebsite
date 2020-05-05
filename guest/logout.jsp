<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Logout</title>
</head>
<body style="background-image: url('img/1.jpg')">

<%
   session.invalidate();
 %>
<jsp:include page="../menu.jsp"></jsp:include>


</body>
</html>
