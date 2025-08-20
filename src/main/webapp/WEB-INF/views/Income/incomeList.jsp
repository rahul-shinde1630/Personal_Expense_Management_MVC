<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
    <div class="page-content">

        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <jsp:include page="./sidebar.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col-md-8">
            <div class="container ">
				    <form action="incomes" method="get">
				      <label for="daterange" class="form-label fw-bold">Search By Date </label>
				          
				      <div class="row g-3 align-items-center">
				        <div class="col-md-4">
				        <div class="input-group">
				            <span class="input-group-text bg-light">
				              <i class="bi bi-calendar3"></i> <!-- Requires Bootstrap Icons -->
				            </span>
				            <input type="text" name="filterValue" id="daterange" class="form-control rounded-end" placeholder="YYYY-MM-DD_YYYY-MM-DD" />
				      	<input type="hidden" name="filterType" value="date-ranges" />

				          </div>
				        </div>
				        <div class="col-md-2 mt-10">
				          <button type="submit" class="btn btn-primary w-100 rounded-pill">Apply Filter</button>
				        </div>
				      </div>
				    </form>
				
				</div>
				<div class="">
                <h6 class="mb-0 text-uppercase">Your Incomes</h6>
                <hr />
                </div>
                <div class="card">
                    <div class="card-body">
                        
                        <c:if test="${empty incomes}">
                            <div class="alert alert-warning">No income records found.</div>
                        </c:if>

                        <c:if test="${not empty incomes}">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Id</th>
                                            <th>Title</th>
                                            <th>Bank</th>
                                            <th>Amount (₹)</th>
                                            <th>Category</th>
                                            <th>Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="inc" items="${incomes}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${inc.title}</td>
                                                <td>${inc.account}</td>
                                                <td>₹ ${inc.amount}</td>
                                                <td>${inc.category}</td>
                                                <td>${inc.incomeDate}</td>
                                                <td>
                                                    <a href="editIncome?id=${inc.id}" class="btn btn-sm btn-primary">Edit</a>
                                                    <a href="deleteIncome?id=${inc.id}" class="btn btn-sm btn-danger"
                                                       onclick="return confirm('Are you sure you want to delete this income?');">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                
                            </div>
                        </c:if>

                    </div>
                </div>
                <!-- Pagination controls -->
				<c:if test="${totalPages > 1}">
			    <nav class="mt-4">
				        <ul class="pagination justify-content-center">
				            <c:forEach begin="0" end="${totalPages - 1}" var="i">
				                <li class="page-item ${i == currentPage ? 'active' : ''}">
				                    <a class="page-link"
				                       href="?email=${email}&filterType=${param.filterType}&filterValue=${param.filterValue}&page=${i}&size=${size}">
				                        ${i + 1}
				                    </a>
				                </li>
				            </c:forEach>
				        </ul>
				    </nav>
				</c:if>
            </div>
        </div>

    </div>
</div>
 <script>
  $(function () {
    $('#daterange').daterangepicker({
      opens: 'right',
      autoUpdateInput: true,
      locale: {
        format: 'YYYY-MM-DD'
      },
      ranges: {
        'Today': [moment(), moment()],
        'This week': [moment().startOf('week'), moment().endOf('week')],
        'Last 7 days': [moment().subtract(6, 'days'), moment()],
        'Last 30 days': [moment().subtract(29, 'days'), moment()],
        'This month': [moment().startOf('month'), moment().endOf('month')],
        'This year': [moment().startOf('year'), moment().endOf('year')],
        'All': [moment('2000-01-01'), moment()],
      }
    });

    // Convert date format before submitting the form
    $('form').on('submit', function (e) {
      const val = $('#daterange').val();
      if (val.includes(' - ')) {
        const parts = val.split(' - ');
        const formatted = parts[0] + '_' + parts[1];
        $('#daterange').val(formatted);
      }
    });
  });
</script>

<jsp:include page="../modules/footer.jsp" />
