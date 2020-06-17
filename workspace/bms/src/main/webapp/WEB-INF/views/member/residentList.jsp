<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>입주자 관리</title>

<%-- 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/vendor/bootstrap/css/bootstrap.min.css">
 --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<%-- 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/vendor/animate/animate.css">

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/vendor/select2/select2.min.css">

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/vendor/perfect-scrollbar/perfect-scrollbar.css"> --%>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/css/itemboard.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/board/vendor/bootstrap/css/bootstrap.css">
	
    <link href="<%=request.getContextPath() %>/resources/css/schedule/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/schedule/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/schedule/css/style.css" rel="stylesheet">

<style>
	#addResidentBtn{
		display : inline;
		margin-bottom : 20px;
		margin-right : 20px;
	}
	
	#searchType{
		display : inline;
		width : 120px;
		margin-right : 10px;
/* 		float : right; */
	}
	#keword{
		display : inline;
		width : 300px;
		margin-right : 10px;
/* 		float : right; */
	}
	#searchBtn{
/* 		float : right; */
	margin-right : 20px;
	}
	
	#searchWrapper{
		float : right;
	}
	
	/* .pictureView{
	background-position:center;
	background-size:cover;
	background-repeat:no-repeat;
	}
	 */
	#imgprofile{
		width : 100%;
		height : 100%;
		border-radius: 50%;
	}
	
	#imgdiv{
		padding : 5px;
		widh : 160px;
		height : 160px;
	}
	
	#contentsdiv{
		padding-left : 30px;
	}
	
</style>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
<button id="addResidentBtn" type="button" class="btn btn-w-m btn-danger" onclick="OpenWindow('<%=request.getContextPath()%>/member/addResident','','850','800');">입주자 등록</button>

<div id="searchWrapper" style="display:inline">
	<select class="form-control m-b" id="searchType" name="searchType">
		<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected': '' }>전체</option>
		<option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected': '' }>이름</option>
		<option value="i" ${pageMaker.cri.searchType eq 'i' ? 'selected': '' }>아이디</option>
		<option value="p" ${pageMaker.cri.searchType eq 'p' ? 'selected': '' }>휴대폰</option>
		<option value="e" ${pageMaker.cri.searchType eq 'e' ? 'selected': '' }>이메일</option>
		<option value="a" ${pageMaker.cri.searchType eq 'a' ? 'selected': '' }>주소</option>
	</select>
		<input id="keword" type="text" class="form-control form-control-sm" name="keyword" placeholder="검색어를 입력하세요.">
	<button id="searchBtn" type="submit" class="btn btn-sm btn-primary" onclick="searchList_go(1);" data-card-widget="search">검색</button>
