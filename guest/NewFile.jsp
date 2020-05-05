<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
<style>
.tab{border: 1px inset black; background-color: black;}
</style>

<script language="javascript">

function clicked(gg,rr,bb)
{
	var hex='#'+deciToHex(gg)+deciToHex(rr)+deciToHex(bb);
	document.body.style.backgroundColor=hex;
}
	
function getHexNum(num)
{
	ar1=new Array('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15');
	ar2=new Array('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
	if(num>15)
		return num;
	else
	{
		red=ar2[num];
		return red;
	}
}

function deciToHex(arg)
{
	res2=999;
	args=arg;
	while(args>15)
	{
		arg1=parseInt(args/16);
		arg2=args%16;
		arg2=getHexNum(arg2);
		args=arg1;
		if(res2==999)
			res2=arg2.toString();
		else
			res2=arg2.toString()+res2.toString();
	}

	if(args<16 && res2 != 999)
	{
		def=getHexNum(args);
		res2=def+res2.toString();
	}
	else if(res2==999)
	{
		if(args<16)
			res2=getHexNum(args);
		else
			res2=1;
	}

	if(res2.length==1)
		res2="0"+res2;

	return res2;
}
		
</script>
</head>
<form name=colchanger>
<div>
<table class=tab cellpadding=0 cellspacing=0>
<script language=javascript>
	
	for(i=0;i<=256;i+=18)
	{
		if(i==252) i=255;
		document.write("<tr>");
		for(j=0;j<=256;j=j+51)
		{
			for(k=0;k<=256;k=k+51)
			{
				document.write("<td onclick='clicked("+i+","+j+","+k+")' \
				style=\"border: 1px inset black; width:10px; \
				height: 3px; font-size: 6px; background-color: rgb("+i+","+j+","+k+");\""+">&nbsp;</td>");
			}
		}
		document.write("</tr>");
	}

</script>
</table>
</div>

</form>
</html>