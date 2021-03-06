<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>교직원 등록 화면</title>

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
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<c:import url="../inc/top.jsp"></c:import>
	<!-- TOP -->

	<!-- LEFT : Navigation -->
	<c:import url="../inc/left.jsp"></c:import>
	<!-- LEFT -->
	</nav>
</div>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">교직원 등록</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				    현재 근무하고 있는 교직원을 등록해주세요.
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form class="addForm" id="addForm" action="${pageContext.request.contextPath}/TeacherAdd" method="POST">
								<div class="form-group">
								    <label>Name</label>
								    <input class="form-control" id="teacherNm" name="teacherNm" placeholder="이름">
								    <span class="asterix">*</span>
									<span class="cross">x</span>
									<div class="alert alert-danger teacher-alert">
										완성된 한글로 2자 이상 15자 내로 입력하세요.
									</div>
									<div class="alert alert-danger custom-alert">
										이름을 입력하세요.
									</div>
								</div>
								
								<!-- <div class="form-group">
								    <label>Email</label>
								    <input type="email" class="form-control" name="teacherEmail" placeholder="이메일">
								</div> -->
								<div class="form-group">
								    <label>Email</label>
								    <input type="email" class="form-control" id="teacherEmail" name="teacherEmail" placeholder="이메일">
								    <!-- <button type="button" id="emailCheck">중복확인</button> -->
								    <span class="asterix">*</span>
									<span class="cross">x</span>
									<div class="alert alert-danger teacher-alert">
										영어 소문자 3자이상으로 시작하여 숫자 3자 이상으로 끝나야합니다.  : abc123 
									</div>
									<div class="alert alert-danger custom-alert">
										아이디를 입력하세요.
									</div>
								    중복여부 : <email />
								</div>
								<div class="form-group">
								    <label>Phone</label>
								    <input class="form-control" id="teacherPhone" name="teacherPhone" placeholder="연락처">
								    <span class="asterix">*</span>
									<span class="cross">x</span>
									<div class="alert alert-danger teacher-alert">
										핸드폰 번호를 정확히 입력하세요.
									</div>
									<div class="alert alert-danger custom-alert">
										연락처를 입력하세요.
									</div>
								</div>
								<div class="form-group">
								    <label>PassWord</label>
								    <input class="form-control" id="teacherPw" name="teacherPw" placeholder="임시비밀번호">
								    <input type="hidden" name="teacherHiddenPw" value=''/>
									<!-- teacherPw의 text value를 javascript로 넘기기 위해 히든에 value값을 넣지 않고 틀만 만들어 둔다. -->
									<span class="asterix">*</span>
									<span class="cross">x</span>
									<div class="alert alert-danger teacher-alert">
										영문 숫자 조합으로 입력해주세요. 7자 이상 15자 내로 적어주세요.
									</div>
									<div class="alert alert-danger custom-alert">
										비밀번호를 입력하세요
									</div>
								</div>
								<button id="addButton" id="submit" type="button"  value="send" >등록</button>
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
	
   <!-- type="text/javascript" 부분은 HTML5에서는 생략할 수 있다. -->
<script type="text/javascript">
 	/* $(document).ready(function() {
		$("#addButton").click(function() {
			$("#addForm").submit();
		});
		$("#emailCheck").click(function() {
			if($("#teacherEmail").val()){
				$.ajax({
					url : 'TeacherEmailCheck'
					, type : "post"
					, data : {teacherEmail : $("#teacherEmail").val()}
					, success : function (data) {
						if(data==1){
							alert("이미 사용 중인 이메일 입니다.");
							$("#teacherEmail").val("");
							$("#teacherEmail").focus();
						}else if(data==0){
							alert("사용 가능한 이메일 입니다.")
						}
					}
				});
			}else{
				alert("이메일을 입력해주세요.");
				$("#teacherEmail").focus();
			}
		});
	});
	 */
	/* 키업방식 */
	$(document).ready(function(){
		$("#teacherEmail").keyup(function(){
			//var gogo="teacher_ajax_id="+$("#teacher_ajax_id").val();
			$.ajax({
				type		: "post"
				,url		: '${pageContext.request.contextPath}/TeacherEmailCheck'
				,data		: {teacherEmail : $("#teacherEmail").val()}
				,success	: function(data){
					if (data == 1){
						$("email").html("이미 사용 중인 이메일 입니다.")
					}else{
						$("email").html("사용 가능한 이메일 입니다.")
						
					}
				}
			})
		});
	});
