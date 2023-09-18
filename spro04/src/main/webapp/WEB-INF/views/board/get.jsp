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

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				console.log("===============================");
				console.log("=========== JS TEST ===========");
				const bnoValue = '<c:out value="${board.bno}"/>';
				const currentDate = new Date();
				const formattedDate = currentDate.getFullYear()
						+ "-"
						+ (currentDate.getMonth() + 1).toString().padStart(2,
								"0") + "-"
						+ currentDate.getDate().toString().padStart(2, "0")
						+ " "
						+ currentDate.getHours().toString().padStart(2, "0")
						+ ":"
						+ currentDate.getMinutes().toString().padStart(2, "0")
						+ ":"
						+ currentDate.getSeconds().toString().padStart(2, "0");

				replyService.add({
					bno : bnoValue,
					reply : "지금 시간은 " + formattedDate + " by get.jsp",
					replyer : "ㅇㅇ"
				}, function(result) {
					alert("RESULT : " + result);
				});

				replyService.getList({
					bno : bnoValue,
					page : 1
				}, function(list) {
					for (let i = 0, len = list.length || 0; i < len; i++) {
						console.log(list[i]);
					}
				});

				replyService.remove(46, function(count) {
					console.log("remove count : " + count);
					if (count === "success") {
						alert("Remove ... ");
					}
				}, function(err) {
					alert("Remove Error! " + err);
				});

				replyService.update({
					rno : 93,
					bno : bnoValue,
					reply : "update from get.jsp"
				}, function(result) {
					alert("수정 완료");
				});

				replyService.get(93, function(data) {
					console.log("get data : ", data);
				}, function(err) {
					alert("Get Error! " + err);
				});

				console.log("update: " , replyService);
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