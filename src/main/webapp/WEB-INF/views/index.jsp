<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="modules/header.jsp"/>




		<!--start page wrapper -->
		<div class="page-wrapper">
			<div class="page-content">
				<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
                  <div class="row">
					   <div class="col">
					     <div class="card radius-10 border-start border-0 border-4 border-info">
					       <div class="card-body">
					         <div class="d-flex align-items-center">
					           <div>
					             <p class="mb-0 text-secondary">Total Income</p>
					             <!-- AJAX will fill this -->
					             <h4 id="incomeValue" class="my-1 text-info">Loading...</h4>
					           </div>
					           <div class="widgets-icons-2 rounded-circle bg-gradient-blues text-white ms-auto">
					             <i class='bx bx-money'></i>
					           </div>
					         </div>
					       </div>
					     </div>
					   </div>
					</div>

				   <div class="col">
						  <div class="card radius-10 border-start border-0 border-4 border-danger">
						    <div class="card-body">
						      <div class="d-flex align-items-center">
						        <div>
						          <p class="mb-0 text-secondary">Total Expense</p>
						          <!-- 👇 id दिलंय AJAX update साठी -->
						          <h4 class="my-1 text-danger" id="expenseValue">${expense}</h4>
						        </div>
						        <div class="widgets-icons-2 rounded-circle bg-gradient-burning text-white ms-auto">
						          <i class='bx bx-wallet'></i>
						        </div>
						      </div>
						    </div>
						  </div>
				</div>
							<div class="col">
							  <div class="card radius-10 border-start border-0 border-4 border-success">
							    <div class="card-body">
							      <div class="d-flex align-items-center">
							        <div>
							          <p class="mb-0 text-secondary">Net Balance</p>
							          <h4 class="my-1 text-success" id="netBalanceValue">₹ 0.00</h4>
							        </div>
							        <div class="widgets-icons-2 rounded-circle bg-gradient-ohhappiness text-white ms-auto">
							          <i class='bx bx-line-chart'></i>
							        </div>
							      </div>
							    </div>
							  </div>
							</div>



				  <div class="col">
				     <div class="card radius-10 border-start border-0 border-4 border-warning">
				       <div class="card-body">
				         <div class="d-flex align-items-center">
				           <div>
				             <p class="mb-0 text-secondary">Borrowed Remaining</p>
          						<h4 class="my-1 text-warning" id="borrowedValue">₹ 0.00</h4>
				           </div>
				           <div class="widgets-icons-2 rounded-circle bg-gradient-orange text-white ms-auto">
				             <i class='bx bx-group'></i>
				           </div>
				         </div>
				       </div>
				     </div>
				   </div> 
				</div><!--end row-->

				<div class="row">
                   
				   <div class="col-12 col-lg-10 m-auto">
                       <div class="card radius-10 w-100">
						    <div class="card-header">
						        <div class="d-flex align-items-center">
						            <div>
						                <h6 class="mb-0">Financial Summary</h6>
						            </div>
						            <div class="dropdown ms-auto">
						                <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown">
						                    <i class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
						                </a>
						                <ul class="dropdown-menu">
						                    <li><a class="dropdown-item" href="javascript:;">Refresh</a></li>
						                </ul>
						            </div>
						        </div>
						    </div>
						    <div class="card-body">
						        <div class="chart-container-2" style="height: 300px;">
						            <canvas id="financeChart"></canvas>
						        </div>
						    </div>
						    <ul class="list-group list-group-flush">
						        <li class="list-group-item d-flex bg-transparent justify-content-between align-items-center border-top">
						            Income <span class="badge bg-success rounded-pill" id="incomeBadge">₹ 0</span>
						        </li>
						        <li class="list-group-item d-flex bg-transparent justify-content-between align-items-center">
						            Expense <span class="badge bg-danger rounded-pill" id="expenseBadge">₹ 0</span>
						        </li>
						        <li class="list-group-item d-flex bg-transparent justify-content-between align-items-center">
						            Net Balance <span class="badge bg-primary rounded-pill" id="netBalanceBadge">₹ 0</span>
						        </li>
						        <li class="list-group-item d-flex bg-transparent justify-content-between align-items-center">
						            Borrowed Remaining <span class="badge bg-warning text-dark rounded-pill" id="borrowedBadge">₹ 0</span>
						        </li>
						    </ul>
						</div>

				   </div>
				</div><!--end row-->
			</div>
		</div>
		<!--end page wrapper -->	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function () {
    let income = 0, expense = 0, borrowed = 0, netBalance = 0;

    // Initialize Doughnut Chart
    const ctx = document.getElementById("financeChart").getContext("2d");
    const financeChart = new Chart(ctx, {
        type: "doughnut",
        data: {
            labels: ["Income", "Expense", "Net Balance", "Borrowed Remaining"],
            datasets: [{
                data: [income, expense, netBalance, borrowed],
                backgroundColor: ["#28a745", "#dc3545", "#007bff", "#ffc107"],
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: "bottom" } }
        }
    });

    // Update chart and values
    function updateChart() {
        netBalance = income - expense;

        $("#incomeValue").text("₹ " + income.toFixed(2));
        $("#expenseValue").text("₹ " + expense.toFixed(2));
        $("#netBalanceValue").text("₹ " + netBalance.toFixed(2));
        $("#borrowedValue").text("₹ " + borrowed.toFixed(2));

        $("#incomeBadge").text("₹ " + income.toFixed(2));
        $("#expenseBadge").text("₹ " + expense.toFixed(2));
        $("#netBalanceBadge").text("₹ " + netBalance.toFixed(2));
        $("#borrowedBadge").text("₹ " + borrowed.toFixed(2));

        financeChart.data.datasets[0].data = [income, expense, netBalance, borrowed];
        financeChart.update();
    }

    // Get current year
    const currentYear = new Date().getFullYear();

    // --- AJAX Calls to updated controller ---
    const requestData = { fromYear: 2000, toYear: currentYear };

    $.get("/reports/income", requestData, function(response) {
        income = response || 0;
        updateChart();
    }).fail(function() { $("#incomeValue").text("Error"); });

    $.get("/reports/expense", requestData, function(response) {
        expense = response || 0;
        updateChart();
    }).fail(function() { $("#expenseValue").text("Error"); });

    $.get("/reports/borrowedRemaining", requestData, function(response) {
        borrowed = response || 0;
        updateChart();
    }).fail(function() { $("#borrowedValue").text("Error"); });
});
</script>


<jsp:include page="modules/footer.jsp"/>