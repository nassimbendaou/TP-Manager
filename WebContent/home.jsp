<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css">
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<style>
.body{
font-family: 'Montserrat', sans-serif;
}
.plus{
	padding:25px;
	margin-top:25px;

	display: block;
	position: relative;
	z-index: 0;

	background-image: url(https://wallpaperaccess.com/full/688630.jpg);
	box-shadow: 0 50px 70px -20px rgba(0, 0, 0, 0.85);
}
.plus:after{
	content: '';
	display: inline-block;
	position: absolute;
	z-index: 0;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-image: radial-gradient(ellipse at left bottom, rgba(22, 24, 47, 1) 0%,rgba(38, 20, 72, .9) 59%, rgba(17, 27, 75, .9) 100%);
	box-shadow: 0 -20px 150px -20px rgba(0, 0, 0, 0.5);
}
.lwest{
		width: 30%;
        margin: 0 auto;
        padding: 20px;
     
	
        
}


</style>
</head>
<body>
<div class="container plus">
<h1 style="text-align:center;color:white;	position: relative;
	z-index: 1;">Login As</h1>

<div class="row">
<h1 class="col" style="color:white;	position: relative;
	z-index: 1;">Student</h1>
<h1 style="color:white;	position: relative;
	z-index: 1;">Teacher</h1>
</div>
<div class="row" style="color:white;	position: relative;
	z-index: 1;">
<!-- hna on change la valeur dyal represent !! -->
	<a class="col" href="./connection_student.jsp"><img  src="https://i.ibb.co/jH53qSr/kisspng-computer-icons-facepalm-clip-art-share-icon-portab-man-student-icon-free-of-780-free-vector-emoji-5b68fcaf42f552-0972699815336070872743.png"></a>
	<a href="./connection_prof.jsp"><img src="https://i.ibb.co/gmCFmPY/Laptop-User.png"></a>
</div>

</div>

</body>
</html>