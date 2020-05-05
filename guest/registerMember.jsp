<%@page import="jdbc.ForDataBase"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE HTML>
<jsp:useBean id="db" class="jdbc.ForDataBase" />

<html dir="rtl">

<head>
<jsp:include page="../menu.jsp"></jsp:include>

<title>הרשמה</title>
<script lang="javascript">
	function ifExist(inputId, charsForSearch) {
		var s = document.getElementById(inputId).value;
		var i;
		for (i = 0; i < charsForSearch.length; i++) {
			var ch = charsForSearch.charAt(i);
			if (s.indexOf(ch) != -1)
				return true;
		}
		return false;
	}

	function FamilyTest() {
		var f = true;
		var s;
		var i;
		// if username is not empty  -----------------------------------1
		if (document.getElementById('UserName').value == "") {

			document.getElementById("error_user").style.display = "block";
			f = false;
		} else {
			document.getElementById("error_user").style.display = "none";
		}

		// if username stands up to notes limit  ------------------------4
		s = document.getElementById('UserName').value;
		if (s.length > 20) {

			f = false;
			document.getElementById("error3_user").style.display = "block";
		} else
			document.getElementById("error3_user").style.display = "none";
		// if the password is not empty  --------------------------------5
		if (document.getElementById('Password').value == "") {

			document.getElementById("error_password").style.display = "block";
			f = false;
		} else {
			document.getElementById("error_password").style.display = "none";
		}
		// if the password does not include Hebrew letters and spaces  --6
		s = document.getElementById('Password').value;
		var f_password = true;
		for (i = 0; i < s.length; i++) {
			if (s.charAt(i) < 'a' || s.charAt(i) > 'z')
				if (s.charAt(i) < 'A' || s.charAt(i) > 'Z')
					if (s.charAt(i) < '0' || s.charAt(i) > '9') {
						f_password = false;
						f = false;
						break;
					}
		}
		if (f_password == false) {

			document.getElementById("error1_password").style.display = "block";
		} else
			document.getElementById("error1_password").style.display = "none";
		// if the password length is fine    ----------------------------7
		s = document.getElementById('Password').value;
		if (s.length < 5) {
			f = false;

			document.getElementById("error2_password").style.display = "block";
		} else {
			if (s.length > 20) {
				f = false;

				document.getElementById("error2_password").style.display = "block";
			} else
				document.getElementById("error2_password").style.display = "none";
		}
		// if the full name is not empty  --------------------------------8
		if (document.getElementById('FullName').value == "") {

			document.getElementById("error_name").style.display = "block";
			f = false;
		} else
			document.getElementById("error_name").style.display = "none";

		// if the full name stands up to the notes limit  ----------------10
		s = document.getElementById('FullName').value;
		if (s.length > 30) {
			f = false;

			document.getElementById("error2_name").style.display = "block";
		} else
			document.getElementById("error2_name").style.display = "none";
		// if the Email adress is not empty  -----------------------------11
		if (document.getElementById('Email').value == "") {

			document.getElementById("error_mail").style.display = "block";
			f = false;
		} else
			document.getElementById("error_mail").style.display = "none";
		// if the Email adress does not include illegal notes  -----------12
		var x = document.getElementById('Email').value;
		if (x != "") {
			var indexShtrudel = x.indexOf("@");
			var indexPoint = x.lastIndexOf(".");
			var n = x.indexOf("@", indexShtrudel + 1);
			if ((indexShtrudel < 1 || indexPoint == -1 || indexPoint
					- indexShtrudel < 2)
					|| (ifExist("Email", " !#$%^&*()-+='?,<>") == true || n != -1)) {

				document.getElementById("error1_mail").style.display = "block";
				f = false;
			} else
				document.getElementById("error1_mail").style.display = "none";
		}
		// if the Email adress stands up to the notes limit  -------------13    
		s = document.getElementById('Email').value;
		if (s.length > 30) {

			f = false;
			document.getElementById("error2_mail").style.display = "block";
		} else
			document.getElementById("error2_mail").style.display = "none";
		return f;
	}
</script>
</head>

