<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- modules/sidebar.jsp -->
<div class="bg-white border rounded p-3"
     style="top: 80px; left: 20px; height: calc(100vh - 100px); overflow-y: auto; min-width: 250px;">

    <!-- Title -->
    <h5 class="fw-bold mb-3 text-center">Repayment Module</h5>

    <!-- Add Repayment -->
    <div class="d-grid mb-3">
        <a class="btn btn-success rounded-pill w-100" href="repayments">
            <i class='bx bx-plus'></i> Add Repayment
        </a>
    </div>

    <!-- View Repayments -->
    <div class="d-grid mb-3">
        <a class="btn btn-primary rounded-pill w-100" href="show-repaymentss">
            <i class='bx bx-list-ul'></i> View Repayments
        </a>
    </div>

    <!-- Filter by Transaction Type -->
    <div class="accordion mb-3" id="repaymentAccordion">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingType">
                <button class="accordion-button collapsed py-2" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseType">
                    Transaction Type
                </button>
            </h2>
            <div id="collapseType" class="accordion-collapse collapse"
                 data-bs-parent="#repaymentAccordion">
                <div class="accordion-body py-2">
                    <a href="show-repayments?type=all" class="d-block text-decoration-none text-primary">All</a>
                    <a href="show-repayments?type=borrowed" class="d-block text-decoration-none text-primary">Borrowed</a>
                    <a href="show-repayments?type=lent" class="d-block text-decoration-none text-primary">Lent</a>
                </div>
            </div>
        </div>

        <!-- Repayment Status -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingStatus">
                <button class="accordion-button collapsed py-2" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseStatus">
                    Repayment Status
                </button>
            </h2>
            <div id="collapseStatus" class="accordion-collapse collapse"
                 data-bs-parent="#repaymentAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="d-block text-decoration-none text-primary">Pending</a>
                    <a href="#" class="d-block text-decoration-none text-primary">Completed</a>
                </div>
            </div>
        </div>

        <!-- Filter by Date -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingDate">
                <button class="accordion-button collapsed py-2" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseDate">
                    Date Filters
                </button>
            </h2>
            <div id="collapseDate" class="accordion-collapse collapse"
                 data-bs-parent="#repaymentAccordion">
                <div class="accordion-body py-2">
                    <a href="#" class="d-block text-decoration-none text-primary">Today</a>
                    <a href="#" class="d-block text-decoration-none text-primary">This Week</a>
                    <a href="#" class="d-block text-decoration-none text-primary">This Month</a>
                </div>
            </div>
        </div>
    </div>
					 <!-- Person Name Filter -->
                            <div class="">
                                <label class="form-label fw-bold">Person Name</label>
                                <input type="text" name="personName" value="${param.personName}" class="form-control" placeholder="Enter name" />
                            </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#personNameFilter').on('keyup', function () {
            var personName = $(this).val();

            $.ajax({
                url: '/show-repayments',
                type: 'GET',
                data: { personName: personName },
                success: function (data) {
                    // Replace the repayment table section with the new data
                    $('#repaymentTableContainer').html($(data).find('#repaymentTableContainer').html());
                },
                error: function () {
                    alert('Error fetching filtered data');
                }
            });
        });
    });
</script>
