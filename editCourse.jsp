<%@ page import="java.sql.*" %>

<%
String id=request.getParameter("id");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

String courseId="";
String courseName="";
int duration=0;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/attendancedb",
"root",
""
);

ps=con.prepareStatement("SELECT * FROM course WHERE course_id=?");
ps.setString(1,id);

rs=ps.executeQuery();

if(rs.next()){

courseId=rs.getString("course_id");
courseName=rs.getString("course_name");
duration=rs.getInt("duration");

}

}catch(Exception e){
out.println(e);
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Edit Course</title>

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

.container{
width:450px;
margin:50px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.2);
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:20px;
}

label{
display:block;
margin-top:15px;
font-weight:bold;
}

input{
width:100%;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:8px;
}

button{
margin-top:25px;
width:100%;
padding:12px;
background:#2563eb;
color:white;
border:none;
border-radius:8px;
cursor:pointer;
font-size:16px;
}

button:hover{
background:#1d4ed8;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Course</h2>

<form action="updateCourse.jsp" method="post">

<label>Course ID</label>

<input
type="text"
name="course_id"
value="<%=courseId%>"
readonly>

<label>Course Name</label>

<input
type="text"
name="course_name"
value="<%=courseName%>"
required>

<label>Duration</label>

<input
type="number"
name="duration"
value="<%=duration%>"
required>

<button type="submit">

Update Course

</button>

</form>

</div>

</body>

</html>