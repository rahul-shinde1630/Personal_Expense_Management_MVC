<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
	<div class="page-content">
		<div class="row">
		 <!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="../Repayments/sidebar.jsp" />
			</div>
			<div class="col-md-7  mx-auto">
				<h6 class="mb-0 text-uppercase">Add Borrowed Repayment</h6>
				<hr/>
				<div class="card">
					<div class="card-body p-4">
					
						<p style="color: green;">${successMsg}</p>
						<p style="color: red;">${errMsg}</p>

						<form class="row g-3" action="addRepayment" method="post">
							
							<input type="hidden" name="borrowedId" value="${borrowedList.id}" />

							<!-- PERSON NAME -->
							<div class="col-md-6">
								<label for="personName" class="form-label">Person Name</label>
								<input type="text" class="form-control" id="personName" name="personName"
									value="${borrowedList.personName}" required>
							</div>
 						<!-- Transaction Type -->
                            <div class="col-md-6">
                                <label for="transactionType" class="form-label">Transaction Type</label>
                                <select class="form-select" id="transactionType" name="transactionType" required>
                                    <option value="" disabled ${empty param.transactionType ? 'selected' : ''}>Choose...</option>
                                    <option value="BORROWED" ${param.transactionType == 'BORROWED' ? 'selected' : ''}>Borrowed</option>
                                    <option value="LENT" ${param.transactionType == 'LENT' ? 'selected' : ''}>Lent</option>
                                </select>
                            </div>
							<!-- AMOUNT -->
							<div class="col-md-6">
								<label for="amount" class="form-label">Amount (₹)</label>
								<input type="number" class="form-control" id="amount" name="amount"
									value="${borrowedList.amount}" required>
							</div>

							<!-- DUE DATE -->
							<div class="col-md-6">
								<label for="repaymentsDate" class="form-label">Repayments Date</label>
								<input type="date" class="form-control" id="RepaymentsDate" name="repaymentsDate"
								required>
							</div>

							<!-- REMAINING AMOUNT -->
							<div class="col-md-6">
								<label for="remainingAmount" class="form-label">Remaining Amount (₹)</label>
								<input type="number" class="form-control" id="remainingAmount" name="remainingAmount"
									value="${borrowedList.remainingAmount}" required>
							</div>

							<!-- STATUS -->
							<div class="col-md-6">
								<label for="status" class="form-label">Status</label>
								<select id="status" class="form-select" name="status" required>
									<option value="Pending" ${borrowedList.status == 'Pending' ? 'selected' : ''}>Pending</option>
									<option value="Paid" ${borrowedList.status == 'Paid' ? 'selected' : ''}>Paid</option>
									<option value="Partial" ${borrowedList.status == 'Partial' ? 'selected' : ''}>Partial</option>
								</select>
							</div>

							

							<!-- SUBMIT BUTTON -->
							<div class="col-md-12">
								<div class="d-md-flex d-grid align-items-center gap-3">
									<button type="submit" class="btn btn-primary px-4">Repayments Lent</button>
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
