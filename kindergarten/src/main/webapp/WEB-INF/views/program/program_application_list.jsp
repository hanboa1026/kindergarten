<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Program Application List</title>
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
<!-- jQuery -->
<script src="resources/vendor/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#searchButton').click(function(){
				$('#searchForm').submit();
		})
	})
</script>
</head>
<body>
	<div id="wrapper">
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
			<h2>특별활동신청 확인목록</h2>
			<!-- 검색처리 시작 -->
				<form action="${pageContext.request.contextPath}/ProgramApplicationList?searchOption=${searchOption}&keyword=${keyword}" method="get" id="searchForm" class="form-inline">
					<select name="searchOption">
						<option value="KIDS_CD">영유아코드</option>
						<option value="PROGRAM_CD">특별활동프로그램코드</option>
						<option value="PRAP_DIVISION">입금여부</option>
						<option value="PRAP_CLOSING_DIVISION">마감유무</option>
						<option value="PRAP_REGISTRANT">등록인</option>
					</select>
					<div class="input-group">
						<input id="keyword" name="keyword" type="text" class="form-control" placeholder="Search">
						<div class="input-group-btn">
							<button id="searchButton" type="button" class="btn btn-info"><i class="fa fa-search"></i></button>
						</div>
					</div>
				</form>
			<!-- 검색처리 끝 -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th>영유아코드</th>
						<th>특별활동프로그램코드</th>
						<th>입금여부</th>
						<th>마감회계_수입특별활동비</th>
						<th>마감유무</th>
						<th>등록날짜</th>
						<th>등록인</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tbody>
					<tr>
						<td>${list.kidsCd}</td>							
						<td>${list.programCd}</td>
						<td>${list.PRAPDivision}</td>
						<td>${list.PRAPClosingCd}</td>
						<td>${list.PRAPClosingDivision}</td>
						<td>${list.PRAPRegistrationDate}</td>
						<td>${list.PRAPRegistrant}</td>
						<td><a class="btn btn-primary" href="${pageContext.request.contextPath}/ProgramApplicationModify?programApplCd=${list.programApplCd}"><i class="fa fa-pencil"></i></a></td>
						<td><a class="btn btn-danger" href="${pageContext.request.contextPath}/ProgramApplicationDelete?programApplCd=${list.programApplCd}"><i class="fa fa-trash"></i></a></td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<!-- 페이징 시작 -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:forEach var="i" begin="1" end="${countPage}" step="1">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/ProgramApplicationList?currentPage=${i}">${i}</a>
						</li>
					</c:forEach>
				</ul>
			</nav>
			<!-- 페이징 끝 -->
			</div>
		</div>
	</div>
	<!-- FOOTER : Navigation -->
	<c:import url="../inc/footer.jsp"></c:import>
	<!-- FOOTER -->
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
</body>
</html>