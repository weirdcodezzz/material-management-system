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
    <link href="${APP_PATH}/static/css/index.css" rel="stylesheet"/>
</head>
<body>
<!-- 添加物料 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">增加物料</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="input_description" class="col-sm-3 control-label">物料描述</label>
                        <div class="col-sm-8">
                            <input type="text" name="description" class="form-control" id="input_description">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_uom" class="col-sm-3 control-label">物料单位</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="uom" id="input_uom">
                                <option value="米">米</option>
                                <option value="平方米">平方米</option>
                                <option value="立方米">立方米</option>
                                <option value="千克">千克</option>
                                <option value="个">个</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_startTime" class="col-sm-3 control-label">生效时间从</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" name="startActiveDate" id="input_startTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_endTime" class="col-sm-3 control-label">生效时间至</label>
                        <div class="col-sm-8">
                            <input type="date" name="endActiveDate" class="form-control" id="input_endTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_enabled" class="col-sm-3 control-label">是否启用</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="enabledFlag" id="input_enabled">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" class="btn btn-primary" id="mat_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel_update">物料编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="update_code" class="col-sm-3 control-label">物料编码</label>
                        <div class="col-sm-8">
                            <input type="text" name="code" disabled="disabled" class="form-control" id="update_code">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_description" class="col-sm-3 control-label">物料描述</label>
                        <div class="col-sm-8">
                            <input type="text" name="description" class="form-control" id="update_description">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_uom" class="col-sm-3 control-label">物料单位</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="uom" id="update_uom">
                                <option value="米">米</option>
                                <option value="平方米">平方米</option>
                                <option value="立方米">立方米</option>
                                <option value="千克">千克</option>
                                <option value="个">个</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_startTime" class="col-sm-3 control-label">生效时间从</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" name="startActiveDate" id="update_startTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_endTime" class="col-sm-3 control-label">生效时间至</label>
                        <div class="col-sm-8">
                            <input type="date" name="endActiveDate" class="form-control" id="update_endTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_enabled" class="col-sm-3 control-label">是否启用</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="enabledFlag" id="update_enabled">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" class="btn btn-primary" id="mat_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>
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
            <button type="button" class="btn btn-default" id="mat_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger" id="mats_delete_btn">删除</button>
            <button type="button" class="btn btn-info" id="mats_export_btn">导出</button>
        </div>
    </div>
    <hr/>
    <!-- 查询 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-1">
            <div class="input">
                <div id="select_data">
                    <table class="input_tb">
                        <tr>
                            <td>
                                <label for="code">物料编码</label>
                                <input type="text" name="code" id="code">
                            </td>
                            <td>
                                <label for="describe">物料描述</label>
                                <input type="text" name="description" id="describe">
                            </td>
                            <td>
                                <label for="unit">物料单位</label>
                                <select name="startActiveDate" id="unit">
                                    <option value="">请选择单位</option>
                                    <option value="米">米</option>
                                    <option value="平方米">平方米</option>
                                    <option value="立方米">立方米</option>
                                    <option value="千克">千克</option>
                                    <option value="个">个</option>
                                    <option value="其他">其他</option>
                                </select>
                            </td>
                            <td>
                                <button id="select_reset">重置</button>
                                <button id="selects">查询</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="date_start">生效时间从</label>
                                <input type="date" name="" id="date_start">
                            </td>
                            <td>
                                <label for="date_end">生效时间至</label>
                                <input type="date" name="endActiveDate" id="date_end">
                            </td>
                            <td>
                                <label for="use">是否启用</label>
                                <select name="enabledFlag" id="use">
                                    <option value="">请选择是否启用</option>
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered" id="mats_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>物料编码</th>
                    <th>物料描述</th>
                    <th>物料单位</th>
                    <th>生效时间从</th>
                    <th>生效时间至</th>
                    <th>是否启用</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row" style="position: relative">
        <div class="col-md-6" id="page_info_area">
        </div>
        <span class="col-md-6" id="page_nav_area">

        </span>
        <select id="get_size" style="position: absolute; left: 940px; top: 23px; width: 70px; height: 28px">
            <option value="5">5条/页</option>
            <option value="10">10条/页</option>
            <option value="20">20条/页</option>
        </select>
    </div>
