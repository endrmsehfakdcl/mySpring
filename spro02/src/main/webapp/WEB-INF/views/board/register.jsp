<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 등록</h1>
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
								<label>제목</label>
								<input class="form-control" placeholder="제목" name="title">
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="5" name="content"></textarea>
							</div>

							<div class="form-group">
								<label>글쓴이</label>
								<input class="form-control" placeholder="글쓴이" name="writer">
							</div>

							<button type="submit" class="btn btn-default">Submit
								Button</button>
							<button type="reset" class="btn btn-default">Reset
								Button</button>
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

<%@include file='../includes/footer.jsp'%>