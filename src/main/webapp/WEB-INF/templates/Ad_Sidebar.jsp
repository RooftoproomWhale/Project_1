<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="<c:url value='/images/icon/logo.png'/>" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="active has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="<c:url value='/Admin/Index.hst'/>">Dashboard</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Chart.hst'/>">
                                <i class="fas fa-chart-bar"></i>Charts</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Table.hst'/>">
                                <i class="fas fa-table"></i>Tables</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Form.hst'/>">
                                <i class="far fa-check-square"></i>Forms</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Calendar.hst'/>">
                                <i class="fas fa-calendar-alt"></i>Calendar</a>
                        </li>
                        <li>
                            <a href="<c:url value='/Admin/Map.hst'/>">
                                <i class="fas fa-map-marker-alt"></i>Maps</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-copy"></i>Pages</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="<c:url value='/Admin/Login.hst'/>">Login</a>
                                </li>
                                <li>
                                    <a href="<c:url value='/Admin/Register.hst'/>">Register</a>
                                </li>
                                <li>
                                    <a href="<c:url value='/Admin/Forget-pass.hst'/>">Forget Password</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

    