<%--
  Created by IntelliJ IDEA.
  User: minileisduk
  Date: 22/06/2023
  Time: 11:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="controller.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    User userNeedEdit = (User) request.getAttribute("userNeedEdit");
    User user = (User) session.getAttribute("acc");
%>
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../a.template/assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Create New User</title>

    <meta name="description" content=""/>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="a.template/assets/img/favicon/favicon.png"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="a.template/assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="a.template/assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="a.template/assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="a.template/assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="a.template/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <link rel="stylesheet" href="a.template/assets/vendor/libs/apex-charts/apex-charts.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="a.template/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="a.template/assets/js/config.js"></script>
</head>


<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="dashboardManager.jsp" class="app-brand-link">
              <span class="app-brand-logo demo">
                    <svg width="128" height="14px" class="styles_everlane-logo__4o010" viewBox="0 0 128 14" fill="none"
                         xmlns="http://www.w3.org/2000/svg"><path
                            d="M116.776 0V14H127.933V11.2198H119.6V8.38015H127.032V5.61985H119.6V2.78015H127.933V0H116.776ZM108.221 0V9.45982L101.311 0H98.5062V14H101.311V4.54018L108.222 14H111.066V0H108.222H108.221ZM86.0055 0L80.3766 14H83.3211L84.4828 11.1397H90.2922L91.4341 14H94.4191L88.7902 0H86.0055ZM87.3875 3.7201L89.2307 8.48018H85.5046L87.3875 3.7201ZM67.1754 0V14H77.3717V11.2198H69.9998V0H67.1754ZM52.4714 2.71982V5.70003H57.6201C58.4017 5.70003 59.0625 5.09986 59.0625 4.22024C59.0625 3.34063 58.4216 2.71982 57.6201 2.71982H52.4714ZM58.7619 14L55.396 8.38015H52.4714V14H49.647V0H57.6201C60.0238 0 61.867 1.74018 61.867 4.17976C61.867 6.35974 60.4651 7.9197 58.5019 8.28012L61.9672 14H58.7619ZM32.9201 0V14H44.0785V11.2198H35.7453V8.38015H43.1776V5.61985H35.7453V2.78015H44.0785V0H32.9201ZM26.1494 0L22.1227 10.1997L18.0753 0H15.0307L20.6596 14H23.484L29.1336 0H26.1486H26.1494ZM0.0865293 0L0.0666504 14H11.245V11.2198H2.91092V8.38015H10.3432V5.61985H2.91092V2.78015H11.2442V0H0.0865293Z"
                            fill="black"></path></svg>
              </span>
                </a>

                <a href="dashboardManager.jsp"
                   class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>

            <ul class="menu-inner py-1">
                <!-- Dashboard -->
                <li class="menu-item active">
                    <a href="dashboardManager.jsp" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home-circle"></i>
                        <div data-i18n="Analytics">Dashboard</div>
                    </a>
                </li>

                <!-- Layouts -->
                <!-- Pages -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text">Pages</span></li>
                <!-- Product List -->
                <%if (user.getRole() == 1) {%>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/StaffListManagerServlet?role=all" class="menu-link">
                        <i class='menu-icon tf-icons bx bx-user'></i>
                        <div data-i18n="User List">Staff List</div>
                    </a>
                </li>
                <%}%>
                <%if (user.getRole() == 1 || user.getRole() == 2) {%>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/ProductListManagerServlet?input=all"
                       class="menu-link">
                        <i class='menu-icon tf-icons bx bxs-package'></i>
                        <div data-i18n="Product List">Product List</div>
                    </a>
                </li>
                <!-- User List -->
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/UserListManagerServlet?role=4" class="menu-link">
                        <i class='menu-icon tf-icons bx bx-user'></i>
                        <div data-i18n="User List">Customer List</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="javascript:void(0);" class="menu-link menu-toggle">
                        <i class="menu-icon tf-icons bx bx-detail"></i>
                        <div data-i18n="Sale">Sale</div>
                    </a>
                    <ul class="menu-sub">
                        <li class="menu-item">
                            <a href="PromotionServlet?input=all" class="menu-link">
                                <div data-i18n="Promotion List">Promotion List</div>
                            </a>
                        </li>
                    </ul>
                    <ul class="menu-sub">
                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/CollectionUpdatePromotion" class="menu-link">
                                <div data-i18n="Promotion List">Season Collection (Update Promotion)</div>
                            </a>
                        </li>
                    </ul>
                </li>
                <%}%>
                <%if (user.getRole() == 1 || user.getRole() == 3) {%>
                <li class="menu-item">
                    <a href="javascript:void(0);" class="menu-link menu-toggle">
                        <i class="menu-icon tf-icons bx bx-detail"></i>
                        <div data-i18n="Marketing">Marketing</div>
                    </a>
                    <ul class="menu-sub">
                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/seasonCollectionEditServlet" class="menu-link">
                                <div data-i18n="Season Collection">Season Collection (Home Page)</div>
                            </a>
                        </li>
                    </ul>
                    <ul class="menu-sub">
                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/categoryEditServlet" class="menu-link">
                                <div data-i18n="Season Collection">Category (Home Page)</div>
                            </a>
                        </li>
                    </ul>
                    <ul class="menu-sub">
                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/StoryServlet?input=all" class="menu-link">
                                <div data-i18n="Story List">Story List (Story Page)</div>
                            </a>
                        </li>
                    </ul>
                </li>
                <%}%>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->
            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar"
            >
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                               data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="a.template/assets/img/avatars/ava.png" alt
                                         class="w-px-40 h-auto rounded-circle"/>
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="a.template/assets/img/avatars/ava.png" alt
                                                         class="w-px-40 h-auto rounded-circle"/>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-semibold d-block"><%=user.getFirstName()%> <%=user.getLastName()%></span>
                                                <%if (user.getRole() == 1) {%>
                                                <small class="text-muted">Admin
                                                </small>
                                                <%} else if (user.getRole() == 2) {%>
                                                <small class="text-muted">Sale
                                                </small>
                                                <%} else if (user.getRole() == 3) {%>
                                                <small class="text-muted">Marketing
                                                </small>
                                                <%} else {%>
                                                <small class="text-muted">Customer
                                                </small>
                                                <%}%>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="HighUserAccountDetailServlet">
                                        <i class="bx bx-user me-2"></i>
                                        <span class="align-middle">My Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="logout-servlet">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Log Out</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->
                    </ul>
                </div>
            </nav>
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">User List / </span> User Details
                    </h4>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card mb-4">
                                <h5 class="card-header">User Detail</h5>
                                <!-- Account -->
                                <hr class="my-0"/>
                                <div class="card-body">
                                    <form method="POST" action="UserEditServlet?input=username">
                                        <div class="row">
                                            <input type="hidden" class="form-control"  name="userID"
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getUserID()%>
                                                       <%}%>
                                            />
                                            <div class="mb-3 col-md-6">
                                                <label for="username" class="form-label">User Name</label>
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="username"
                                                        name="username"
                                                        placeholder="Please enter User Name"
                                                        <% if (userNeedEdit == null) {%>
                                                        value=""
                                                        <%} else {%>
                                                        value=<%= userNeedEdit.getUserName()%>
                                                            <%}%>
                                                />
                                            </div>
                                            <input type="hidden" class="form-control" id="password" name="password"
                                                    <% if (userNeedEdit == null) {%>
                                                   value="123456"
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getPassword()%>
                                                       <%}%>
                                            />
                                            <input
                                                    class="form-control"
                                                    type="hidden"
                                                    id="email"
                                                    name="email"
                                                    placeholder="Please enter Password"
                                                    <% if (userNeedEdit == null) {%>
                                                    value=""
                                                    <%} else {%>
                                                    value=<%= userNeedEdit.getEmail()%>
                                                        <%}%>
                                            />
                                            <input
                                                    class="form-control"
                                                    type="hidden"
                                                    id="firstName"
                                                    name="firstName"
                                                    placeholder="Please enter First Name"
                                                    <% if (userNeedEdit == null) {%>
                                                    value=""
                                                    <%} else {%>
                                                    value=<%= userNeedEdit.getFirstName()%>
                                                        <%}%>
                                                            pattern="([A-Z][a-zA-Z]*)" title="First letter must be uppercase, no number and white space"
                                                    required
                                            />
                                            <input class="form-control" type="hidden" name="lastName" id="lastName"
                                                   placeholder="Please enter Last Name"
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getLastName()%>
                                                       <%}%>
                                                           pattern="([A-Z][a-zA-Z]*)" title="First letter must be uppercase, no number and white space"
                                                   required
                                            />
                                            <input type="hidden" class="form-control" id="dob" name="dob"
                                                   placeholder="" required
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getDob()%>
                                                       <%}%>

                                            />
                                            <input type="hidden" class="form-control" name="gender"
                                                   placeholder=""
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value="<%= userNeedEdit.getSex()%>"
                                                       <%}%>
                                            />
                                            <input type="hidden" class="form-control" name="role"
                                                   placeholder=""
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value="<%= userNeedEdit.getRole()%>"
                                                    <%}%>
                                            />
                                            <input
                                                    type="hidden"
                                                    id="phoneNumber"
                                                    name="phoneNumber"
                                                    class="form-control"
                                                    placeholder="Please enter Phone Number"
                                                    <% if (userNeedEdit == null) {%>
                                                    value=""
                                                    <%} else {%>
                                                    value=<%= userNeedEdit.getPhone()%>
                                                        <%}%>
                                            />
                                            <% if (userNeedEdit == null) {%>
                                            <input
                                                    type="hidden"
                                                    id="userID"
                                                    name="UserID"
                                                    class="form-control"
                                                    value=0
                                            />
                                            <%} else {%>
                                            <input
                                                    type="hidden"
                                                    id="userID"
                                                    name="UserID"
                                                    class="form-control"
                                                    value=<%= userNeedEdit.getUserID()%>
                                            />
                                            <%}%>
                                        </div>
                                        <div class="mt-2">
                                            <button type="submit" class="btn btn-dark me-2">Save</button>
                                            <a href="${pageContext.request.contextPath}/StaffListManagerServlet?role=all"
                                               class="btn btn-outline-secondary">Cancel</a>
                                        </div>
                                    </form>
                                    <h5 style="color:red;">${error1}</h5>
                                    <h5 style="color:green;">${success1}</h5>
                                </div>
                                <div class="card-body">
                                    <form method="POST" action="UserEditServlet?input=email">
                                        <div class="row">
                                            <input type="hidden" class="form-control"  name="userID"
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getUserID()%>
                                                       <%}%>
                                            />
                                            <input
                                                    type="hidden"
                                                    class="form-control"
                                                    id="username"
                                                    name="username"
                                                    placeholder="Please enter User Name"
                                                    <% if (userNeedEdit == null) {%>
                                                    value=""
                                                    <%} else {%>
                                                    value=<%= userNeedEdit.getUserName()%>
                                                        <%}%>
                                                            autofocus
                                            />
                                            <div class="mb-3 col-md-6">
                                                <label for="email" class="form-label">Email</label>
                                                <input
                                                        class="form-control"
                                                        type="email"
                                                        id="email"
                                                        name="email"
                                                        placeholder="Please enter Password"
                                                        <% if (userNeedEdit == null) {%>
                                                        value=""
                                                        <%} else {%>
                                                        value=<%= userNeedEdit.getEmail()%>
                                                            <%}%>
                                                />
                                            </div>
                                            <input type="hidden" class="form-control" id="password" name="password"
                                                    <% if (userNeedEdit == null) {%>
                                                   value="123456"
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getPassword()%>
                                                       <%}%>
                                            />

                                            <input
                                                    class="form-control"
                                                    type="hidden"
                                                    id="firstName"
                                                    name="firstName"
                                                    placeholder="Please enter First Name"
                                                    <% if (userNeedEdit == null) {%>
                                                    value=""
                                                    <%} else {%>
                                                    value=<%= userNeedEdit.getFirstName()%>
                                                        <%}%>
                                            />
                                            <input class="form-control" type="hidden" name="lastName" id="lastName"
                                                   placeholder="Please enter Last Name"
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getLastName()%>
                                                       <%}%>
                                            />
                                            <input type="hidden" class="form-control" id="dob" name="dob"
                                                   placeholder=""
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getDob()%>
                                                       <%}%>
                                            />
                                            <input type="hidden" class="form-control" name="gender"
                                                   placeholder=""
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value="<%= userNeedEdit.getSex()%>"
                                                    <%}%>
                                            />
                                            <input type="hidden" class="form-control" name="role"
                                                   placeholder=""
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value="<%= userNeedEdit.getRole()%>"
                                                    <%}%>
                                            />
                                            <input
                                                    type="hidden"
                                                    id="phoneNumber"
                                                    name="phoneNumber"
                                                    class="form-control"
                                                    placeholder="Please enter Phone Number"
                                                    <% if (userNeedEdit == null) {%>
                                                    value=""
                                                    <%} else {%>
                                                    value=<%= userNeedEdit.getPhone()%>
                                                        <%}%>
                                            />
                                            <% if (userNeedEdit == null) {%>
                                            <input
                                                    type="hidden"
                                                    id="userID"
                                                    name="UserID"
                                                    class="form-control"
                                                    value=0
                                            />
                                            <%} else {%>
                                            <input
                                                    type="hidden"
                                                    id="userID"
                                                    name="UserID"
                                                    class="form-control"
                                                    value=<%= userNeedEdit.getUserID()%>
                                            />
                                            <%}%>
                                        </div>
                                        <div class="mt-2">
                                            <button type="submit" class="btn btn-dark me-2">Save</button>
                                            <a href="${pageContext.request.contextPath}/StaffListManagerServlet?role=all"
                                               class="btn btn-outline-secondary">Cancel</a>
                                        </div>
                                    </form>
                                    <h5 style="color:red;">${error2}</h5>
                                    <h5 style="color:green;">${success2}</h5>
                                </div>
                                <div class="card-body">
                                    <form method="POST" action="UserEditServlet?input=detail">
                                        <div class="row">
                                            <input type="hidden" class="form-control"  name="userID"
                                                    <% if (userNeedEdit == null) {%>
                                                   value=""
                                                    <%} else {%>
                                                   value=<%= userNeedEdit.getUserID()%>
                                                       <%}%>
                                            />
                                                <input
                                                        type="hidden"
                                                        class="form-control"
                                                        id="username"
                                                        name="username"
                                                        placeholder="Please enter User Name"
                                                        <% if (userNeedEdit == null) {%>
                                                        value=""
                                                        <%} else {%>
                                                        value=<%= userNeedEdit.getUserName()%>
                                                            <%}%>
                                                                autofocus
                                                />

                                                <input type="hidden" class="form-control" id="password" name="password"
                                                        <% if (userNeedEdit == null) {%>
                                                       value="123456"
                                                        <%} else {%>
                                                       value=<%= userNeedEdit.getPassword()%>
                                                           <%}%>
                                                />
                                                <input
                                                        class="form-control"
                                                        type="hidden"
                                                        id="email"
                                                        name="email"
                                                        placeholder="Please enter Password"
                                                        <% if (userNeedEdit == null) {%>
                                                        value=""
                                                        <%} else {%>
                                                        value=<%= userNeedEdit.getEmail()%>
                                                            <%}%>
                                                />
                                            <div class="mb-3 col-md-6">
                                                <label for="firstName" class="form-label">First Name</label>
                                                <input
                                                        class="form-control"
                                                        type="text"
                                                        id="firstName"
                                                        name="firstName"
                                                        placeholder="Please enter First Name"
                                                        pattern="([A-Z][a-zA-Z]*)" title="First letter must be uppercase, no number and white space"
                                                        required
                                                        <% if (userNeedEdit == null) {%>
                                                        value=""
                                                        <%} else {%>
                                                        value=<%= userNeedEdit.getFirstName()%>
                                                            <%}%>
                                                />
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="lastName" class="form-label">Last Name</label>
                                                <input class="form-control" type="text" name="lastName" id="lastName"
                                                       placeholder="Please enter Last Name"
                                                       pattern="([A-Z][a-zA-Z]*)" title="First letter must be uppercase, no number and white space"
                                                       required
                                                        <% if (userNeedEdit == null) {%>
                                                       value=""
                                                        <%} else {%>
                                                       value=<%= userNeedEdit.getLastName()%>
                                                           <%}%>
                                                />
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="dob" class="form-label">Date Of Birth</label>
                                                <input type="date" class="form-control" id="dob" name="dob"
                                                       placeholder=""
                                                       required
                                                        <% if (userNeedEdit == null) {%>
                                                       value=""
                                                        <%} else {%>
                                                       value=<%= userNeedEdit.getDob()%>
                                                           <%}%>

                                                />
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="gender" class="form-label">Gender</label>
                                                <% if (userNeedEdit == null) {%>
                                                <select id="gender" name="gender" class="select2 form-select" required>
                                                    <option value="0">Select</option>
                                                    <option value="1">Male</option>
                                                    <option value="2">Female</option>
                                                    <option value="3">Other</option>
                                                </select>
                                                <%} else {%>
                                                <select id="gender" name="gender" class="select2 form-select" required>
                                                    <option value="<%= userNeedEdit.getSex()%>">Select
                                                    </option>
                                                    <option value="1">Male</option>
                                                    <option value="2">Female</option>
                                                    <option value="3">Other</option>
                                                </select>
                                                <%}%>

                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="role" class="form-label">Role</label>
                                                <% if (userNeedEdit == null) {%>
                                                <select id="role" name="role" class="select2 form-select" required>
                                                    <option value="0">Select</option>
                                                    <option value="1">Admin</option>
                                                    <option value="2">Marketing</option>
                                                    <option value="3">Sale</option>
                                                    <option value="4">Customer</option>
                                                </select>
                                                <%} else {%>
                                                <select id="role" name="role" class="select2 form-select" required>
                                                    <option value="<%= userNeedEdit.getRole()%>">Select
                                                    </option>
                                                    <option value="1">Admin</option>
                                                    <option value="2">Marketing</option>
                                                    <option value="3">Sale</option>
                                                    <option value="4">Customer</option>
                                                </select>
                                                <%}%>

                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="phoneNumber">Phone Number</label>
                                                <div class="input-group input-group-merge">
                                                    <input
                                                            type="tel"
                                                            id="phoneNumber"
                                                            name="phoneNumber"
                                                            class="form-control"
                                                            placeholder="Please enter Phone Number"
                                                            required
                                                            <% if (userNeedEdit == null) {%>
                                                            value=""
                                                            <%} else {%>
                                                            value=<%= userNeedEdit.getPhone()%>
                                                                <%}%>
                                                    />
                                                </div>
                                            </div>
                                            <% if (userNeedEdit == null) {%>
                                            <input
                                                    type="hidden"
                                                    id="userID"
                                                    name="UserID"
                                                    class="form-control"
                                                    value=0
                                            />
                                            <%} else {%>
                                            <input
                                                    type="hidden"
                                                    id="userID"
                                                    name="UserID"
                                                    class="form-control"
                                                    value=<%= userNeedEdit.getUserID()%>
                                            />
                                            <%}%>
                                        </div>
                                        <div class="mt-2">
                                            <button type="submit" class="btn btn-dark me-2">Save</button>
                                            <a href="${pageContext.request.contextPath}/StaffListManagerServlet?role=all"
                                               class="btn btn-outline-secondary">Cancel</a>
                                        </div>
                                    </form>
                                    <h5 style="color:red;">${error3}</h5>
                                    <h5 style="color:green;">${success3}</h5>
                                </div>
                                <!-- /Account -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Content -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="a.template/assets/vendor/libs/jquery/jquery.js"></script>
<script src="a.template/assets/vendor/libs/popper/popper.js"></script>
<script src="a.template/assets/vendor/js/bootstrap.js"></script>
<script src="a.template/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="a.template/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="a.template/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="a.template/assets/js/main.js"></script>

<!-- Page JS -->
<script src="a.template/assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>

