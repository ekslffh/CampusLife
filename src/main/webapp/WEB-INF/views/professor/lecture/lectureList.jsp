<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/masonry/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }
  a {
  	text-decoration: none;
  }
</style>

<main class="container py-5">
  <h2>강의리스트</h2>
  <!-- <p class="lead">Integrate <a href="https://masonry.desandro.com/">Masonry</a> with the Bootstrap grid system and cards component.</p>

  <p>Masonry is not included in Bootstrap. Add it by including the JavaScript plugin manually, or using a CDN like so:</p>

  <pre><code>
&lt;script src=&quot;https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js&quot; integrity=&quot;sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D&quot; crossorigin=&quot;anonymous&quot; async&gt;&lt;/script&gt;
  </code></pre>

  <p>By adding <code>data-masonry='{"percentPosition": true }'</code> to the <code>.row</code> wrapper, we can combine the powers of Bootstrap's responsive grid and Masonry's positioning.</p> -->

  <hr class="my-5">

  <div class="row" data-masonry='{"percentPosition": true }'>
  	<a href="${pageContext.request.contextPath }/lecture/view.do" class="col-sm-6 col-lg-4 mb-4">
	    <div>
	      <div class="card">
	        <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
	        <div class="card-body">
	          <h5 class="card-title">졸업프로젝트2</h5>
	          <p class="card-text">졸업프로젝트2 2023년 2학기</p>
	        </div>
	      </div>
	    </div>
  	</a>
  	<a href="${pageContext.request.contextPath }/lecture/view.do" class="col-sm-6 col-lg-4 mb-4">
	    <div>
	      <div class="card">
	        <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
	        <div class="card-body">
	          <h5 class="card-title">안드로이드실습</h5>
	          <p class="card-text">안드로이드실습 2023년 2학기</p>
	        </div>
	      </div>
	    </div>
  	</a>
  	<a href="${pageContext.request.contextPath }/lecture/view.do" class="col-sm-6 col-lg-4 mb-4">
	    <div>
	      <div class="card">
	        <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
	        <div class="card-body">
	          <h5 class="card-title">취업전략 01분반</h5>
	          <p class="card-text">취업전략 01분반 2023년 2학기</p>
	        </div>
	      </div>
	    </div>
  	</a>
  	<a href="${pageContext.request.contextPath }/lecture/view.do" class="col-sm-6 col-lg-4 mb-4">
	    <div>
	      <div class="card">
	        <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
	        <div class="card-body">
	          <h5 class="card-title">Communication2</h5>
	          <p class="card-text">Communication2 2023년 2학기</p>
	        </div>
	      </div>
	    </div>
  	</a>
  	<a href="${pageContext.request.contextPath }/lecture/view.do" class="col-sm-6 col-lg-4 mb-4">
	    <div>
	      <div class="card">
	        <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
	        <div class="card-body">
	          <h5 class="card-title">웹프로그래밍</h5>
	          <p class="card-text">웹프로그래밍 2023년 2학기</p>
	        </div>
	      </div>
	    </div>
  	</a>
  	<a href="${pageContext.request.contextPath }/lecture/view.do" class="col-sm-6 col-lg-4 mb-4">
	    <div>
	      <div class="card">
	        <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
	        <div class="card-body">
	          <h5 class="card-title">게임프로젝트설계</h5>
	          <p class="card-text">게임프로젝트설계 2023년 2학기</p>
	        </div>
	      </div>
	    </div>
  	</a>
</main>