<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/attendancedb",
        "root",
        ""
    );

    ps = con.prepareStatement(
        "SELECT * FROM faculty WHERE username=? AND password=?"
    );

    ps.setString(1, username);
    ps.setString(2, password);

    rs = ps.executeQuery();

    if(rs.next())
    {
        session.setAttribute("faculty_id", rs.getString("faculty_id"));
        session.setAttribute("faculty_name", rs.getString("faculty_name"));

        response.sendRedirect("facultyDashboard.jsp");
    }
    else
    {
%>

<script>
alert("Invalid Username or Password");
window.location="facultyLogin.html";
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
    try
    {
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
    catch(Exception e){}
}
%>