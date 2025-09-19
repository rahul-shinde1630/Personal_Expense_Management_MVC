	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		
<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="resources/assets/images/favicon-32x32.png" type="image/png" />
	<!--plugins-->
	<link href="resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
	<link href="resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet"/>
	<!-- loader-->
	<link href="resources/assets/css/pace.min.css" rel="stylesheet" />
	<script src="resources/assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<!-- Bootstrap Bundle JS (includes Popper) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<!--alert  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- jQuery (required for your AJAX call) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/assets/css/bootstrap-extended.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&amp;display=swap" rel="stylesheet">
	<link href="resources/assets/css/app.css" rel="stylesheet">
	<link href="resources/assets/css/icons.css" rel="stylesheet">
	<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Moment.js -->
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<!-- Daterangepicker CSS and JS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	
	<!-- Theme Style CSS -->
	<link rel="stylesheet" href="resources/assets/css/dark-theme.css" />
	<link rel="stylesheet" href="resources/assets/css/semi-dark.css" />
	<link rel="stylesheet" href="resources/assets/css/header-colors.css" />
	<title>Personal Expense Manager</title>
</head>
<body>
	<!--wrapper-->
	<div class="wrapper">
	 <!--start header wrapper-->	
	  <div class="header-wrapper">
		<!--start header -->
		<header>
			<div class="topbar d-flex align-items-center">
				<nav class="navbar navbar-expand gap-3">
					<div class="topbar-logo-header d-none d-lg-flex">
						<div class="">
							<img src="resources/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
						</div>
						<div class="">
							<h4 class="logo-text">Manage Expence</h4>
						</div>
					</div>
					<div class="mobile-toggle-menu d-block d-lg-none" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"><i class='bx bx-menu'></i></div>
					<div class="search-bar d-lg-block d-none" data-bs-toggle="modal" data-bs-target="#SearchModal">
						<a href="avascript:;" class="btn d-flex align-items-center"><i class='bx bx-search'></i>Search</a>
					 </div>
					  <div class="top-menu ms-auto">
						<ul class="navbar-nav align-items-center gap-1">
							<li class="nav-item mobile-search-icon d-flex d-lg-none" data-bs-toggle="modal" data-bs-target="#SearchModal">
								<a class="nav-link" href="avascript:;"><i class='bx bx-search'></i>
								</a>
							</li>	
						</ul>
					</div>
						<div class="user-box dropdown px-3">
						<a class="d-flex align-items-center nav-link dropdown-toggle gap-3 dropdown-toggle-nocaret" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<img src="resources/assets/images/avatars/avatar-2.png" class="user-img" alt="user avatar">
							<div class="user-info">
								<p class="user-name mb-0">Rahul Shinde</p>
								<p class="designattion mb-0">Web Designer</p>
							</div>
						</a>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-user fs-5"></i><span>Profile</span></a>
							</li>
							<li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-cog fs-5"></i><span>Settings</span></a>
							</li>
							<li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-home-circle fs-5"></i><span>Dashboard</span></a>
							</li>
							<li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-dollar-circle fs-5"></i><span>Earnings</span></a>
							</li>
							<li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-download fs-5"></i><span>Downloads</span></a>
							</li>
							<li>
								<div class="dropdown-divider mb-0"></div>
							</li>
							<li><a class="dropdown-item d-flex align-items-center" href="logout"><i class="bx bx-log-out-circle"></i><span>Logout</span></a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</header>
		<!--end header -->
		
		<!--navigation-->
		   <div class="primary-menu">
			   <nav class="navbar navbar-expand-lg align-items-center">
				  <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header border-bottom">
						<div class="d-flex align-items-center">
							<div class="">
								<img src="resource/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
							</div>
							<div class="">
								<h4 class="logo-text">Expense Manager</h4>
							</div>
						</div>
					  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
					  <ul class="navbar-nav align-items-center flex-grow-1">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:;" data-bs-toggle="dropdown">
								<div class="parent-icon"><i class='bx bx-home-alt'></i>
								</div>
								<div class="menu-title d-flex align-items-center">Home</div>
								<div class="ms-auto dropy-icon"><i class='bx bx-chevron-down'></i></div>
							</a>
							<ul class="dropdown-menu">
							  <li><a class="dropdown-item"  href="homePage"><i class='bx bx-home-alt' ></i>Home</a></li>
							</ul>
						  </li>						
						 <li class="nav-item">
								<a class="nav-link" href="expense" >
									<i class="bx bx-money"></i>
										<div class="menu-title d-flex align-items-center">Expense</div>
									<div class="ms-auto dropy-icon"></div>
								</a>
						</li>
						<li class="nav-item ">
						  <a class="nav-link " href="income">
						   <i class='bx bx-coin'></i>
						    <div class="menu-title d-flex align-items-center">Income</div>
						    <div class="ms-auto dropy-icon"></div>
						  </a>
						</li>

						 <li class="nav-item">
						  <a class="nav-link" href="addBudget">
						    <i class='bx  bx-wallet'></i>
						    <div class="menu-title d-flex align-items-center">Budget</div>
						    <div class="ms-auto dropy-icon"></div>
						  </a>
						</li>
						 
						<li class="nav-item">
						  <a class="nav-link" href="moneyTransaction">
						    <i class='bx bx-coin'></i>
						    <div class="menu-title d-flex align-items-center">Money Lending & Borrowing</div>
						    <div class="ms-auto dropy-icon"></div>
						  </a>
						</li>

						  

						
						<li class="nav-item">
						  <a class="nav-link" href="repayments">
						    <i class='bx bx-coin'></i>
						    <div class="menu-title d-flex align-items-center">Repayments</div>
						    <div class="ms-auto dropy-icon"></div>
						  </a>
						</li>

						  
					  </ul>
					</div>
				  </div>
			  </nav>
		</div>
		<!--end navigation-->
	   </div>
	   <!--end header wrapper-->