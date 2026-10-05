<%@ page import="java.sql.*" %>

<%
String courseId=request.getParameter("course_id");
String courseName=request.getParameter("course_name");
String duration=request.getParameter("duration");

Connection con=null;
PreparedStatement ps=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/attendancedb",
"root",
""
);

ps=con.prepareStatement(
"INSERT INTO course(course_id,course_name,duration) VALUES(?,?,?)"
);

ps.setString(1,courseId);
ps.setString(2,courseName);
ps.setInt(3,Integer.parseInt(duration));

int i=ps.executeUpdate();

if(i>0){
%>

<script>
alert("Course Added Successfully");
window.location="course.jsp";
</script>

<%
}else{
%>

<script>
alert("Failed to Add Course");
window.location="addCourse.jsp";
</script>

<%
}

}catch(Exception e){
%>

<script>
alert("<%=e.getMessage()%>");
window.location="addCourse.jsp";
</script>

<%
}

finally{

try{

if(ps!=null)
ps.close();

if(con!=null)
con.close();

}catch(Exception e){}

}
%>