<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- modules/sidebar-budget.jsp -->
<div class="bg-white border rounded p-3" style="top: 80px; left: 20px; height: calc(120vh - 100px); overflow-y: auto;">
    
    <!-- Title -->
    <h5 class="fw-bold mb-3">Budget</h5>

    <!-- Add Budget Button -->
    <div class="d-grid mb-3">
        <a href="addBudget" class="btn btn-success rounded-pill">
            <i class='bx bx-plus'></i> Add Budget
        </a>
    </div>

    <!-- Show Budgets Button -->
    <div class="d-grid mb-3">
        <a href="viewBudget" class="btn btn-success rounded-pill">
            <i class='bx bx-show'></i> Show Budgets
        </a>
    </div>

    <!-- Future: Search Box or Filters (optional) -->
    <div class="mb-3">
        <!-- Optional input or search/filter goes here -->
    </div>

    <!-- Accordion Filters (optional and extendable) -->
    <div class="accordion" id="budgetFilterAccordion">
        <!-- Filter by Category -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="budgetHeadingOne">
                <button class="accordion-button collapsed py-2" type="button" data-bs-toggle="collapse" data-bs-target="#budgetCollapseOne">
                    Categories
                </button>
            </h2>
            <div id="budgetCollapseOne" class="accordion-collapse collapse" data-bs-parent="#budgetFilterAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="text-decoration-none text-success">All</a>
                </div>
            </div>
        </div>

        <!-- Filter by Time Period -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="budgetHeadingTwo">
                <button class="accordion-button collapsed py-2" type="button" data-bs-toggle="collapse" data-bs-target="#budgetCollapseTwo">
                    Time Period
                </button>
            </h2>
            <div id="budgetCollapseTwo" class="accordion-collapse collapse" data-bs-parent="#budgetFilterAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="text-decoration-none text-success">All</a>
                </div>
            </div>
        </div>
    </div>
</div>
