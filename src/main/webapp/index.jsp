<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<h2>Linux 목차</h2>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LINUX 목차 개요_임도희</title>
<style>
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
* {
	font-family: "Pretendard",serif;
}

h2 {
	text-align : center;
}
	
section {
	max-width: 500px;
}
		
details {
	text-align : center;
	background: #cfe7ea;
	padding: 20px;
	margin-bottom: 5px;
	text-align : left;
	transition: 0.5s
 }
 
summary:hover {
	cursor: pointer;
	font-weight: bold;
	font-size: 1.1em;
}
</style>
</head>

<body>
<%
	Connection conn=null;
	
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/chapter";
	String dbId = "chapter";
	String dbPass = "1234";
    
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass); //DB데이터에 연결된 DB가져오기
}catch(Exception e){ 
	out.println("제대로 연결 안 되었습니다.");
	e.printStackTrace();
}
 %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
try{
	pstmt = conn.prepareStatement("select * from data_1;");
	rs = pstmt.executeQuery();
 %>
<table>
<%
	while(rs.next()) {
%>
	<details>
		<summary>
			<%=rs.getString("chapttitle") %>
		</summary>
		<p><%=rs.getString("chaptdesp") %></p>
	</details>
<%
}
%>
</table>
<%
}
catch(SQLException e){
	
}
finally{
   if(rs != null) rs.close();
   if(pstmt != null) pstmt.close();
   if(conn != null) conn.close();
}
%>
</body>
</html>