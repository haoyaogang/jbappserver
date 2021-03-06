<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbSafetime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%> 
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/jbSafetimeController/edit',
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
				<input type="hidden" name="id" value = "${jbSafetime.id}"/>
			<table class="table table-hover table-condensed">
			<tr>	
												
					<th><%=TjbSafetime.ALIAS_START_TIME%></th>	
					<td>
					<input class="span2" name="startTime" type="text" onclick="WdatePicker({dateFmt:'<%=TjbSafetime.FORMAT_START_TIME%>'})"   maxlength="0" value="${jbSafetime.startTime}"/>
					</td>	
					<th><%=TjbSafetime.ALIAS_END_TIME%></th>	
					<td>
					<input class="span2" name="endTime" type="text" onclick="WdatePicker({dateFmt:'<%=TjbSafetime.FORMAT_END_TIME%>'})"   maxlength="0" value="${jbSafetime.endTime}"/>
					</td>						
			</tr>	
			<tr>	
					<th><%=TjbSafetime.ALIAS_UID%></th>	
					<td>
											<input class="span2" name="uid" type="text" value="${jbSafetime.uid}"/>
					</td>								
					<th><%=TjbSafetime.ALIAS_STATUS%></th>	
					<td>
											<jb:select dataType="SS" name="status" value="${jbSafetime.status}"></jb:select>	
					</td>							
			</tr>	
			
			</table>				
		</form>
	</div>
</div>