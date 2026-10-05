<%@ page import="java.sql.*" %>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/attendancedb",   // <-- Database name check cheyyi
        "root",
        ""
    );

    st = con.createStatement();

    String sql =
    "SELECT d.dept_id, d.dept_name, c.course_name " +
    "FROM dept d " +
    "INNER JOIN course c ON d.course_id = c.course_id " +
    "ORDER BY d.dept_id";

    rs = st.executeQuery(sql);

}catch(Exception e){

    out.println("<h3 style='color:red;'>Database Error : " + e.getMessage() + "</h3>");

}
%>

<!DOCTYPE html>
<html>
<head>
<title>View Departments</title>

<style>

body{
    font-family:Arial;
    background:#eef3f9;
}

.container{
    width:90%;
    margin:40px auto;
}

h2{
    text-align:center;
    color:#1e3a8a;
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#fff;
    box-shadow:0 0 10px #ccc;
}

th{
    background:#1e3a8a;
    color:#fff;
    padding:15px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:hover{
    background:#f5f5f5;
}

.back{
    margin-top:20px;
    text-align:center;
}

.back a{
    text-decoration:none;
    background:#1e3a8a;
    color:white;
    padding:10px 20px;
    border-radius:5px;
}

</style>

</head>

<body>

<div class="container">

<h2>Department Details</h2>

<table>

<tr>
    <th>Department ID</th>
    <th>Department Name</th>
    <th>Course Name</th>
</tr>

<%
if(rs != null){

    while(rs.next()){
%>

<tr>

<td><%= rs.getString("dept_id") %></td>

<td><%= rs.getString("dept_name") %></td>

<td><%= rs.getString("course_name") %></td>

</tr>

<%
    }

}else{
%>

<tr>
<td colspan="3">No Records Found</td>
</tr>

<%
}
%>

</table>

<div class="back">
    <a href="facultyDashboard.jsp">Back to Dashboard</a>
</div>

</div>

</body>
</html>

<%
try{
    if(rs!=null) rs.close();
    if(st!=null) st.close();
    if(con!=null) con.close();
}catch(Exception e){}
%>