<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules/header.jsp" />

<!-- start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">	
		<div class="row">
			<!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="./sidebar.jsp" />
			</div>

			<div class="col-md-7 mx-auto">
				<h6 class="mb-0 text-uppercase">Add Expenses</h6>
				<hr/>

				<!-- ✅ Alert Box -->
				<div id="alertBox" class="alert" style="display:none;"></div>

				<div class="card">
					<div class="card-body p-4">
						<form id="expenseForm" class="row g-3" action="addExpense" method="post" onsubmit="return validateExpenseForm()">
							
							<!-- BANK DROPDOWN -->
							<div class="col-md-6">
								<label for="account" class="form-label">Bank Name</label>
								<select class="form-select" id="account" name="account">
									<option selected disabled>Choose Bank...</option>
									<c:forEach var="bank" items="${banks}">
										<option value="${bank.name}">${bank.name}</option>
									</c:forEach>
									<option value="__new__">+ Add New Bank</option>
								</select>
								<small class="text-danger d-none" id="accountError">Please select a bank</small>
							</div>

							<!-- NEW BANK INPUT -->
							<div class="col-md-6" id="newBankDiv" style="display:none;">
							    <label for="newAccount" class="form-label">New Bank Name</label>
							    <input type="text" class="form-control" id="newAccount" name="newAccount" placeholder="Enter new bank name">
							    <small class="text-danger d-none" id="newBankError">Please enter bank name</small>
							</div>
							<!-- AMOUNT -->
							<div class="col-md-6">
							    <label for="amount" class="form-label">Amount (₹)</label>
							    <input type="text"  class="form-control" id="amount"  name="amount"  placeholder="e.g., 250"  required  onkeypress="return allowOnlyNumbers(event)"  onpaste="return false"  ><!-- Prevent pasting alphabets --> 
							    <small class="text-danger d-none" id="amountError">Please enter a valid amount</small>
							</div>

							
							<!-- CATEGORY DROPDOWN -->
							<div class="col-md-6">
								<label for="category" class="form-label">Category</label>
								<select id="category" class="form-select" name="category" required>
									<option selected disabled>Choose Category...</option>
									<c:forEach var="cat" items="${categories}">
										<option value="${cat.name}">${cat.name}</option>
									</c:forEach>
									<option value="__new__">+ Add New Category</option>
								</select>
								<small class="text-danger d-none" id="categoryError">Please select a category</small>
							</div>

							<!-- ADD NEW CATEGORY FIELD -->
							<div class="col-md-6" id="newCategoryDiv" style="display: none;">
								<label for="newCategory" class="form-label">New Category</label>
								<input type="text" class="form-control" id="newCategory" name="newCategory" placeholder="Enter new category">
							</div>
							
							<!-- PAYMENT MODE -->
							<div class="col-md-6">
								<label for="paymentMode" class="form-label">Payment Mode</label>
								<select id="paymentMode" class="form-select" name="paymentMode" required>
									<option selected disabled>Choose...</option>
									<option>Cash</option>
									<option>UPI</option>
									<option>Credit Card</option>
									<option>Debit Card</option>
								</select>
								<small class="text-danger d-none" id="paymentError">Please select payment mode</small>
							</div>
							
							<!-- DATE -->
							<div class="col-md-6">
								<label for="expenseDate" class="form-label">Expense Date</label>
								<input type="date" class="form-control" id="expenseDate" name="expenseDate" required>
								<small class="text-danger d-none" id="dateError">Please select a valid date</small>
							</div>
							
							<!-- TIME -->
							<div class="col-md-6">
								<label for="expenseTime" class="form-label">Time</label>
								<input type="time" class="form-control" id="expenseTime" name="expenseTime">
							</div>
								
							<!-- SUBMIT BUTTON -->
							<div class="col-md-12">
								<div class="d-md-flex d-grid align-items-center gap-3">
									<button type="submit" class="btn btn-primary px-4">Add Record</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../modules/footer.jsp" />

<!-- ✅ Validation + Alert Script -->
<script>
function showAlert(message, type) {
    const alertBox = document.getElementById("alertBox");
    alertBox.style.display = "block";
    alertBox.className = "alert alert-" + type; // success / danger
    alertBox.innerText = message;

    setTimeout(() => {
        alertBox.style.display = "none";
    }, 3000);
}

function validateExpenseForm() {
    let isValid = true;

    // Bank validation
    let account = document.getElementById("account").value;
    if (account === "Choose Bank..." || account === "") {
        document.getElementById("accountError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("accountError").classList.add("d-none");
    }

 

    // Category validation
    let category = document.getElementById("category").value;
    if (category === "Choose Category..." || category === "") {
        document.getElementById("categoryError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("categoryError").classList.add("d-none");
    }

    // Payment validation
    let payment = document.getElementById("paymentMode").value;
    if (payment === "Choose..." || payment === "") {
        document.getElementById("paymentError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("paymentError").classList.add("d-none");
    }

    // Date validation
    let expenseDate = document.getElementById("expenseDate").value;
    if (expenseDate === "") {
        document.getElementById("dateError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("dateError").classList.add("d-none");
    }

    // If not valid → show error alert
    if (!isValid) {
        showAlert("Please fix the errors before submitting!", "danger");
        return false;
    }

    // If valid → show success alert
    showAlert("Expense added successfully!", "success");
    return true;
}
</script>
<script>
function allowOnlyNumbers(event) {
    const charCode = event.which ? event.which : event.keyCode;

    // Allow digits (0–9) and one dot (.)
    if ((charCode >= 48 && charCode <= 57) || charCode === 46) {
        // Prevent multiple dots
        const inputValue = event.target.value;
        if (charCode === 46 && inputValue.includes('.')) {
            return false;
        }
        return true;
    }

    // Block any other input (letters, symbols, spaces)
    return false;
}

// Extra validation check before submitting
function validateAmount() {
    const amount = document.getElementById("amount").value.trim();
    const error = document.getElementById("amountError");
    let isValid = true;

    if (amount === "" || isNaN(amount) || parseFloat(amount) <= 0) {
        error.classList.remove("d-none");
        isValid = false;
    } else {
        error.classList.add("d-none");
    }

    return isValid;
}
</script>
