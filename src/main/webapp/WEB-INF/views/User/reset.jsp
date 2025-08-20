<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../modules2/header.jsp"/>

<!--wrapper-->
	<div class="wrapper">
		<div class="section-authentication-cover">
			<div class="">
				<div class="row g-0">
					<div class="col-12 col-xl-7 col-xxl-8 auth-cover-left align-items-center justify-content-center d-none d-xl-flex">
                        <div class="card shadow-none bg-transparent shadow-none rounded-0 mb-0">
							<div class="card-body">
                                 <img src="assets/images/login-images/reset-password-cover.svg" class="img-fluid" width="600" alt=""/>
							</div>
						</div>
					</div>
					<div class="col-12 col-xl-5 col-xxl-4 auth-cover-right align-items-center justify-content-center">
						<div class="card rounded-0 m-3 shadow-none bg-transparent mb-0">
							<div class="card-body p-sm-5">
								<div class="">
									<div class="mb-4 text-center">
										<img src="assets/images/logo-icon.png" width="60" alt="" />
									</div>
									<div class="text-start mb-4">
										<h5 class="">Generate New Password</h5>
										<p class="mb-0">We received your reset password request. Please enter your new password!</p>
									</div>
									<div class="mb-3 mt-4">
										<label class="form-label">New Password</label>
										<input type="text"name="newpassword" class="form-control" placeholder="Enter new password" />
									</div>
									<div class="mb-4">
										<label class="form-label">Confirm Password</label>
										<input type="text"name="conpassword" class="form-control" placeholder="Confirm password" />
									</div>
									<div class="d-grid gap-2">
										<button type="button" class="btn btn-primary">Change Password</button> <a href="login" class="btn btn-light"><i class='bx bx-arrow-back mr-1'></i>Back to Login</a>
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
<jsp:include page="../modules2/header.jsp"/>