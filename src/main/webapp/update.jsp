<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="mylib.Member"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   int custno=Integer.parseInt(request.getParameter("custno"));

   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection(
         "jdbc:oracle:thin:@localhost:1521:xe"
         ,"system"
         ,"1234"
         );
   
   String sql="select * from member_tbl_02 where custno=?";
   PreparedStatement ps=conn.prepareStatement(sql);
   ps.setInt(1, custno);
   ResultSet rs=ps.executeQuery();
   Member member=new Member();
   if(rs.next()){
      member.setCustno(rs.getInt("custno"));
      member.setCustname(rs.getString("custname"));
      member.setPhone(rs.getString("phone"));
      member.setAddress(rs.getString("address"));
      member.setJoindate(rs.getDate("joindate"));
      member.setGrade(rs.getString("grade"));
      member.setCity(rs.getString("city"));
   }
   rs.close();
   ps.close();
   conn.close();
   %>
   <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin:0;padding:0;}
header{background-color:rgba(30,95,235);
      height:100px;
      color:white;
      font-size:30px;
      text-align:center;
      line-height:100px;
      }
nav{background-color:rgba(135,145,255); color:white; text-align:center; }
nav > ul > li{display:inline-block;
           padding:20px 30px;}
section{height:500px; background-color:rgba(220,220,220);}
section > h2 {
text-align:center;
padding-top:20ox;
padding-bottom:20ox;
}
footer{
background-color:rgba(30,95,235);
   height:100px;
   color:white;
   font-size:15px;
   text-align:center;
   line-height:100px;
}
table{
margin:auto; /* margin-left:auto; 이나 margin-right:auto;도 가능 */
text-align:center;

}
nav > a{a
color:white;
text-decoration: none;
}
a{
color:white;
}
</style>
<script>
function valuecheck(){
   var custname=document.getElementById("custname");
   var phone=document.getElementById("phone");
   var address=document.getElementById("address");
   var joindate=document.getElementById("joindate");
   var grade=document.getElementById("grade");
   var city=document.getElementById("city");
   
    if(phone.value==""){
      alert("전화번호가 입력되지 않았습니다");
      phone.focus();
      return false;
   }
    if(address.value==""){
      alert("주소가 입력되지 않았습니다");
      address.focus();
      return false;
   }
    if(joindate.value==""){
      alert("가입일자가 입력되지 않았습니다");
      joindate.focus();
      return false;
   }
    if(grade.value==""){
      alert("고객등급이 입력되지 않았습니다");
      grade.focus();
      return false;
   }
    if(city.value==""){
      alert("도시코드가 입력되지 않았습니다");
      city.focus();
      return false;
   }
    if(custname.value==""){
      alert("회원성명이 입력되지 않았습니다");
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
<li><a href="memberlist.jsp">회원목록조회/수정</a></li>
<li><a href="sales.jsp">회원매출조회</a></li>
<li><a href="index.jsp">홈으로</a></li>
</ul>
</nav>
<section>
<h2>쇼핑물 회원 등록</h2>
<p>
<form action=updateproc.jsp method="post" onsubmit="return valuecheck()">
<table border='1'>
<tr>
<td>회원번호(자동발생)</td>
<td><input type="text" id="custno" name="custno" value="<%=member.getCustno()%>"></td>
</tr>
<tr>
<td>회원성명</td>
<td><input type="text" id="custname" name="custname" value="<%=member.getCustno()%>"></td>
</tr>
<tr>
<td>회원전화</td>
<td><input type="text" id="phone" name="phone" value="<%=member.getCustname()%>"></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type="text" id="address" name="address" value="<%=member.getAddress()%>"></td>
</tr>
<tr>
<td>가입일지</td>
<td><input type="text" id="joindate" name="joindate" value="<%=member.getJoindate()%>"></td>
</tr>
<tr>
<td>고객등급[A:VIP,B:일반,c:직원]</td>
<td><input type="text" id="grade" name="grade" value="<%=member.getGrade()%>"></td>
</tr>
<tr>
<td>도시코드</td>
<td><input type="text" id="city" name="city" value="<%=member.getCity()%>"></td>
</tr>
<tr>
<td colspan=2>
<input type="submit" value="수정">
<input type="button" value="조회" onclick="javascript:location.href='memberlist.jsp'">
</td>
</tr>
</table>
</form>
</p>
</section>
<footer>
HRDKOREA Copyright@2016 ALL rights reserved. Human Resources Development Service of korea.
</footer>
</body>
</html>