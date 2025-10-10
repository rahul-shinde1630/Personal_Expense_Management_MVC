<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
  <div class="page-content">
    <div class="row">
      <!-- Sidebar column -->
      <div class="col-md-3">
        <jsp:include page="./sidebar.jsp" />
      </div>

      <div class="col-md-8 col-sm-6 mx-auto">
      <h6 class="mb-0 text-uppercase">Your Borrowed</h6>
				<hr/>
        <div class="card">
          <div class="card-body p-4">
           
            <div class="table-responsive">
              <table class="table table-bordered table-striped mt-4">
                  <thead class="table-striped">
                      <tr>
                          <th>Person Name</th>
                          <th>Amount</th>
                          <th>Borrowed Date</th>
                          <th>Due Date</th>
                          <th>Remaining</th>
                          <th>Status</th>
                          <th>Reason</th>
                          <th>Actions</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="borrow" items="${borrowedList}">
                          <tr>
                              <td>${borrow.personName}</td>
                              <td>${borrow.amount}</td>
                              <td>${borrow.borrowedDate}</td>
                              <td>${borrow.dueDate}</td>
                              <td>${borrow.remainingAmount}</td>
                              <td>${borrow.status}</td>
                              <td>${borrow.reason}</td>
                              <td>
                                  <a href="editBorrowed?id=${borrow.id}" class="btn btn-sm btn-warning">Edit</a>
                                  <a href="deleteBorrowed?id=${borrow.id}" class="btn btn-sm btn-danger"
                                     onclick="return confirm('Are you sure you want to delete this?')">Delete</a>
                              </td>
                          </tr>
                      </c:forEach>
                  </tbody>
              </table>
            </div> <!-- table-responsive -->

          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../modules/footer.jsp" />
