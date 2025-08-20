<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

			<div class="col-md-7 mx-auto">	
				
				<div class="container ">
				    <form action="/transactions" method="get">
				     <label for="daterange" class="form-label fw-bold">Search By </label>
				         
				      <div class="row g-3 align-items-center">
				        <div class="col-md-4">
				          <div class="input-group">
				            <span class="input-group-text bg-light">
				              <i class="bi bi-calendar3"></i> <!-- Requires Bootstrap Icons -->
				            </span>
				            <input type="text" name="filterValue" id="daterange" class="form-control rounded-end" placeholder="YYYY-MM-DD_YYYY-MM-DD" />
				            <input type="hidden" name="filterType" value="custom" />
				          </div>
				        </div>
				        <div class="col-md-2 mt-10">
				          <button type="submit" class="btn btn-primary w-100 rounded-pill">Apply Filter</button>
				        </div>
				      </div>
				    </form>
				
				</div>

				<h6 class="mb-0 text-uppercase">Your Expenses</h6>
				<hr/>
				<div class="card">
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">BankTitle</th>
									<th scope="col">Category</th>
									<th scope="col">Amount</th>
									<th scope="col">Payment Mode</th>	
									<th scope="col">Expense Date</th>
									<th scope="col">Expense Time</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="e" items="${expenses}" varStatus="loop">
									<tr>
										
										<td>${e.account}</td>
										<td>${e.category}</td>
										<td>${e.amount}</td>
										<td>${e.paymentMode}</td>
										<td>${e.expenseDate}</td>
										<td>${e.expenseTime}</td>
										<td>
											<a href="editExpense?id=${e.id}" class="btn btn-sm btn-warning">Edit</a>
											<a href="deleteExpense?id=${e.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this expense?');">Delete</a>
										</td>
									</tr>
								</c:forEach>
								<c:if test="${empty expenses}">
									<tr>
										<td colspan="8" class="text-center">No expenses found.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
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
								
			</div> <!-- col-md-7 ends -->
		</div> <!-- row ends -->
	</div> <!-- page-content ends -->
</div> <!-- page-wrapper ends -->


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


<jsp:include page="../modules/footer.jsp"/>
