<%@ page import="java.sql.*" %>

<%

String dept_id = request.getParameter("id");

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
    "DELETE FROM dept WHERE dept_id=?"
    );


    ps.setString(1, dept_id);


    int result = ps.executeUpdate();


    if(result > 0){

%>

<script>
alert("Department Deleted Successfully");
window.location="department.jsp";
</script>

<%

    }
    else{

%>

<script>
alert("Delete Failed");
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