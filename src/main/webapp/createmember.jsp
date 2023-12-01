<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   int custno=0;
   //데이터베이스 라이브러리 등록, db 라이브러리 업로드. db접속, sql실행
   //1)데이터베이스 라이브러리 등록:WEB-INF/lib폴더에 ojdbc8.jar 복사
   //2)라이브러리 업로드
   Class.forName("oracle.jdbc.driver.OracleDriver");
   //3)db접속
   Connection conn=DriverManager.getConnection(
         "jdbc:oracle:thin:@localhost:1521:xe"
         ,"system"
         ,"1234"
         );
   //out.print(conn);
   String sql="select member_custno_seq.nextval from dual";
   PreparedStatement ps = conn.prepareStatement(sql);
   ResultSet rs=ps.executeQuery();
   if(rs.next()){
	   custno=rs.getInt("nextval");
   }
   rs.close();conn.close();ps.close();
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 	
*{margin:0;padding:0;}
header{
	background-color:rgba(30,95,235);
	height:100px;
	color:white;
	font-size:30px;
	text-align:center;
	line-height:100px;
}
nav{background-color:rgba(135,145,255); color:white; text-align:center;}
nav > ul > li{
	display:inline-block;
	padding:20px 30px;
}
section{height:500px; background-color:rgba(220,220,220);}
section > h2{
text-align:center;
padding-top:20px;
paddint-bottom:20px;
}
footer{
	background-color:rgba(30,95,235);
	height:100px;
	color:white;
	font-size:15px;
	text-align:center;
	line-height:100px;}
	
table{
margin:auto;
text-align:center;
}
li a{
color:white;
text-decoration:none;
}
</style>
<script>
function valuecheck(){
	var cutname=document.getElemenById("custname");
	var phone=document.getElemenById("phone");
	var address=document.getElemenById("adress");
	var joindate=document.getElemenById("joindate");
	var grade=document.getElemenById("grade");
	var city=document.getElemenById("city");
	
	if(custname.value==""){
		alter("회원성명이 입력되지 않았습니다.");
		custname.focus();
		return false;
	}
	if(phone.value==""){
		alter("전화번호가 입력되지 않았습니다.");
		custname.focus();
		return false;
	}
	if(address.value==""){
		alter("주소가 입력되지 않았습니다.");
		custname.focus();
		return false;
	}
	if(joindate.value==""){
		alter("가입날짜가 입력되지 않았습니다.");
		custname.focus();
		return false;
	}
	if(grade.value==""){
		alter("고객등급이 입력되지 않았습니다.");
		custname.focus();
		return false;
	}
	if(city.value==""){
		alter("도시코드가 입력되지 않았습니다.");
		custname.focus();
		return false;
	}
}
</script>
</head>
<body>
<header>홈쇼핑 회원관리 ver1.0</header>
<nav>
<ul>
<li><a href="createmember.jsp">회원등록</a></li>
<li><a href="memberlist.jsp">회원목록주회/수정</a></li>
<li><a href="sales.jsp">회원매출조회</a></li>
<li><a href="index.jsp">홈으로.</a></li>
</ul>
</nav>
<section>
<h2>쇼핑물 회원 등록</h2>
<p>
<form action=creatememberproc.jsp method="post" onsubmit="return valuecheck()">
<table border ='1'>
<tr>
	<td>회원번호(자동발생)</td>
	<td><input type="text" id="custno" name="custno" value="<%=custno%>"></td>
</tr>
<tr>
	<td>회원성명</td>
	<td><input type="text" id="custname" name="custname"></td>
</tr>
<tr>
	<td>회원전화</td>
	<td><input type="text" id="phone" name="phone"></td>
</tr>
<tr>
	<td>회원주소</td>
	<td><input type="text" id="address" name="address"></td>
</tr>
<tr>
	<td>가입일지</td>
	<td><input type="text" id="joindate" name="joindate"></td>
</tr>
<tr>
	<td>고객등급[A:VIP,B:일반,c:직원]</td>
	<td><input type="text" id="grade" name="grade"></td>
</tr>
<tr>
	<td>도시코드</td>
	<td><input type="text" id="city" name="city"></td>
</tr>
<tr>
	<td colspan=2>
	<input type="submit" value="등록">
	<input type="button" value="조회" onclick="jacascript:location.href='memberlist.jsp'">
	</td>
</table>
</form>
<pre>쇼핑물 회원정보와....
프로그램작성순서
1.
2.
3.
4.
5.
6.
</pre>
</p>
</section>
<footer>
HRDKOREA Copyright@2016 ALL rights reserved. Human Resources Development Service of korea.
</footer>
</body>
</html>