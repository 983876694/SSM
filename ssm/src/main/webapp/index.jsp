
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <%--// <script src="${APP_PATH}/static/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>--%>
    <%--// <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css">--%>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="style/css/btn.css"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <%--<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <title>物料信息</title>
    <style>
        .form-group {

            margin-left: 70px;
        }

        .myButton {
            -moz-box-shadow: inset 0px 1px 11px 0px #ffffff;
            -webkit-box-shadow: inset 0px 1px 11px 0px #ffffff;
            box-shadow: inset 0px 1px 11px 0px #ffffff;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
            background: -moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
            background: -webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
            background: -o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
            background: -ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
            background: linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9', GradientType=0);
            background-color: #f9f9f9;
            -moz-border-radius: 12px;
            -webkit-border-radius: 12px;
            border-radius: 12px;
            border: 1px solid #dcdcdc;
            display: inline-block;
            cursor: pointer;
            color: #666666;
            font-family: Arial;
            font-size: 13px;
            font-weight: bold;
            padding: 13px 24px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #ffffff;
        }

        .myButton:hover {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
            background: -moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
            background: -webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
            background: -o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
            background: -ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
            background: linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9', GradientType=0);
            background-color: #e9e9e9;
        }

        .myButton:active {
            position: relative;
            top: 1px;
        }

    </style>

</head>
<body>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">物料信息修改</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <input type="hidden" id="updateItemId" name="itemId">
                        <label for="updateIteDescription" class="col-sm-2 control-label">物料描述</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="iteDescription" id="updateIteDescription">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateItemUom" class="col-sm-2 control-label">物料单位</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="itemUom" id="updateItemUom">
                                <option>米</option>
                                <option>平方米</option>
                                <option>立方米</option>
                                <option>千克</option>
                                <option>个</option>
                                <option>其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateStartActiveDate" class="col-sm-2 control-label">生效时间</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" name="startActiveDate" id="updateStartActiveDate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateEndActiveDate" class="col-sm-2 control-label">截至时间</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" name="endActiveDate" id="updateEndActiveDate"
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否启用</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="enabledFlag" id="updateEnabledFlag">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_update_btn">修改</button>
            </div>
        </div>
    </div>

</div>
<!-- 员工添加的Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">物料信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">物料描述</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="iteDescription" id="addIteDescription"
                                   placeholder="itemDescription">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">物料单位</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="itemUom" id="addItemUom">
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
                        <label for="updateStartActiveDate" class="col-sm-2 control-label">生效时间</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" name="startActiveDate" id="addStartActiveDate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateEndActiveDate" class="col-sm-2 control-label">截至时间</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" name="endActiveDate" id="addEndActiveDate" value="">
                        </div>
                    </div>
                    <%--<label > 有效期从</label>--%>
                    <%--<input  type="date" class="form-control" autocomplete="off"name="startActiveDate" id="addStartActiveDate">--%>
                    <%--<label > 有效期至</label>--%>
                    <%--<input  type="date" class="form-control" autocomplete="off"  name="endActiveDate" id="addEndActiveDate" >--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否启用</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="enabledFlag" id="addEnabledFlag">
                                <option value="true">是</option>
                                <option value="false">否</option>

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  blue" data-dismiss="modal" style="background-color: transparent; ">
                    返回
                </button>
                <button type="button" class="btn  green emp_save_btn" style="background-color: transparent; ">保存
                </button>
            </div>
        </div>
    </div>
