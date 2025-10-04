<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
  <div class="page-content">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-3">
        <jsp:include page="./sidebar.jsp" />
      </div>

      <div class="col-md-7 mx-auto">
        <div class="card">
          <div class="card-body p-4">
            <h5 class="mb-4">Spending Pattern Analysis</h5>

            <div class="mb-3">
              <p><b>Total Spent:</b> ₹${analysis.totalSpent}</p>
              <p><b>Top Category:</b> ${analysis.topCategory} (${analysis.topCategoryPercent}%)</p>
              <p><b>Insight:</b> ${analysis.monthComparison}</p>
            </div>

           <div class="mt-4  m-auto">
			  <div class="ratio ratio-16x9" style="max-height:400px;">
			    <canvas id="pieChart"></canvas>
			  </div>
			</div>

          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<jsp:include page="../modules/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const ctx = document.getElementById('pieChart');
  const data = {
      labels: [
          <c:forEach var="entry" items="${analysis.categoryWisePercent}">
              "${entry.key}",
          </c:forEach>
      ],
      datasets: [{
          data: [
              <c:forEach var="entry" items="${analysis.categoryWisePercent}">
                  ${entry.value},
              </c:forEach>
          ],
          backgroundColor: ['#FF6384','#36A2EB','#FFCE56','#4BC0C0','#9966FF','#FF9F40']
      }]
  };
  new Chart(ctx, { type: 'pie', data: data });
</script>
