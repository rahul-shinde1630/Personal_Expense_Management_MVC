<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
	<div class="page-content">
		<div class="row">
		 <!-- Sidebar column -->
			<div class="col-md-3">
				<jsp:include page="../Borrow/sidebar.jsp" />
			</div>
			<div class="col-md-7  mx-auto">
		<h6 class="mb-0 text-uppercase">Your Lent</h6>
				<hr/>
		<p style="color: green;">${successMsg}</p>
		<p style="color: red;">${errMsg}</p>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Person Name</th>
					<th>Amount</th>
					<th>Lent Date</th>
					<th>Due Date</th>
					<th>Remaining</th>
					<th>Status</th>
					<th>Reason</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="entry" items="${lentList}">
					<tr>
						<td>${entry.personName}</td>
						<td>${entry.amount}</td>
						<td>${entry.lentDate}</td>
						<td>${entry.dueDate}</td>
						<td>${entry.remainingAmount}</td>
						<td>${entry.status}</td>
						<td>${entry.reason}</td>
						<td>
							<a href="editLentMoney?lentId=${entry.lentId}" class="btn btn-sm btn-warning">Edit</a>
							<a href="deleteLentMoney?lentId=${entry.lentId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</div>
</div>
<jsp:include page="../modules/footer.jsp" />
