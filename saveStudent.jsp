<%@ page import="java.sql.*" %>

<%
String student_id = request.getParameter("student_id");
String student_name = request.getParameter("student_name");
String gender = request.getParameter("gender");
String dob = request.getParameter("dob");
String mobile = request.getParameter("mobile");
String mail = request.getParameter("mail");
String address = request.getParameter("address");
String regulation_id = request.getParameter("regulation_id");
String course_id = request.getParameter("course_id");
String dept_id = request.getParameter("dept_id");
String semester = request.getParameter("semester");
String section = request.getParameter("section");
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

    ps = con.prepareStatement(
    "INSERT INTO student(student_id,student_name,gender,dob,mobile,mail,address,regulation_id,course_id,dept_id,semester,section,password) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

    ps.setString(1, student_id);
    ps.setString(2, student_name);
    ps.setString(3, gender);
    ps.setString(4, dob);
    ps.setString(5, mobile);
    ps.setString(6, mail);
    ps.setString(7, address);
    ps.setString(8, regulation_id);
    ps.setString(9, course_id);
    ps.setString(10, dept_id);
    ps.setString(11, semester);
    ps.setString(12, section);
    ps.setString(13, password);
    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Student Added Successfully");

window.location="studentList.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Failed to Add Student");

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