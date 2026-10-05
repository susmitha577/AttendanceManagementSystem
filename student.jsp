<%@page import="java.sql.*"%>

<%
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/attendancedb",
"root",
"");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from student");
%>

<!DOCTYPE html>

<html>

<head>

<title>Student Management</title>

<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:#eef3f9;
padding:30px;
}

.container{
width:95%;
margin:auto;
background:#fff;
padding:30px;
border-radius:15px;
box-shadow:0 5px 20px rgba(0,0,0,.1);
}

.heading{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:25px;
}

.heading h2{
color:#1e3a8a;
}

.add{
background:#2563eb;
color:#fff;
padding:12px 20px;
text-decoration:none;
border-radius:8px;
font-weight:bold;
transition:.3s;
}

.add:hover{
background:#1d4ed8;
}

table{
width:100%;
border-collapse:collapse;
overflow:hidden;
border-radius:10px;
}

th{
background:#2563eb;
color:white;
padding:15px;
font-size:15px;
}

td{
padding:14px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:nth-child(even){
background:#f8fbff;
}

tr:hover{
background:#dbeafe;
transition:.3s;
}

.edit{
background:#16a34a;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:6px;
font-size:14px;
}

.edit:hover{
background:#15803d;
}

.delete{
background:#dc2626;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:6px;
font-size:14px;
}

.delete:hover{
background:#b91c1c;
}
.back-btn{
display:inline-block;
background:#1e3a8a;
color:white;
padding:12px 25px;
text-decoration:none;
border-radius:8px;
font-weight:bold;
transition:.3s;
}

.back-btn:hover{
background:#163172;
}

</style>


</head>

<body>

<h2>Student Details</h2>


<table>

<tr>

<th> student ID</th>

<th>Name</th>

<th>Gender</th>
<th>date of birth</th>
<th>Mobile</th>
<th>Email</th>
<th>Address</th>
<th>Regulation</th>
<th>Course</th>
<th>Department</th>

<th>Semester</th>
<th>section</th>

<th>Edit</th>

<th>Delete</th>

</tr>

<%

while(rs.next())
{

%>

<tr>

<td><%=rs.getString("student_id")%></td>

<td><%=rs.getString("student_name")%></td>

<td><%=rs.getString("gender")%></td>
<td><%=rs.getString("dob")%></td>
<td><%=rs.getString("mobile")%></td>
<td><%=rs.getString("mail")%></td>
<td><%=rs.getString("address")%></td>
<td><%=rs.getString("regulation_id")%></td>
<td><%=rs.getString("course_id")%></td>
<td><%=rs.getString("dept_id")%></td>
<td><%=rs.getString("semester")%></td>
<td><%=rs.getString("section")%></td>


<td>

<a class="edit"

href="editStudent.jsp?id=<%=rs.getString("student_id")%>">

Edit

</a>

</td>

<td>

<a class="delete"

onclick="return confirm('Delete Student?')"

href="deleteStudent.jsp?id=<%=rs.getString("student_id")%>">

Delete

</a>

</td>

</tr>

<%

}

%>
<div style="margin-bottom:20px; overflow:hidden;">

<a href="addStudent.jsp"
style="float:right;
background:#2563eb;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:8px;
font-weight:bold;">

+ Add Student

</a>

</div>

</table>
<br><br>

<div style="text-align:center;">

<a href="facultyDashboard.jsp" class="back-btn">
<i class="fa fa-arrow-left"></i> Back to Dashboard
</a>

</div>

</body>
<%
rs.close();
st.close();
con.close();
%>

</html>