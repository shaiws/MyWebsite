
<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>

<%
	request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");
%>
<jsp:useBean id="db" class="jdbc.ForDataBase" />

<style type="text/css">
#cssmenu {
	width: auto;
	height: 37px;
	display: block;
	padding: 0;
	margin: 20px auto;
	border: 1px solid;
	border-radius: 5px;
	height: 37px;
}

#cssmenu>ul {
	list-style: inside none;
	padding: 0;
	margin: 0;
}

#cssmenu>ul>li {
	list-style: inside none;
	padding: 0;
	margin: 0;
	float: right;
	display: block;
	position: relative;
}

#cssmenu>ul>li#sgh {
	list-style: inside none;
	padding: 0;
	margin: 0;
	float: left;
	display: block;
	position: relative;
}

#cssmenu>ul>li>a {
	outline: none;
	display: block;
	position: relative;
	padding: 12px 20px;
	font: bold 13px/100% Arial, Helvetica, sans-serif;
	text-align: right;
	text-decoration: none;
	text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.4);
}

#cssmenu>ul>li:first-child>a {
	border-radius: 5px 0 0 5px;
}

#cssmenu>ul>li>a:after {
	content: '';
	position: absolute;
	border-right: 1px solid;
	top: -1px;
	bottom: -1px;
	left: -2px;
	z-index: 99;
}

#cssmenu ul li.has-sub:hover>a:after {
	top: 0;
	bottom: 0;
}

#cssmenu>ul>li.has-sub>a:before {
	content: '';
	position: absolute;
	top: 18px;
	left: 6px;
	border: 5px solid transparent;
	border-top: 5px solid #fff;
}

#cssmenu>ul>li.has-sub:hover>a:before {
	top: 19px;
}

#cssmenu ul li.has-sub:hover>a {
	background: #3f3f3f;
	border-color: #3f3f3f;
	padding-bottom: 13px;
	padding-top: 13px;
	top: -1px;
	z-index: 999;
}

#cssmenu ul li.has-sub:hover>ul,#cssmenu ul li.has-sub:hover>div {
	display: block;
}

#cssmenu ul li.has-sub>a:hover {
	background: #3f3f3f;
	border-color: #3f3f3f;
}

#cssmenu ul li>ul,#cssmenu ul li>div {
	display: none;
	width: auto;
	position: absolute;
	top: 38px;
	padding: 10px 0;
	background: #3f3f3f;
	border-radius: 0 0 5px 5px;
	z-index: 999;
}

#cssmenu ul li>ul {
	width: 200px;
}

#cssmenu ul li>ul li {
	display: block;
	list-style: inside none;
	padding: 0;
	margin: 0;
	position: relative;
}

#cssmenu ul li>ul li a {
	outline: none;
	display: block;
	position: relative;
	margin: 0;
	padding: 8px 20px;
	font: 10pt Arial, Helvetica, sans-serif;
	color: #fff;
	text-decoration: none;
	text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.5);
}

#cssmenu,#cssmenu>ul>li>ul>li a:hover {
	background: #3e698c;
	background: -moz-linear-gradient(top, #3e698c 0%, #30576e 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3e698c),
		color-stop(100%, #30576e) );
	background: -webkit-linear-gradient(top, #3e698c 0%, #30576e 100%);
	background: -o-linear-gradient(top, #3e698c 0%, #30576e 100%);
	background: -ms-linear-gradient(top, #3e698c 0%, #30576e 100%);
	background: linear-gradient(top, #3e698c 0%, #30576e 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(            startColorstr='#3e698c',
		endColorstr='#30576e', GradientType=0 );
}

#cssmenu {
	border-color: #1b313d;
}

#cssmenu>ul>li>a {
	border-left: none;
	color: #fff;
}

#cssmenu>ul>li>a:after {
	border-color: #6696bd;
}

#cssmenu>ul>li>a:hover {
	background: #436f93;
}

</style>

<div id='cssmenu'>
	<ul>
		<li><a href="../guest/Home.jsp">דף בית </a></li>
		<li><a href="../guest/selectFamilyTable.jsp">קצת עלינו </a></li>
		<%
			if (session.getAttribute("status") == null
					|| session.getAttribute("status").equals("guest")) {
		%>
		<li><a href="../guest/registerMember.jsp">הרשמה לאתר </a></li>
		<%
			}
			if (session.getAttribute("status") != ("manager")) {
		%>
		<%
			}
			if (session.getAttribute("status") == null
					|| session.getAttribute("status").equals("guest")) {
		%>
		<li class='last' id="sgh"><a href="Login.jsp"
			style="font-weight: bold">התחבר</a></li>
		<%
			} else {
		%>
		<li class="last" id="sgh"><a href="../guest/logout.jsp"
			style="font-weight: bold">התנתק</a></li>
		<%
			}
		%>
	</ul>

</div>

<%
	if (session.getAttribute("status") != null
			&& session.getAttribute("status").equals("member")) {
%>
<div id='cssmenu'>
	<ul>
		<li class='has-sub'><a href="#">פעולות משתמש</a>
			<ul>
				<li><a href="../members/selectForMembers.jsp">רשימת משתמשים</a></li>
				<li><a href="../members/deleteMember.jsp">מחיקת משתמש</a></li>
				<li class='last'><a href="../members/UpdateDetails.jsp">עדכון
						פרטים</a></li>
			</ul></li>
		<li><a href="../members/ChatMeshupar.jsp ">צ'אט אתר</a></li>
		<li><a href="../members/sekerWithCookies.jsp">סקר</a></li>
				<li><a href="../members/forum.jsp">פורום האתר</a></li>
		
	</ul>
</div>
<%
	}
	if (session.getAttribute("status") != null
			&& session.getAttribute("status").equals("manager")) {
%>
<div id='cssmenu'>
	<ul>
		<li class='has-sub'><a href="#">ניהול משתמשים</a>
			<ul>
				<li><a href="../admin/select.jsp">רשימת משתמשים</a></li>
				<li><a href="../admin/deleteWithCheckBoxes.jsp">מחיקת
						משתמשים</a></li>
				<li><a href="../admin/selectManyForms.jsp">מיון טבלת
						משתמשים</a></li>
				<li class='last'><a href="../admin/UpdateDetails.jsp">עדכון
						פרטי משתמש</a></li>
			</ul></li>
		<li class='has-sub'><a href="#">ניהול טבלת משפחה</a>
			<ul>
			
				<li><a href="../admin/InsertFamilyTable.jsp">טבלת משפחה</a></li>
				<li><a href="../admin/UpdateFamilyTable.jsp">עדכון טבלת
						משפחה</a></li>
				<li><a href="../admin/UpdateFamilyDes.jsp">עדכון תיאור
						בטבלת משפחה</a></li>
				<li><a href="../admin/UpdateFamilyPic.jsp">עדכון תמונה
						בטבלת משפחה</a></li>
				<li class='last'><a href="../admin/deleteFamily.jsp">מחיקה
						מטבלת משפחה</a></li>
			</ul></li>
	</ul>
</div>
<div id='cssmenu'>
	<ul>
		<li><a href="../admin/cleanChat.jsp">צ'אט+ניקוי צ'אט</a></li>
		<li id=sgh><a href="../admin/ipus.jsp">איפוס סקר</a></li>
		<li class='last'><a href="../admin/sekerWithCookies.jsp">סקר</a></li>
	</ul>
</div>


<%
	}
%>
<h3 onclick="window.location='../index.jsp'"> מספר הביקורים באתר:<%=application.getAttribute("mone") %></h3>

