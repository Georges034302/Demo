<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
 

<c:import url="/WEB-INF/users.xml" var="xml"/>
<c:import url="/xsl/users.xsl" var="xsl"/>
<x:transform xml="${xml}" xslt="${xsl}"></x:transform>


