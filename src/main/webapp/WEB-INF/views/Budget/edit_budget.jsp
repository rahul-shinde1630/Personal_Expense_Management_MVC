<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp"/>

<!--start page wrapper -->
<div class="page-wrapper">
  <div class="page-content">
    <div class="row">
     <!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="./sidebar-budget.jsp" />
			</div>
      <div class="col-xl-6 mx-auto">

        <div class="card">
          <div class="card-body p-4">
            <h5 class="mb-4">Edit Budget</h5>
            <p style="color: green;">${successMsg}</p>
            <p style="color: red;">${errMsg}</p>

            <form class="row g-3" action="updateBudget" method="post">
              <!-- Hidden ID -->
              <input type="hidden" name="id" value="${budgetDto.id}" />

              <div class="col-md-12">
                <label for="budgetTitle" class="form-label">Budget Title</label>
                <input type="text" class="form-control" id="budgetTitle" name="title" value="${budgetDto.title}" required />
              </div>

              <div class="col-md-6">
                <label for="amount" class="form-label">Amount (₹)</label>
                <input type="number" class="form-control" id="amount" name="amount" value="${budgetDto.amount}" required />
              </div>

              <div class="col-md-6">
                <label for="category" class="form-label">Category</label>
                <select id="category" class="form-select" name="category" required>
                  <option disabled>Choose...</option>
                  <option ${budgetDto.category == 'Salary' ? 'selected' : ''}>Salary</option>
                  <option ${budgetDto.category == 'Freelance' ? 'selected' : ''}>Freelance</option>
                  <option ${budgetDto.category == 'Business' ? 'selected' : ''}>Business</option>
                  <option ${budgetDto.category == 'Investment' ? 'selected' : ''}>Investment</option>
                  <option ${budgetDto.category == 'Gift' ? 'selected' : ''}>Gift</option>
                  <option ${budgetDto.category == 'Other' ? 'selected' : ''}>Other</option>
                </select>
              </div>

              <div class="col-md-6">
                <label for="fromDate" class="form-label">From Date</label>
                <input type="date" class="form-control" id="fromDate" name="fromDate" value="${budgetDto.fromDate}" required />
              </div>

              <div class="col-md-6">
                <label for="toDate" class="form-label">To Date</label>
                <input type="date" class="form-control" id="toDate" name="toDate" value="${budgetDto.toDate}" required />
              </div>

              <div class="col-md-12">
                <div class="d-md-flex d-grid align-items-center gap-3">
                  <button type="submit" class="btn btn-primary px-4">Update Budget</button>
                  <a href="viewBudgets" class="btn btn-secondary">Back to List</a>
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
