<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
  <div class="page-content">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-3">
        <jsp:include page="./sidebar-budget.jsp" />
      </div>

      <div class="col-md-8 mx-auto">
        <h6 class="mb-0 text-uppercase">All Budgets</h6>
        <hr />

        <!-- 🔽 Category Filter Form -->
        <form action="viewBudget" method="get" class="mb-3">
          <div class="row">
            <div class="col-md-6">
              <select name="category" class="form-select">
                <option value="">-- All Categories --</option>
                <c:forEach var="cat" items="${categories}">
                  <option value="${cat}" <c:if test="${param.category == cat}">selected</c:if>>
                    ${cat}
                  </option>
                </c:forEach>
              </select>
            </div>
            <div class="col-md-6">
              <button type="submit" class="btn btn-primary w-100">Filter</button>
            </div>
          </div>
        </form>
        <!-- End Filter -->

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

            <!-- Pagination Controls -->
            <nav aria-label="Page navigation" class="mt-3">
              <ul class="pagination justify-content-center">
                <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                  <a class="page-link"
                     href="?page=${currentPage - 1}&size=${pageSize}&category=${param.category}">Previous</a>
                </li>

                <c:forEach var="i" begin="1" end="${totalPages}">
                  <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link"
                       href="?page=${i}&size=${pageSize}&category=${param.category}">${i}</a>
                  </li>
                </c:forEach>

                <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                  <a class="page-link"
                     href="?page=${currentPage + 1}&size=${pageSize}&category=${param.category}">Next</a>
                </li>
              </ul>
            </nav>

          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<jsp:include page="../modules/footer.jsp" />
