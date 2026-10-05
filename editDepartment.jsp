<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String dept_id="";
String dept_name="";
String course_id="";

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/attendancedb",
    "root",
    "");

    ps=con.prepareStatement(
    "SELECT * FROM dept WHERE dept_id=?");

    ps.setString(1,id);

    rs=ps.executeQuery();

    if(rs.next()){

        dept_id=rs.getString("dept_id");
        dept_name=rs.getString("dept_name");
        course_id=rs.getString("course_id");

    }

}catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Edit Department</title>

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
background:#fff;
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
font-weight:bold;
color:#1e3a8a;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Department</h2>

<form action="updateDepartment.jsp" method="post">

<input type="hidden"
name="old_dept_id"
value="<%=dept_id%>">

<label>Department ID</label>

<input type="text"
name="dept_id"
value="<%=dept_id%>"
required>

<label>Department Name</label>

<input type="text"
name="dept_name"
value="<%=dept_name%>"
required>

<label>Course ID</label>

<input type="text"
name="course_id"
value="<%=course_id%>"
required>

<button type="submit">

Update Department

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
if(ps!=null) ps.close();
if(con!=null) con.close();
%>