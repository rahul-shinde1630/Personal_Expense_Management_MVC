<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../modules/header.jsp" />

<!-- Start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<div class="row">
			<!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="./sidebar.jsp" />
			</div>

			<!-- Main content -->
			<div class="col-md-7 mx-auto">
				<h6 class="mb-0 text-uppercase">Update Income</h6>
				<hr />
				<div class="card">
					<div class="card-body p-4">
						<p style="color: green;">${successMsg}</p>
						<p style="color: red;">${errMsg}</p>

						<form class="row g-3" action="updateIncome" method="post">
							<input type="hidden" name="id" value="${income.id}" />

							<!-- Bank Dropdown -->
							<div class="col-md-12">
								<label for="account" class="form-label">Bank Name</label>
								<select class="form-select" id="account" name="account">
									<option disabled>Choose Bank...</option>
									<c:forEach var="bank" items="${banks}">
										<option value="${bank.name}" ${bank.name == income.account ? 'selected' : ''}>${bank.name}</option>
									</c:forEach>
									<option value="__new__">+ Add New Bank</option>
								</select>
							</div>

							<!-- Title -->
							<div class="col-md-6">
								<label for="incomeTitle" class="form-label">Income Title</label>
								<input type="text" class="form-control" id="incomeTitle" name="title"
									value="${income.title}" required />
							</div>

							<!-- Amount -->
							<div class="col-md-6">
								<label for="incomeAmount" class="form-label">Amount (₹)</label>
								<input type="number" class="form-control" id="incomeAmount" name="amount"
									value="${income.amount}" required />
							</div>

							<!-- Category -->
							<div class="col-md-6">
								<label for="category" class="form-label">Category</label>
								<select id="category" class="form-select" name="category" required>
									<option disabled>Choose Category...</option>
									<c:forEach var="cat" items="${categories}">
										<option value="${cat.name}" ${cat.name == income.category ? 'selected' : ''}>${cat.name}</option>
									</c:forEach>
									<option value="__new__">+ Add New Category</option>
								</select>
							</div>

							<!-- New Category Field (Optional) -->
							<div class="col-md-6" id="newCategoryDiv" style="display: none;">
								<label for="newCategory" class="form-label">New Category</label>
								<input type="text" class="form-control" id="newCategory" name="newCategory"
									placeholder="Enter new category" />
							</div>

							<!-- Date -->
							<div class="col-md-6">
								<label for="incomeDate" class="form-label">Income Date</label>
								<input type="date" class="form-control" id="incomeDate" name="incomeDate"
									value="${income.incomeDate}" required />
							</div>
							<div class="col-md-12">
							                <div class="d-md-flex d-grid align-items-center gap-3">
							                  <button type="submit" class="btn btn-primary px-4">Update </button>
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
