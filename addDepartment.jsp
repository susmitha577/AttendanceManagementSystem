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
    rs=st.executeQuery("SELECT * FROM course");

}catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Add Department</title>

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
width:50%;
margin:40px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.1);
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:25px;
}

label{
display:block;
margin-top:15px;
font-weight:bold;
}

input,select{
width:100%;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
}

button{
margin-top:25px;
background:#2563eb;
color:white;
padding:12px;
width:100%;
border:none;
border-radius:8px;
font-size:16px;
cursor:pointer;
}

button:hover{
background:#1d4ed8;
}

.back{
display:block;
text-align:center;
margin-top:20px;
text-decoration:none;
color:#1e3a8a;
font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<h2>Add Department</h2>

<form action="saveDepartment.jsp" method="post">

<label>Department ID</label>

<input type="text"
name="dept_id"
required>

<label>Department Name</label>

<input type="text"
name="dept_name"
required>

<label>Course</label>

<select name="course_id" required>

<option value="">Select Course</option>

<%
while(rs.next()){
%>

<option value="<%=rs.getString("course_id")%>">

<%=rs.getString("course_name")%>

</option>

<%
}
%>

</select>

<button type="submit">

Save Department

</button>

</form>

<a href="department.jsp" class="back">

Back

</a>

</div>

</body>
</html>

<%
if(rs!=null) rs.close();
if(st!=null) st.close();
if(con!=null) con.close();
%>



