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
            <div class="col-md-7  mx-auto">
					<h6 class="mb-0 text-uppercase">Add Income</h6>
				<hr/>
                <div class="card">
                    <div class="card-body p-4">
                        <p style="color: green;">${successMsg}</p>
                        <p style="color: red;">${errMsg}</p>

                        <form class="row g-3" action="addIncomes" method="post">
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
                            <div class="col-md-6">
                                <label for="incomeTitle" class="form-label">Income Title</label>
                                <input type="text" class="form-control" id="incomeTitle" name="title" placeholder="Eg: Salary for June" required>
                            </div>

                            <div class="col-md-6">
                                <label for="incomeAmount" class="form-label">Amount (₹)</label>
                                <input type="number" class="form-control" id="incomeAmount" name="amount" placeholder="Eg: 10000" required>
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
							
                            <div class="col-md-6">
                                <label for="incomeDate" class="form-label">Income Date</label>
                                <input type="date" class="form-control" id="incomeDate" name="incomeDate" required>
                            </div>

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
<script src="resources/assets/js/expense-form.js"></script>