<body>

	<%
		request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");
	%>


	<h2 style="color: #700000">הכנס פרטים להרשמה</h2>
	<form action="registerMember.jsp" method="post"
		onsubmit="return FamilyTest()" autocomplete="off"
		enctype="multipart/form-data">

		<table>
			<tr>
				<td style="font-weight: bold">*שם מלא (עד 30 תווים):</td>
				<td><input type="text" id="FullName" name="FullName" autofocus></td>
				<td>
					<div align="right" id="error_name"
						style="display: none; color: red">לא הזנת שם.</div>
					<div align="right" id="error1_name"
						style="display: none; color: red">השם מכיל סימנים לא חוקיים.</div>
					<div align="right" id="error2_name"
						style="display: none; color: red">השם חייב להיות עד 30
						תווים.</div>
				</td>
			</tr>

			<tr>
				<td style="font-weight: bold">*שנת לידה:</td>
				<td><select id="DateOfBirth" name="DateOfBirth">
						<%
							int i;
						for (i = 2007; i >= 1900; i--) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select></td>

			</tr>

			<tr>
				<td style="font-weight: bold">*מין:</td>
				<td>זכר <input type="radio" id="Gender" name="Gender" value="0">
					נקבה <input type="radio" id="Gender" name="Gender" value="1"
					checked>
				</td>


			</tr>
			<tr>

				<td style="font-weight: bold">*כתובת דוא"ל (עד 30 תווים):</td>
				<td><input type="email" id="Email" name="Email"></td>
				<td>
					<div align="right" id="error_mail"
						style="display: none; color: red">לא הזנת את כתובת הדוא"ל
						שלך.</div>
					<div align="right" id="error1_mail"
						style="display: none; color: red">כתובת המייל שהזנת מכילה
						סימנים לא חוקיים.</div>
					<div align="right" id="error2_mail"
						style="display: none; color: red">כתובת המייל יכולה להכיל עד
						30 תווים בלבד.</div>
				</td>

			</tr>

			<tr>

				<td style="font-weight: bold">*שם משתמש (עד 30 תווים):</td>
				<td><input type="text" id="UserName" name="UserName"></td>
				<td>
					<div align="right" id="error_user"
						style="display: none; color: red">לא הזנת שם המשתמש.</div>
					<div align="right" id="error1_user"
						style="display: none; color: red">שם המשתמש שלך מכיל אותיות
						באנגלית</div>
					<div align="right" id="error2_user"
						style="display: none; color: red">שם המשתמש שלך מכיל סימנים
						לא חוקיים</div>
					<div align="right" id="error3_user"
						style="display: none; color: red">שם משתמש שלך מכיל יותר מ-
						20 תווים.</div>
				</td>
			</tr>

			<tr>


				<td style="font-weight: bold">*סיסמה (חייבת להיות בין 5 עד 20
					תווים):</td>
				<td><input type="password" id="Password" name="Password"></td>
				<td>
					<div align="right" id="error_password"
						style="display: none; color: red">לא הזנת סיסמה.</div>
					<div align="right" id="error1_password"
						style="display: none; color: red">הסיסמה מכילה סימנים לא
						חוקיים.</div>
					<div align="right" id="error2_password"
						style="display: none; color: red">הסיסמה חייבת להכיל בין 5
						ל- 20 תווים.</div>
				</td>
			</tr>

			<tr>
				<td style="font-weight: bold">תמונה:</td>
				<td><input type="file" id="Picture" name="Picture"></td>
			</tr>
			<tr>
				<td><input type="reset" id="reset" value="אפס טופס"> <input
					type="submit" value="הירשם לאתר">
			</tr>
			<tr>

				<td><br /> <br />
					<h5 style="color: red;">*שדה חובה</h5></td>
			</tr>

		</table>
	</form>


	<%
		if (request.getMethod().equals("POST")) {
		PreparedStatement pst = null;
		String contentType = request.getContentType();
		String UserName = null, Password = null, FullName = null, DateOfBirth = null, Gender = null, Email = null,
		Picture = null;
		if ((contentType.indexOf("multipart/form-data") >= 0)) {
			File file;
			int maxFileSize = 5000 * 1024;
			int maxMemSize = 5000 * 1024;
			String filePath = "C:/Users/Shai/eclipse-workspace/website/WebContent/img/";
			System.out.println(contentType);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(maxMemSize);
			factory.setRepository(new File("c:\\temp"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(maxFileSize);
			try {
		List<FileItem> fileItems = upload.parseRequest(request);
		Iterator<FileItem> it = fileItems.iterator();
		while (it.hasNext()) {
			FileItem fi = (FileItem) it.next();
			if (fi.isFormField()) {
				String fieldname = fi.getFieldName();
				if (fieldname.equals("UserName"))
					UserName = new String(fi.getString().getBytes(),StandardCharsets.UTF_8);
				if (fieldname.equals("Password"))
					Password = new String(fi.getString().getBytes(),StandardCharsets.UTF_8);
				if (fieldname.equals("FullName"))
					FullName =new String(fi.getString().getBytes(),StandardCharsets.ISO_8859_1);
				if (fieldname.equals("DateOfBirth"))
					DateOfBirth = new String(fi.getString().getBytes(),StandardCharsets.UTF_8);
				if (fieldname.equals("Gender")) {
					Gender = fi.getString().equals("0") ? "זכר" : "נקבה";

				}
				if (fieldname.equals("Email"))
					Email = fi.getString();

			} else {
				String fieldName = fi.getFieldName();
				String fileName = fi.getName();
				boolean isInMemory = fi.isInMemory();
				long sizeInBytes = fi.getSize();
				file = new File(filePath + fileName);
				fi.write(file);
				Picture = fileName;
			}
		}
		pst = db.preparedStatement("select * from users where UserName=?");
		pst.setString(1, UserName);
		String[][] result = db.select(pst);
		if (!UserName.equals("shaiws2") && !Password.equals("251296")) {
			if (result.length == 0) {
				String query = "insert into users values(?,?,?,?,?,?,?,null);";
				pst = db.preparedStatement(query);
				pst.setString(1, FullName);
				pst.setString(2, DateOfBirth);
				pst.setString(3, Gender);
				pst.setString(4, Email);
				pst.setString(5, UserName);
				pst.setString(6, Password);
				pst.setString(7, Picture);
				db.insertUpdateDelete(pst);
			}
		}
			} catch (Exception ex) {
		System.out.println(ex);
			}
		} else {
			out.println("Error in file upload.");
		}
	%>
	<table dir="rtl" align="right" border="4">
		<tr>

		</tr>

		<%
			pst = db.preparedStatement("select * from users where UserName=?");
		pst.setString(1, UserName);
		String[][] result1 = db.select(pst);
		int j;
		for (i = 0; i < result1.length; i++) {
			out.println("<tr>");
			for (j = 0; j < result1[i].length; j++) {
				if (j == 6)
			out.println("<td align='center'><img src='../img/" + result1[i][j] + "' width='200'/></td>");
				else if (j == 10) {
			String m = "זכר";
			if (result1[i][j].equals("0"))
				m = "נקבה";
			out.println("<td>" + m + "</td>");
				} else {
			out.println("<td>" + result1[i][j] + "</td>");
				}
			}
			out.println("</tr>");
		}
		}
		%>
	</table>


</body>

</html>