</script>

<script>
$(document).ready(function(){
	$(function check() {
		/* 1. 이름, 2. 이메일, 3. 핸드폰번호, 4. 비밀번호*/
		var name = $("#teacherNm");
		//var id = $("#teacher_ajax_id");
		var email = $("#teacherEmail");
		var hp = $("#teacherPhone");
		var pw = $("#teacherPw");
		
		///^[a-z]+[0-9]{3,15}$/g;//
		//var regId = /^[a-z0-9_]{4,20}$/;	// 아이디 유효성 검사식 시작
		var regNm = /^[가-힣]{2,15}$/;	// 1. 이름 유효성 검사식
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;  // 2. 이메일 유효성 검사식
		var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;	// 3. 핸드폰번호 유효성 검사식
		var regPw = /^[a-z0-9]{7,15}$/;	// 4. 비밀번호 유효성 검사식
		
		///^\d{3}-\d{3,4}-\d{4}$//
		'use strict';
				// error variables
				var UserError  = true,
					NameError = true,
					SubError   = true,
					MsgError   = true;			

		$("#teacherNm").focus(function() {
			
			if(name.val() === "" || name.val() === null){
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				NameError = true;
			}else{
				if(regNm.test(name.val()) === false || name.val().length < 2){
					$(this).css('border','1px solid #F00');
					$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
					NameError = true;
					name.focus();
				}else{
					$(this).css('border','1px solid #080');
					$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
					NameError = false;
				}
				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
				NameError = false;
			}
		});
		
		$("#teacherEmail").focus(function() {
			
			if(email.val() === "" || email.val() === null){
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				UserError = true;
			}else{
				if(regEmail.test(email.val()) === false){
					$(this).css('border','1px solid #F00');
					$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
					UserError = true;
					email.focus();
				}else{
					$(this).css('border','1px solid #080');
					$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
					UserError = false;
				}
				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
				UserError = false;
			}
		});
		
		$("#teacherPw").focus(function() {
			if(pw.val() === "" || pw.val() === null){
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				SubError = true;
			}else{
				if(regPw.test(pw.val()) === false) {
					$(this).css('border','1px solid #F00');
					$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
					SubError = true;
					pw.focus();
				}else{
					$(this).css('border','1px solid #080');
					$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
					SubError = false;
				}
				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
				SubError = false;
			}
		});

		$("#teacherPhone").focus(function() {
			if(hp.val() === "" || hp.val() === null){
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				MsgError = true;
			}else{
				if(regPhone.test(hp.val()) === false){
					$(this).css('border','1px solid #F00');
					$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
					MsgError = true;
					hp.focus();
				}else{
					$(this).css('border','1px solid #080');
					$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
					MsgError = false;
				}
				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
				MsgError = false;
			}
		});

		// submit form
		$('.addForm').submit(function(event) {
			 if(UserError === true || NameError === true || SubError === true || MsgError === true){
			 	event.preventDefault(); // prevent sending 
			 	$('#teacherEmail,#teacherName,#teacherPw,#teacherPhone').focus();
			 }
		});
	});
});
</script>

