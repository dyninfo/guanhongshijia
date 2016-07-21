<%@ page import="cn.com.dyninfo.o2o.furniture.sys.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/Dress/include/top.jsp"%>
<%--
  ~ Copyright (c) 2009-2016 SHENZHEN Eternal Dynasty Technology Co.,Ltd.
  ~ All rights reserved.
  ~
  ~ This file contains valuable properties of  SHENZHEN Eternal Dynasty
  ~ Technology Co.,Ltd.,  embodying  substantial  creative efforts  and
  ~ confidential information, ideas and expressions.    No part of this
  ~ file may be reproduced or distributed in any form or by  any  means,
  ~ or stored in a data base or a retrieval system,  without  the prior
  ~ written permission  of  SHENZHEN Eternal Dynasty Technology Co.,Ltd.
  ~
  --%>

<script type="text/javascript">
	var i=1;

	function allChoose(){
		$("[name='list']").attr("checked",'true');
	}
	
	function allCancel(){
		$("[name='list']").removeAttr("checked");
	}
	function xz(){
		if(i==1){
			allChoose();
			i=0;
		}else{
			allCancel();
			i=1;
		}
	}
	function delall(){
		if(confirm("请确认是否执行删除操作!"))
			document.getElementById("del").submit();
	}
	function delUrl(url){
		if(confirm("请确认是否执行删除操作!")){
			window.location=url;
		}
	}
	function cz(){
		document.getElementById("czlist").submit();
	}
	function exportt(){
		document.getElementById("czlist").action="<%=request.getContextPath()%>/html/ibms/huiYuan/export";
		 document.getElementById("czlist").submit();
	}
</script>
<body>
<script type="text/javascript" src="<%=request.getContextPath()%>/<%=Constants.ADMIN_ADDRESS%>/js/dialog.js"></script>



<table cellspacing="2" cellpadding="0" class="tab2">
	<tr>
		<td class="tab2_top">
			
		</td>
	</tr>
	<tr>
		<td>
			<form method="post" id="czlist" name="form1" action="<%=request.getContextPath()%>/html/manage/affiliation/huiyuan">
				<input type="hidden" name="pageNo" id="pageNo" value=${PAGE_INFO.pageNo } />
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td class="tab2_tou">
							<a href="<%=request.getContextPath()%>/html/manage/affiliation/huiyuan">
								<img src="<%=request.getContextPath()%>/<%=Constants.ADMIN_ADDRESS%>/img/biao_03.gif" border="0" />
							</a>
						</td>
						<td class="chazhaofanshi1">会员昵称：</td>
						<td><input name="userName" type="text" style="color:#494949" value="${userName }"/></td>
						<td class="chazhaofanshi1">会员账号：</td>
						<td><input name="name" type="text" style="color:#494949" value="${name }"/></td>
						<td class="chazhaofanshi1">会员注册时间：</td>
						<td><input name="loginData" class="date" type="text" style="color:#494949" value="${loginData }"/></td>
						<td class="tab2_tou">
							<a href="javascript:cz();"><img src="<%=request.getContextPath()%>/<%=Constants.ADMIN_ADDRESS%>/img/222.gif" border="0" /></a>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr><td></td></tr>
	<tr>
		<td>
			<form method="post" id="del" action="<%=request.getContextPath()%>/html/manage/affiliation/delall">
				<input type="hidden" name="_method" value="delete" />
				<table cellspacing="0" cellpadding="0" class="table4_da">
					<thead>
					<tr>
						<td>账号</td>
						<td>昵称</td>
						<td>会员等级</td>
						<td>所属店铺</td>
						<td>会员登录次数</td>
						<td>上次登录时间</td>
						<td>账号注册时间</td>
						<td>操作</td>
					</tr>
					</thead>
				    	<c:forEach var='Info' items='${DATA}' varStatus='index'>
						<tr>
							<td>${Info.name}&nbsp;</td>
							<td>${Info.userName}&nbsp;</td>
							<td>${Info.rank}&nbsp;</td>
							<td>${Info.shangJiaInfo.name}&nbsp;</td>
							<td>${Info.count}&nbsp;</td>
							<td>${Info.enterData}&nbsp;</td>
							<td>${Info.loginData}&nbsp;</td>
							<td>
								<c:if test="${empty Info.shangJiaInfo}">
								  <a href="<%=request.getContextPath()%>/html/manage/affiliation/${Info.huiYuan_id}/disUpdate" class="zhu2">
									    分配归属</a>&nbsp;
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<jsp:include page="<%=Constants.PAGE_JSP%>">
						<jsp:param name="url" value="/html/manage/huiyuan/list" />
					</jsp:include>
				</table>
			</form>
		</td>
	</tr>
</table>
</body>