<%@ page import="java.sql.*" %>
<html>
<head>
<title>Student Details</title>
</head>
<body>
	<h2>Student List</h2>
	<table border="1">
	<tr>
		<th>ID</th>
		<th>Name</th>
	</tr>
<%
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendancedb",
		"root",
		""
		);
	stmt=con.createStatement();
	rs=stmt.executeQuery("SELECT * FROM Student");
	while(rs.next()){
%>
	<tr>
		<td><%= rs.getString(1)%></td>
		<td><%= rs.getString(2)%></td>
	</tr>
<%
		}
	}
	catch(Exception e){
	out.println("Error:"+e.getMessage());
}
finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();		
	if(con!=null)con.close();
}
%>
</table>
</body>
</html>
