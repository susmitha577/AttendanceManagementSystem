<%
String facultyId=(String)session.getAttribute("faculty_id");
String facultyName=(String)session.getAttribute("faculty_name");

if(facultyId==null)
{
    response.sendRedirect("facultyLogin.html");
    return;
}

String section=request.getParameter("section");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Section Dashboard</title>

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
background:#eef2f7;
}

.header{
background:#1f2a56;
color:white;
padding:25px;
text-align:center;
}

.container{
width:90%;
margin:40px auto;
display:grid;
grid-template-columns:repeat(2,1fr);
gap:25px;
}

.card{

background:white;
padding:35px;
border-radius:15px;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,.15);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card i{

font-size:55px;
color:#304ffe;
margin-bottom:20px;

}

.card h2{

margin-bottom:15px;
color:#1f2a56;

}

.card a{

display:inline-block;
margin-top:20px;
padding:12px 25px;
background:#304ffe;
color:white;
text-decoration:none;
border-radius:8px;
font-weight:bold;

}

.card a:hover{

background:#1f2a56;

}

.back{

text-align:center;
margin:30px;

}

.back a{

background:#d9534f;
color:white;
text-decoration:none;
padding:12px 25px;
border-radius:8px;
font-weight:bold;

}

</style>

</head>

<body>

<div class="header">

<h2><%=section%> Section</h2>

<h3>Welcome, <%=facultyName%></h3>

</div>

<div class="container">
<div class="card">

<i class="fas fa-users"></i>

<h2>View Students</h2>

<a href="viewStudents.jsp?section=<%=section%>">
Open
</a>

</div>

<div class="card">

<i class="fas fa-user-plus"></i>

<h2>Add Student</h2>

<a href="addStudent.jsp?section=<%=section%>">
Open
</a>

</div>

<div class="card">

<i class="fas fa-calendar-check"></i>

<h2>Take Attendance</h2>

<a href="takeAttendance.jsp?section=<%=section%>">
Open
</a>

</div>

<div class="card">

<i class="fas fa-chart-bar"></i>

<h2>Attendance Report</h2>

<a href="attendanceReport.jsp?section=<%=section%>">
Open
</a>

</div>

</div>

<div class="back">

<a href="mySections.jsp">

<i class="fas fa-arrow-left"></i>

Back

</a>

</div>

</body>

</html>