<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/statics/css/style.css" rel="stylesheet" type="text/css" />
<link href="/statics/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/statics/js/jquery.js"></script>
<script type="text/javascript" src="/statics/js/select-ui.min.js"></script>
<script type="text/javascript" src="/statics/js/page.js"></script>
<!--#var(${packageName?replace('/','.')}.model.${mypackageName}.${voClassName} query)-->
<!--#set(PageEntity page)-->
<script type="text/javascript">
$(document).ready(function()${"{"}
  $(".del").click(function()${"{"}
  	var id = $(this).attr("tid");
  	$(".sure").click(function()${"{"}
  		$("#ids").val(id);
  		$(".tip").fadeOut(100);
  		$("#searchForm").attr("action","/manage/system/${voClassName?lower_case}/delete");
  		$("#searchForm").submit();
  	${"}"});
 	$(".cancel").click(function()${"{"}
  		$(".tip").fadeOut(100);
  	${"}"});
  	$(".tip").fadeIn(200);
  ${"}"});
  $(".btn-add").click(function()${"{"}
  	window.location.href="/manage/system/${voClassName?lower_case}/add";
  ${"}"});
  $(".btn-del").click(function()${"{"}
  	var id="";
  	var arrChk=$("input[name='id']:checked");
    $(arrChk).each(function(i,val)${"{"}
       if(i>0)${"{"}
       		id+=",";
       ${"}"}
       id+=this.value;
    ${"}"}); 
    if($.trim(id)!="")${"{"}
    	$("#ids").val(id);
  		$(".sure").click(function()${"{"}
  			$("#ids").val(id);
  			$(".tip").fadeOut(100);
  			$("#searchForm").attr("action","/manage/system/${voClassName?lower_case}/delete");
  			$("#searchForm").submit();
  		${"}"});
 		$(".cancel").click(function()${"{"}
  			$(".tip").fadeOut(100);
  		${"}"});
  		$(".tip").fadeIn(200);
  	${"}"}
  ${"}"});
  $(".tiptop a").click(function()${"{"}
  	$(".tip").fadeOut(200);
  ${"}"});

  $("#all").click(function()${"{"}
  	$("input[name='id']").attr("checked",$(this).attr("checked"));
  ${"}"});
  $(".select1").uedSelect(${"{"}width : 167${"}"});
  $('.tablelist tbody tr:odd').addClass('odd');
  
  //显示中间部分页数
  showPageNumber($${"{"}page.currentPage${"}"},$${"{"}page.totalPageSize${"}"});
${"}"});
//搜索
function search()${"{"}
	$("#pageCurrentPage").val(1);
	$("#searchForm").submit();
${"}"}
var totalPageSize="$${"{"}page.totalPageSize${"}"}";//总页码
</script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    	<li><a href="/manage/system/index">首页</a></li>
    	<li>广告列表</li>
    </ul>
    </div>
    <div class="rightinfo">
    <div class="tools">
    	<ul class="toolbar">
			<li class="btn-add"><span><img src="/statics/images/t01.png" /></span>添加</li>
			<li class="btn-edit"><span><img src="/statics/images/t02.png" /></span>修改</li>
			<li class="btn-del"><span><img src="/statics/images/t03.png" /></span>删除</li>
			<li class="btn-count"><span><img src="/statics/images/t04.png" /></span>统计</li>
        </ul>
        
        <form action="" method="post" id="searchForm">
        <ul class="seachform" style="float:right;">
    		<li><label>名称</label><input name="name" type="text" class="scinput" /></li>
    		<li>
    			<label>广告位置</label>  
    			<div class="vocation">
    				<select class="select1"  name="position" id="ad_position">
    					<option value="0"> --全部--</option>
    				</select>
    			</div>
    		</li>
    		<input type="hidden" id="pageCurrentPage" name="page.currentPage" value="$${"{"}page.currentPage${"}"}"/>
    		<input type="hidden" id="ids" name="ids"/>
    		<li><label>&nbsp;</label><input name="" type="button" onclick="javascript:search();" class="scbtn" value="查询"/></li>
    	</ul>
    	</form>
    </div>
    <table class="tablelist">
    	<thead>
    		<tr>
        		<th><input name="all" id="all" type="checkbox" value=""/></th>
        		<#list columnList as column>
        		<th>${column.propertyName}</th>
        		</#list>
        		<th>操作</th>
        	</tr>
        </thead>
        <tbody>
        	<!--#for(${packageName?replace('/','.')}.model.${mypackageName}.${voClassName} ${voClassName?uncap_first} : ${voClassName?uncap_first}List)-->
        	<tr>
        		<td><input name="id" type="checkbox" value="$${"{"}${voClassName?uncap_first}.id${"}"}" /></td>
        		<#list columnList as column>
        		<td>$${"{"}${voClassName?uncap_first}.${column.propertyName} ${"}"}</td>
        		</#list>
        		<td>
        			<a class="tablelink" href="/manage/system/${voClassName?lower_case}/edit?id=$${"{"}${voClassName?uncap_first}.id${"}"}">修改</a>
					<!--#if(${voClassName?uncap_first}.status==0)-->
					<a class="tablelink" id="freeze$${"{"}${voClassName?uncap_first}.id${"}"}" href="/manage/system/${voClassName?lower_case}/freeze?id=$${"{"}${voClassName?uncap_first}.id${"}"}" onclick="freeze($${"{"}${voClassName?uncap_first}.id${"}"},this);">冻结</a>
					<!--#end-->
					<!--#if(${voClassName?uncap_first}.status==1)-->
					<a class="tablelink" id="freeze$${"{"}${voClassName?uncap_first}.id${"}"}" href="/manage/system/${voClassName?lower_case}/freeze?id=$${"{"}${voClassName?uncap_first}.id${"}"}" onclick="freeze($${"{"}${voClassName?uncap_first}.id${"}"},this);">解冻</a>
					<!--#end-->
					<a class="tablelink del" tid="$${"{"}${voClassName?uncap_first}.id${"}"}" href="javascript:;">删除</a>
				</td>
        	</tr> 
        	<!--#end-->
        </tbody>
    </table>
    <div class="pagin">
    	<div class="message">共<i class="blue">$${"{"}page.totalResultSize${"}"}</i>条记录，当前显示第&nbsp;<i class="blue">$${"{"}page.currentPage${"}"}&nbsp;</i>页</div>
        	<ul class="paginList">
        	<!--#if(page.first)-->
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <!--#else-->
            <li class="paginItem"><a href="javascript:goPage($${"{"}page.currentPage-1${"}"});"><span class="pagepre"></span></a></li>
            <!--#end-->
        	<!--#if(page.last)-->
            <li class="paginItem" id="nextpage"><a href="javascript:;"><span class="pagenxt"></span></a></li>
            <!--#else-->
            <li class="paginItem" id="nextpage"><a href="javascript:goPage($${"{"}page.currentPage+1${"}"});"><span class="pagenxt"></span></a></li>
            <!--#end-->
        </ul>
    </div>
    <div class="tip">
	  <div class="tiptop"><span>提示信息</span><a></a></div>  
      <div class="tipinfo">
        <span><img src="/statics/images/ticon.png" /></span>
        <div class="tipright">
			<p>是否确认删除选中信息？</p>
			<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
      </div>
      <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
      </div>
    </div>
</div>
</body>
</html>
