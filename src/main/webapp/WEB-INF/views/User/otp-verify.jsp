<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../modules2/header.jsp"/>

<!--wrapper-->
<div class="wrapper">
    <div class="section-authentication-cover">
        <div class="">
            <div class="row g-0">
                <!-- Left side image -->
                <div class="col-12 col-xl-7 col-xxl-8 auth-cover-left align-items-center justify-content-center d-none d-xl-flex">
                    <div class="card shadow-none bg-transparent shadow-none rounded-0 mb-0">
                        <div class="card-body">
                            <img src="assets/images/login-images/otp-verify.svg" class="img-fluid" width="600" alt=""/>
                        </div>
                    </div>
                </div>

                <!-- Right side form -->
                <div class="col-12 col-xl-5 col-xxl-4 auth-cover-right align-items-center justify-content-center">
                    <div class="card rounded-0 m-3 shadow-none bg-transparent mb-0">
                        <div class="card-body p-sm-5">
                            <div class="p-3">
                                <div class="text-center">
                                    <img src="assets/images/icons/otp.png" width="100" alt="" />
                                </div>
                                <h4 class="mt-5 font-weight-bold">OTP Verification</h4>
                                <p class="text-muted">Enter the OTP sent to your registered email</p>

                                <!-- OTP Form -->
                                <form action="verify-otp" method="post">
                                    <div class="my-4">
                                        <label class="form-label">Enter OTP</label>
                                        <input type="text" name="otp" class="form-control" placeholder="Enter 6-digit OTP" required />
                                    </div>
                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-primary">Verify OTP</button>
                                        <a href="forgot-password" class="btn btn-light">
                                            <i class='bx bx-arrow-back me-1'></i> Back
                                        </a>
                                    </div>
                                </form>

                                <!-- Resend option -->
                                <div class="text-center mt-3">
                                    <a href="resend-otp" class="text-decoration-none">Didn’t receive OTP? Resend</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end right side-->
            </div>
            <!--end row-->
        </div>
    </div>
</div>
<!--end wrapper-->

<jsp:include page="../modules2/footer.jsp"/>
