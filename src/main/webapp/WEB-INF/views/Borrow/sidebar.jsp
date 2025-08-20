<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- modules/sidebar.jsp -->
<div class="bg-white border rounded p-3"
     style="top: 80px; left: 20px; height: calc(100vh - 100px); overflow-y: auto; min-width: 250px;">

    <!-- Title -->
    <h5 class="fw-bold mb-3 text-center">Money Lending & Borrowing</h5>

    <!-- Add Transaction Dropdown -->
    <div class="d-grid mb-3">
        <div class="dropdown w-100">
            <button class="btn btn-primary dropdown-toggle rounded-pill w-100" type="button" data-bs-toggle="dropdown">
                <i class='bx bx-plus'></i> Add Transaction
            </button>
            <ul class="dropdown-menu w-100 shadow border-0 rounded-3">
    <!-- Borrowed -->
    <li>
        <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="add-borrowed">
            <div class="icon-circle bg-danger text-white d-flex justify-content-center align-items-center" style="width: 24px; height: 24px; border-radius: 50%;">
                <i class='bx bx-arrow-from-left'></i>
            </div>
            <span class="fw-semibold text-dark">➕ Borrowed</span>
        </a>
    </li>

    <!-- Lent -->
    <li>
        <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="add-lent">
            <div class="icon-circle bg-success text-white d-flex justify-content-center align-items-center" style="width: 24px; height: 24px; border-radius: 50%;">
                <i class='bx bx-arrow-from-right'></i>
            </div>
            <span class="fw-semibold text-dark">➕ Lent</span>
        </a>
    </li>
</ul>


        </div>
    </div>

    <!-- Show Transactions Dropdown -->
    <div class="d-grid mb-3">
        <div class="dropdown w-100">
            <button class="btn btn-primary dropdown-toggle rounded-pill w-100" type="button" data-bs-toggle="dropdown">
                <i class='bx bx-show'></i> Show Transactions
            </button>
           <ul class="dropdown-menu w-100 shadow border-0 rounded-3">
    <!-- Show Borrowed -->
    <li>
        <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="show-borrowed">
            <div class="icon-circle bg-danger text-white d-flex justify-content-center align-items-center" style="width: 24px; height: 24px; border-radius: 50%;">
                <i class='bx bx-show'></i>
            </div>
            <span class="fw-semibold text-dark"> Borrowed</span>
        </a>
    </li>

    <!-- Show Lent -->
    <li>
        <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="show-lent">
            <div class="icon-circle bg-success text-white d-flex justify-content-center align-items-center" style="width: 24px; height: 24px; border-radius: 50%;">
                <i class='bx bx-show'></i>
            </div>
            <span class="fw-semibold text-dark"> Lent</span>
        </a>
    </li>
</ul>

        </div>
    </div>

    <!-- Search Box -->
    <div class="mb-3">
        <input type="text" class="form-control" placeholder="Search transactions...">
    </div>

    <!-- Accordion Filters -->
    <div class="accordion" id="filterAccordion">
        <!-- Transaction Type Filter -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingType">
                <button class="accordion-button collapsed py-2" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseType">
                    Transaction Type
                </button>
            </h2>
            <div id="collapseType" class="accordion-collapse collapse" data-bs-parent="#filterAccordion">
                <div class="accordion-body py-2">
                    <a href="show-money?type=all" class="d-block text-decoration-none text-primary">All</a>
                    <a href="show-money?type=borrowed" class="d-block text-decoration-none text-primary">Borrowed</a>
                    <a href="show-money?type=lent" class="d-block text-decoration-none text-primary">Lent</a>
                </div>
            </div>
        </div>

        <!-- Accounts Filter -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingAccount">
                <button class="accordion-button collapsed py-2" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseAccount">
                    Accounts
                </button>
            </h2>
            <div id="collapseAccount" class="accordion-collapse collapse" data-bs-parent="#filterAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="d-block text-decoration-none text-primary">All</a>
                    <!-- More account links -->
                </div>
            </div>
        </div>

        <!-- Due Dates / Status Filter -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingDue">
                <button class="accordion-button collapsed py-2" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseDue">
                    Due Dates / Status
                </button>
            </h2>
            <div id="collapseDue" class="accordion-collapse collapse" data-bs-parent="#filterAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="d-block text-decoration-none text-primary">Overdue</a>
                    <a href="#" class="d-block text-decoration-none text-primary">Due Soon</a>
                    <a href="#" class="d-block text-decoration-none text-primary">Cleared</a>
                </div>
            </div>
        </div>
    </div>
</div>
