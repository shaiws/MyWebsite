<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body>

<%
if( application.getAttribute("mone")==null)
{
         application.setAttribute("mone",0);
}

   int m=(Integer) application.getAttribute("mone");
   m++;
   application.setAttribute("mone",m);


response.sendRedirect("guest/Home.jsp");
%>

</body>
</html>