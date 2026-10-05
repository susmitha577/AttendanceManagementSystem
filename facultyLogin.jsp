<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Faculty Login</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}
  body{
        height:100vh;
        display:flex;
        justify-content:center;
        align-items:center;
        background-image:url("attendance.png");
        background-size:cover;
        background-position:center;
        background-repeat:no-repeat;
    }

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#6a8fe8,#6fd3f5);
}

.container{
    width:450px;
    background:#fff;
    border-radius:25px;
    padding:40px;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
    text-align:center;
}

.container h1{
    color:#183b72;
    font-size:42px;
    margin-bottom:10px;
}

.container p{
    color:#666;
    font-size:18px;
    margin-bottom:30px;
}

.icon{
    font-size:70px;
    color:#183b72;
    margin-bottom:20px;
}

.input-box{
    position:relative;
    margin-bottom:20px;
}

.input-box i{
    position:absolute;
    left:15px;
    top:50%;
    transform:translateY(-50%);
    color:#183b72;
    font-size:18px;
}

.input-box input{
    width:100%;
    padding:14px 14px 14px 45px;
    border:2px solid #ddd;
    border-radius:10px;
    font-size:16px;
    outline:none;
    transition:.3s;
}

.input-box input:focus{
    border-color:#183b72;
}

button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:30px;
    background:#183b72;
    color:white;
    font-size:20px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

button:hover{
    background:#29549d;
    transform:scale(1.03);
}

.back{
    margin-top:20px;
}

.back a{
    text-decoration:none;
    color:#183b72;
    font-weight:bold;
}

.back a:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

    <h1>Faculty Login</h1>
    <p>Student Attendance Management System</p>

    <div class="icon">
        <i class="fas fa-user-shield"></i>
    </div>

    <form action="facultyLoginProcess.jsp" method="post">

        <div class="input-box">
            <i class="fas fa-user"></i>
            <input type="text" name="username" placeholder="Enter Username" required>
        </div>

        <div class="input-box">
            <i class="fas fa-lock"></i>
            <input type="password" name="password" placeholder="Enter Password" required>
        </div>

        <button type="submit">Login</button>

    </form>

    <div class="back">
        <a href="index.html">
            <i class="fas fa-arrow-left"></i> Back to Home
        </a>
    </div>

</div>

</body>
</html>