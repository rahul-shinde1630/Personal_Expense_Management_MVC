<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules/header.jsp"/>

<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            
            <!-- Sidebar -->
            <div class="col-md-3">
                <jsp:include page="./sidebar.jsp"/>
            </div>

            <!-- Main Form -->
            <div class="col-md-7 mx-auto">
                <h6 class="mb-0 text-uppercase">Add Repayment</h6>
                <hr/>
                <div class="card">
                    <div class="card-body p-4">

                        <!-- Messages -->
                        <c:if test="${not empty successMsg}">
                            <p class="text-success fw-bold">${successMsg}</p>
                        </c:if>
                        <c:if test="${not empty errMsg}">
                            <p class="text-danger fw-bold">${errMsg}</p>
                        </c:if>

                        <!-- Add Repayment Form -->
                        <form class="row g-3" id="repaymentForm" action="addRepayment" method="post" novalidate>

                            <input type="hidden" name="referenceId" value="${param.referenceId}"/>

                            <!-- Transaction Type -->
                            <div class="col-md-6">
                                <label for="transactionType" class="form-label">Transaction Type</label>
                                <select class="form-select" id="transactionType" name="transactionType" required>
                                    <option value="" disabled ${empty param.transactionType ? 'selected' : ''}>Choose...</option>
                                    <option value="BORROWED" ${param.transactionType == 'BORROWED' ? 'selected' : ''}>Borrowed</option>
                                    <option value="LENT" ${param.transactionType == 'LENT' ? 'selected' : ''}>Lent</option>
                                </select>
                                <small class="text-danger d-none">Please select transaction type.</small>
                            </div>

                            <!-- Person Name -->
                            <div class="col-md-6">
                                <label for="personName" class="form-label">Person Name</label>
                                <input type="text" class="form-control" id="personName" name="personName"
                                       value="${param.personName}" required>
                                <small class="text-danger d-none">Enter valid name (only letters, min 2 chars).</small>
                            </div>

                            <!-- Amount -->
                            <div class="col-md-6">
                                <label for="amount" class="form-label">Repayment Amount (₹)</label>
                                <input type="number" step="0.01" class="form-control" id="amount" name="amount"
                                       placeholder="Eg: 500.00" value="${param.amount}" required>
                                <small class="text-danger d-none">Enter valid amount (max 2 decimals).</small>
                            </div>

                            <!-- Remaining Amount -->
                            <div class="col-md-6">
                                <label for="remainingAmount" class="form-label">Remaining Amount (₹)</label>
                                <input type="number" step="0.01" class="form-control" id="remainingAmount" 
                                       name="remainingAmount" value="${param.remainingAmount}" required>
                                <small class="text-danger d-none">Enter valid remaining amount.</small>
                            </div>

                            <!-- Repayment Date -->
                            <div class="col-md-6">
                                <label for="repaymentDate" class="form-label">Repayment Date</label>
                                <input type="date" class="form-control" id="repaymentDate" name="repaymentDate"
                                       value="${param.repaymentDate}" required>
                                <small class="text-danger d-none">Please select repayment date.</small>
                            </div>

                            <!-- Status -->
                            <div class="col-md-6">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="" disabled ${empty param.status ? 'selected' : ''}>Choose...</option>
                                    <option value="PENDING" ${param.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                    <option value="PARTIALLY" ${param.status == 'PARTIALLY' ? 'selected' : ''}>Partially Paid</option>
                                    <option value="COMPLETED" ${param.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                                </select>
                                <small class="text-danger d-none">Please select status.</small>
                            </div>

                            <!-- Submit -->
                            <div class="col-md-12 text-end">
                                <button type="submit" class="btn btn-primary px-4">Save</button>
                                <a href="show-repayments" class="btn btn-secondary px-4">Cancel</a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<jsp:include page="../modules/footer.jsp"/>

<script>
    const form = document.getElementById('repaymentForm');

    // Regex patterns
    const regexPatterns = {
        personName: /^[A-Za-z ]{2,50}$/,
        amount: /^[0-9]+(\.[0-9]{1,2})?$/,
        remainingAmount: /^[0-9]+(\.[0-9]{1,2})?$/
    };

    form.addEventListener('submit', function(e) {
        let valid = true;

        // Validate transactionType
        const transactionType = document.getElementById('transactionType');
        toggleError(transactionType, transactionType.value !== '');

        // Validate personName
        const personName = document.getElementById('personName');
        toggleError(personName, regexPatterns.personName.test(personName.value.trim()));

        // Validate amount
        const amount = document.getElementById('amount');
        toggleError(amount, regexPatterns.amount.test(amount.value.trim()));

        // Validate remainingAmount
        const remainingAmount = document.getElementById('remainingAmount');
        toggleError(remainingAmount, regexPatterns.remainingAmount.test(remainingAmount.value.trim()));

        // Validate repaymentDate
        const repaymentDate = document.getElementById('repaymentDate');
        toggleError(repaymentDate, repaymentDate.value !== '');

        // Validate status
        const status = document.getElementById('status');
        toggleError(status, status.value !== '');

        // Check for any visible errors
        form.querySelectorAll('small').forEach(small => {
            if (!small.classList.contains('d-none')) valid = false;
        });

        if (!valid) e.preventDefault(); // stop submit if invalid
    });

    function toggleError(input, condition) {
        const small = input.nextElementSibling;
        if (condition) {
            small.classList.add('d-none');
            input.classList.remove('is-invalid');
            input.classList.add('is-valid');
        } else {
            small.classList.remove('d-none');
            input.classList.remove('is-valid');
            input.classList.add('is-invalid');
        }
    }
</script>

<style>
    .is-invalid {
        border-color: #dc3545 !important;
    }
    .is-valid {
        border-color: #198754 !important;
    }
</style>
