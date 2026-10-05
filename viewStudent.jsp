<%@ page import="java.sql.*" %>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/attendancedb",
        "root",
        ""
    );

    st = con.createStatement();
    rs = st.executeQuery(
        "SELECT Student_id, Student_name, Gender, Mobile, Mail FROM student"
    );

}catch(Exception e){
    out.println("<h3 style='color:red;'>Database Error : " + e.getMessage() + "</h3>");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Students</title>

    <style>
        body{
            font-family:Arial;
            background:#eef3f9;
        }

        .container{
            width:90%;
            margin:40px auto;
        }

        h2{
            text-align:center;
            color:#1e3a8a;
            margin-bottom:20px;
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:white;
            box-shadow:0 0 10px #ccc;
        }

        th{
            background:#1e3a8a;
            color:white;
            padding:15px;
        }

        td{
            padding:12px;
            text-align:center;
            border-bottom:1px solid #ddd;
        }

        tr:hover{
            background:#f5f5f5;
        }

        .back{
            margin-top:20px;
            text-align:center;
        }

        .back a{
            text-decoration:none;
            background:#1e3a8a;
            color:white;
            padding:10px 20px;
            border-radius:5px;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Student Details</h2>

    <table>
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Gender</th>
            <th>Mobile</th>
            <th>Email</th>
        </tr>

        <%
        if(rs != null){
            while(rs.next()){
        %>

        <tr>
            <td><%= rs.getString("Student_id") %></td>
            <td><%= rs.getString("Student_name") %></td>
            <td><%= rs.getString("Gender") %></td>
            <td><%= rs.getString("Mobile") %></td>
            <td><%= rs.getString("Mail") %></td>
        </tr>

        <%
            }
        }else{
        %>

        <tr>
            <td colspan="5">No Students Found</td>
        </tr>

        <%
        }
        %>
    </table>

    <div class="back">
        <a href="facultyDashboard.jsp">Back to Dashboard</a>
    </div>

</div>

</body>
</html>

<%
try{
    if(rs != null) rs.close();
    if(st != null) st.close();
    if(con != null) con.close();
}catch(Exception e){}
%>