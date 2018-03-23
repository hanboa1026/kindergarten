<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Contract List</title>
<link href="../resources/vendor/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="../resources/vendor/css/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../resources/vendor/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="../resources/vendor/css/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="../resources/vendor/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id "wrapper">
		<!-- TOP : Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<c:import url="../inc/top.jsp"></c:import>
		<!-- TOP -->
		<!-- LEFT : Navigation -->
		<c:import url="../inc/left.jsp"></c:import>
		<!-- LEFT -->
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-11">
			<h2>계약 리스트</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>CONTRACT_CD</th>
						<th>CONTRACT_START_DATE</th>
						<th>CONTRACT_END_DATE</th>
						<th>CLEINT_CD</th>
						<th>CONTRACT_AMOUNT</th>
						<th>CONTRACT_CONTENTS</th>
						<th>CONTRACT_TYPE</th>
						<th>CONTRACT_REGISTRATION_DATE</th>
						<th>CONTRACT_REGISTRANT</th>
						<th>LICENSE_KINDERGARTEN</th>
						<th>수정</th>
						<th>삭제</th>						
					</tr>
				</thead>
				<c:forEach var="contract" items="${list}">
					<tbody>
						<tr>
							<td>${contract.contractCd}</td>
							<td>${contract.contractStartDate}</td>
							<td>${contract.contractEndDate}</td>
							<td>${contract.clientCd}</td>
							<td>${contract.contractAmount}</td>
							<td>${contract.contractContents}</td>
							<td>${contract.contractType}</td>
							<td>${contract.contractRegistrationDate}</td>
							<td>${contract.contractRegistrant}</td>
							<td>${contract.licenseKindergarten}</td>
							<td><a class="btn btn-primary" href="${pageContext.request.contextPath}"><i class="fa fa-pencil"></i></a></td>
							<td><a class="btn btn-danger" href="${pageContext.request.contextPath}"><i class="fa fa-trash"></i></a></td>
						</tr>
					</tbody>	
					</c:forEach>
			</table>
			</div>
		</div>
	</div>
	<!-- FOOTER : Navigation -->
	<c:import url="./inc/footer.jsp"></c:import>
	<!-- FOOTER -->
</body>
</html>