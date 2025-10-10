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
		
      <div class="col-md-7 mx-auto">
        <!-- ✅ Alert Box -->
        	<h6 class="mb-0 text-uppercase">Add Budget</h6>
				<hr/>
        <div id="alertBox" class="alert" style="display:none;"></div>

        <div class="card">
          <div class="card-body p-4">
            <h5 class="mb-4">Create Budget</h5>	

            <form id="budgetForm" class="row g-3" action="addBudgets" method="post" onsubmit="return validateBudgetForm()">

              <!-- Budget Title -->
              <div class="col-md-12">
                <label for="budgetTitle" class="form-label">Budget Title</label>
                <input type="text" class="form-control" id="budgetTitle" name="title" placeholder="e.g., Monthly Groceries" required />
                <small class="text-danger d-none" id="titleError">Please enter a title</small>
              </div>

              <!-- Amount -->
              <div class="col-md-6">
                <label for="totalAmount" class="form-label">Budget Amount (₹)</label>
                <input type="number" class="form-control" id="totalAmount" name="amount" placeholder="e.g., 5000" required />
                <small class="text-danger d-none" id="amountError">Please enter valid amount</small>
              </div>

              <!-- Category -->
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
                <small class="text-danger d-none" id="categoryError">Please select category</small>
              </div>

              <!-- From Date -->
              <div class="col-md-6">
                <label for="fromDate" class="form-label">From Date</label>
                <input type="date" class="form-control" id="fromDate" name="fromDate" required />
                <small class="text-danger d-none" id="fromDateError">Please select from date</small>
              </div>

              <!-- To Date -->
              <div class="col-md-6">
                <label for="toDate" class="form-label">To Date</label>
                <input type="date" class="form-control" id="toDate" name="toDate" required />
                <small class="text-danger d-none" id="toDateError">Please select valid to date</small>
              </div>

              <!-- Submit -->
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

<!-- ✅ Validation + Alert Script -->
<script>
function showAlert(message, type) {
  const alertBox = document.getElementById("alertBox");
  alertBox.style.display = "block";
  alertBox.className = "alert alert-" + type; // success / danger
  alertBox.innerText = message;

  setTimeout(() => {
    alertBox.style.display = "none";
  }, 3000);
}

function validateBudgetForm() {
  let isValid = true;


//Submit-time validation
let title = document.getElementById("budgetTitle").value.trim();
let titleRegex = /^[A-Za-z\s]+$/; // letters + spaces only

if (title === "" || !titleRegex.test(title)) {
   document.getElementById("titleError").classList.remove("d-none");
   document.getElementById("titleError").innerText = "Please enter a valid title (letters only)";
   isValid = false;
} else {
   document.getElementById("titleError").classList.add("d-none");
}
  // Amount
  let amount = document.getElementById("totalAmount").value;
  if (amount === "" || amount <= 0) {
    document.getElementById("amountError").classList.remove("d-none");
    isValid = false;
  } else {
    document.getElementById("amountError").classList.add("d-none");
  }

  // Category
  let category = document.getElementById("category").value;
  if (category === "Choose Category..." || category === "") {
    document.getElementById("categoryError").classList.remove("d-none");
    isValid = false;
  } else {
    document.getElementById("categoryError").classList.add("d-none");
  }

  // From Date
  let fromDate = document.getElementById("fromDate").value;
  if (fromDate === "") {
    document.getElementById("fromDateError").classList.remove("d-none");
    isValid = false;
  } else {
    document.getElementById("fromDateError").classList.add("d-none");
  }

  // To Date
  let toDate = document.getElementById("toDate").value;
  if (toDate === "" || (fromDate && toDate < fromDate)) {
    document.getElementById("toDateError").classList.remove("d-none");
    isValid = false;
  } else {
    document.getElementById("toDateError").classList.add("d-none");
  }

  // Final check
  if (!isValid) {
    showAlert("Please fix the errors before submitting!", "danger");
    return false;
  }

  showAlert("Budget created successfully!", "success");
  return true;
}
</script>
