<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.Tappuser" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/appuserController/edit',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
				<input type="hidden" name="id" value = "${appuser.id}"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th><%=Tappuser.ALIAS_USERNAME%></th>	
					<td>
					<input class="span2" name="username" type="text" class="span2"  value="${appuser.username}"/>
					</td>							
					<th><%=Tappuser.ALIAS_GROUP%></th>	
					<td>
					<input class="span2" name="group" type="text" class="span2"  value="${appuser.group}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=Tappuser.ALIAS_FROM_IP%></th>	
					<td>
					<input class="span2" name="fromIp" type="text" class="span2"  value="${appuser.fromIp}"/>
					</td>							
			</tr>	
			</table>				
		</form>
	</div>
</div>