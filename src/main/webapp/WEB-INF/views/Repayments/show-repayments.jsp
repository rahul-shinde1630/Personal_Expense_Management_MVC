<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
                <div class="container">
                    <form action="show-data" method="get">
                        <div class="row g-3 align-items-end">
                            <!-- Type Filter -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold">Type</label>
                                <select name="repaymentType" class="form-select">
                                    <option value="REPAYMENTS" ${param.repaymentType == 'REPAYMENTS' ? 'selected' : ''}>Repayments</option>
                                    <option value="LENT" ${param.repaymentType == 'LENT' ? 'selected' : ''}>Lent</option>
                                    <option value="BORROWED" ${param.repaymentType == 'BORROWED' ? 'selected' : ''}>Borrowed</option>
                                </select>
                            </div>
                            <!-- Submit Button -->
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary w-100 rounded-pill">Apply Filter</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="mt-4">
                    <h6 class="mb-0 text-uppercase">
                        <c:choose>
                            <c:when test="${empty param.repaymentType}">All Records</c:when>
                            <c:otherwise>${param.repaymentType}</c:otherwise>
                        </c:choose>
                    </h6>
                    <hr />
                </div>

                <!-- ===================== REPAYMENTS TABLE ===================== -->
                <c:if test="${empty param.repaymentType or param.repaymentType == 'REPAYMENTS'}">
                    <c:if test="${empty repayments}">
                        <div class="alert alert-warning">No repayments found.</div>
                    </c:if>
                    <c:if test="${not empty repayments}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5>Repayments</h5>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Person Name</th>
                                                <th>RepaymentType</th>
                                                <th>Amount (₹)</th>
                                                <th>RemainingAmount (₹)</th>
                                                <th>Date</th>        
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="rep" items="${repayments}">
                                                <tr>
                                                    <td>${rep.personName}</td>
                                                    <td> ${rep.transactionType}</td>
                                                    <td>₹ ${rep.amount}</td>
                                                    <td>₹ ${rep.remainingAmount}</td>
                                                    <td>${rep.repaymentDate}</td>
                                                    <td>${rep.status}</td>
                                                    <td>
                                                        <a href="deleteRepayment?repaymentId=${rep.repaymentId}" class="btn btn-sm btn-danger"
                                                           onclick="return confirm('Are you sure you want to delete this repayment?');">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>

                <!-- ===================== LENT TABLE ===================== -->
                <c:if test="${empty param.repaymentType or param.repaymentType == 'LENT'}">
                    <c:if test="${empty lentList}">
                        <div class="alert alert-warning">No lent records found.</div>
                    </c:if>
                    <c:if test="${not empty lentList}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5>Lent Money</h5>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Person Name</th>
                                                <th>Amount (₹)</th>
                                                <th>Lent Date</th>
                                                <th>Due Date</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="lent" items="${lentList}">
                                                <tr>
                                                    <td>${lent.personName}</td>
                                                    <td>₹ ${lent.amount}</td>
                                                    <td>${lent.lentDate}</td>
                                                    <td>${lent.dueDate}</td>
                                                    <td>${lent.status}</td>
                                                    <td>
							<a href="repaymentsLent?lentId=${lent.lentId}" class="btn btn-sm btn-warning">Repayments</a>
							<a href="deleteLentMoney?lentId=${lent.lentId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
						</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>

                <!-- ===================== BORROWED TABLE ===================== -->
                <c:if test="${empty param.repaymentType or param.repaymentType == 'BORROWED'}">
                    <c:if test="${empty borrowedList}">
                        <div class="alert alert-warning">No borrowed records found.</div>
                    </c:if>
                    <c:if test="${not empty borrowedList}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5>Borrowed Money</h5>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Person Name</th>
                                                <th>Amount (₹)</th>
                                                <th>Borrowed Date</th>
                                                <th>Due Date</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="bor" items="${borrowedList}">
                                                <tr>
                                                    <td>${bor.personName}</td>
                                                    <td>₹ ${bor.amount}</td>
                                                    <td>${bor.borrowedDate}</td>
                                                    <td>${bor.dueDate}</td>
                                                    <td>${bor.status}</td>
                                                       <td>
							<a href="repaymentsBorrowed?id=${bor.id}" class="btn btn-sm btn-warning">Repayments</a>
							<a href="deleteLentMoney?id=${bor.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
						</td>
                                                </tr>
                                                
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>

            </div>
        </div>
    </div>
</div>

<jsp:include page="../modules/footer.jsp" />
