<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<table>
<thead></thead>
<tbody>
<tr>
<td></td>
</tr>
</tbody>
</table>
<div><img src="/upload/${fn:replace(mdto.fvo.saveDir, '\\', '/') }/${mdto.fvo.uuid }_th_${mdto.fvo.fileName }"></div>
<div>${mdto.mvo.email }</div>
<div>${rdto.rvo.content }</div>
<c:if test="${mdto.mvo.email ==rdto.rvo.writer}">
	<div>${rdto.rvo.content }</div>
</c:if> 
<jsp:include page="../common/footer.jsp"/>