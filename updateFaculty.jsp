<%@ page import="java.sql.*" %>

<%

String facultyId=request.getParameter("faculty_id");
String facultyName=request.getParameter("faculty_name");
String username=request.getParameter("username");
String gender=request.getParameter("gender");
String deptId=request.getParameter("dept_id");
String mail=request.getParameter("mail");
String mobile=request.getParameter("mobile");
String password=request.getParameter("password");

try
{
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/attendancedb",
"root",
"");

PreparedStatement ps=con.prepareStatement(

"UPDATE faculty SET Faculty_name=?,Username=?,Gender=?,Dept_id=?,Mail=?,Mobile=?,Password=? WHERE Faculty_id=?"

);

ps.setString(1,facultyName);
ps.setString(2,username);
ps.setString(3,gender);
ps.setString(4,deptId);
ps.setString(5,mail);
ps.setString(6,mobile);
ps.setString(7,password);
ps.setString(8,facultyId);

int i=ps.executeUpdate();

if(i>0)
{
%>

<script>

alert("Faculty Updated Successfully");

window.location="faculty.jsp";

</script>

<%
}
else
{
%>

<script>

alert("Update Failed");

history.back();

</script>

<%
}

}
catch(Exception e)
{
out.println(e);
}

%>