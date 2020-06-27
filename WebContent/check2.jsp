<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="style2.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
</head>
<body>
<style>
body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #ADD8E6;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div id="mySidenav" class="sidenav" align="centre">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <center>
  <font size="5">UPDATE</font>
  </center>
  <br>
  <br>
  <a href="TeacherAssignments1.jsp">ASSIGNMENTS</a><br>
    <a href="Notice.jsp">NOTICE</a><br>
    <a href="Test.jsp">TEST</a>
  
</div>
<div align="left">
<br>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Click Here</span>
</div>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "400px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
     
<section class="container">
    <div class="login">
      <h1>Confirmation Page</h1>
	<center>
    </center>
    <%@ page import = "java.sql.*" %>  
    
	<% 	   
	    String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Student"; //test is the db name. 3306 is the default port
		String userName = "root"; //username to db
		String passWord = "mysql"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,userName,passWord);
		String username= request.getParameter("login"); 
	    String password= request.getParameter("password");
		    
	  try{
		  	
	    String query = String.format("select username,password from registration1 where username = '"+username+"'");
	    System.out.println(query);
		PreparedStatement ps =conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery(query);
		String pa="",un="";
		if(rs.next()){
			pa=rs.getString("password");
			un=rs.getString("username");
		if(password.equals(pa) && username.equals(un))
		{
			%>
			LogIn Successful
			<input type="button" name="log" value="Welcome" onclick="window.location='welcomePage1.jsp'">
			
		<%}
		else
		{      	
		%> 
			Credentials don't match. Please try again.
			<input type="button" name="log" value="LogIn" onclick="window.location='login1Page.jsp'">
			
		<% }
	  }
		try{
			 String ks= String.format("insert into login1(username,password) values('"+username+"','"+password+"')");
			    System.out.println(ks);
				PreparedStatement pstmt =conn.prepareStatement(ks);
				pstmt.execute();		
				pstmt.close();
				conn.close();	
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		rs.close();
		ps.close();
		conn.close();
	  }
	  catch(SQLException e)
	  {
		  System.out.println("Some Error");
	  }
	%>
     
</body>
</html>