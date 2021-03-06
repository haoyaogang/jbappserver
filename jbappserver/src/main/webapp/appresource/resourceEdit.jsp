<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#iconCls').combobox({
			data : $.iconData,
			formatter : function(v) {
				return $.formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
			},
			value : '${resource.iconCls}'
		});
		parent.$.messager.progress('close');
		

		$('#form').form({
			url : '${pageContext.request.contextPath}/appResourceController/edit',
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
					<th>资源名称</th>
					<td><input name="name" type="text" placeholder="请输入资源名称" class="easyui-validatebox span2" data-options="required:true" value="${resource.name}"></td>
					<th>排序</th>
					<td><input name="seq" value="${resource.seq}" class="easyui-numberspinner" style="width: 140px; height: 29px;" required="required" data-options="editable:false"></td>				
				</tr>				
				<tr>
					<th>菜单图标</th>
					<td colspan="3"><input id="iconCls" name="iconCls" style="width: 375px; height: 29px;" data-options="editable:false" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>
