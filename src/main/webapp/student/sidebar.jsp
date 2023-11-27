<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

     <!-- Sidebar - Brand -->
     <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }/student">
         <div class="sidebar-brand-icon rotate-n-15">
             <i class="fas fa-laugh-wink"></i>
         </div>
         <div class="sidebar-brand-text mx-3">학생 페이지</div>
     </a>

     <!-- Divider -->
     <hr class="sidebar-divider my-0">

     <!-- Nav Item - Dashboard -->
     <li class="nav-item active">
         <a class="nav-link" href="index.html">
             <i class="fas fa-fw fa-tachometer-alt"></i>
             <span>대쉬보드</span></a>
     </li>

     <!-- Divider -->
     <hr class="sidebar-divider">

     <!-- Heading -->
     <div class="sidebar-heading">
         수업
     </div>

     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo1"
             aria-expanded="true" aria-controls="collapseTwo1">
             <i class="fas fa-fw fa-folder"></i>
             <span>강의</span>
         </a>
         <div id="collapseTwo1" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <a class="collapse-item" href="buttons.html">졸프2</a>
                 <a class="collapse-item" href="buttons.html">취업전략</a>
             </div>
         </div>
     </li>
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="${pageContext.request.contextPath }/student/official-absence/list.do">
             <i class="fas fa-fw fa-folder"></i>
             <span>공결</span>
         </a>
     </li>
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#">
             <i class="fas fa-fw fa-folder"></i>
             <span>수강신청</span>
         </a>
     </li>

     <!-- Divider -->
     <hr class="sidebar-divider">

     <!-- Heading -->
     <div class="sidebar-heading">
         포탈
     </div>

     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages1"
             aria-expanded="true" aria-controls="collapsePages1">
             <i class="fas fa-fw fa-folder"></i>
             <span>장학</span>
         </a>
         <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <a class="collapse-item" href="login.html">장학정보</a>
                 <a class="collapse-item" href="login.html">장학신청</a>
                 <a class="collapse-item" href="login.html">장학내역</a>
             </div>
         </div>
     </li>
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2"
             aria-expanded="true" aria-controls="collapsePages2">
             <i class="fas fa-fw fa-folder"></i>
             <span>생활관</span>
         </a>
         <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <a class="collapse-item" href="login.html">생활관신청</a>
                 <a class="collapse-item" href="login.html">신청내역</a>
                 <a class="collapse-item" href="login.html">상벌점내역</a>
                 <a class="collapse-item" href="login.html">외박신청</a>
                 <a class="collapse-item" href="login.html">입실내역</a>
             </div>
         </div>
     </li>
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3"
             aria-expanded="true" aria-controls="collapsePages3">
             <i class="fas fa-fw fa-folder"></i>
             <span>상담</span>
         </a>
         <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <a class="collapse-item" href="login.html">상담신청</a>
                 <a class="collapse-item" href="login.html">상담내역</a>
             </div>
         </div>
     </li>
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4"
             aria-expanded="true" aria-controls="collapsePages4">
             <i class="fas fa-fw fa-folder"></i>
             <span>봉사</span>
         </a>
         <div id="collapsePages4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <a class="collapse-item" href="login.html">봉사신청</a>
                 <a class="collapse-item" href="login.html">봉사내역</a>
             </div>
         </div>
     </li>
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages5"
             aria-expanded="true" aria-controls="collapsePages5">
             <i class="fas fa-fw fa-folder"></i>
             <span>휴학/복학</span>
         </a>
         <div id="collapsePages5" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <a class="collapse-item" href="login.html">휴학정보</a>
                 <a class="collapse-item" href="login.html">휴학신청</a>
                 <a class="collapse-item" href="login.html">휴학내역</a>
             </div>
         </div>
     </li>
     <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages6"
             aria-expanded="true" aria-controls="collapsePages6">
             <i class="fas fa-fw fa-folder"></i>
             <span>시설</span>
         </a>
         <div id="collapsePages6" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
             <div class="bg-white py-2 collapse-inner rounded">
                 <a class="collapse-item" href="login.html">시설신청</a>
                 <a class="collapse-item" href="login.html">시설내역</a>
             </div>
         </div>
     </li>

     <!-- Divider -->
     <hr class="sidebar-divider d-none d-md-block">
     
      <!-- Sidebar Toggler (Sidebar) -->
     <div class="text-center d-none d-md-inline">
         <button class="rounded-circle border-0" id="sidebarToggle"></button>
     </div>

     <!-- Sidebar Message -->
     <div class="sidebar-card d-none d-lg-flex">
         <img class="sidebar-card-illustration mb-2" src="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-2-gh-pages/img/undraw_rocket.svg" alt="...">
         <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
         <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
     </div>

 </ul>