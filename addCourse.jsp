<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>Add Course</title>

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
width:450px;
margin:50px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.2);
}

.container h2{
text-align:center;
color:#1e3a8a;
margin-bottom:25px;
}

label{
display:block;
font-weight:bold;
margin-top:15px;
margin-bottom:8px;
}

input{
width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
}

.buttons{
margin-top:30px;
display:flex;
justify-content:space-between;
}

.save{
background:#2563eb;
color:white;
border:none;
padding:12px 25px;
border-radius:8px;
font-size:16px;
cursor:pointer;
}

.save:hover{
background:#1d4ed8;
}

.cancel{
background:#dc2626;
color:white;
padding:12px 25px;
text-decoration:none;
border-radius:8px;
}

.cancel:hover{
background:#b91c1c;
}

</style>

</head>

<body>

<div class="header">
Attendance Management System
</div>

<div class="container">

<h2>Add Course</h2>

<form action="saveCourse.jsp" method="post">

<label>Course ID</label>

<input
type="text"
name="course_id"
placeholder="Enter Course ID"
required>

<label>Course Name</label>

<input
type="text"
name="course_name"
placeholder="Enter Course Name"
required>

<label>Duration (Years)</label>

<input
type="number"
name="duration"
placeholder="Enter Duration"
min="1"
max="10"
required>

<div class="buttons">

<button type="submit" class="save">
<i class="fas fa-save"></i> Save
</button>

<a href="course.jsp" class="cancel">
<i class="fas fa-times"></i> Cancel
</a>

</div>

</form>

</div>

</body>
</html>