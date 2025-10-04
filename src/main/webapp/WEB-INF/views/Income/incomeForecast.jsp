<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<div class="page-wrapper">
  <div class="page-content">
    <div class="row">
      <div class="col-md-3">
        <jsp:include page="./sidebar.jsp" />
      </div>

      <div class="col-md-7 mx-auto">
        <div class="card mb-4">
          <div class="card-body p-4">
            <h5 class="mb-4">Next Month Income Forecast</h5>

            <ul>
              <c:forEach var="entry" items="${incomeForecast.forecastByCategory}">
                <li>${entry.key}: ₹${entry.value}</li>
              </c:forEach>
            </ul>
            <p><b>Total Expected Income:</b> ₹${incomeForecast.totalExpectedIncome}</p>

            <div class="ratio ratio-4x3" style="max-height:250px;">
              <canvas id="incomeChart"></canvas>
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
  const ctx = document.getElementById('incomeChart');
  const data = {
      labels: [
          <c:forEach var="entry" items="${incomeForecast.forecastByCategory}">
              "${entry.key}",
          </c:forEach>
      ],
      datasets: [{
          data: [
              <c:forEach var="entry" items="${incomeForecast.forecastByCategory}">
                  ${entry.value},
              </c:forEach>
          ],
          backgroundColor: [
              '#36A2EB','#FF6384','#FFCE56','#4BC0C0','#9966FF','#FF9F40','#A52A2A','#00CED1'
          ]
      }]
  };

  new Chart(ctx, { 
      type: 'pie', 
      data: data, 
      options: { responsive: true }
  });
</script>
