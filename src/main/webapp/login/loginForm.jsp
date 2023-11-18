<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form id="loginForm" class="user" action="${pageContext.request.contextPath }/login/loginProcess" method="post">
                                        <div class="form-group">
                                            <input type="text" name="userid" class="form-control form-control-user"
                                                id="inputId" aria-describedby="emailHelp"
                                                placeholder="Enter Your Number...">
                                            <input id="hapInput" type="hidden" name="username" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" class="form-control form-control-user"
                                                id="inputPw" placeholder="Password">
                                        </div>
                                       <!--  <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div> -->

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												name="role" id="inlineRadio1" value="STD">
											<label class="form-check-label" for="inlineRadio1">학생</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												name="role" id="inlineRadio2" value="PRF">
											<label class="form-check-label" for="inlineRadio2">교수</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="role"
												id="inlineRadio3" value="STF"> 
												<label class="form-check-label" for="inlineRadio3">교직원</label>
										</div>
										<button type="submit" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                    
                                    <!-- 계정 자동 로그인 기능 임시 생성 -->
                                    <div class="d-flex text-center" style="justify-content: space-between; width: 180px;">
										<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
											<input type="hidden" name="username" value="STD_20210001"> <input type="hidden" name="password" value="java"> <input type="submit" class="btn btn-warning" value="학생">
										</form>
										<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
											<input type="hidden" name="username" value="PRF_84890001"> <input type="hidden" name="password" value="java"> <input type="submit" class="btn btn-warning" value="교수">
										</form>
										<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
											<input type="hidden" name="username" value="STF_72410001"> <input type="hidden" name="password" value="java"> <input type="submit" class="btn btn-warning" value="교직원">
										</form>
									</div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

</body>

<script type="text/javascript">
	$(loginForm).submit(function(event) {
		// 기본 이벤트 막기
		event.preventDefault();
		
		// 아이디, 비밀번호 다 입력받았는지 확인하기
		let idVal = $(inputId).val().trim();
		let pwVal = $(inputPw).val().trim();
		
		if (idVal == '' || pwVal == '') {
			alert("아이디 또는 비밀번호를 입력해주세요.");
			return;
		}
		
		// 선택된 라디오 버튼의 값을 가져오기
	    var selectedRole = document.querySelector('input[name="role"]:checked');

		// 타입이 선택되었다면 타입_아이디형태로 서버에 보내주기
	    if (selectedRole) {
	        let role = selectedRole.value;
	        $(hapInput).val(role + '_' + idVal);
			$(loginForm).unbind('submit').submit();
	    } else {
	        alert("사용자의 타입을 선택해주세요.");
	    }
	});
</script>

</html>