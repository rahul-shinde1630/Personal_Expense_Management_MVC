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

      <!-- Main content -->
      <div class="col-md-9 mx-auto">
        
          <div class="">
            <img src="${pageContext.request.contextPath}/resources/assets/images/lentBorrowed.png"
                 class="img-fluid rounded" />
            <h6 class="mt-3 text-muted">Lent And Borrowed Overview</h6>
          </div>
      
      </div>
    </div>
  </div>
</div>

<jsp:include page="../modules/footer.jsp" />
