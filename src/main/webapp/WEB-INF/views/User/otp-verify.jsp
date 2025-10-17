<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules2/header.jsp"/>
<style>
.otp-box {
    width: 40px;
    height: 40px;
    text-align: center;
    font-size: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
</style>
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
									<c:if test="${not empty error}">
									    <div class="alert alert-danger mt-3">${error}</div>
									</c:if>
									
									<c:if test="${not empty msg}">
									    <div class="alert alert-success mt-3">${msg}</div>
									</c:if>

                                <!-- OTP Form -->
                                <form action="verify-otp" method="post" onsubmit="combineOtp()">
								    <div class="my-4">
								        <label class="form-label">Enter OTP</label>
								        <div id="otp" style="display: flex; gap: 5px;">
								            <input type="text" maxlength="1" class="otp-box" oninput="moveNext(this, event)" onpaste="handlePaste(event)" />
								            <input type="text" maxlength="1" class="otp-box" oninput="moveNext(this, event)" onpaste="handlePaste(event)" />
								            <input type="text" maxlength="1" class="otp-box" oninput="moveNext(this, event)" onpaste="handlePaste(event)" />
								            <input type="text" maxlength="1" class="otp-box" oninput="moveNext(this, event)" onpaste="handlePaste(event)" />
								            <input type="text" maxlength="1" class="otp-box" oninput="moveNext(this, event)" onpaste="handlePaste(event)" />
								            <input type="text" maxlength="1" class="otp-box" oninput="moveNext(this, event)" onpaste="handlePaste(event)" />
								        </div>
								    </div>
								
								    <!-- Hidden field to hold combined OTP -->
								    <input type="hidden" name="otp" id="hiddenOtp" />
								
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
<script>
function moveNext(current, e) {
    current.value = current.value.replace(/[^0-9]/g, '');
    if(current.value.length === 1){
        let next = current.nextElementSibling;
        if(next && next.classList.contains('otp-box')){
            next.focus();
        }
    }
    if(e.inputType === "deleteContentBackward"){
        let prev = current.previousElementSibling;
        if(prev && prev.classList.contains('otp-box')){
            prev.focus();
        }
    }
}
function combineOtp() {
    let boxes = document.querySelectorAll('.otp-box');
    let otpValue = '';
    boxes.forEach(box => otpValue += box.value);
    document.getElementById('hiddenOtp').value = otpValue;
}

// Handle paste for all boxes
function handlePaste(e) {
    e.preventDefault();
    let pasteData = (e.clipboardData || window.clipboardData).getData('text');
    pasteData = pasteData.replace(/[^0-9]/g, ''); // keep digits only
    let boxes = document.querySelectorAll('.otp-box');
    for(let i = 0; i < boxes.length; i++){
        boxes[i].value = pasteData[i] || '';
    }
    // Focus last filled box
    for(let i = 0; i < boxes.length; i++){
        if(boxes[i].value === ''){
            boxes[i].focus();
            return;
        }
    }
}
</script>


<jsp:include page="../modules2/footer.jsp"/>
