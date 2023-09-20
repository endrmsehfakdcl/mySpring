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



<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">댓글등록</h4>
							</div>
							<div class="modal-body">
							
								<div class="form-group">
									<label>댓글내용</label>
									<input class="form-control" name="reply" value="New Reply!!">
								</div>
								<div class="form-group">
									<label>작성자</label>
									<input class="form-control" name="replyer" value="replyer">
								</div>
								<div class="form-group">
									<label>작성일자</label>
									<input class="form-control" name="replydate" value="replydate">
								</div>						
							
							</div>
							<div class="modal-footer">
								<button id="modalModBtn" type="button" class="btn btn-warning" >수정</button>
								<button id="modalRemoveBtn" type="button" class="btn btn-danger" >삭제</button>
								<button id="modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
								<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->




<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>댓글
				<button id='addReplyBtn' class="btn btn-primary btn-xs pull-right">댓글추가</button>
			</div>


			<div class="pannel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="10">
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2023-09-17 10:06:33</small>
							</div>
							<p>댓글 내용이 들어가는 자리</p>
						</div>
					</li>
				</ul>
				
				<!-- 댓글 페이지 처리 -->
				<div class="panel-footer">
				 
				</div>
				
			</div>
			<!-- end reply -->

		</div>
	</div>
</div>



<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function() {
	
	const bnoValue = '<c:out value="${board.bno}"/>';
	const replyUL = $(".chat");
	
	showList(1);
	
	function showList(page) {
		replyService.getList({bno: bnoValue, page: page || 1}, function(replyCnt, list) {
			
			console.log("get.jsp replyCnt : ", replyCnt);
			console.log("get.jsp list : ", list);
			
			if(page == -1) {
				pageNum = Math.ceil(replyCnt / 10.0);
				showList(pageNum);
				return;
			}
			
			
			let str="";
			console.log("list", list);
			if(list == null || list.length == 0) {
				replyUL.html("");	
				return;
			}
			
			for(let i =0, len=list.length || 0 ; i < len ; i++) {
				str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
				str += " <div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
				str += " <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replydate) + "</small></div>";
				str += " <p>" + list[i].reply + "</p></div></li>";				
			}
			
			replyUL.html(str);
			showReplyPage(replyCnt);
			
		}); // end funciton
		
	} // end showList
	
	let pageNum = 1;
	let replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt) {
		let endNum = Math.ceil(pageNum / 10.0) * 10;
		let startNum = endNum - 9;
		const prev = startNum != 1;
		let next = false;
		
		if(endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt / 10.0);
		}
		
		if(endNum * 10 < replyCnt) {
			next = true;
		}
		
		let str = "<div class='container text-center'><ul class='pagination'>";
		if(prev) {
			str += "<li class='page-item'><a class='page-link' href='" + (startNum-1) +"'>이전</a></li>";
		}
		
		for (let i=startNum; i<=endNum; i++) {
			const active = pageNum == i ? "active" : "";
			str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>"
				+ i +"</a></li>";
		}
		
		if(next) {
			str += "<li class='page-item'><a class='page-link' href='" + (endNum +1) + "'>다음</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log("str: ", str);
		
		replyPageFooter.html(str);
	}
	
	// 댓글 페이지 이동
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page number click ");
		const targetPage = $(this).attr("href");
		console.log("target page Number: ", targetPage);
		
		// 새로운 댓글 이후 마지막 페이지로 이동
		pageNum = targetPage;
		showList(pageNum);
	})
	
	
	
	// 댓글 모달 처리
	const modal = $("#myModal");
	const modalInputReply = modal.find("input[name='reply']");
	const modalInputReplyer = modal.find("input[name='replyer']");
	const modalInputReplyDate = modal.find("input[name='replydate']");
	
	const modalModBtn = $("#modalModBtn");
	const modalRemoveBtn = $("#modalRemoveBtn");
	const modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addReplyBtn").on("click", function(e){
		modal.find("input").val("");
		modalInputReplyer.removeAttr("readonly");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
// 댓글 조회 클릭 이벤트 처리
	$(".chat").on("click", "li", function(e) {
		const rno = $(this).data("rno");
		console.log("chat rno: ", rno);
		
		replyService.get(rno, function(reply) {
			console.log(reply);
			modalInputReply.val(reply.reply);	
			modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");	
			modalInputReplyDate.val(replyService.displayTime(reply.replydate)).attr("readonly", "readonly");	
			modal.data("rno", reply.rno);
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalInputReplyDate.closest("div").show();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
			
		})
	});
	
	modalRegisterBtn.on("click", function(e){
		const reply ={
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno: bnoValue
		};
		
		replyService.add(reply, function(result){
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			showList(-1);
		});
		
	});
	
	modalModBtn.on("click", function(e){
		const reply ={rno: modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(1);		
		})
	});
	
	modalRemoveBtn.on("click", function(e) {
		const rno = modal.data("rno");
		
		replyService.remove(rno, function(result) {
			alert(result);
			modal.modal("hide")
			showList(1);
			})
	});
	
	
	
	
});

</script>

<script type="text/javascript">
	$(document).ready( function() {
			 /*	console.log("===============================");
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

				replyService.remove(127, function(count) {
					console.log("remove count : " + count);
					if (count === "success") {
						alert("Remove ... ");
					}
				}, function(err) {
					console.log("Remove Error: ", err);
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

				console.log("update: ", replyService); */
				
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