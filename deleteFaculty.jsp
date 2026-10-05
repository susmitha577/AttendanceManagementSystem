<%@ page import="java.sql.*" %>

<%
String facultyId = request.getParameter("id");

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

    String sql = "DELETE FROM faculty WHERE Faculty_id=?";

    ps = con.prepareStatement(sql);
    ps.setString(1, facultyId);

    int result = ps.executeUpdate();

    if(result > 0)
    {
%>

<script>
    alert("Faculty Deleted Successfully");
    window.location="faculty.jsp";
</script>

<%
    }
    else
    {
%>

<script>
    alert("Faculty Not Found");
    window.location="faculty.jsp";
</script>

<%
    }

}
catch(Exception e)
{
    out.println("Error : " + e.getMessage());
}
finally
{
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>