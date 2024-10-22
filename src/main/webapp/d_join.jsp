<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품등록</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">약품 등록 </h2> <br>
<form method="post" action="d_action.jsp" name="d_frm" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="insert">
<table border=1>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String dnum="";
try {
	conn= Condb.getConnection();//DB 연결
	st = conn.createStatement();
	//SQL 실행하기 위한 변수 생성
	String sql="select max(dnum)+1 dnum from sjhdrug";
	//bmember테이블에서 현재까지의 회원번호 최대값에서 1을 더한 값을 bnum으로 별칭한다.
	ResultSet rs= st.executeQuery(sql);
	//st를 통해서 sql 실행결과를 받아옴 
	rs.next(); //1개의 결과물 출력 
	dnum = rs.getString("dnum");
	//데이터베이스에서 불러온 값을 변수에 저장한다.
	}
catch(Exception e){
	e.printStackTrace();
}
%>
<script type="text/javascript" src="dcheck.js"></script>
<tr><td>약품번호(자동발생)</td>
<td><input type="text" name="dnum" value="<%=dnum %>" 
readonly></td></tr>
<tr><td>약이름</td>
<td><input type="text" name="dname"></td></tr>
<tr><td>제조회사</td>
<td><select name="maker">
<option value="가가">가가
<option value="나나">나나
<option value="다다">다다
<option value="라라">라라
<option value="마마">마마
<option value="바바">바바
</select></td></tr>
<tr><td>약의 효과</td>
<td><input type="text" name="detail"></td></tr>
<tr><td>약종류</td>
<td><input type="radio" name="dkind" value="소화기약">소화기약
<input type="radio" name="dkind" value="외부상처약">외부상처약
<input type="radio" name="dkind" value="피부약">피부약
<input type="radio" name="dkind" value="호흡기약">호흡기약
<input type="radio" name="dkind" value="기타">기타

<tr><td>가  격</td>
<td><input type="text" name="dprice"></td></tr>
<tr><td>재  고</td>
<td><input type="text" name="dstock"></td></tr>
<tr><td colspan=2>
<input type="submit" value="등록" onclick="return joinCheck()">
<input type="button" value="조회" onclick="return search()"></td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>	