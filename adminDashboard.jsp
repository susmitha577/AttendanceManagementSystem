
<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("faculty_id")==null)
{
    response.sendRedirect("facultyLogin.jsp");
    return;
}
%>
<%
String username = (String)session.getAttribute("username");
String facultyName = (String)session.getAttribute("facultyName");
String facultyId = (String)session.getAttribute("facultyId");

/* null protection */
if(facultyName == null){
    facultyName = "Faculty";
}

if(username == null){
    username = "faculty";
}


Connection con=null;

int totalStudents=0;
int totalDepartments=0;
int totalCourses=0;
int totalAttendance=0;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/attendancedb",
        "root",
        ""
    );

    Statement st=con.createStatement();

    ResultSet rs;

    rs=st.executeQuery("SELECT COUNT(*) FROM student");
    if(rs.next())
        totalStudents=rs.getInt(1);


    rs=st.executeQuery("SELECT COUNT(*) FROM department");
    if(rs.next())
        totalDepartments=rs.getInt(1);


    rs=st.executeQuery("SELECT COUNT(*) FROM course");
    if(rs.next())
        totalCourses=rs.getInt(1);


    rs=st.executeQuery("SELECT COUNT(*) FROM attendance");
    if(rs.next())
        totalAttendance=rs.getInt(1);


}
catch(Exception e)
{
    out.println(e);
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Faculty Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:#eef3f9;
overflow-x:hidden;
}

