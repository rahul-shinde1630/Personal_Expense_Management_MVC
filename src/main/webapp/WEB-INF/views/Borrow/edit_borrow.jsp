<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp"/>

<div class="page-wrapper">
  <div class="page-content">
    <div class="row justify-content-center">
      <!-- Sidebar -->
      <div class="col-lg-3 mb-4">
        <jsp:include page="./sidebar.jsp" />
      </div>

      <!-- Form Card -->
      <div class="col-lg-7">
        <div class="card shadow-sm rounded-4">
          <div class="card-body p-4">
            <h4 class="mb-4 text-center">Edit Borrowed Money</h4>

            <c:if test="${not empty successMsg}">
              <div class="alert alert-success">${successMsg}</div>
            </c:if>
            <c:if test="${not empty errMsg}">
              <div class="alert alert-danger">${errMsg}</div>
            </c:if>

            <form class="row g-3" action="updateBorrowed" method="post">
              <input type="hidden" name="id" value="${borrow.id}" />

              <div class="col-md-12">
                <label class="form-label">Person Name</label>
                <input type="text" name="personName" class="form-control" value="${borrow.personName}" required />
              </div>

              <div class="col-md-6">
                <label class="form-label">Amount (₹)</label>
                <input type="number" step="0.01" name="amount" class="form-control" value="${borrow.amount}" required />
              </div>

              <div class="col-md-6">
                <label class="form-label">Borrowed Date</label>
                <input type="date" name="borrowedDate" class="form-control" value="${borrow.borrowedDate}" required />
              </div>

              <div class="col-md-6">
                <label class="form-label">Due Date</label>
                <input type="date" name="dueDate" class="form-control" value="${borrow.dueDate}" required />
              </div>

              <div class="col-md-6">
                <label class="form-label">Remaining Amount (₹)</label>
                <input type="number" step="0.01" name="remainingAmount" class="form-control" value="${borrow.remainingAmount}" required />
              </div>
					<div class="col-md-6">
					    <label class="form-label">Status</label>
					    <select name="status" class="form-select" required>
					        <option value="PENDING" ${borrow.status == 'PENDING' ? 'selected' : ''}>Pending</option>
					        <option value="PARTIAL" ${borrow.status == 'PARTIAL' ? 'selected' : ''}>Partial</option>
					        <option value="PAID" ${borrow.status == 'PAID' ? 'selected' : ''}>Paid</option>
					    </select>
					</div>


              <div class="col-md-12">
                <label class="form-label">Reason</label>
                <textarea name="reason" class="form-control" rows="3" required>${borrow.reason}</textarea>
              </div>

              <div class="col-md-12 d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="borrow/list" class="btn btn-secondary">Cancel</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../modules/footer.jsp"/>
