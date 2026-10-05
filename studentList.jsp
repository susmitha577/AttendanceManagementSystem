<%@ page import="java.sql.*" %>

<%
String facultyId=(String)session.getAttribute("faculty_id");

if(facultyId==null)
{
    response.sendRedirect("facultyLogin.html");
    return;
}

String semester=request.getParameter("semester");
String section=request.getParameter("section");
String subject=request.getParameter("subject");
%>

<!DOCTYPE html>
<html>
<head>
<title>Student List</title>

<style>

body{
    font-family:Arial;
    background:#eef3f9;
}

.container{
    width:95%;
    margin:30px auto;
    background:#fff;
    padding:25px;
    border-radius:8px;
    box-shadow:0 0 10px gray;
}

h2{
    text-align:center;
    color:#1e3a8a;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#1e3a8a;
    color:white;
    padding:10px;
}

td{
    border:1px solid #ddd;
    text-align:center;
    padding:10px;
}

.btn{
    background:#1e3a8a;
    color:white;
    padding:12px 30px;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

.btn:hover{
    background:#163172;
}
.addStudent{
    background:#1e3a8a;
    color:white;
    padding:12px 25px;
    text-decoration:none;
    border-radius:6px;
    font-size:16px;
    font-weight:bold;
    transition:0.3s;
}

.addStudent:hover{
    background:#163172;
}
.back{
    display:inline-block;
    margin-left:15px;
    padding:12px 30px;
    background:#555;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-size:16px;
    transition:0.3s;
}

.back:hover{
    background:#333;
}

</style>

</head>

<body>

<div class="container">
<h2>Student Attendance</h2>

<form action="saveAttendance.jsp" method="post">

<input type="hidden" name="semester" value="<%=semester%>">
<input type="hidden" name="section" value="<%=section%>">
<input type="hidden" name="subject" value="<%=subject%>">

Attendance Date :

<input type="date" name="attendance_date" required>

<br><br>

<table>

<tr>
    <th>Student ID</th>
    <th>Student Name</th>
    <th>Attendance</th>
</tr>

<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{
Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/attendancedb",
"root",
"");

ps=con.prepareStatement(
"select student_id,student_name from student where semester=? and section=? order by student_name");

ps.setString(1,semester);
ps.setString(2,section);

rs=ps.executeQuery();

while(rs.next())
{
%>

<tr>
<tr>

<td>
<%=rs.getString("student_id")%>

<input type="hidden"
name="student_id"
value="<%=rs.getString("student_id")%>">
</td>

<td>
<%=rs.getString("student_name")%>

<input type="hidden"
name="student_name"
value="<%=rs.getString("student_name")%>">
</td>

<td>
<input
type="checkbox"
name="present"
value="<%=rs.getString("student_id")%>">
</td>

</tr>

</tr>

<%
}

}
catch(Exception e)
{
out.println(e);
}
finally
{
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
}
%>

</table>

<br>
<div style="margin-top:20px; text-align:center;">
<input type="submit" value="Save Attendance" class="btn">
  </div>


</form>
<div style="margin-top:20px; text-align:center;">

    <a href="subjects.jsp?semester=<%=semester%>&section=<%=section%>"
       class="back">
        Back
    </a>

</div>
</div>

</body>
</html>