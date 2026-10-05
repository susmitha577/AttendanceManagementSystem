<%@ page import="java.sql.*" %>

<%
String facultyId=(String)session.getAttribute("faculty_id");
String facultyName=(String)session.getAttribute("faculty_name");

if(facultyId==null)
{
    response.sendRedirect("facultyLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>My Sections</title>

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
padding:20px;
text-align:center;
}

.container{
width:90%;
margin:30px auto;
display:grid;
grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
gap:25px;
}

.card{
background:white;
padding:25px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.15);
text-align:center;
transition:.3s;
}

.card:hover{
transform:translateY(-8px);
}

.card i{
font-size:55px;
color:#304ffe;
margin-bottom:15px;
}

.card h2{
color:#1f2a56;
margin-bottom:15px;
}

.card p{
margin:8px 0;
color:#555;
}

.btn{
display:inline-block;
margin-top:18px;
padding:10px 25px;
background:#304ffe;
color:white;
text-decoration:none;
border-radius:8px;
font-weight:bold;
}

.btn:hover{
background:#1f2a56;
}

</style>

</head>

<body>

<div class="header">

<h2>Welcome, <%=facultyName%></h2>

<h3>My Assigned Sections</h3>

</div>

<div class="container">

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
""
);

ps=con.prepareStatement(
"select * from faculty_section where faculty_id=?"
);

ps.setString(1,facultyId);

rs=ps.executeQuery();

while(rs.next())
{
%>

<div class="card">

<i class="fas fa-users"></i>

<h2><%=rs.getString("section")%></h2>

<p><b>Semester :</b> <%=rs.getString("semester")%></p>

<p><b>Subject :</b> <%=rs.getString("subject")%></p>

<a class="btn"
href="sectionDashboard.jsp?section=<%=rs.getString("section")%>">
Open Section
</a>

</div>
<%
}

}
catch(Exception e)
{
out.println("<h3>"+e.getMessage()+"</h3>");
}
finally
{
try
{
if(rs!=null)
rs.close();

if(ps!=null)
ps.close();

if(con!=null)
con.close();
}
catch(Exception e){}
}
%>

</div>

<div style="text-align:center;margin:30px;">

<a href="facultyDashboard.jsp"
style="
text-decoration:none;
background:#d9534f;
color:white;
padding:12px 30px;
border-radius:8px;
font-weight:bold;
">

<i class="fas fa-arrow-left"></i>

Back to Dashboard

</a>

</div>

</body>
</html>