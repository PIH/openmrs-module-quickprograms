<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ taglib prefix="quickprograms" uri="/WEB-INF/view/module/quickprograms/taglib/quickprograms.tld" %>

<script type="text/javascript">
	<%-- TODO: FORMATDATE AND PARSEDATE ARE TERRIBLE HACKS --%>
	function parseDate_2(date) {
		if (date == null || date == '')
			return '';
		<c:choose>
			<c:when test="${model.locale == 'fr' || model.locale == 'en_GB'}">
				// dd/mm/yyyy 01/34/6789
				return date.substring(6,10) + '-' + date.substring(3,5) + '-' + date.substring(0,2);
			</c:when>
			<c:otherwise>
				// mm/dd/yyyy 01/34/6789
				return date.substring(6,10) + '-' + date.substring(0,2) + '-' + date.substring(3,5);
			</c:otherwise>
		</c:choose>
	}
	
	function changeToState(patientProgramId, workflowId, stateId, dateField) {
		var onDate = parseDate_2(DWRUtil.getValue(dateField));
		DWRProgramWorkflowService.changeToState(patientProgramId, workflowId, stateId, onDate, function() {
				refreshPage();
			});
	}
</script>

<table cellspacing="0" cellpadding="2">
	<tr>
		<td>HIV Program:</td>
		<td><quickprograms:quickPrograms patientId="${model.patientId}" initialStateIds="120,1,7" stateIds="7,87" terminalStateIds="2" /><br /></td>
	</tr>
	<tr>
		<td>Chronic Care Program:</td>
		<td><quickprograms:quickPrograms patientId="${model.patientId}" initialStateIds="83" defaultLocation="2"/></td>
	</tr>
	<tr>
		<td>TB Program:</td>
		<td><quickprograms:quickPrograms patientId="${model.patientId}" initialStateIds="92" defaultLocation="2"/></td>
	</tr>
</table>