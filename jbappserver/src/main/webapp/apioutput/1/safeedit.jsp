<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbSafetime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String url = request.getContextPath()+"/api/jbSafetimeController/edit";
%>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(function() {
	 	parent.$.messager.progress('close');
		$('#safeedit_Form').form({
			url : '<%=url%>',
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
				$("#safeedit_result").text(result);
			}
		});
	});
</script>

	<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'center'">
			<form id="safeedit_Form" action="">
				<table align="center" width="90%" class="tablex">
					<tr>
						<td align="right" style="width: 80px;"><label>url：</label></td>
						<td><%=url%></td>
					</tr>
					<tr>
						<td align="right" style="width: 180px;"><label>sessionId(sessionId)*：</label></td>
						<td><input name="sessionId" type="text" class="span2" value=""/></td>
					</tr>
			<tr>	
												
					<th>startTimeStr(<%=TjbSafetime.ALIAS_START_TIME%>)</th>	
					<td>
					<input class="span2" name="startTimeStr" type="text"  value="082324"/>
					</td>	
					<th>endTimeStr(<%=TjbSafetime.ALIAS_END_TIME%>)</th>	
					<td>
					<input class="span2" name="endTimeStr" type="text" value="122324"/>
					</td>						
			</tr>
			<tr>
				<th>startWeek(开始周)</th>
				<td>
					<input class="span2" name="startWeek" type="text" value="1"/>
				</td>
				<th>endWeek(结束周)</th>
				<td>
					<input class="span2" name="endWeek" type="text" value="2"/>
				</td>
			</tr>
			<tr>	
					<th>id(id)</th>	
					<td>
											<input class="span2" name="id" type="text" value=""/>
					</td>								
					<th>status(<%=TjbSafetime.ALIAS_STATUS%>)</th>	
					<td>
											<jb:select dataType="SS" name="status" value=""></jb:select>	
					</td>							
			</tr>
			<tr>
				<th>description(描述)</th>
				<td>
					<input class="span2" name="description" type="text" value=""/>
				</td>

				<th>uid(uid)</th>
				<td>
					<input class="span2" name="uid" type="text" value=""/>
				</td>

			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button"
					value="提交" onclick="javascript:$('#safeedit_Form').submit();" /></td>
			</tr>
				</table>
			</form>
			<label>结果：</label>
				<div id="safeedit_result">
				</div>
			<div>
				结果说明：1、json格式<br/>
					2、success:true 成功<br/>
			</div>
		</div>
	</div>
</body>
</html>