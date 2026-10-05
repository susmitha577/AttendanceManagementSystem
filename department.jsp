<%@ page import="java.sql.*" %>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/attendancedb",
    "root",
    "");

    st=con.createStatement();
    rs=st.executeQuery("SELECT * FROM dept");

}catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Department Management</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
background:#eef3f9;
}

.header{
background:#1e3a8a;
color:white;
padding:20px;
font-size:28px;
font-weight:bold;
}

.container{
width:90%;
margin:30px auto;
}

.top{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:25px;
}

.top h2{
color:#1e3a8a;
}

.add-btn{
background:#2563eb;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:8px;
font-weight:bold;
}

.add-btn:hover{
background:#1d4ed8;
}

table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 5px 15px rgba(0,0,0,.1);
}

th{
background:#2563eb;
color:white;
padding:15px;
}

td{
padding:15px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f4f8ff;
}

.edit{
background:green;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:5px;
}

.delete{
background:red;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:5px;
}

.back{
margin-top:25px;
text-align:center;
}

.back a{
background:#1e3a8a;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:8px;
}

</style>

</head>

<body>

<div class="header">
Attendance Management System
</div>

<div class="container">

<div class="top">

<h2>Department Management</h2>

<a href="addDepartment.jsp" class="add-btn">
<i class="fas fa-plus"></i> Add Department
</a>

</div>

<table>

<tr>

<th>Department ID</th>
<th>Department Name</th>
<th>Course ID</th>
<th>Action</th>

</tr>

<%
while(rs.next()){
%>

<tr>

<td><%=rs.getString("dept_id")%></td>

<td><%=rs.getString("dept_name")%></td>

<td><%=rs.getString("course_id")%></td>

<td>

<a class="edit"
href="editDepartment.jsp?id=<%=rs.getString("dept_id")%>">

Edit

</a>

&nbsp;

<a class="delete"
href="deleteDepartment.jsp?id=<%=rs.getString("dept_id")%>"
onclick="return confirm('Delete Department?')">

Delete

</a>

</td>

</tr>

<%
}
%>

</table>

<div class="back">

<a href="administratorDashboard.jsp">

<i class="fas fa-arrow-left"></i>

Back to Dashboard

</a>

</div>

</div>

</body>
</html>

<%
if(rs!=null) rs.close();
if(st!=null) st.close();
if(con!=null) con.close();
%>