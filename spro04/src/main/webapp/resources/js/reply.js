/**
 * 
 */
console.log("reply modules...");

const replyService = (function () {

	function add(reply, callback, error) {
		console.log("add reply");
		$.ajax({
			type: 'POST',
			url: '/reply/new',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=UTF-8",
			success: function (result, status, xhr) {
				console.log("result : " + result);
				if (callback) {
					callback(result);
				}
			},
			error: function (xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		})
	}

	function getList(param, callback, error) {
		const bno = param.bno;
		const page = param.page || 1;

		$.getJSON("/reply/pages/" + bno + "/" + page + ".json",
			function (data) {
				console.log("data : ", data)
				if (callback) {
					callback(data.replyCnt, data.list);
				}
			}
		).fail(function (xhr, status, err) {
			if (error) {
				error(err);
			}
		})
	}

	function remove(rno, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/reply/' + rno,
			success: function (deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error: function (xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		})
	}

	function update(reply, callback, error) {
		console.log("update rno: ", reply.rno);
		$.ajax({
			type: 'put',
			url: '/reply/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: 'application/json; charset=UTF-8',
			success: function (result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function (xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		})
	}

	// function get(rno, callback, error) {
	// 	console.log("get rno : " + rno);
	// 	$.ajax({
	// 		type: 'get',
	// 		url: '/reply/' + rno,
	// 		success: function (result, status, xhr) {
	// 			if (callback) {
	// 				callback(result);
	// 			}
	// 		},
	// 		error: function (xhr, status, err) {
	// 			if (error) {
	// 				error(err);
	// 			}
	// 		}
	// 	})
	// }

	function get(rno, callback, error) {
		$.get("/reply/" + rno + ".json", function (result) {
			if (callback) {
				callback(result);
			}
		}).fail(function (xhr, status, err) {
			if (error) {
				error(err);
			}
		});
	}

	function displayTime(timeValue) {
		const today = new Date();
		const gap = today.getTime() - timeValue;
		const currentDate = today.toDateString();
		const inputDate = new Date(timeValue).toDateString();

		const dateObj = new Date(timeValue);	
		let str = "";
		
		if (currentDate === inputDate) {
			//gap < (1000 * 60 * 60 * 24)
			// 오늘이니까 시 분 초만 보여줌
			const hh = dateObj.getHours();
			const mi = dateObj.getMinutes();
			const ss = dateObj.getSeconds();

			return [
				(hh > 9 ? "" : "0") + hh, ":",
				(mi > 9 ? "" : "0") + mi, ":",
				(ss > 9 ? "" : "0") + ss].join('');
		}
		else {
			const yy = dateObj.getFullYear();
			const mm = dateObj.getMonth() + 1;
			const dd = dateObj.getDate();

			return [yy, "/", (mm > 9 ? "" : "0") + mm, "/", (dd > 9 ? "" : "0") + dd].join('');
		}
	}


	return {
		add: add,
		getList: getList,
		remove: remove,
		update: update,
		get: get,
		displayTime: displayTime
	};

})();