<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 수정</h1>
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
						<form action="/board/register" method="post">

							<div class="form-group">
								<label>글번호</label>
								<input class="form-control" placeholder="제목" name="bno"
									value="${board.bno }" readonly>
							</div>

							<div class="form-group">
								<label>제목</label>
								<input class="form-control" placeholder="제목" name="title"
									value="${board.title }">
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="5" name="content">${board.content }</textarea>
							</div>

							<div class="form-group">
								<label>글쓴이</label>
								<input class="form-control" placeholder="글쓴이" name="writer"
									value="${board.writer }" readonly>
							</div>

							<div class="form-group">
								<label>작성일자</label>
								<input class="form-control" placeholder="작성일자" name="regdate"
									value='<fmt:formatDate value="${board.regdate }"
										pattern="yyyy/MM/dd HH:mm:ss" />'
									readonly>
							</div>

							<div class="form-group">
								<label>수정일자</label>
								<input class="form-control" placeholder="수정일자" name="updatedate"
									value='<fmt:formatDate value="${board.updatedate }"
										pattern="yyyy/MM/dd HH:mm:ss" />'
									readonly>
							</div>

							<button type="button" data-oper="remove"
								class="btn btn-danger pull-right">게시글 삭제</button>
							<button type="button" data-oper="modify"
								class="btn btn-default pull-right">게시글 수정</button>
							<button type="button" data-oper="list"
								class="btn btn-info pull-right">게시글 목록</button>
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

<script>
	$(document).ready(function() {
		const formObj = $("form");
		$('button').on('click', function(e) {
			e.preventDefault();
			const operation = $(this).data("oper");
			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/board/remove").attr("method", "post")
			} else if (operation === 'modify') {
				formObj.attr("action", "/board/modify").attr("method", "post")
			} else if (operation === 'list') {
				formObj.attr("action", "/board/list").attr("method", "get")
			}

			formObj.submit();
		})
	})
</script>


<%@include file='../includes/footer.jsp'%>