</div>
<div class="jumbotron">
    <div class="container">
        <div class="col-md-12">
            <h1>物料管理系统</h1>
        </div>
        <p>这是一个物料管理系统，包含了几乎所有物料的信息</p>
        <div class="row">
            <div class="col-md-4 col-md-offset-10">
                <a class="btn  btn-lg blue" href="#" role="button" id="logistics_add_modal_btn">新增</a>
                <a class="btn  btn-lg red" href="#" data-transition="pop" role="button" id="emp_delete_all_btn">删除</a>
            </div>
        </div>
        <div class="row " id="info">
            <div class="col-md-12">
                <ul class="nav nav-tabs " style="">
                    <li role="presentation" class="active"><a href="#" class="myButton">物料信息</a></li>
                </ul>
            </div>
        </div>
        <%--查询条件--%>
        <div class="row">
            <div class="col-md-12">
                <form class="form-inline" style="margin-top: 30px;">
                    <div class="form-group">
                        <label for="itemSelectCode">物料编码</label>
                        <input type="text" class="form-control" name="itemCode" id="itemSelectCode">
                    </div>
                    <div class="form-group">
                        <label for="iteSelectDescription">物料描述</label>
                        <input type="text" class="form-control" name="iteDescription" id="iteSelectDescription">
                    </div>
                    <div class="form-group">
                        <label for="itemSelectUom">物料单位</label>

                        <select class="form-control" name="itemUom" id="itemSelectUom">
                            <option value=""></option>
                            <option value="米">米</option>
                            <option value="平方米">平方米</option>
                            <option value="立方米">立方米</option>
                            <option value="千克">千克</option>
                            <option value="个">个</option>
                            <option value="其他">其他</option>
                        </select>

                    </div>
                    <button type="button" class="btn btn-sm orange"
                            style="margin-left: 13%;background-color: transparent;" id="reset">重置
                    </button>
                </form>
                <form class="form-inline" style="margin-top: 30px;">
                    <div class="form-group">
                        <label for="selectStartActiveDate">生效日期</label>
                        <input type="date" class="form-control" name="startActiveDate" id="selectStartActiveDate">
                    </div>
                    <div class="form-group" style="margin-left: 105px;">
                        <label for="selectEndActiveDate">截至日期</label>
                        <input type="date" class="form-control" name="endActiveDate" id="selectEndActiveDate">
                    </div>
                    <div class="form-group" style="margin-left: 108px;">
                        <label for="selectEnabledFlag">是否启用</label>

                        <select class="form-control" name="enabledFlag" id="selectEnabledFlag">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>

                        </select>

                    </div>
                    <button type="button" class="btn btn-sm green"
                            style="margin-left: 15.4%;background-color: transparent;" id="search">查询
                    </button>
                </form>
            </div>

        </div>

        <%--需求列表--%>
        <div class="row " id="info2">
            <div class="col-md-12">
                <ul class="nav nav-tabs " style="margin-bottom: 30px;">
                    <li role="presentation" class="active"><a href="#" class="myButton">需求列表</a></li>
                </ul>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-striped" id="item_table">
                    <thead>
                    <tr>
                        <%--<th>--%>
                        <%--<input type="checkbox" id="check_all"/>--%>
                        <%--</th>--%>
                        <th><input type="checkbox" class="check_all"></th>
                        <th style="display:none;">物料ID</th>
                        <th>物料编码</th>
                        <th>物料描述</th>
                        <th>物料单位</th>
                        <th>生效时间</th>
                        <th>截至时间</th>
                        <th>是否启用</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>


                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6" id="page_info_area">
            </div>
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var totalRecord, currentPage;
    /*表格*/
    function build_Table(result) {
        $("#item_table tbody").empty();
            var tableList = result.extend.page.list;
        $.each(tableList, function (index, item) {
            var checkBoxTd =
                $("<td><input type=\"checkbox\"  class='check_item'></td>");
            var itemId =
                $("<td style=\"display:none;\"></td>").append(item.itemId);
            var itemCode =
                $("<td></td>").append(item.itemCode);
            var itemUom =
                $("<td></td>").append(item.itemUom);
            var iteDescription =
                $("<td></td>").append(item.iteDescription);
            var startActiveDate =
                $("<td></td>").append(item.startActiveDate);
            var endActiveDate =
                $("<td></td>").append(item.endActiveDate);
            var enabledFlag =
                $("<td></td>").append(item.enabledFlag ? "是" : "否");
            var editBtn =
                $("<button style='margin-top:5px;background-color: transparent;' data-target=\"#updateModal\"></button>")
                    .addClass("btn btn-sm blue edit_btn")
                    .append($("<span></span>")
                    .addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
            editBtn.attr("edit-id", item.itemId);
            var delBtn =
                $("<button style='margin-top: 5px;margin-right: 10px;background-color:transparent; ' ></button>")
                    .addClass("btn btn-sm red delete_btn")
                    .append($("<span></span>")
                    .addClass("glyphicon glyphicon-trash"))
                    .append("删除");
            var btnTd =
                $("<td></td>")
                    .append(editBtn)
                    .append(" ")
                    .append(delBtn);
            delBtn.attr("del-id", item.itemId);
            $("<tr></tr>").append(checkBoxTd)
                .append(itemId)
                .append(itemCode)
                .append(iteDescription)
                .append(itemUom)
                .append(startActiveDate)
                .append(endActiveDate)
                .append(enabledFlag)
                .append(btnTd)
                .appendTo("#item_table tbody");
        });
    }
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>")
                .append($("<a></a>")
                    .append("首页")
                    .attr("href", "#"));
            var prePageLi = $("<li></li>")
                .append($("<a></a>")
                    .append("&laquo;"));
            if (result.extend.page.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                var dataList = {
                    "start": 1
                };
                getList(dataList);
            });
            prePageLi.click(function () {
                var dataList = {
                    "start": result.extend.page.pageNum - 1
                };
                getList(dataList);
            });
        }
        var nextPageLi = $("<li></li>")
            .append($("<a></a>")
                .append("&raquo;"));
        var lastPageLi = $("<li></li>")
            .append($("<a></a>")
                .append("末页")
                .attr("href", "#"));
        if (result.extend.page.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                var dataList = {
                    "start": result.extend.page.pageNum + 1
                };
                getList(dataList);
            });
            lastPageLi.click(function () {
                var dataList = {
                    "start": result.extend.page.pages
                };
                getList(dataList);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.page.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>")
                .append($("<a></a>")
                    .append(item));
            if (result.extend.page.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                var dataList = {
                    "start": item
                }
                getList(dataList);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    $(document).on('click', "#logistics_add_modal_btn", function () {
        $("#addIteDescription").val("");
        $("#addItemUom").val("米");
        $("#addStartActiveDate").val("");
        $("#addEndActiveDate").val("");
        $("#addEnabledFlag").val("true");
        $("#addModal").modal('show');
    })
    $(document).on("click", "#reset", function () {
        $("#itemSelectCode").val("");
        $("#iteSelectDescription").val("");
        $("#itemSelectUom").val("");
        $("#selectStartActiveDate").val("");
        $("#selectEndActiveDate").val("");
        $("#selectEnabledFlag").val("");
    })
    $(document).on("click", ".emp_save_btn", function () {
        $.ajax({
            url: "item/addItem",
            type: "POST",
            data: $("#addModal form").serialize(),
                success: function (result) {
                    if (result.code == 100) {
                        alert("新增成功！")
                        $("#addModal").modal('hide');
                        var dataList = {"start": totalRecord }
                        getList(dataList);
                    } else {
                        alert("新增失败！")
                    }
                }

        })
    })
    $(document).on("click", ".check_all", function () {
            $(".check_item").prop("checked", $(this).prop("checked"));
        }
    )
    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $(".check_all").prop("checked", flag);
    });
    $(document).on("click", ".delete_btn", function () {
        var itemId = $(this).parents("tr").find("td:eq(1)").text();
        var datalist = {
            "itemId": itemId
        }
        if (confirm("确认删除这条数据？")) {
            $.ajax({
                url: "item/deleteById",
                type: "POST",
                data: datalist,
                    success: function (result) {
                        if (result.code == 100) {
                            alert("删除成功！");
                        } else {
                            alert("删除失败！");
                        }
                            var dataLiat = {"start": currentPage}
                        getList(dataLiat);
                    }
            })
        }
    })
    $(document).on("click", "#emp_delete_all_btn", function () {
        var item = "";
        $.each($(".check_item:checked"), function () {
            item += $(this).parents("tr").find("td:eq(1)").text() + ""
        })
        itemId = item.substring(0, item.length - 1);
        var a = false;
        if (itemId.length >= 1) {
            var datalist = {
                "itemId2": itemId
            }
            if (confirm("是否删除" + itemId + "这条数据？")) {
                $.ajax({
                    url: "item/deleteByIdList",
                    type: "POST",
                    data: datalist,
                    success: function (result) {
                        if (result.code == 100) {
                            alert("删除成功！");
                        } else {
                            alert("删除失败！");
                        }
                        getList(currentPage);
                    }
                })
            }
        } else {
            alert("请选择要删除的数据！")
        }

    });
    $(document).on("click", "#search", function () {
        var dataList = {
            "itemSelectCode": $("#itemSelectCode").val(),
            "iteSelectDescription": $("#iteSelectDescription").val(),
            "itemSelectUom": $("#itemSelectUom").val(),
            "selectStartActiveDate": $("#selectStartActiveDate").val(),
            "selectEndActiveDate": $("#selectEndActiveDate").val(),
            "selectEnabledFlag": $("#selectEnabledFlag").val()
        }
        getList(dataList);
    });
    function getItem(itemId) {
        var data = {
            "itemId": itemId
        }
        $.ajax({
            url: "item/selItemById",
            type: "POST",
            data: data,
            success: function (result) {
                var list = result.extend.list;
                $("#updateItemId").val(list[0].itemId);
                $("#updateIteDescription").val(list[0].iteDescription);
                $("#updateItemUom").val(list[0].itemUom);
                $("#updateStartActiveDate").val(list[0].startActiveDate);
                $("#updateEndActiveDate").val(list[0].endActiveDate);
                if (list[0].enabledFlag == true) {
                    $("#updateEnabledFlag").val("1");
                } else {
                    $("#updateEnabledFlag").val("0");
                }

            }
        })

    };
    $(document).on("click", ".edit_btn", function () {
        var data = $(this).attr("edit-id");
        getItem(data);
        $("#updateModal").modal({
            backdrop: "static"
        });


    })
    $(document).on("click", ".emp_update_btn", function () {
        var a = true;
        if ($("#updateStartActiveDate").val() > $("#updateEndActiveDate").val()) {
            alert("生效时间不得大于截至时间！请重新填写！");
            $("#updateEndActiveDate").val("");
            a = false;
        }
        var datalist = {
            "updateItemId": $("#updateItemId").val(),
            "updateIteDescription": $("#updateIteDescription").val(),
            "updateItemUom": $("#updateItemUom").val(),
            "updateStartActiveDate": $("#updateStartActiveDate").val(),
            "updateEndActiveDate": $("#updateEndActiveDate").val(),
            "updateEnabledFlag": $("#updateEnabledFlag").val()
        }
        if (a) {
            $.ajax({
                url: "item/updateItemById",
                type: "POST",
                data: datalist,
                success: function (result) {
                    alert("success！");
                    $("#updateModal").modal("hide");
                    var dataList = {
                        "start": currentPage
                    }
                    getList(dataList);
                }
            });
        }


    })

    $(function () {
        var listData = {}
        getList(listData);
    })
    /*显示数据*/
    function getList(listData) {
        $.ajax({
            url: "item/itemList",
            data: listData,
            type: "POST",
            success: function (result) {
                build_Table(result);
                build_page_info(result);
                build_page_nav(result);
            },
            error: function (result) {
                alert();
            }
        });
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        var pageList = result.extend.page;
        var html = "当前 " + result.extend.page.pageNum + "页，总" + result.extend.page.pages + "页,总" +
            result.extend.page.total + "条记录";
        $("#page_info_area").append(html);
        totalRecord = result.extend.page.total;
        currentPage = result.extend.page.pageNum;

    }


</script>
</html>