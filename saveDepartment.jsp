<%@ page import="java.sql.*" %>

<%
String dept_id = request.getParameter("dept_id");
String dept_name = request.getParameter("dept_name");
String course_id = request.getParameter("course_id");

Connection con = null;
PreparedStatement ps = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/attendancedb",
    "root",
    ""
    );

    ps = con.prepareStatement(
    "INSERT INTO dept(dept_id,dept_name,course_id) VALUES(?,?,?)");

    ps.setString(1, dept_id);
    ps.setString(2, dept_name);
    ps.setString(3, course_id);

    int i = ps.executeUpdate();

    if(i>0)
    {
%>

<script>

alert("Department Added Successfully");

window.location="department.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Failed to Add Department");

history.back();

</script>

<%
    }

}
catch(Exception e)
{
%>

<h2>Database Error</h2>

<pre>

<%=e%>

</pre>

<%
}
finally
{
    try{
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
    catch(Exception ex){}
}
%>