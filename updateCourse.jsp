<%@ page import="java.sql.*" %>

<%
String courseId = request.getParameter("course_id");
String courseName = request.getParameter("course_name");
String duration = request.getParameter("duration");

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
        "UPDATE course SET course_name=?, duration=? WHERE course_id=?"
    );

    ps.setString(1, courseName);
    ps.setInt(2, Integer.parseInt(duration));
    ps.setString(3, courseId);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>
alert("Course Updated Successfully");
window.location="course.jsp";
</script>

<%
    }
    else
    {
%>

<script>
alert("Update Failed");
window.location="editCourse.jsp?id=<%=courseId%>";
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