<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인 화면</title>

<!-- Bootstrap Core CSS -->
<link href="resources/vendor/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="resources/vendor/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/vendor/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="resources/vendor/css/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="resources/vendor/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>
<div id="wrapper">
	<!-- TOP : Navigation -->
	<c:import url="../inc/top.jsp"></c:import>
	<!-- TOP -->

	<!-- LEFT : Navigation -->
	<c:import url="../inc/left.jsp"></c:import>
	<!-- LEFT -->
</div>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">로그인</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				    관리자 권한으로 로그인
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="loginForm" action="${pageContext.request.contextPath}/AdminLogin" method="POST">
								<div class="form-group">
								    <label>ID</label>
								    <input class="form-control" id="adminId" name="adminId" placeholder="아이디" value="admin">
								</div>
								<div class="form-group">
								    <label>PassWord</label>
								    <input class="form-control" id="adminPw" name="adminPw" placeholder="비밀번호" value="pw1234">
								</div>
								<button type="submit">LOGIN</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				    원장 권한으로 로그인
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="loginForm" action="${pageContext.request.contextPath}/Login" method="POST">
								<div class="form-group">
								    <label>Email</label>
								    <input class="form-control" id="teacherEmail" name="teacherEmail" placeholder="이메일" value="sun@kinder.com">
									중복여부 : <email />
								</div>
								<div class="form-group">
								    <label>PassWord</label>
								    <input class="form-control" id="teacherPw" name="teacherPw" placeholder="비밀번호" value="pw1234">
								</div>
								<button type="submit">LOGIN</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				    교사 권한으로 로그인
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="loginForm" action="${pageContext.request.contextPath}/Login" method="POST">
								<div class="form-group">
								    <label>Email</label>
								    <input class="form-control" id="teacherEmail" name="teacherEmail" placeholder="이메일" value="hee@kinder.com">
									중복여부 : <email />
								</div>
								<div class="form-group">
								    <label>PassWord</label>
								    <input class="form-control" id="teacherPw" name="teacherPw" placeholder="비밀번호" value="pw1234">
								</div>
								<button type="submit">LOGIN</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER : Navigation -->
	<c:import url="../inc/footer.jsp"></c:import>
	<!-- FOOTER -->
</div>

	<!-- jQuery -->
	<script src="resources/vendor/js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/vendor/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="resources/vendor/js/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="resources/vendor/js/raphael.min.js"></script>
	<script src="resources/vendor/js/morris.min.js"></script>
	<script src="resources/vendor/js/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/vendor/js/sb-admin-2.js"></script>
	
	<script>
	$(document).ready(function(){
		$("#teacherEmail").keyup(function(){
			$.ajax({
				type		: "post"
				,url		: '${pageContext.request.contextPath}/TeacherEmailCheck'
				,data		: {teacherEmail : $("#teacherEmail").val()}
				,success	: function(data){
					if(data == 0){
						$("email").html("아이디가 없습니다.")
					}else{
						$("email").html("아이디가 확인되었습니다.")						
					}
				}
			})
		});
	});
	</script>
</body>
</html>