</div>
<script type="text/javascript">
    var totalRecord, currentPage;
    $(function () {
        //去首页
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/selects" + path,
            data: "pageNo=" + pn + "&pageSize=" + getSize(),
            type: "GET",
            success: function (result) {
                //console.log(result);
                build_materials_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    function getSize() {
        var size = $("#get_size").val();
        //console.log(size);
        return size;
    }

    $("#get_size").click(function () {
        to_page(1);
    });

    //显示校验结果的提示信息
    function show_validate_msg(ele, status, msg) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#mat_save_btn").click(function () {
        //alert($("#addModal form").serialize());
        $.ajax({
            url: "${APP_PATH}/add",
            type: "POST",
            data: $("#addModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    $("#addModal").modal("hide");
                    to_page(totalRecord);
                } else {
                    alert("格式错误，请重新输入");
                }
            }
        })
    });

    function build_materials_table(result) {
        $("#mats_table tbody").empty();
        var materials = result.extend.pageInfo.list;
        $.each(materials, function (index, item) {
            //alert(item.code)
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
            var matCode = $("<td></td>").append(item.code);
            var matDes = $("<td></td>").append(item.description);
            var matUom = $("<td></td>").append(item.uom);
            var matStart = $("<td></td>").append(item.startActiveDate);
            var matEnd = $("<td></td>").append(item.endActiveDate);
            var matEnabled = $("<td></td>").append(item.enabledFlag == 1 ? "是" : "否");
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").append("编辑"));
            editBtn.attr("edit_id", item.code);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").append("删除"));
            deleteBtn.attr("delete_id", item.code);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").append(checkBoxTd).append(matCode).append(matDes)
                .append(matUom).append(matStart)
                .append(matEnd).append(matEnabled)
                .append(btnTd)
                .appendTo("#mats_table tbody");
        })
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页,总共" + result.extend.pageInfo.pages + "页,总共" + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("<"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }


        var nextPageLi = $("<li></li>").append($("<a></a>").append(">"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }


        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    $("#mat_add_modal_btn").click(function () {
        $("#addModal").modal({
            backdrop: "static"
        })
    });
    $(document).on("click", ".edit_btn", function () {
        getMat($(this).attr("edit_id"));
        $("#updateModal").modal({
            backdrop: "static"
        });
    });

    function getMat(code) {
        $.ajax({
            url: "${APP_PATH}/material/" + code,
            type: "GET",
            success: function (result) {
                //console.log(result);
                var matData = result.extend.mat;
                $("#update_code").val(matData.code);
                $("#update_description").val(matData.description);
                $("#update_uom").val(matData.uom);
                $("#update_startTime").val(matData.startActiveDate);
                $("#update_endTime").val(matData.endActiveDate);
                $("#update_enabled").val(matData.enabledFlag);
            }
        });
    }

    $("#mat_update_btn").click(function () {
        //alert($("#updateModal form").serialize());
        //alert($("#update_code").val())
        $.ajax({
            url: "${APP_PATH}/update/" + $("#update_code").val(),
            type: "POST",
            data: $("#updateModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    $("#updateModal").modal("hide");
                    to_page(currentPage);
                } else {
                    alert("格式错误，请重新输入");
                }
            }
        });
    });

    $(document).on("click", ".delete_btn", function () {
        var code = $(this).attr("delete_id");
        if (confirm("确认删除[" + code + "]吗？")) {
            $.ajax({
                url: "${APP_PATH}/delete/" + $(this).attr("delete_id"),
                type: "DELETE",
                success: function (result) {
                    if (result.code == 100) {
                        alert("删除成功");
                        to_page(currentPage);
                    } else {
                        alert("删除出错");
                    }
                }
            });
        }
    });

    $("#check_all").click(function () {
        //$(this).prop("checked");
        $(".check_item").prop("checked", $(this).prop("checked"));
        //alert($(".check_item:checked").length);
    });

    $(document).on("click", ".check_item", function () {
        //alert($(".check_item:checked").length);
        //$("#check_all").prop("checked")
        var flag = $(".check_item").length == $(".check_item:checked").length;
        $("#check_all").prop("checked", flag);
    });

    $("#mats_delete_btn").click(function () {
        var codes = "";
        var codeList = ""
        $.each($(".check_item:checked"), function () {
            var code = $(this).parents("tr").find("td:eq(1)").text();
            //alert(code);
            codes += code + "\n";
            codeList += code + "-";
        });
        if (confirm("确认删除:\n" + codes + "吗？")) {
            $.ajax({
                url: "${APP_PATH}/deletes/" + codeList,
                type: "DELETE",
                success: function (result) {
                    if (result.code == 100) {
                        alert("删除成功");
                        to_page(currentPage);
                    } else {
                        alert("删除出错");
                    }
                }
            });
        }
    });

    $("#mats_export_btn").click(function () {
        var codes = "";
        var codeList = "";
        $.each($(".check_item:checked"), function () {
            var code = $(this).parents("tr").find("td:eq(1)").text();
            //alert(code);
            codes += code + "\n";
            codeList += code + "-";
        });
        if (codeList == null || codeList == ""){
            alert("选择要导出的列");
            return;
        }
        if (confirm("是否要导出数据？")) {
            window.location.href = "${APP_PATH}/export/"+codeList;
        }
    });

    $("#select_reset").click(function () {
        $("#code").val("");
        $("#describe").val("");
        $("#unit").val("");
        $("#date_start").val("");
        $("#date_end").val("");
        $("#use").val("");
        path = "";
        to_page(1);
    });

    var path = "";
    $("#selects").click(function () {
        var code = $("#code").val() == null;
        var describe = $("#describe").val();
        var unit = $("#unit").val();
        var date_start = $("#date_start").val();
        var date_end = $("#date_end").val();
        var use = $("#use").val();
        path = "?";
        if (code != "") {
            path += "code=" + code + "&";
        }
        if (describe != "") {
            path += "description=" + describe + "&";
        }
        if (unit != "" && unit != null) {
            path += "uom=" + unit + "&";
        }
        if (date_start != "") {
            path += "startActiveDate=" + date_start + "&";
        }
        if (date_end != "") {
            path += "endActiveDate=" + date_end + "&";
        }
        if (use != "" && use != null) {
            path += "enabledFlag=" + use;
        }
        to_page(1);
    });
</script>
</body>
</html>
