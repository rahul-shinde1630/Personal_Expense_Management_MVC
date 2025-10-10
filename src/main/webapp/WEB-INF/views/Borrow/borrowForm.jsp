<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
  <div class="page-content">
    <div class="row">
    <!-- Sidebar -->
            <div class="col-md-3">
                <jsp:include page="./sidebar.jsp" />
            </div>
      <div class="col-md-7 mx-auto">
	<h6 class="mb-0 text-uppercase">Add Borrowed</h6>
				<hr/>
        <div class="card">
          <div class="card-body p-4">
            <p style="color: green;">${successMsg}</p>
            <p style="color: red;">${errMsg}</p>
			
            <form class="row g-3" action="addBorrow" method="post">

              <div class="col-12 col-md-6"">
                <label for="personName" class="form-label">Person Name</label>
                <input type="text" class="form-control" id="personName" name="personName" required />
              </div>

              <div class="col-12 col-md-6"">
                <label for="amount" class="form-label">Amount (₹)</label>
                <input type="number" class="form-control" id="amount" name="amount" required />
              </div>

              <div class="col-12 col-md-6"">
                <label for="borrowedDate" class="form-label">Borrowed Date</label>
                <input type="date" class="form-control" id="borrowedDate" name="borrowedDate" required />
              </div>

              <div class="col-md-6">
                <label for="dueDate" class="form-label">Due Date</label>
                <input type="date" class="form-control" id="dueDate" name="dueDate" required />
              </div>

              <div class="col-md-12">
                <label for="reason" class="form-label">Reason</label>
                <input type="text" class="form-control" id="reason" name="reason" required />
              </div>

              <div class="col-md-6">
                <label for="status" class="form-label">Status</label>
                <select class="form-select" id="status" name="status" required>
             	<option value="PENDING">Pending</option>
				<option value="PAID">Paid</option>
				<option value="PARTIAL">Partial</option>
                </select>
              </div>

              <div class="col-md-6">
                <label for="remainingAmount" class="form-label">Remaining Amount</label>
                <input type="number" class="form-control" id="remainingAmount" name="remainingAmount" required />
              </div>

              <div class="col-md-12">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>

            </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<jsp:include page="../modules/footer.jsp" />
