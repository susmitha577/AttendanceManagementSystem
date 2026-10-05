<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/signupdb",
        "root",
        ""
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM users WHERE username=? AND password=?"
    );

    ps.setString(1, username);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if(rs.next())
    {
        if(rs.next())
{
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Login Successful</title>");
    out.println("</head>");

    out.println("<body style='margin:0; font-family:Arial; background:linear-gradient(to right,#36d1dc,#5b86e5);'>");

    out.println("<div style='width:450px; margin:120px auto; background:white; padding:30px; border-radius:15px; text-align:center; box-shadow:0px 0px 20px gray;'>");

    out.println("<h1 style='color:green;'>Login Successful!</h1>");

    out.println("<h2>Welcome, " + rs.getString("firstname") + " </h2>");

    out.println("<p>You have logged in successfully.</p>");

    out.println("<br>");

    out.println("<a href='login.html' style='background:#007BFF; color:white; padding:12px 25px; text-decoration:none; border-radius:8px;'>Logout</a>");

    out.println("</div>");

    out.println("</body>");
    out.println("</html>");
}
else
{
    out.println("<h2 style='color:red;'>Invalid Username or Password!</h2>");
}    }
    else
    {
        out.println("<h2 style='color:red;'>Invalid Username or Password</h2>");
    }

    rs.close();
    ps.close();
    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>