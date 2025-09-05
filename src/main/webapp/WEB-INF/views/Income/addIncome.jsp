<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules/header.jsp"/>

<!-- Start page wrapper -->
<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <!-- Sidebar column -->
            <div class="col-md-3">
                <jsp:include page="./sidebar.jsp" />
            </div>

            <div class="col-md-7 mx-auto">
                <h6 class="mb-0 text-uppercase">Add Income</h6>
                <hr/>

                <!-- ✅ Alert Box -->
                <div id="alertBox" class="alert" style="display:none;"></div>

                <div class="card">
                    <div class="card-body p-4">
                        <form id="incomeForm" class="row g-3" action="addIncomes" method="post" onsubmit="return validateIncomeForm()">

                            <!-- BANK DROPDOWN -->
                            <div class="col-md-12">
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

                            <!-- INCOME TITLE -->
                            <div class="col-md-6">
                                <label for="incomeTitle" class="form-label">Income Title</label>
                                <input type="text" class="form-control" id="incomeTitle" name="title" placeholder="Eg: Salary for June" required>
                                <small class="text-danger d-none" id="titleError">Please enter a title</small>
                            </div>

                            <!-- AMOUNT -->
                            <div class="col-md-6">
                                <label for="incomeAmount" class="form-label">Amount (₹)</label>
                                <input type="number" class="form-control" id="incomeAmount" name="amount" placeholder="Eg: 10000" required>
                                <small class="text-danger d-none" id="amountError">Please enter valid amount</small>
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
                                <small class="text-danger d-none" id="categoryError">Please select category</small>
                            </div>

                            <!-- ADD NEW CATEGORY FIELD -->
                            <div class="col-md-6" id="newCategoryDiv" style="display: none;">
                                <label for="newCategory" class="form-label">New Category</label>
                                <input type="text" class="form-control" id="newCategory" name="newCategory" placeholder="Enter new category">
                            </div>

                            <!-- DATE -->
                            <div class="col-md-6">
                                <label for="incomeDate" class="form-label">Income Date</label>
                                <input type="date" class="form-control" id="incomeDate" name="incomeDate" required>
                                <small class="text-danger d-none" id="dateError">Please select a valid date</small>
                            </div>

                            <!-- SUBMIT -->
                            <div class="col-md-12">
                                <div class="d-md-flex d-grid align-items-center gap-3">
                                    <button type="submit" class="btn btn-success px-4">Add Income</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="../modules/footer.jsp"/>

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

function validateIncomeForm() {
    let isValid = true;

    // Bank validation
    let account = document.getElementById("account").value;
    if (account === "Choose Bank..." || account === "") {
        document.getElementById("accountError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("accountError").classList.add("d-none");
    }

    // Title validation
    let title = document.getElementById("incomeTitle").value.trim();
    if (title === "") {
        document.getElementById("titleError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("titleError").classList.add("d-none");
    }

    // Amount validation
    let amount = document.getElementById("incomeAmount").value;
    if (amount === "" || amount <= 0) {
        document.getElementById("amountError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("amountError").classList.add("d-none");
    }

    // Category validation
    let category = document.getElementById("category").value;
    if (category === "Choose Category..." || category === "") {
        document.getElementById("categoryError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("categoryError").classList.add("d-none");
    }

    // Date validation
    let incomeDate = document.getElementById("incomeDate").value;
    if (incomeDate === "") {
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
    showAlert("Income added successfully!", "success");
    return true;
}
</script>
