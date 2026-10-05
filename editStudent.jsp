<%@ page import="java.sql.*" %>

<%
String student_id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String student_name = "";
String gender = "";
String dob = "";
String mobile = "";
String email = "";
String address = "";
String regulation_id= "";
String course_id = "";
String dept_id= "";
String semester = "";
String section = "";

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/attendancedb",
        "root",
        ""
    );

    ps = con.prepareStatement(
    "SELECT * FROM student WHERE student_id=?");

    ps.setString(1, student_id);

    rs = ps.executeQuery();

    if(rs.next())
    {
        student_name = rs.getString("student_name");
        gender = rs.getString("gender");
        dob = rs.getString("dob");
        mobile = rs.getString("mobile");
        email = rs.getString("mail");
        address = rs.getString("address");
        regulation_id = rs.getString("regulation_id");
        course_id = rs.getString("course_id");
        dept_id = rs.getString("dept_id");
        semester = rs.getString("semester");
        section = rs.getString("section");
    }

}catch(Exception e)
{
    out.println(e);
}
%>

<!DOCTYPE html>

<html>

<head>

<title>Edit Student</title>

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

h2{
color:#1e3a8a;
margin-bottom:25px;
text-align:center;
}

.container{
width:80%;
margin:auto;
background:#fff;
padding:35px;
border-radius:15px;
box-shadow:0 5px 20px rgba(0,0,0,.1);
}

.row{
display:flex;
gap:20px;
margin-bottom:20px;
}

.col{
flex:1;
}

label{
display:block;
font-weight:bold;
margin-bottom:8px;
color:#1e3a8a;
}

input,
select,
textarea{
width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
}

textarea{
height:90px;
resize:none;
}

button{
background:#2563eb;
color:white;
border:none;
padding:12px 30px;
border-radius:8px;
font-size:16px;
cursor:pointer;
}

button:hover{
background:#1d4ed8;
}
</style>

</head>

<body>

<div class="container">

<h2>Edit Student Details</h2>

<form action="updateStudent.jsp" method="post">

<input type="hidden"
name="student_id"
value="<%=student_id%>">

<div class="row">

<div class="col">

<label>Student Name</label>

<input type="text"
name="student_name"
value="<%=student_name%>"
required>

</div>

<div class="col">

<label>Gender</label>

<select name="gender">

<option value="Male"
<%=gender.equals("Male")?"selected":""%>>

Male

</option>

<option value="Female"
<%=gender.equals("Female")?"selected":""%>>

Female

</option>

</select>

</div>

</div>

<div class="row">

<div class="col">

<label>Date of Birth</label>

<input type="date"
name="dob"
value="<%=dob%>">

</div>

<div class="col">

<label>Mobile</label>

<input type="text"
name="mobile"
value="<%=mobile%>">

</div>

</div>

<div class="row">

<div class="col">

<label>Email</label>

<input type="email"
name="mail"
value="<%=email%>">

</div>

<div class="col">

<label>Semester</label>

<select name="semester">
<option value="1-1" <%=semester.equals("1-1")?"selected":""%>>1-1</option>
<option value="1-2" <%=semester.equals("1-2")?"selected":""%>>1-2</option>
<option value="2-1" <%=semester.equals("2-1")?"selected":""%>>2-1</option>
<option value="2-2" <%=semester.equals("2-2")?"selected":""%>>2-2</option>
<option value="3-1" <%=semester.equals("3-1")?"selected":""%>>3-1</option>
<option value="3-2" <%=semester.equals("3-2")?"selected":""%>>3-2</option>
<option value="4-1" <%=semester.equals("4-1")?"selected":""%>>4-1</option>
<option value="4-2" <%=semester.equals("4-2")?"selected":""%>>4-2</option>
</select>

</div>

</div>

<label>Address</label>

<textarea
name="address"><%=address%></textarea>

<br><br>

<div class="row">

<div class="col">

<label>Regulation</label>

<input type="text"
name="regulation_id"
value="<%=regulation_id%>">

</div>

<div class="col">

<label>Course</label>

<input type="text"
name="course_id"
value="<%=course_id%>">

</div>

</div>

<div class="row">

<div class="col">

<label>Department</label>

<input type="text"
name="dept_id"
value="<%=dept_id%>">

</div>

<div class="col">

<label>Section</label>

<input type="text"
name="section"
value="<%=section%>">

</div>

</div>

<br>

<center>

<button type="submit">

Update Student

</button>

</center>

</form>

</div>

</body>

</html>

<%
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
%>
