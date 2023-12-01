<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title><tiles:getAsString name="title" /></title>
        <tiles:insertAttribute name="preScript" />
        
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/startbootstrap-sb-admin-gh-pages/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

		<!-- 부트스트랩 아이콘 사용 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">        
		
    </head>
    <body class="sb-nav-fixed">
    
        <tiles:insertAttribute name="headerMenu" />
            
        <div id="layoutSidenav">
        
	        <tiles:insertAttribute name="sidebar" />
	        
            <div id="layoutSidenav_content">
            
		        <tiles:insertAttribute name="contentPage" />
		        
                <tiles:insertAttribute name="footer" />
            </div>
        </div>
        
        <tiles:insertAttribute name="postScript" />
       
    </body>
</html>
    