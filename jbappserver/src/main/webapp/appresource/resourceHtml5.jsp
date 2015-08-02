<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {		
		parent.$.messager.progress('close');		
		$('#form').form({
			url : '${pageContext.request.contextPath}/appResourceController/editHtml5',
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
					parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为resource.jsp页面预定义好了
					parent.layout_west_tree.tree('reload');
					parent.$.modalDialog.handler.dialog('close');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
		    <input name="id" type="hidden" class="span2" value="${resource.id}" readonly="readonly">
			<table class="table table-hover table-condensed">			
				<tr>
					<th>html5路径</th>
					<td colspan="3">
						<select name="htmlUrl" class="easyui-combobox" data-options="width:300,height:29,editable:true,panelHeight:'auto'">
							<c:forEach items="${resourceHtml5List}" var="resourceHtml5">
								<option value="${resourceHtml5}" <c:if test="${resourceHtml5 == resource.htmlUrl}">selected="selected"</c:if>>${resourceHtml5}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
