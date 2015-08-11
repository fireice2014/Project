<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/common/taglibs.jsp"%>
<c:set var="currentMenu" scope="request"><decorator:getProperty property="meta.menu"/></c:set>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <%@ include file="/common/meta.jsp" %>
        <title><decorator:title/> | <fmt:message key="webapp.name"/></title>
        <c:if test="${currentMenu == 'qt'}">
        <link href="styles/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" charset="utf-8" src="<c:url value='/scripts/jquery-1.3.2.js'/>"></script>
        </c:if>
        <c:if test="${currentMenu == 'ht'}">
	        <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/${appConfig["csstheme"]}/theme.css'/>" />
	        <link rel="stylesheet" type="text/css" media="print" href="<c:url value='/styles/${appConfig["csstheme"]}/print.css'/>" />
        </c:if>
        <decorator:head/>
    </head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>
    <div id="page">
            <c:if test="${currentMenu == 'ht'}">
		        <div id="header" class="clearfix">
		            <jsp:include page="/common/header.jsp"/>
		        </div>
			</c:if>
			
        <div id="content" class="clearfix">
            <div id="main">
                <%@ include file="/common/messages.jsp" %>
                <h1><decorator:getProperty property="meta.heading"/></h1>
                <decorator:body/>
            </div>

            <c:if test="${currentMenu == 'ht'}">
	            <div id="sub">
	                <menu:useMenuDisplayer name="Velocity" config="cssVerticalMenu.vm" permissions="rolesAdapter">
	                    <menu:displayMenu name="AdminMenu"/>
	                </menu:useMenuDisplayer>
	            </div>
            </c:if>
			<c:if test="${currentMenu == 'ht'}">
            <div id="nav">
                <div class="wrapper">
                    <h2 class="accessibility">Navigation</h2>
                    <jsp:include page="/common/menu.jsp"/>
                </div>
                <hr/>
            </div><!-- end nav -->
            </c:if>
        </div>
		<c:if test="${currentMenu == 'ht'}">
        <div id="footer" class="clearfix">
            <jsp:include page="/common/footer.jsp"/>
        </div>
        </c:if>
    </div>
</body>
</html>
