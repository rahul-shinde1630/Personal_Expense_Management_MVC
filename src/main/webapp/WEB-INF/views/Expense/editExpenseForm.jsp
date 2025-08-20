<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp"/>

<!--start page wrapper -->
<div class="page-wrapper">
  <div class="page-content">
    <div class="row">
    <!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="./sidebar.jsp" />
			</div>
      <div class="col-xl-6 mx-auto">

        <div class="card">
          <div class="card-body p-4">
            <h5 class="mb-4">Edit Expense</h5>
            <p style="color: green;">${successMsg}</p>
            <p style="color: red;">${errMsg}</p>

            <form class="row g-3" action="updateExpense" method="post">
              <!-- Hidden ID -->
              <input type="hidden" name="id" value="${expense.id}" />

             	<!-- BANK DROPDOWN -->
             	<div class="col-md-12">
						<label for="account" class="form-label">Bank Name</label>
				<select class="form-select" id="account" name="account">
				  <option disabled>Choose Bank...</option>
				  <c:forEach var="bank" items="${bankList}">
				    <option value="${bank.name}" ${expense.account == bank.name ? 'selected' : ''}>${bank.name}</option>
				  </c:forEach>
				</select>
				</div>
              <div class="col-md-6">
                <label for="amount" class="form-label">Amount (₹)</label>
                <input type="number" class="form-control" id="amount" name="amount" value="${expense.amount}" required>
              </div>

             
				<!-- CATEGORY DROPDOWN -->
							<div class="col-md-6">
					<label for="category" class="form-label">Category</label>
				<select id="category" class="form-select" name="category" required>
				  <option disabled>Choose Category...</option>
				  <c:forEach var="cat" items="${categoryList}">
				    <option value="${cat.name}" ${expense.category == cat.name ? 'selected' : ''}>${cat.name}</option>
				  </c:forEach>
				</select>
				
				</div>
              <div class="col-md-6">
                <label for="paymentMode" class="form-label">Payment Mode</label>
                <select id="paymentMode" class="form-select" name="paymentMode" required>
                  <option disabled>Choose...</option>
                  <option ${expense.paymentMode == 'Cash' ? 'selected' : ''}>Cash</option>
                  <option ${expense.paymentMode == 'UPI' ? 'selected' : ''}>UPI</option>
                  <option ${expense.paymentMode == 'Credit Card' ? 'selected' : ''}>Credit Card</option>
                  <option ${expense.paymentMode == 'Debit Card' ? 'selected' : ''}>Debit Card</option>
                </select>
              </div>

              <div class="col-md-6">
                <label for="expenseDate" class="form-label">Expense Date</label>
                <input type="date" class="form-control" id="expenseDate" name="expenseDate" value="${expense.expenseDate}" required>
              </div>

              <div class="col-md-6">
                <label for="expenseTime" class="form-label">Expense Time</label>
                <input type="time" class="form-control" id="expenseTime" name="expenseTime" value="${expense.expenseTime}" required>
              </div>

              <div class="col-md-12">
                <div class="d-md-flex d-grid align-items-center gap-3">
                  <button type="submit" class="btn btn-primary px-4">Update Expense</button>
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
