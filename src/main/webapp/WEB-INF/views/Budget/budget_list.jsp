<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../modules/header.jsp" />

<!--start page wrapper -->
<div class="page-wrapper">
  <div class="page-content">
        <div class="row">
   <!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="./sidebar-budget.jsp" />
			</div>
	<div class="col-md-8 mx-auto">
    <h6 class="mb-0 text-uppercase">All Budgets</h6>
    <hr />
    <div class="card">
      <div class="card-body">
        <table class="table mb-0 table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Title</th>
              <th>Category</th>
              <th>Amount</th>
              <th>From Date</th>
              <th>To Date</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="budget" items="${budgets}" varStatus="status">
              <tr>
                <th scope="row">${status.index + 1}</th>
                <td>${budget.title}</td>
                <td>${budget.category}</td>
                <td>${budget.amount}</td>
                <td>${budget.fromDate}</td>
                <td>${budget.toDate}</td>
                <td>
                  <a href="editBudget?id=${budget.id}" class="btn btn-sm btn-warning">Edit</a>
                  <a href="deleteBudget?id=${budget.id}" class="btn btn-sm btn-danger"
                     onclick="return confirm('Are you sure you want to delete this budget?');">
                    Delete
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
 </div>
  </div>
</div>
</div>

<jsp:include page="../modules/footer.jsp" />
