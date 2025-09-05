<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules2/header.jsp"/>

<!--wrapper-->
<div class="wrapper">
	<div class="section-authentication-cover">
		<div class="">
			<div class="row g-0">

				<!-- Left Image Section -->
				<div class="col-12 col-xl-7 col-xxl-8 auth-cover-left align-items-center justify-content-center d-none d-xl-flex">
					<div class="card shadow-none bg-transparent shadow-none rounded-0 mb-0">
						<div class="card-body">
							<img src="resources/assets/images/login-images/register-cover.svg" class="img-fluid auth-img-cover-login" width="550" alt=""/>
						</div>
					</div>
				</div>

				<!-- Right Sign Up Section -->
				<div class="col-12 col-xl-5 col-xxl-4 auth-cover-right align-items-center justify-content-center">
					<div class="card rounded-0 m-3 shadow-none bg-transparent mb-0">
						<div class="card-body p-sm-5">
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
																
							<div class="">
								<div class="mb-3 text-center">
									<img src="resources/assets/images/logo-icon.png" width="60" alt="" />
								</div>
								<div class="text-center mb-4">
									<h5 class="">Sign up</h5>
									<p class="mb-0">Please fill the below details to create your account</p>
									
								</div>

								<div class="form-body">
									<!-- ✅ Added Validation function -->
									<form class="row g-3" action="signup" method="post" onsubmit="return validateSignupForm()">
										
										<!-- Username -->
										<div class="col-12">
											<label for="inputUsername" class="form-label">Username</label>
											<input type="text" name="name" class="form-control" id="inputUsername" placeholder="John">
											<small id="usernameError" style="color:red; display:none;">Username is required</small>
										</div>

										<!-- Email -->
										<div class="col-12">
											<label for="inputEmailAddress" class="form-label">Email Address</label>
											<input type="email" name="email" class="form-control" id="inputEmailAddress" placeholder="example@user.com">
											<small id="emailError" style="color:red; display:none;">Enter a valid email</small>
										</div>

										<!-- Password -->
										<div class="col-12">
											<label for="inputChoosePassword" class="form-label">Password</label>
											<div class="input-group" id="show_hide_password">
												<input type="password" class="form-control border-end-0" name="password" id="inputChoosePassword" placeholder="Enter Password"> 
												<a href="javascript:;" class="input-group-text bg-transparent"><i class='bx bx-hide'></i></a>
											</div>
											<small id="passwordError" style="color:red; display:none;">Password must be at least 6 characters</small>
										</div>

										<!-- Country -->
										<div class="col-12">
											<label class="form-label">Country</label>
											<select class="form-select" name="country" id="inputSelectCountry">
												<option value="">-- Select Country --</option>
												<option value="India">India</option>
												<option value="United Kingdom">United Kingdom</option>
												<option value="America">America</option>
												<option value="Dubai">Dubai</option>
											</select>
											<small id="countryError" style="color:red; display:none;">Please select a country</small>
										</div>

										<!-- Terms -->
										<div class="col-12">
											<div class="form-check form-switch">
												<input class="form-check-input" id="termsCheck" name="checkbox" type="checkbox" value="true">
												<label class="form-check-label" for="termsCheck">I read and agree to Terms & Conditions</label>
											</div>
											<small id="termsError" style="color:red; display:none;">You must agree to Terms & Conditions</small>
										</div>

										<!-- Submit -->
										<div class="col-12">
											<div class="d-grid">
												<button type="submit" class="btn btn-primary">Sign up</button>
											</div>
										</div>

										<div class="col-12">
											<div class="text-center">
												<p class="mb-0">Already have an account? <a href="login">Login here</a></p>
											</div>
										</div>
									</form>
								</div>

								<div class="login-separater text-center mb-5"> 
									<span>OR SIGN UP WITH EMAIL</span>
									<hr/>
								</div>

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

<!-- ✅ JavaScript Validation -->
<script>
function validateSignupForm() {
    let username = document.getElementById("inputUsername").value.trim();
    let email = document.getElementById("inputEmailAddress").value.trim();
    let password = document.getElementById("inputChoosePassword").value.trim();
    let country = document.getElementById("inputSelectCountry").value;
    let terms = document.getElementById("termsCheck").checked;

    let isValid = true;

    // Username
    if (username === "") {
        document.getElementById("usernameError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("usernameError").style.display = "none";
    }

    // Email
    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (email === "" || !email.match(emailPattern)) {
        document.getElementById("emailError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("emailError").style.display = "none";
    }

    // Password
    if (password.length < 6) {
        document.getElementById("passwordError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("passwordError").style.display = "none";
    }

    // Country
    if (country === "") {
        document.getElementById("countryError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("countryError").style.display = "none";
    }

    // Terms
    if (!terms) {
        document.getElementById("termsError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("termsError").style.display = "none";
    }

    return isValid; // false => form submit nahi hoil
}
//auto close after 3 sec
setTimeout(() => {
   let alerts = document.querySelectorAll('.alert');
   alerts.forEach(alert => {
      bootstrap.Alert.getOrCreateInstance(alert).close();
   });
}, 6000);


</script>

<jsp:include page="../modules2/footer.jsp"/>
