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
                        <form class="row g-3" action="addRepayment" method="post">

                            <!-- Hidden Reference ID -->
                            <input type="hidden" name="referenceId" value="${param.referenceId}"/>

                            <!-- Transaction Type -->
                            <div class="col-md-6">
                                <label for="transactionType" class="form-label">Transaction Type</label>
                                <select class="form-select" id="transactionType" name="transactionType" required>
                                    <option value="" disabled ${empty param.transactionType ? 'selected' : ''}>Choose...</option>
                                    <option value="BORROWED" ${param.transactionType == 'BORROWED' ? 'selected' : ''}>Borrowed</option>
                                    <option value="LENT" ${param.transactionType == 'LENT' ? 'selected' : ''}>Lent</option>
                                </select>
                            </div>

                            <!-- Person Name -->
                            <div class="col-md-6">
                                <label for="personName" class="form-label">Person Name</label>
                                <input type="text" class="form-control" id="personName" name="personName"
                                       value="${param.personName}" required>
                            </div>

                            <!-- Amount -->
                            <div class="col-md-6">
                                <label for="amount" class="form-label">Repayment Amount (₹)</label>
                                <input type="number" step="0.01" class="form-control" id="amount" name="amount"
                                       placeholder="Eg: 500.00" value="${param.amount}" required>
                            </div>

                            <!-- Remaining Amount -->
                            <div class="col-md-6">
                                <label for="remainingAmount" class="form-label">Remaining Amount (₹)</label>
                                <input type="number" step="0.01" class="form-control" id="remainingAmount" 
                                       name="remainingAmount" value="${param.remainingAmount}" required>
                            </div>

                            <!-- Repayment Date -->
                            <div class="col-md-6">
                                <label for="repaymentDate" class="form-label">Repayment Date</label>
                                <input type="date" class="form-control" id="repaymentDate" name="repaymentDate"
                                       value="${param.repaymentDate}" required>
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
