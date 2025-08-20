<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
	<div class="page-content">		
		<div class="row">
		 <!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="../Borrow/sidebar.jsp" />
			</div>
			<div class="col-md-7  mx-auto">
				<div class="card">
					<div class="card-body p-4">
						<h5 class="mb-4">Add Lent Money</h5>

						<p style="color: green;">${successMsg}</p>
						<p style="color: red;">${errMsg}</p>

						<form class="row g-3" action="addLentMoney" method="post">
							
							<!-- PERSON NAME -->
							<div class="col-md-12">
								<label for="personName" class="form-label">Person Name</label>
								<input type="text" class="form-control" id="personName" name="personName" placeholder="Enter person's name" required>
							</div>

							<!-- AMOUNT -->
							<div class="col-md-6">
								<label for="amount" class="form-label">Amount (₹)</label>
								<input type="number" class="form-control" id="amount" name="amount" placeholder="e.g., 500" required>
							</div>

							<!-- LENT DATE -->
							<div class="col-md-6">
								<label for="lentDate" class="form-label">Lent Date</label>
								<input type="date" class="form-control" id="lentDate" name="lentDate" required>
							</div>

							<!-- DUE DATE -->
							<div class="col-md-6">
								<label for="dueDate" class="form-label">Due Date</label>
								<input type="date" class="form-control" id="dueDate" name="dueDate" required>
							</div>

							<!-- REMAINING AMOUNT -->
							<div class="col-md-6">
								<label for="remainingAmount" class="form-label">Remaining Amount (₹)</label>
								<input type="number" class="form-control" id="remainingAmount" name="remainingAmount" placeholder="e.g., 300" required>
							</div>

							<!-- STATUS -->
							<div class="col-md-6">
								<label for="status" class="form-label">Status</label>
								<select id="status" class="form-select" name="status" required>
									<option selected disabled>Choose status...</option>
									<option value="Pending">Pending</option>
									<option value="Paid">Paid</option>
									<option value="Partial">Partial</option>
								</select>
							</div>

							<!-- REASON -->
							<div class="col-md-12">
								<label for="reason" class="form-label">Reason</label>
								<textarea class="form-control" id="reason" name="reason" placeholder="e.g., emergency, loan..." rows="3"></textarea>
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
