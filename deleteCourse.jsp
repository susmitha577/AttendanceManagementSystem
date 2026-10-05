<%@ page import="java.sql.*" %>

<%
String courseId = request.getParameter("id");

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
        "DELETE FROM course WHERE course_id=?"
    );

    ps.setString(1, courseId);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>
alert("Course Deleted Successfully");
window.location="course.jsp";
</script>

<%
    }
    else
    {
%>

<script>
alert("Delete Failed");
window.location="course.jsp";
</script>

<%
    }

}
catch(Exception e)
{
%>

<script>
alert("<%=e.getMessage()%>");
window.location="course.jsp";
</script>

<%
}
finally
{
    try
    {
        if(ps!=null)
            ps.close();

        if(con!=null)
            con.close();
    }
    catch(Exception e){}
}
%>