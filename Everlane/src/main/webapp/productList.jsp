<%--
  Created by IntelliJ IDEA.
  User: minileisduk
  Date: 5/20/2023
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="controller.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Product List</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="a.template/assets/img/favicon/favicon.png"/>
    <%--    icon--%>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="header/header1.css">
    <link rel="stylesheet" href="footer/footer.css">
    <link rel="stylesheet" href="footer/ad-container.css">
    <link rel="stylesheet" href="productpage/productlist/filter-container.css">
    <link rel="stylesheet" href="productpage/productlist/product-list-container1.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<%
    Category category = (Category) request.getAttribute("category");
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    List<Color> colorList = (List<Color>) request.getAttribute("colorList");
    List<Size> sizeList = (List<Size>) request.getAttribute("sizeList");
%>
<section class="Product_List_Container">
    <div class="Product_List_InnerContainer">
        <div class="Filter_Container">
            <a class='bx bx-x' id="x_filter-icon"></a>
            <div class="Category_Container">
                <h1>Category</h1>
                <c:forEach var="cate" items="${cateList}" varStatus="status">
                    <c:if test="${status.index < 8}">
                        <a href="${pageContext.request.contextPath}/productList-servlet?categoryID=${cate.getCategoryID()}&color_ID=all"
                           class="Category_Option">
                            <div class="checkbox"></div>
                            <span>${cate.getCategoryName()}</span>
                        </a>
                    </c:if>
                </c:forEach>
            </div>
            <div class="Color_Container">
                <%
                    if(category.getCategoryID() != 9){
                %>
                <h1>Color</h1>
                <div class="Color">
                    <%
                        for (Color color : colorList) {
                    %>
                    <a href="${pageContext.request.contextPath}/productList-servlet?categoryID=<%=category.getCategoryID()%>&color_ID=<%= color.getColor_ID()%>>">
                        <div style="background-color: <%= color.getColor_Name()%>"></div>
                        <span><%= color.getColor_Name()%></span>
                    </a>
                    <%}%>
                </div>
                <%}%>
            </div>
<%--            <div class="Size_Container">--%>
<%--                <h1>Size</h1>--%>
<%--                <div class="Size">--%>
<%--                    <%--%>
<%--                        for (Size size : sizeList) {--%>
<%--                    %>--%>
<%--                    <a><%= size.getSize_Name()%></a>--%>
<%--                    <%}%>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
        <div class="List_Container">
            <div class="Product_List_Headline">
                <h1><%=category.getCategoryName()%></h1>
            </div>

            <a class="bx bx-menu" id="menu_Filter-icon">Filter</a>
            <div class="Product_List">
                <%
                    if (productList == null) {
                %>
                <h2>No products found</h2>
                <%
                } else if (!productList.isEmpty()) {
                %>
                <%
                    for (Product x : productList) {
                %>
                <div class="Product">
                    <img src=<%= x.getThumbnail()%>>
                    <div class="Product_Text">
                        <div class="Product_Name">
                            <a href="${pageContext.request.contextPath}/productDetail-servlet?ProductID=<%= x.getProductID()%>&color_Name=<%= x.getColor_Name()%>"><%= x.getProductName()%></a>
                            <p><%= x.getPrice()%></p>
                        </div>
                        <p><%= x.getColor_Name()%></p>
                    </div>
                </div>
                <% } %>
                <% } %>

            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>
<script>
    //cart
    z1 = document.querySelector("#menu_Filter-icon");
    z2 = document.querySelector("#x_filter-icon")
    z3 = document.querySelector(".Filter_Container");
    z1.onclick = function () {
        z3.classList.toggle("openFilter");
    }
    z2.onclick = function () {
        z3.classList.toggle("openFilter");
    }

</script>
</body>
</html>
