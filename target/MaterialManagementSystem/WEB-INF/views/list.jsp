<%--
  Created by IntelliJ IDEA.
  User: lfq05
  Date: 2020/12/7
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>物料清单</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>物料管理</h1>
        </div>
    </div>
    <!-- 增删按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button type="button" class="btn btn-default">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
    <hr/>
    <!-- 查询 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-4">

        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered">
                <tr>
                    <th>物料编码</th>
                    <th>物料描述</th>
                    <th>物料单位</th>
                    <th>生效时间从</th>
                    <th>生效时间至</th>
                    <th>是否启用</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="mat">
                    <tr>
                        <th>${mat.code}</th>
                        <th>${mat.description}</th>
                        <th>${mat.uom}</th>
                        <th>${mat.startActiveDate}</th>
                        <th>${mat.endActiveDate}</th>
                        <th>
                            <c:choose>
                                <c:when test="${mat.enabledFlag==1}">是</c:when>
                                <c:otherwise>否</c:otherwise>
                            </c:choose>
                        </th>
                        <th>
                            <button class="btn btn-primary btn-xs">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-xs">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,总共${pageInfo.total}条记录
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${APP_PATH}/materials?page=1">首页</a>
                    </li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/materials?page=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/materials?page=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/materials?page=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li>
                        <a href="${APP_PATH}/materials?page=${pageInfo.pages}">尾页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