.sidebar{

position:fixed;
left:0;
top:0;
width:250px;
height:100%;
background:linear-gradient(180deg,#0f172a,#1e3a8a);
color:white;
overflow:auto;

}

.logo{

padding:30px;
text-align:center;
border-bottom:1px solid rgba(255,255,255,.2);

}

.logo h2{

font-size:32px;
letter-spacing:2px;

}

.logo p{

margin-top:8px;
color:#cbd5e1;

}

.sidebar ul{

list-style:none;
margin-top:20px;

}

.sidebar ul li{

margin:8px 0;

}

.sidebar ul li a{

display:block;
padding:15px 25px;
text-decoration:none;
color:white;
transition:.3s;

}

.sidebar ul li a:hover{

background:#2563eb;
padding-left:35px;

}

.sidebar i{

width:28px;

}

.header{

position:fixed;
left:250px;
right:0;
top:0;
height:75px;
background:white;
display:flex;
justify-content:space-between;
align-items:center;
padding:0 30px;
box-shadow:0 2px 10px rgba(0,0,0,.1);
z-index:100;

}

.header h2{

color:#1e3a8a;

}

.search-box{

position:relative;

}

.search-box input{

width:320px;
padding:10px 18px;
border:1px solid #ddd;
border-radius:30px;
outline:none;
font-size:15px;

}

.search-box i{

position:absolute;
right:15px;
top:12px;
color:gray;

}
.right-header{

display:flex;
align-items:center;
gap:25px;

}

.notification{

font-size:22px;
color:#1e3a8a;
cursor:pointer;

}

.profile{

display:flex;
align-items:center;
gap:12px;

}

.profile img{

width:45px;
height:45px;
border-radius:50%;
border:2px solid #2563eb;

}

.profile span{

font-size:14px;
color:gray;

}
.main{

margin-left:250px;
margin-top:75px;
padding:35px;

}

.main h1{

color:#1e3a8a;

}

.main p{

color:gray;
margin-top:10px;

}
.banner{

margin-top:30px;
background:linear-gradient(135deg,#2563eb,#4f46e5);
color:white;
padding:35px;
border-radius:18px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 10px 20px rgba(0,0,0,.15);

}

.banner h2{

font-size:30px;
margin-bottom:10px;

}

.banner p{

color:#e5e7eb;

}

.banner button{

padding:13px 28px;
border:none;
border-radius:10px;
font-size:16px;
font-weight:bold;
background:white;
color:#2563eb;
cursor:pointer;
transition:.3s;

}

.banner button:hover{

background:#dbeafe;

}
.cards{

display:grid;
grid-template-columns:repeat(4,1fr);
gap:25px;
margin-top:35px;

}

.card{

background:white;
padding:25px;
border-radius:18px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 8px 20px rgba(0,0,0,.08);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card h2{

color:#1e3a8a;
margin-bottom:8px;

}

.card p{

color:gray;

}

.card i{

font-size:45px;
color:#2563eb;

}

.students i{

color:#2563eb;

}

.departments i{

color:#16a34a;

}

.attendance i{

color:#f59e0b;

}

.rate i{

color:#ef4444;

}

</style>

</head>

<body>

<div class="sidebar">

<ul>

<li><a href="facultyDashboard.jsp"><i class="fas fa-home"></i> Dashboard</a></li>

<li><a href="viewRegulation.jsp"><i class="fas fa-book"></i> Regulation</a></li>

<li><a href="viewCourse.jsp"><i class="fas fa-graduation-cap"></i> Courses</a></li>

<li><a href="viewDepartment.jsp"><i class="fas fa-building"></i> Departments</a></li>

<li><a href="viewStudent.jsp"><i class="fas fa-user-graduate"></i> Students</a></li>

<li><a href="#"><i class="fas fa-calendar-check"></i> Attendance</a></li>

<li><a href="#"><i class="fas fa-chart-bar"></i> Reports</a></li>

<li><a href="#"><i class="fas fa-key"></i> Change Password</a></li>

<li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>

</ul>

</div>

<div class="header">

<h2>Attendance Management System</h2>

<div class="right-header">

<i class="fas fa-bell notification"></i>



<b>Welcome <%=session.getAttribute("username")%></b><br>
<span>@<%=username%></span>



</div>

</div>

</div>

</div>

<div class="main">

<h1>Faculty Dashboard</h1>

<p>Welcome to the Attendance Management System</p>
<div class="banner">

<div>

<h2>
Welcome Back

</h2>

<p>Manage Students, Attendance and Reports Easily from one place.</p>

</div>

<button>

<i class="fas fa-calendar-check"></i>

Mark Attendance

</button>

</div>
<div class="cards">

<div class="card students">

<div>

<h2><%=totalStudents%></h2>

<p>Total Students</p>

</div>

<i class="fas fa-user-graduate"></i>

</div>

<div class="card departments">

<div>

<h2><%=totalDepartments%></h2>
<p>Departments</p>

</div>

<i class="fas fa-building"></i>

</div>

<div class="card attendance">

<div>

<h2><%=totalAttendance%></h2>

<p>Today's Attendance</p>

</div>

<i class="fas fa-calendar-check"></i>

</div>

<div class="card rate">

<div>

<h2>91%</h2>

<p>Attendance Rate</p>

</div>

<i class="fas fa-chart-line"></i>

</div>

</div>
<h2 class="section-title">Quick Access</h2>

<div class="quick-links">

<div class="quick-card" onclick="window.location='student.jsp'" style="cursor:pointer;">
    <i class="fas fa-user-plus"></i>
    <h3>Add Student</h3>
    <p>Register new students.</p>
</div>

<div class="quick-card" onclick="window.location='attendance.jsp'" style="cursor:pointer;">
    <i class="fas fa-calendar-check"></i>
    <h3>Attendance</h3>
    <p>Mark daily attendance.</p>
</div>

<div class="quick-card" onclick="window.location='reports.jsp'" style="cursor:pointer;">
    <i class="fas fa-chart-bar"></i>
    <h3>Reports</h3>
    <p>Generate reports.</p>
</div>

<div class="quick-card" onclick="window.location='course.jsp'" style="cursor:pointer;">
    <i class="fas fa-book"></i>
    <h3>Courses</h3>
    <p>Manage courses.</p>
</div>

</div><h2 class="section-title">Attendance Overview</h2>

<div class="chart-box">

<div class="chart-card">
<h3>Overall Attendance</h3>

<div class="progress">

<div class="progress-bar">
91%
</div>

</div>

<p>Overall attendance this month is <b>91%</b>.</p>

</div>

<div class="chart-card">

<h3>Today's Summary</h3>

<p>Total Students : <b>250</b></p>

<p>Present : <span style="color:green;font-weight:bold;">228</span></p>

<p>Absent : <span style="color:red;font-weight:bold;">22</span></p>

</div>

</div>

</div>

<style>

.section-title{

margin-top:40px;
margin-bottom:20px;
color:#1e3a8a;

}

.quick-links{

display:grid;
grid-template-columns:repeat(4,1fr);
gap:20px;

}

.quick-card{

background:white;
padding:25px;
border-radius:15px;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,.1);
transition:.3s;
cursor:pointer;

}

.quick-card:hover{

transform:translateY(-8px);
background:#2563eb;
color:white;

}

.quick-card i{

font-size:40px;
margin-bottom:15px;
color:#2563eb;

}

.quick-card:hover i{

color:white;

}

.chart-box{

display:grid;
grid-template-columns:2fr 1fr;
gap:20px;
margin-top:20px;

}

.chart-card{

background:white;
padding:25px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.1);

}

.progress{

background:#ddd;
height:30px;
border-radius:20px;
overflow:hidden;
margin:20px 0;

}

.progress-bar{

width:91%;
height:100%;
background:#2563eb;
color:white;
display:flex;
align-items:center;
justify-content:center;
font-weight:bold;

}

table{

width:100%;
background:white;
border-collapse:collapse;
border-radius:15px;
overflow:hidden;
box-shadow:0 5px 15px rgba(0,0,0,.1);

}

table th{

background:#2563eb;
color:white;
padding:15px;

}

table td{

padding:15px;
text-align:center;
border-bottom:1px solid #eee;

}

table tr:hover{

background:#f4f8ff;

}

.present{

color:green;
font-weight:bold;

}

.absent{

color:red;
font-weight:bold;

}

.profile-box{

display:flex;
align-items:center;
gap:25px;
background:white;
padding:25px;
margin-top:20px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.1);

}

.profile-box img{

width:140px;
height:140px;
border-radius:50%;
border:5px solid #2563