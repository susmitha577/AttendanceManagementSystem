<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendancedb","root","");

    ps = con.prepareStatement("SELECT * FROM faculty WHERE Faculty_id=?");
    ps.setString(1,id);

    rs = ps.executeQuery();

    if(rs.next())
    {
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Faculty</title>

<style>

body{
    font-family:Arial;
    background:#f2f2f2;
}

.container{
    width:500px;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px gray;
}

input,select{
    width:100%;
    padding:10px;
    margin:8px 0;
}

button{
    background:#007bff;
    color:white;
    border:none;
    padding:10px 20px;
    cursor:pointer;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Faculty</h2>

<form action="updateFaculty.jsp" method="post">

Faculty ID
<input type="text" name="faculty_id"
value="<%=rs.getString("Faculty_id")%>" readonly>

Faculty Name
<input type="text" name="faculty_name"
value="<%=rs.getString("Faculty_name")%>">

Username
<input type="text" name="username"
value="<%=rs.getString("Username")%>">

Gender

<select name="gender">

<option value="Male"
<%=rs.getString("Gender").equals("Male")?"selected":""%>>
Male
</option>

<option value="Female"
<%=rs.getString("Gender").equals("Female")?"selected":""%>>
Female
</option>

</select>

Department ID
<input type="text" name="dept_id"
value="<%=rs.getString("Dept_id")%>">

Mail
<input type="email" name="mail"
value="<%=rs.getString("Mail")%>">

Mobile
<input type="text" name="mobile"
value="<%=rs.getString("Mobile")%>">

Password
<input type="text" name="password"
value="<%=rs.getString("Password")%>">

<button type="submit">Update Faculty</button>

</form>

</div>

</body>
</html>

<%
}
}
catch(Exception e)
{
    out.println(e);
}
%>