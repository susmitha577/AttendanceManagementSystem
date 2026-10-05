<%@ page import="java.sql.*" %>

<%
String facultyId = request.getParameter("faculty_id");
String facultyName = request.getParameter("faculty_name");
String gender = request.getParameter("gender");
String deptId = request.getParameter("dept_id");
String mail = request.getParameter("mail");
String mobile = request.getParameter("mobile");
String username = request.getParameter("username");
String password = request.getParameter("password");
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

    String sql = "INSERT INTO faculty(Faculty_id, Faculty_name, Gender, Dept_id, Mail, Mobile, Username,Password) VALUES(?,?,?,?,?,?,?,?)";

    ps = con.prepareStatement(sql);

    ps.setString(1, facultyId);
    ps.setString(2, facultyName);
    ps.setString(3, gender);
    ps.setString(4, deptId);
    ps.setString(5, mail);
    ps.setString(6, mobile);
    ps.setString(7, username);
    ps.setString(8, password);
    int result = ps.executeUpdate();

    if(result > 0)
    {
%>
        <script>
           alert("Faculty Added Successfully...");
           window.location="faculty.jsp"
        </script>
<%
    }
    else
    {
%>
        <script>
            alert("Faculty Not Added...");
            window.location="faculty.jsp";
        </script>
<%
    }

}
catch(Exception e)
{
    out.println("<h3>Error : " + e.getMessage() + "</h3>");
}
finally
{
    if(ps != null) ps.close();
    if(con != null) con.close();
}
%>