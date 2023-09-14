<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Basic Form Elements</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">

						<div class="form-group">
							<label>글번호</label>
							<input class="form-control" placeholder="제목" name="bno"
								value="${board.bno }" readonly>
						</div>

						<div class="form-group">
							<label>제목</label>
							<input class="form-control" placeholder="제목" name="title"
								value="${board.title }" readonly>
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5" name="content" readonly>${board.content }</textarea>
						</div>

						<div class="form-group">
							<label>글쓴이</label>
							<input class="form-control" placeholder="글쓴이" name="writer"
								value="${board.writer }" readonly>
						</div>

						<button data-oper="modify" class="btn btn-default pull-right">수정</button>
						<button data-oper="list" class="btn btn-info pull-right">목록</button>
						${cri.pageNum }

						<form id="operform" action="/board/modify" method="get">
							<input type="hidden" id="bno" name="bno" value="${board.bno }">
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
						</form>
					</div>
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {
		const operform = $("#operform");

		$("button[data-oper='modify']").on("click", function(e) {
			operform.attr("action", "/board/modify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operform.find("#bno").remove();
			operform.attr("action", "/board/list");
			operform.submit();

		})
	})
</script>



<%@include file='../includes/footer.jsp'%>