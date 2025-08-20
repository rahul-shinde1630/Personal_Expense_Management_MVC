<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../modules/header.jsp" />

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
            <h5 class="mb-4">Create Budget</h5>	
            <p style="color: green;">${successMsg}</p>
            <p style="color: red;">${errMsg}</p>

            <form class="row g-3" action="addBudgets" method="post">
              
              <div class="col-md-12">
                <label for="budgetTitle" class="form-label">Budget Title</label>
                <input type="text" class="form-control" id="budgetTitle" name="title" placeholder="e.g., Monthly Groceries" required />
              </div>

              <div class="col-md-6">
                <label for="totalAmount" class="form-label">Budget Amount (₹)</label>
                <input type="number" class="form-control" id="totalAmount" name="amount" placeholder="e.g., 5000" required />
              </div>

              <div class="col-md-6">
                <label for="category" class="form-label">Category</label>
                <select id="category" class="form-select" name="category" required>
                  <option selected disabled>Choose Category...</option>
                  <option>Food</option>
                  <option>Transport</option>
                  <option>Bills</option>
                  <option>Entertainment</option>
                  <option>Health</option>
                  <option>Others</option>
                </select>
              </div>

              <div class="col-md-6">
                <label for="fromDate" class="form-label">From Date</label>
                <input type="date" class="form-control" id="fromDate" name="fromDate" required />
              </div>

              <div class="col-md-6">
                <label for="toDate" class="form-label">To Date</label>
                <input type="date" class="form-control" id="toDate" name="toDate" required />
              </div>

              <div class="col-md-12">
                <div class="d-md-flex d-grid align-items-center gap-3">
                  <button type="submit" class="btn btn-primary px-4">
                    <i class="bx bx-plus-circle"></i> Create Budget
                  </button>
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
