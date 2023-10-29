<%-- 
    Document   : paintingList
    Created on : 10/06/2023, 12:47:09 PM
    Author     : Truong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Painting Page</title>
    </head>
    <body>
         <!--your code here-->
         Welcome,${sessionScope.user.fullname}
         <br/>
         <form action="MainController">
              <input type="submit" value="logout" name="action" /><br/>
              search: <input type="text" name="txtsearch" value="${param.txtsearch}" />
              <input type="submit" value="search" name="action" />
               <c:set var="searchvalue" value="${param.txtsearch}" ></c:set>
               <c:set var="result" value="${requestScope.SEARCH_RESULT}" ></c:set>
               <c:if test="${not empty result}">
                   <table border="1">
                       <thead>
                           <tr>
                               <th>No</th>
                               <th>id</th>
                               <th>description</th>
                               <th>height</th>
                               <th>width</th>
                               <th>price</th>
                           </tr>
                       </thead>
                       <tbody>
                           <c:forEach items="${result}" var="paint" varStatus="counter">
                           <tr>
                               
                               <td>
                                   ${counter.count}
                                   
                               </td>
                               <td>
                                   ${paint.id}
                                   <input type="hidden" name="paintID" value="${paint.id}" /> 
                               </td>
                               <td>${paint.description} </td>
                               <td>${paint.height} </td>
                               <td>${paint.width} </td>
                               <td>${paint.price} </td>
                               <td>
                                   <input type="submit" value="Delete" name="action" />
                                   <input type="hidden" name="lastSearchValue" value="${searchvalue}" />
                               </td>
                           </tr>
                            </c:forEach>
                           
                       </tbody>
                   </table>

               </c:if>
         </form>
         
    </body>
</html>
