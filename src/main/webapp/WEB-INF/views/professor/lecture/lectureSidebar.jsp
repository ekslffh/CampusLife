<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }

  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }

  .b-example-divider {
    width: 100%;
    height: 3rem;
    background-color: rgba(0, 0, 0, .1);
    border: solid rgba(0, 0, 0, .15);
    border-width: 1px 0;
    box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
  }

  .b-example-vr {
    flex-shrink: 0;
    width: 1.5rem;
    height: 100vh;
  }

  .bi {
    vertical-align: -.125em;
    fill: currentColor;
  }

  .nav-scroller {
    position: relative;
    z-index: 2;
    height: 2.75rem;
    overflow-y: hidden;
  }

  .nav-scroller .nav {
    display: flex;
    flex-wrap: nowrap;
    padding-bottom: 1rem;
    margin-top: -1px;
    overflow-x: auto;
    text-align: center;
    white-space: nowrap;
    -webkit-overflow-scrolling: touch;
  }

  .btn-bd-primary {
    --bd-violet-bg: #712cf9;
    --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

    --bs-btn-font-weight: 600;
    --bs-btn-color: var(--bs-white);
    --bs-btn-bg: var(--bd-violet-bg);
    --bs-btn-border-color: var(--bd-violet-bg);
    --bs-btn-hover-color: var(--bs-white);
    --bs-btn-hover-bg: #6528e0;
    --bs-btn-hover-border-color: #6528e0;
    --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
    --bs-btn-active-color: var(--bs-btn-hover-color);
    --bs-btn-active-bg: #5a23c8;
    --bs-btn-active-border-color: #5a23c8;
  }
  .bd-mode-toggle {
    z-index: 1500;
  }
</style>

<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

 <div class="flex-shrink-0 p-3" style="width: 200px;">
    <a href="#" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      <span class="fs-5 fw-semibold">강의 (${lecNo })</span>
    </a>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="mb-1">
        <a href="#" data-url="${pageContext.request.contextPath }/lecture/plan.do?lecNo=${lecNo }" class="nav-link">
			강의 계획서
        </a>
      </li>
      <li class="mb-1">
        <a href="#" data-url="${pageContext.request.contextPath }/lecture/data/list.do?lecNo=${lecNo }" class="nav-link">
			강의 자료실
        </a>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <a href="#" data-url="${pageContext.request.contextPath }/lecture/exam/list.do?lecNo=${lecNo }" class="nav-link">
        	시험 
        </a>
      </li>
      <li class="mb-1">
        <a href="#" data-url="${pageContext.request.contextPath }/lecture/assignment/list.do?lecNo=${lecNo }" class="nav-link">
        	과제
        </a>
      </li>
      <li class="mb-1">
        <a href="#" data-url="${pageContext.request.contextPath }/lecture/group.do?lecNo=${lecNo }" class="nav-link">
        	그룹
        </a>
      </li>
      <li class="mb-1">
        <a href="#" data-url="${pageContext.request.contextPath }/lecture/record/list.do?lecNo=${lecNo }" class="nav-link">
        	성적
        </a>
      </li>
      <li class="mb-1">
        <a href="#" data-url="${pageContext.request.contextPath }/lecture/attend.do?lecNo=${lecNo }" class="nav-link">
        	출결
        </a>
      </li>
    </ul>
</div>

<div class="b-example-divider b-example-vr"></div>