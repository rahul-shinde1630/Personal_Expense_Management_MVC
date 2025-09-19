<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="modules2/header.jsp"/>
<%-- <c:if test="${param.logout != null}">
    <div class="alert alert-success">
        ✅ You have successfully logged out!
    </div>
</c:if> --%>

<!--wrapper-->
<div class="wrapper">
	<div class="section-authentication-cover">
		<div class="">
			<div class="row g-0">

				<!-- Left Image Section -->
				<div class="col-12 col-xl-7 col-xxl-8 auth-cover-left align-items-center justify-content-center d-none d-xl-flex">
					<div class="card shadow-none bg-transparent shadow-none rounded-0 mb-0">
						<div class="card-body">
							<img src="resources/assets/images/login-images/login-cover.svg" class="img-fluid auth-img-cover-login" width="650" alt=""/>
						</div>
					</div>
				</div>

				<!-- Right Login Form -->
				<div class="col-12 col-xl-5 col-xxl-4 auth-cover-right align-items-center justify-content-center">
					<div class="card rounded-0 m-3 shadow-none bg-transparent mb-0">
						<div class="card-body p-sm-5">

							<!-- ✅ Alerts for success / error -->
							<c:if test="${not empty successMsg}">
								  <div class="alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-3" role="alert">
								    ${successMsg}
								    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								  </div>
							</c:if>
							
							<c:if test="${not empty errMsg}">
								  <div class="alert alert-danger alert-dismissible fade show position-fixed top-0 end-0 m-3" role="alert">
								    ${errMsg}
								    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								  </div>
							</c:if>

							<div class="text-center mb-4">
								<img src="resources/assets/images/logo-icon.png" width="60" alt="">
								<h5 class="mt-3">Log in</h5>
								<p class="mb-0">Please log in to your account</p>
							</div>
								
							<div class="form-body">
								<form class="row g-3" action="home" method="post" onsubmit="return validateLoginForm()">
									
									<!-- Email -->
									<div class="col-12">
										<label for="inputEmailAddress" class="form-label">Email</label>
										<input type="email" name="email" class="form-control" id="inputEmailAddress" placeholder="jhon@example.com">
										<small id="emailError" style="color:red; display:none;">Please enter a valid email</small>
									</div>
									
									<!-- Password -->
									<div class="col-12">
										<label for="inputChoosePassword" class="form-label">Password</label>
										<div class="input-group" id="show_hide_password">
											<input type="password" name="password" class="form-control border-end-0" id="inputChoosePassword" placeholder="Enter Password"> 
											<a href="javascript:;" class="input-group-text bg-transparent"><i class="bx bx-hide"></i></a>
										</div>
										<small id="passwordError" style="color:red; display:none;">Password must be at least 6 characters</small>
									</div>

									<div class="col-md-6 text-end">
										<a href="forgot-password">Forgot Password ?</a>
									</div>

									<!-- Submit -->
									<div class="col-12">
										<div class="d-grid">
											<button type="submit" class="btn btn-primary">Sign in</button>
										</div>
									</div>

									<!-- Sign up link -->
									<div class="col-12">
										<div class="text-center ">
											<p class="mb-0">Don't have an account yet? <a href="signup">Sign up here</a></p>
										</div>
									</div>
								</form>
							</div>

							<div class="login-separater text-center mb-5"> 
								<span>OR SIGN IN WITH</span>
								<hr>
							</div>
								
						</div>
					</div>
				</div>

			</div>
			<!--end row-->
		</div>
	</div>
</div>
<!--end wrapper-->

<!-- ✅ JavaScript Validation + Auto Close Alert -->
<script>
function validateLoginForm() {
    let email = document.getElementById("inputEmailAddress").value.trim();
    let password = document.getElementById("inputChoosePassword").value.trim();
    let emailError = document.getElementById("emailError");
    let passwordError = document.getElementById("passwordError");

    let isValid = true;

    // Email validation
    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (email === "" || !email.match(emailPattern)) {
        emailError.style.display = "block";
        isValid = false;
    } else {
        emailError.style.display = "none";
    }

    // Password validation
    if (password === "" || password.length < 6) {
        passwordError.style.display = "block";
        isValid = false;
    } else {
        passwordError.style.display = "none";
    }

    return isValid; 
}

// Auto close alert after 6 sec
setTimeout(() => {
   let alerts = document.querySelectorAll('.alert');
   alerts.forEach(alert => {
      bootstrap.Alert.getOrCreateInstance(alert).close();
   });
}, 6000);
</script>

<jsp:include page="modules2/footer.jsp"/>
