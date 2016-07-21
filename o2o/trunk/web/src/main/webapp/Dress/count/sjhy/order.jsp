<%@ page import="cn.com.dyninfo.o2o.furniture.sys.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
$(function(){
	$("#form1").validate();
})
function cz(){
		 document.getElementById("czlist").submit();
	}
</script>


<table cellspacing="2" cellpadding="0" class="tab2">
	<tr>
		<td class="tab2_top">
		</td>
	</tr>
	<tr>
		<td>
			<form method="post" id="czlist" name="form1"
				action="<%=request.getContextPath()%>/html/manage/sjhy/order">
				<input type="hidden" name="type" value="${type }" />
				<input type="hidden" name="pageNo" id="pageNo"
					value=${PAGE_INFO.pageNo } />
				<table b="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="tab2_tou">
							<a href="<%=request.getContextPath()%>/html/manage/sjhy/order">
								<img src="<%=request.getContextPath()%>/<%=Constants.ADMIN_ADDRESS%>/img/biao_03.gif"
									b="0" /> </a>
						</td>
						<td class="chazhaofanshi1">
							按日期查询：
						</td>
						<td>
							<input name="btime" type="text" id="btime" readonly onclick=""
								class="bianji_3 date" style="font-size: 12px" value="${btime }" />
							-
							<input name="etime" type="text" id="etime" readonly onclick=""
								class="bianji_3 date" style="font-size: 12px" value="${etime }" />
						</td>
						<td class="tab2_tou">
							<a href="javascript:cz();"><img
									src="<%=request.getContextPath()%>/<%=Constants.ADMIN_ADDRESS%>/img/222.gif" b="0" />
							</a>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" name="_method" value="delete" />
			<table cellspacing="0" cellpadding="0" class="table4_da">
				<thead>
					<tr>
						<td>
							会员名称
						</td>
						<td>
							订单号
						</td>
						<td>
						    订单完成时间
						</td>
						<td>
						    归属店铺
						</td>
						<td>
						    消费金额
						</td>
					</tr>
				</thead>
				<c:forEach var='Info' items='${LIST}' varStatus='index'>
					<tr>
						<td>
							${Info.name}&nbsp;
						</td>
						<td>
							￥${Info.order}&nbsp;
						</td>
						<td>
							${Info.time}&nbsp;
						</td>
						<td>
							${Info.sname}&nbsp;
						</td>
						<td>
							${Info.money}&nbsp;
						</td>
					</tr>
				</c:forEach>
				<jsp:include page="<%=Constants.PAGE_JSP%>">
					<jsp:param name="url" value="/html/manage/sjhy/order" />
				</jsp:include>
			</table>
		</td>
	</tr>
</table>
		