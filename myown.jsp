<%@ page language="java" %>

<!DOCTYPE html>
<html>
<head>
<title>Registration Successful</title>

<style>

body{
font-family:Arial;
background:#e3f2fd;
}

.box{
width:500px;
margin:40px auto;
background:white;
padding:20px;
border-radius:10px;
box-shadow:0 0 10px gray;
}

h2{
text-align:center;
color:green;
}

table{
width:100%;
border-collapse:collapse;
}

td{
padding:10px;
border:1px solid gray;
}

</style>

</head>

<body>

<div class="box">

<h2>Registration Successful</h2>

<%
String name=request.getParameter("name");
String roll=request.getParameter("roll");
String email=request.getParameter("email");
String password=request.getParameter("password");
String phone=request.getParameter("phone");
String gender=request.getParameter("gender");
String course=request.getParameter("course");
String branch=request.getParameter("branch");
String dob=request.getParameter("dob");
String address=request.getParameter("address");
%>

<table>

<tr><td>Name</td><td><%=name%></td></tr>
<tr><td>Roll Number</td><td><%=roll%></td></tr>
<tr><td>Email</td><td><%=email%></td></tr>
<tr><td>Password</td><td><%=password%></td></tr>
<tr><td>Phone</td><td><%=phone%></td></tr>
<tr><td>Gender</td><td><%=gender%></td></tr>
<tr><td>Course</td><td><%=course%></td></tr>
<tr><td>Branch</td><td><%=branch%></td></tr>
<tr><td>Date of Birth</td><td><%=dob%></td></tr>
<tr><td>Address</td><td><%=address%></td></tr>

</table>

</div>

</body>
</html>