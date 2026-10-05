<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String confirmpassword = request.getParameter("confirmpassword");
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String address = request.getParameter("address");
String mobile = request.getParameter("mobile");
String mailid = request.getParameter("mailid");
String altmail = request.getParameter("altmail");
String gender = request.getParameter("gender");
String[] hobbiesArray = request.getParameterValues("hobbies");
String dob = request.getParameter("dob");

String hobbies = "";
if(hobbiesArray != null){
    hobbies = String.join(", ", hobbiesArray);
}

// Password check
if(password == null || confirmpassword == null){
    out.println("Password values are missing.");
    return;
}

if(!password.equals(confirmpassword)){
    out.println("<h2 style='color:red;'>Password and Confirm Password do not match!</h2>");
    return;
}
try{
    // Load Driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Connect Database
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/signupdb",
        "root",
        ""
    );
	PreparedStatement check = con.prepareStatement(
"SELECT * FROM users WHERE username=?");

check.setString(1, username);

ResultSet rs = check.executeQuery();

if(rs.next())
{
    out.println("<h2 style='color:red;'>Username already exists! Please choose another username.</h2>");
    return;
}

    // Insert Query
    PreparedStatement ps = con.prepareStatement(
    "INSERT INTO users(username,password,firstname,lastname,address,mobile,mailid,altmail,gender,hobbies,dob) VALUES(?,?,?,?,?,?,?,?,?,?,?)");

    ps.setString(1, username);
    ps.setString(2, password);
    ps.setString(3, firstname);
    ps.setString(4, lastname);
    ps.setString(5, address);
    ps.setString(6, mobile);
    ps.setString(7, mailid);
    ps.setString(8, altmail);
    ps.setString(9, gender);
    ps.setString(10, hobbies);
    ps.setString(11, dob);

    int result = ps.executeUpdate();

    if(result > 0){
      out.println("<html>");
out.println("<head>");
out.println("<title>Registration Successful</title>");
out.println("</head>");

out.println("<body style='margin:0; font-family:Arial; background:linear-gradient(to right,#36d1dc,#5b86e5);'>");

out.println("<div style='width:450px; margin:120px auto; background:white; padding:30px; border-radius:15px; text-align:center; box-shadow:0px 0px 20px gray;'>");

out.println("<h1 style='color:green;'>Registration Successful!</h1>");

out.println("<h3>Welcome, " + firstname + "</h3>");

out.println("<p>Your account has been created successfully.</p>");

out.println("<br>");

out.println("<a href='login.html' style='background:#007BFF; color:white; padding:12px 25px; text-decoration:none; border-radius:8px;'>Go to Login Page</a>");

out.println("</div>");

out.println("</body>");
out.println("</html>");
    }
    else{
        out.println("<h2>Registration Failed!</h2>");
    }

    ps.close();
    con.close();

}
catch(Exception e){
    out.println("<h3>Error : " + e.getMessage() + "</h3>");
}
%>