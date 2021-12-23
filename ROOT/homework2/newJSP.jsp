<%@ page import="lesson04.Pudge" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<c:set var="name" value="axe"/>
${name}

<c:set var="age" value="20"/>
<c:if test="${age>=18}">
casino Joker 777
</c:if>

<hr>
<c:choose>
<c:when test="${age<16}">
Go to play muincraft
</c:when> 
  <c:when test="${age<18}">
Go to play Dota2
  </c:when>
    <c:otherwise>
welcome to lineage
    </c:otherwise>
</c:choose>

<hr>
<c:if test="${name eq 'max'}">
hello max
</c:if>

<hr>
<c:forEach var="i" begin="0" end="5">
i=${i}<br>
</c:forEach>