<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 등록</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">펫 등록 </h2> <br>
<form method="post" action="p_action.jsp" name="p_frm" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="insert">
<table border=1>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String pnum="";
try {
	conn= Condb.getConnection();//DB 연결
	st = conn.createStatement();
	//SQL 실행하기 위한 변수 생성
	String sql="select max(pnum)+1 pnum from sjhpet";
	//bmember테이블에서 현재까지의 회원번호 최대값에서 1을 더한 값을 mnum으로 별칭한다.
	ResultSet rs= st.executeQuery(sql);
	//st를 통해서 sql 실행결과를 받아옴 
	rs.next(); //1개의 결과물 출력 
	pnum = rs.getString("pnum");
	//데이터베이스에서 불러온 값을 변수에 저장
	}
catch(Exception e){
	e.printStackTrace();
}
%>
<script type="text/javascript" src="pcheck.js"></script>
<tr><td>펫번호(자동발생)</td>
<td><input type="text" name="pnum" value="<%=pnum %>" 
readonly></td></tr>
<tr><td>펫이름</td>
<td><input type="text" name="pname"></td></tr>
<tr><td>종 류</td>
<td><input type="radio" name="kinds" value="호흡기" checked>개
<input type="radio" name="kinds" value="소화기">고양이
<input type="radio" name="kinds" value="기타">기타
</td></tr>
<tr><td>질환종류</td>
<td><select name="disease">
<option value="호흡기">호흡기
<option value="소화기">소화기 
<option value="피부질환">피부질환
<option value="기타">기타
</select></td></tr>
<tr><td>상세증상</td>
<td><input type="text" name="detail"></td></tr>
<tr><td>증상정도</td>
<td><select name="degree">
<option value="매우심각">매우심각
<option value="심각">심 각
<option value="보통">보 통 
<option value="경미">경 미
</select>
</td></tr>
<tr><td>주인이름</td>
<td><input type="text" name="owner"></td></tr>
<tr><td>연락처</td>
<td><input type="text" name="hp"></td></tr>
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