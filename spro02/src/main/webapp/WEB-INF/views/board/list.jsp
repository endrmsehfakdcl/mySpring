<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				스프링 게시판
				<button id='regBtn' type='button'
					class="btn btn-primary btn-xs pull-right">게시글 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="board">
							<tr>
								<td><c:out value="${board.bno }"></c:out></td>
								<td><a href="/board/get?bno=${board.bno }">
										<c:out value="${board.title }"></c:out>
									</a></td>
								<td><c:out value="${board.writer }"></c:out></td>
								<td><fmt:formatDate value="${board.regdate }"
										pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
								<td><fmt:formatDate value="${board.updatedate }"
										pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- /.table-responsive -->

				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage-1 }">Previous</a>
							</li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li
								class="paginate_button ${pageMaker.cri.pageNum == num ? 'active': ''  }">
								<a href="${num }"> ${num }</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next">
								<a href="${pageMaker.endPage + 1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>

				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>


				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						const result = '<c:out value="${result}" />';

						checkModal(result);

						console.log(history);
						history.replaceState({}, null, null);

						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}
							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.")
							}
							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {
							window.location = "/board/register";
						});

						const actionForm = $("#actionForm");
						$(".paginate_button a").on("click", function(e) {
							e.preventDefault();
							console.log("-----------------------page num click------------------------");
							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
							})
						});
</script>


<%@include file='../includes/footer.jsp'%>
