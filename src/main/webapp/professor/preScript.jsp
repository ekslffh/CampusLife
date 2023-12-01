<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="<%=request.getContextPath() %>/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">
window.addEventListener('DOMContentLoaded', (event) => {
	<c:if test="${not empty errMsg}">
    	swal.fire({
            icon: 'error',
            title: '알림',
            text: "${errMsg}"
        });
	</c:if>
	<c:if test="${not empty sucMsg}">
    	swal.fire({
            icon: 'success',
            title: '알림',
            text: "${sucMsg}"
        });
	</c:if>
});
</script>