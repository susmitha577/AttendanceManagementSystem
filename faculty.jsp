<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Faculty Management</title>

<style>

body{
font-family:Arial;
background:#eef3f9;
}

.container{
width:90%;
margin:30px auto;
background:white;
padding:20px;
border-radius:10px;
}

input,select{

width:100%;
padding:10px;
margin:8px 0;

}

button{

padding:10px 20px;
background:#2563eb;
color:white;
border:none;

}

table{

width:100%;
margin-top:20px;
border-collapse:collapse;

}

table th{

background:#2563eb;
color:white;
padding:10px;

}

table td{

padding:10px;
border:1px solid #ddd;

}
.edit-btn{
    background:#28a745;
    color:white;
    padding:8px 12px;
    text-decoration:none;
    border-radius:5px;
    margin-right:50px;
}

.edit-btn:hover{
    background:#218838;
}

.delete-btn{
    background:#dc3545;
    color:white;
    padding:8px 12px;
    text-decoration:none;
    border-radius:5px;
    
}

.delete-btn:hover{
    background:#c82333;
}
.back-btn{
    display:inline-block;
    background:#003366;
    color:white;
    text-decoration:none;
    padding:10px 20px;
    border-radius:5px;
    margin-bottom:20px;
}

.back-btn:hover{
    background:#0055aa;
}

</style>

</head>

<body>

<div class="container">

<h2>Faculty Management</h2>

<form action="insertFaculty.jsp" method="post">

<input type="text" name="faculty_id" placeholder="Faculty ID" required>

<input type="text" name="faculty_name" placeholder="Faculty Name" required>
<input type="text" name="username" placeholder="Username" required>
<select name="gender">
<option>Male</option>
<option>Female</option>
</select>

<input type="text" name="dept_id" placeholder="Department ID">

<input type="email" name="mail" placeholder="Email">

<input type="text" name="mobile" placeholder="Mobile">
<input type="text" name="password" placeholder="Password" required>
<button type="submit">Save Faculty</button>

</form>

<br>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Gender</th>
<th>Dept_id</th>
<th>Email</th>
<th>Mobile</th>
<th>Action</th>

</tr>

<%
try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/attendancedb",
"root",
""
);

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("SELECT * FROM faculty");

while(rs.next()){
%>

<tr>

<td><%=rs.getString("faculty_id")%></td>
<td><%=rs.getString("faculty_name")%></td>
<td><%=rs.getString("gender")%></td>
<td><%=rs.getString("dept_id")%></td>
<td><%=rs.getString("mail")%></td>
<td><%=rs.getString("mobile")%></td>
 <td>
        <a href="editFaculty.jsp?id=<%= rs.getString("Faculty_id") %>" class="edit-btn">
            Edit
        </a>

        <a href="deleteFaculty.jsp?id=<%= rs.getString("Faculty_id") %>"
           class="delete-btn"
           onclick="return confirm('Are you sure you want to delete this faculty?');">
            Delete
        </a>
    </td
</tr>

<%
}


}catch(Exception e){

out.println(e);

}
%>

</table>
<br></br>
<a href="administratorDashboard.jsp" class="back-btn"> Back to Dashboard</a>
</div>
</body>

</html>