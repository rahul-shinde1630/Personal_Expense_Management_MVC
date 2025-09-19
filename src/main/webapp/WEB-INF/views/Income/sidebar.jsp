<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- modules/sidebar.jsp -->
<div class="bg-white border rounded p-3 " style="top: 80px; left: 20px; height: calc(120vh - 100px); overflow-y: auto;" >
    <!-- Title -->
    <h5 class="fw-bold mb-3">Income</h5>

    <!-- Add Button -->
    <div class="d-grid mb-3	">
        <a href="income" class="btn btn-primary rounded-pill"><i class='bx bx-plus'></i> Add Income</a>
        
      
    </div>
        <!-- Show Button -->
      <div class="d-grid mb-3">
  		<a href="incomes" class="btn btn-primary rounded-pill"><i class='bx bx-show'></i> Show Incomes</a>
  	  </div>
    <!-- Search Box -->
    <div class="mb-3">
        
				

    </div>

  
    <!-- Accordion Filters -->
    <div class="accordion" id="filterAccordion">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button collapsed py-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                    Accounts
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#filterAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="text-decoration-none text-primary">All</a>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed py-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                    Categories
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#filterAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="text-decoration-none text-primary">All</a>
                </div>
            </div>
        </div>

        

    </div>
</div>
