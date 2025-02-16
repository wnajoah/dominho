﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/layout2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/js/jquery.min.js"></script>
<script type="text/javascript">
function deleteMenu(menuNum) {
	if(confirm("메뉴를 삭제 하시겠습니까 ?")) {
		var url="${pageContext.request.contextPath}/menu/menuDelete.do?menuNum="+menuNum+"&${query}";
		location.href=url;
	}
}

function addCart() {
	
	if(!$("#count").val()||$("#count").val()<=0){
		alert("올바른 개수를 입력하세요")
		return
	}
	var f=document.cartForm;
	f.submit();
}
</script>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
<div class="container">
    <div style="width: 700px; margin: 10px auto;">
        <div class="body-title">
            <h3>메뉴</h3>
        </div>
        
        <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   ${dto.menuNum}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 : ${dto.menuName}
			    </td>
			</tr>
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       가격 : ${dto.menuPrice}
			    </td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" style="padding: 10px 5px;">
					<div>
			      		<img src="${pageContext.request.contextPath}/uploads/menu/${dto.imageFilename}" style="max-width: 100%; height: auto; resize: both;">
			      	</div>
				</td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="70">
			      ${dto.menuExplain}
			   </td>
			</tr>
			
			<tr height="45">
			    <td>
			    	<c:choose>
			    		<c:when test="${sessionScope.member.userId=='admin'}">
			    			
			          		<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/menu/menuUpdate.do?menuNum=${dto.menuNum}&page=${page}';">수정</button>
			          	</c:when>
			        </c:choose>	
			        <form name="cartForm" action="${pageContext.request.contextPath}/order/cart_add.do" method="post">
			         	<input type="number" name="count" id="count" class="boxTF" >
			         	<input type="hidden" name="menuNum" value="${dto.menuNum}">
			         	<input type="hidden" name="page" value="${page}">
			         	<button type="button" class="btn" onclick="addCart()">장바구니</button>
			    	</form>
			    </td>
				
			    <td align="right">
			    	<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/review/review.do?${query}';">리뷰</button>
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/menu/menuList.do?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
        </div>
    </div>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>