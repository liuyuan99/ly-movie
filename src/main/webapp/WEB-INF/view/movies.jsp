<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/bootstrap.css">
<title>Insert title here</title>
<script type="text/javascript" src="/resource/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function fenye(pageNum) {
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}
	function xz() {
		$(".check").map(function() {
			this.checked=!this.checked;
		}) 
	}
	 function del() {
		//批删
		var id = $(".check:checked").map(function() {
			return this.value;
		}).get().join();
		alert(id);
		if(confirm("确认要删除"+id)){
			$.post("/del",{id:id},function(msg){
				if(msg>0){
					alert("删除成功");
					location="/selects"
				}else{
					alert("删除失败")
				}
			},"json")
		}
	} 
	function morder(orderName) {
		var orderMethod='${movieVo.orderMethod}';
		orderMethod = orderMethod=='desc'?'asc':'desc';
		location.href="/selects?orderName="+orderName+"&orderMethod="+orderMethod;
	}
</script>
</head>
<body>
<form action="/selects" method="post">
	<input type="hidden" name="pageNum">
	影片名称<input type="text" name="name" value="${movieVo.name}">&nbsp;上映时间<input type="text" name="t1" value="${movieVo.t1}">--<input type="text" name="t2" value="${movieVo.t2}"><br/>
	导演<input type="text" name="actor" value="${movieVo.actor}">&nbsp;价格<input type="text" name="p1" value="${movieVo.p1}">--<input type="text" name="p2" value="${movieVo.p2}"><br/>
	电影年代<input type="text" name="years" value="${movieVo.years}">&nbsp;电影时长<input type="text" name="l1" value="${movieVo.l1}">--<input type="text" name="l2" value="${movieVo.l2}"><br/>
	<button type="submit" class="btn btn-info">查询</button>

</form>
	<input type="button" value="删除" onclick="del()">
<table class="table">
	<tr>
		<td><input type="checkbox" name="che" onclick="xz()"></td>
		<td>序号</td>
		<td>电影名称</td>
		<td>导演</td>
		<td><a href="javascript:morder('price')">票价</a></td>
		<td>上映事件</td>
		<td><a href="javascript:morder('longtime')">电影时长</a></td>
		<td><a href="javascript:morder('years')">年代</a></td>
		<td>类型</td>
		<td>区域</td>
		<td>状态</td>
	</tr>
	<c:forEach items="${movie}" var="movie" varStatus="count">
		<tr>
			<td><input type="checkbox" class="check" value="${movie.id}"></td>
			<td>${count.count}</td>
			<td>${movie.name}</td>
			<td>${movie.actor}</td>
			<td>${movie.price}</td>
			<td>${movie.uptime}</td>
			<td>${movie.longtime}</td>
			<td>${movie.years}</td>
			<td>${movie.type}</td>
			<td>${movie.area}</td>
			<td>${movie.status==1?"即将上映":${movie.status}==2?"正在上映":"已经下架"}</td>
		</tr>
	</c:forEach>
	<tr>
		 <td colspan="10">
			<button onclick="fenye(1)">首页</button>
			<button onclick="fenye(${page.prePage==0?1:page.prePage})">上一页</button>
			<button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
			<button onclick="fenye(${page.pages})">尾页</button>
			当前${page.pageNum}页,共${page.pages}页,共${page.total}条
		</td> 
	</tr>
</table>
</body>
</html>