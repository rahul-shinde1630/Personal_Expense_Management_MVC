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
				<div class="card">
					<div class="card-body p-4">
						<p style="color: green;">${successMsg}</p>
						<p style="color: red;">${errMsg}</p>

						<form class="row g-3" action="addExpense" method="post">
							
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
							</div>

							<!-- AMOUNT -->
							<div class="col-md-6">
								<label for="amount" class="form-label">Amount (₹)</label>
								<input type="number" class="form-control" id="amount" name="amount" placeholder="e.g., 250" required>
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
							</div>
							
							<!-- DATE -->
							<div class="col-md-6">
								<label for="expenseDate" class="form-label">Expense Date</label>
								<input type="date" class="form-control" id="expenseDate" name="expenseDate" required>
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

<script src="resources/assets/js/expense-form.js"></script>