</div>       
        <div class="row">
     
      <c:forEach items="${residentList}" var="resident">
      	<c:set value="${loginUser}" var="loginUser"/>
      		<c:if test="${loginUser.member_code eq resident.member_up_code}">
            <div class="col-lg-4" onclick="OpenWindow('<%=request.getContextPath()%>/member/detailResident?member_code=${resident.member_code }','','600','620');">
                <div class="contact-box">
                    <a class="row" href="#"><!-- href에 디테일로가게 만들자. href아니면 script:location.href였나 똑같은건가?? -->
                    
                    <div class="col-4">
                        <div class="text-center">
                        <input type="hidden" name="picture">
                            <%-- <img alt="image" class="rounded-circle m-t-xs img-fluid" src="<%=request.getContextPath(${superintendent.member_picture}) %>/resources/images/member/1.jpg"> --%>
                            	<div id="imgdiv" class="rounded-circle m-t-xs img-fluid pictureView">
                            	
                            	<IMG id="imgprofile" onerror="this.src='<%=request.getContextPath()%>/resources/images/animal/a16.jpg'" src="<%=request.getContextPath()%>/member/getPicture?picture=${resident.member_picture }&member_code=${resident.member_code }" />
                            	
                            	
                            	</div>
                            	<input type="hidden" name="pictureNameInput" value="${resident.member_name }"/>
                            	<input type="hidden" name="pictureCodeInput" value="${resident.member_code }"/>
                            <%-- <div> </div> --%>
                            <%-- <input id="" type="hidden" value="<%=request.getContextPath()%>/member/getPicture?picture=${superintendent.member_picture}"> --%>
                            <div class="m-t-xs font-bold">${resident.member_address }</div>
                        </div>
                    </div>
                    <div id="contentsdiv" class="col-8">
                    <br>
                        <h3><strong><i class="fa fa-user">&nbsp;</i>${resident.member_name }</strong></h3>
                        <p></i>${resident.member_id}</p>
                        <address>
                            <strong>연락처</strong><br>
                            ${resident.member_email }<br>
                            <abbr title="Phone">P:</abbr> ${resident.member_phone }
                        </address>
                    </div>
                        </a>
                </div>
            </div>
            </c:if>
	</c:forEach>
        </div>
        </div>
    <div class="card-footer">
		<nav aria-label="member list Navigation">
			<ul class="pagination justify-content-center m-0">
				<li class="page-item">
					<a class="page-link" href="javascript:searchList_go(1);">
					<i class="fas fa-angle-double-left"></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:searchList_go(${pageMaker.prev ? pageMaker.startPage-1 : 1});"><i class="fas fa-angle-left"></i></a>
				</li>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">						
				<li class="page-item<c:out value="${pageMaker.cri.page == pageNum?'active':''}"/>">
					<a class="page-link" href="javascript:searchList_go(${pageNum});" >${pageNum }</a>
				</li>
				</c:forEach>
				<li class="page-item">
					<a class="page-link" href="javascript:searchList_go(${pageMaker.next ? pageMaker.endPage+1 : pageMaker.cri.page});"><i class="fas fa-angle-right" ></i></a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:searchList_go(${pageMaker.realEndPage} );"><i class="fas fa-angle-double-right"></i></a>
				</li>	
			</ul>
		</nav>   	
		
		<form id="jobForm">
			<input type='hidden' name="page" value="${pageMaker.cri.page}" />
			<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
			<input type='hidden' name="searchType" value="${pageMaker.cri.searchType }" />
			<input type='hidden' name="keyword" value="${pageMaker.cri.keyword }" />
		</form>	
	</div>
	
	  <!-- Mainly scripts -->
    <script src="<%=request.getContextPath() %>/resources/js/schedule/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/schedule/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/schedule/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/schedule/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/schedule/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!--===============================================================================================-->	
	<script src="<%=request.getContextPath()%>/resources/board/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/resources/board/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/resources/board/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/resources/board/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/resources/board/js/stock.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%=request.getContextPath() %>/resources/js/schedule/js/inspinia.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/schedule/js/plugins/pace/pace.min.js"></script>
    
	<script>
	
	
<%-- 	function animalImage(){
	// 이미지없을 때 동물사진 띄우는 함수
		var ppath ='<%=request.getContextPath()%>/resources/images/animal/';
		var rnum = Math.random();
	    rnum = Math.floor( jbRandom * 10+8 );
	    
	    var path = ppath+'a'+rnum+'.jpg';
		return path;
	} --%>
	
	
	$('#searchBtn').on('click',function(e){
		
		var jobForm=$('#jobForm');
		jobForm.find("[name='page']").val(1);
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
		
		jobForm.attr("action","<%=request.getContextPath()%>/member/resident_management/owner/test").attr("method","get");
		jobForm.submit();
	});
	
	function searchList_go(page){
		
		var jobForm=$('#jobForm');
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());	
		jobForm.attr("action","<%=request.getContextPath()%>/member/resident_management/owner/test").attr("method","post");
		jobForm.submit();
	}
	
	
	
	
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", height="+ WinHeight +", top="+ wintop +", left=" + winleft + ", resizable=yes, status=yes"  );
	    win.focus() ; 
	}	
	
	

/* 	$(document).ready(function(){
		// 이미지용 랜덤숫자
		var rnum = Math.random();
	    rnum = Math.floor( jbRandom * 10+8 );
	}); */

	</script>
</body>
</html>