<script type="text/javascript">
	/**
	*
	*  Secure Hash Algorithm (SHA256)
	*  http://www.webtoolkit.info/
	*
	*  Original code by Angel Marin, Paul Johnston.
	*
	**/
	$(document).ready(function(){
		function SHA256(s){
      
	        var chrsz   = 8;
	        var hexcase = 0;
	      
	        function safe_add (x, y) {
	            var lsw = (x & 0xFFFF) + (y & 0xFFFF);
	            var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
	            return (msw << 16) | (lsw & 0xFFFF);
	        }
	        function S (X, n) { return ( X >>> n ) | (X << (32 - n)); }
	        function R (X, n) { return ( X >>> n ); }
	        function Ch(x, y, z) { return ((x & y) ^ ((~x) & z)); }
	        function Maj(x, y, z) { return ((x & y) ^ (x & z) ^ (y & z)); }
	        function Sigma0256(x) { return (S(x, 2) ^ S(x, 13) ^ S(x, 22)); }
	        function Sigma1256(x) { return (S(x, 6) ^ S(x, 11) ^ S(x, 25)); }
	        function Gamma0256(x) { return (S(x, 7) ^ S(x, 18) ^ R(x, 3)); }
	        function Gamma1256(x) { return (S(x, 17) ^ S(x, 19) ^ R(x, 10)); }
	      
	        function core_sha256 (m, l) {
	             
	            var K = new Array(0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1,
	                0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3,
	                0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786,
	                0xFC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA,
	                0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147,
	                0x6CA6351, 0x14292967, 0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13,
	                0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B,
	                0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070,
	                0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A,
	                0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208,
	                0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2);
	 
	            var HASH = new Array(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
	 
	            var W = new Array(64);
	            var a, b, c, d, e, f, g, h, i, j;
	            var T1, T2;
	      
	            m[l >> 5] |= 0x80 << (24 - l % 32);
	            m[((l + 64 >> 9) << 4) + 15] = l;
	      
	            for ( var i = 0; i<m.length; i+=16 ) {
	                a = HASH[0];
	                b = HASH[1];
	                c = HASH[2];
	                d = HASH[3];
	                e = HASH[4];
	                f = HASH[5];
	                g = HASH[6];
	                h = HASH[7];
	      
	                for ( var j = 0; j<64; j++) {
	                    if (j < 16) W[j] = m[j + i];
	                    else W[j] = safe_add(safe_add(safe_add(Gamma1256(W[j - 2]), W[j - 7]), Gamma0256(W[j - 15])), W[j - 16]);
	      
	                    T1 = safe_add(safe_add(safe_add(safe_add(h, Sigma1256(e)), Ch(e, f, g)), K[j]), W[j]);
	                    T2 = safe_add(Sigma0256(a), Maj(a, b, c));
	      
	                    h = g;
	                    g = f;
	                    f = e;
	                    e = safe_add(d, T1);
	                    d = c;
	                    c = b;
	                    b = a;
	                    a = safe_add(T1, T2);
	                }
	                HASH[0] = safe_add(a, HASH[0]);
	                HASH[1] = safe_add(b, HASH[1]);
	                HASH[2] = safe_add(c, HASH[2]);
	                HASH[3] = safe_add(d, HASH[3]);
	                HASH[4] = safe_add(e, HASH[4]);
	                HASH[5] = safe_add(f, HASH[5]);
	                HASH[6] = safe_add(g, HASH[6]);
	                HASH[7] = safe_add(h, HASH[7]);
	            }
	            return HASH;
	        }
	        function str2binb (str) {
	            var bin = Array();
	            var mask = (1 << chrsz) - 1;
	            for(var i = 0; i < str.length * chrsz; i += chrsz) {
	                bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i%32);
	            }
	            return bin;
	        }
	        function Utf8Encode(string) {
	            string = string.replace(/\r\n/g,"\n");
	            var utftext = "";
	      
	            for (var n = 0; n < string.length; n++) {
	                var c = string.charCodeAt(n);
	                if (c < 128) {
	                    utftext += String.fromCharCode(c);
	                }
	                else if((c > 127) && (c < 2048)) {
	                    utftext += String.fromCharCode((c >> 6) | 192);
	                    utftext += String.fromCharCode((c & 63) | 128);
	                }
	                else {
	                    utftext += String.fromCharCode((c >> 12) | 224);
	                    utftext += String.fromCharCode(((c >> 6) & 63) | 128);
	                    utftext += String.fromCharCode((c & 63) | 128);
	                }
	            }
	            return utftext;
	        }
	        function binb2hex (binarray) {
	            var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
	            var str = "";
	            for(var i = 0; i < binarray.length * 4; i++) {
	                str += hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8+4)) & 0xF) +
	                hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8  )) & 0xF);
	            }
	            return str;
	        }
	      
	        s = Utf8Encode(s);
	        return binb2hex(core_sha256(str2binb(s), s.length * chrsz));
	    }
	    $('#addButton').click(function(){
	    	var pw = $('#teacherPw').val();
	    	console.log(pw+'<--사용자가 입력한 비밀번호');
	    	var SHA256PW = SHA256(pw);
	    	console.log(SHA256PW+"<-- 암호화된 비밀번호");
	    	$('.addForm').submit();
		});
	});
</script>
</body>
</html>
