<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../modules2/header.jsp"/>

<!--wrapper-->
<div class="wrapper">
    <div class="section-authentication-cover">
        <div class="">
            <div class="row g-0">
                <!-- Left Image -->
                <div class="col-12 col-xl-7 col-xxl-8 auth-cover-left align-items-center justify-content-center d-none d-xl-flex">
                    <div class="card shadow-none bg-transparent rounded-0 mb-0">
                        <div class="card-body">
                            <img src="assets/images/login-images/reset-password-cover.svg" class="img-fluid" width="600" alt=""/>
                        </div>
                    </div>
                </div>

                <!-- Right Form -->
                <div class="col-12 col-xl-5 col-xxl-4 auth-cover-right align-items-center justify-content-center">
                    <div class="card rounded-0 m-3 shadow-none bg-transparent mb-0">
                        <div class="card-body p-sm-5">
                            <div>
                                <div class="mb-4 text-center">
                                    <img src="assets/images/logo-icon.png" width="60" alt="" />
                                </div>
                                <div class="text-start mb-4">
                                    <h5 class="">Generate New Password</h5>
                                    <p class="mb-0">We received your reset password request. Please enter your new password!</p>
                                </div>

                                <!-- Form for Reset Password -->
                                <form action="update-password" method="post" onsubmit="return validatePassword()">
                                    <input type="hidden" name="email" value="${email}" />

                                    <div class="mb-3 mt-4">
                                        <label class="form-label">New Password</label>
                                        <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="Enter new password" required />
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">Confirm Password</label>
                                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm password" required />
                                    </div>

                                    <div id="errorMsg" class="text-danger mb-3" style="display:none;"></div>

                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-primary">Change Password</button>
                                        <a href="login" class="btn btn-light"><i class='bx bx-arrow-back mr-1'></i>Back to Login</a>
                                    </div>
                                </form>
                                <!-- End Form -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Right Form -->
            </div>
        </div>
    </div>
</div>

<!-- JS Validation -->
<script>
function validatePassword() {
    const newPassword = document.getElementById("newPassword").value.trim();
    const confirmPassword = document.getElementById("confirmPassword").value.trim();
    const errorMsg = document.getElementById("errorMsg");

    // Reset previous error
    errorMsg.style.display = "none";
    errorMsg.innerText = "";

    // 1️⃣ Check if empty
    if (!newPassword || !confirmPassword) {
        errorMsg.innerText = "Please fill in both password fields.";
        errorMsg.style.display = "block";
        return false;
    }

    // 2️⃣ Check password match
    if (newPassword !== confirmPassword) {
        errorMsg.innerText = "Passwords do not match.";
        errorMsg.style.display = "block";
        return false;
    }

    // 3️⃣ Check password strength
    const strongPassword = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
    if (!strongPassword.test(newPassword)) {
        errorMsg.innerHTML = `
            Password must be at least 8 characters long and include:<br>
            • 1 uppercase letter<br>
            • 1 number<br>
            • 1 special character (!@#$%^&*)
        `;
        errorMsg.style.display = "block";
        return false;
    }

    return true; // ✅ Allow form submit
}
</script>

<jsp:include page="../modules2/footer.jsp"/>
