<%@ page import="java.sql.*" %>

<%

String old_dept_id = request.getParameter("old_dept_id");
String dept_id = request.getParameter("dept_id");
String dept_name = request.getParameter("dept_name");
String course_id = request.getParameter("course_id");

Connection con = null;
PreparedStatement ps = null;

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/attendancedb",
    "root",
    ""
    );


    ps = con.prepareStatement(
    "UPDATE dept SET dept_id=?, dept_name=?, course_id=? WHERE dept_id=?"
    );


    ps.setString(1, dept_id);
    ps.setString(2, dept_name);
    ps.setString(3, course_id);
    ps.setString(4, old_dept_id);


    int result = ps.executeUpdate();


    if(result > 0){

%>

<script>
alert("Department Updated Successfully");
window.location="department.jsp";
</script>

<%

    }
    else{

%>

<script>
alert("Update Failed");
window.location="department.jsp";
</script>

<%

    }


}catch(Exception e){

out.println("Database Error : "+e);

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