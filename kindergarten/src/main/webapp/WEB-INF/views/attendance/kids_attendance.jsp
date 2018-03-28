<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>kids attendance</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"src="<c:url value="/resources/vendor/js/jquery.min.js"/>"></script>
<script>
	$(document).ready(function() {
		$('#attendanceInButton').click(function() {
			$('#kidsAttendanceInForm').submit();
		})
		$('#attendanceOutButton').click(function() {
			$('#kidsAttendanceOutForm').submit();
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div class="alert alert-success">
			<h2>영유아 등원 폼</h2>
			<form id="kidsAttendanceInForm" action="${pageContext.request.contextPath}/kids_attendance" method="post">
				<span>영유아번호를 입력해주세요.</span>
				<input type="text" id="kidsCd" name="kidsCd">
				<span>특이사항이 있으면 입력해주세요.</span>
				<input type="text" id="kidsReason" name="kidsReason">
				<button id="attendanceInButton" type="button">등원</button>
			</form>
		</div>
		<div class="alert alert-danger">
			<h2>영유아 하원 폼</h2>
			<form id="kidsAttendanceOutForm" action="${pageContext.request.contextPath}/kids_attendance_update" method="post">
				<span>영유아번호를 입력해주세요.</span>
				<input type="text" id="kidsCd" name="kidsCd">
			 	<button id="attendanceOutButton" type="button">하원</button>
			</form>
		</div>
	</div>
</body>
</html>