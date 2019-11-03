<%--
  Created by IntelliJ IDEA.
  User: 吕航
  Date: 2019/10/30
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

    <!-- 员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_update_static" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender1_update_input" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="empEmail_add_input" class="col-sm-2 control-label">E-mail</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="empEmail_update_input" name="email" placeholder="Tom@163.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="empEmail_add_input" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="deptId" id="emp_update_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 员工添加的模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="empName_add_input" name="name" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="inlineRadio1" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="inlineRadio2" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="empEmail_add_input" class="col-sm-2 control-label">E-mail</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="empEmail_add_input" name="email" placeholder="Tom@163.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="empEmail_add_input" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="deptId" id="emp_add_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 搭建显示页面 --%>
    <div class="container">
        <%-- 标题 --%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <%-- 按钮 --%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
                <button class="btn btn-danger" id="emp_del_modal_btn">删除</button>
            </div>
        </div>
        <%-- 显示表格 --%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>邮箱</th>
                            <th>部门</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
            </div>
        </div>
        <%-- 显示分页信息 --%>
        <div class="row">
            <%-- 分页文字信息 --%>
            <div class="col-md-6" id="page_info_area">

            </div>
            <%-- 分页条信息 --%>
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>
    <script type="text/javascript">

        var totalRecord;    // 总记录数
        var currentPage;    // 当前页

        // 页面加载完成后，直接发送 AJAX 请求，请求查询数据
        $(function () {
            toPage(1);
        });

        function toPage(pn) {
            $.ajax({
                url:"${pageContext.request.contextPath}/emps",
                data:"pn=" + pn,
                type:"GET",
                success:function (result) {
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        }

        // 解析显示表格信息
        function build_emps_table(result) {
            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var idTd = $("<td></td>").append(item.id);
                var nameTd = $("<td></td>").append(item.name);
                var genderTd = $("<td></td>").append(item.gender);
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
                editBtn.attr("edit-id", item.id);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append("删除");
                delBtn.attr("delete-id", item.id);
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(idTd)
                    .append(nameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }
        
        // 解析显示分页信息
        function build_page_info(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append("当前 " + result.extend.pageInfo.pageNum + " 页，总 "
                + result.extend.pageInfo.pages + " 页，总共 "
                + result.extend.pageInfo.total + " 条记录");
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
        }
        
        // 解析显示分页条
        function build_page_nav(result) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

            firstPageLi.click(function () {
                toPage(1);
            });
            prePageLi.click(function () {
                toPage(result.extend.pageInfo.pageNum - 1);
            });

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

            nextPageLi.click(function () {
                toPage(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                toPage(result.extend.pageInfo.pages)
            });

            ul.append(firstPageLi);
            if (result.extend.pageInfo.hasPreviousPage) {
                ul.append(prePageLi);
            }

            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
                if (result.extend.pageInfo.pageNum === item) {
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    toPage(item);
                });
                ul.append(numLi);
            });

            if (result.extend.pageInfo.hasNextPage) {
                ul.append(nextPageLi);
            }
            ul.append(lastPageLi);

            var navEle = $("<nav></nav>").append(ul).appendTo("#page_nav_area");
        }

        // 清空表单样式
        function reset_form(element) {
            $(element)[0].reset();
            $(element).find("*").removeClass("has-success has-error");
            $(element).find(".help-block").text("");
        }
        
        /* 点击新建按钮弹出模态框 */
        $("#emp_add_modal_btn").click(function () {
            // 清空表单数据
            reset_form("#empAddModal form");
            // 发送 Ajax 请求，查询部门信息
            getDepts("#emp_add_select");
            // 显示模态框
            $("#empAddModal").modal({
               backdrop:"static"
            });
        });

        // 查询部门信息显示到模态框中
        function getDepts(element) {
            // 清除 select 标签所有的 option 标签
            $(element).empty();
            $.ajax({
                url:"${pageContext.request.contextPath}/depts",
                type:"GET",
                success:function (result) {
                    $.each(result.extend.depts, function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                        optionEle.appendTo(element);
                    });
                }
            });
        }
        
        // 保存新增员工信息
        $("#emp_save_btn").click(function () {
            // 校验输入的信息
            if (!validate_add_form("#empName_add_input")) {
                return false;
            }
            if (!validate_add_form("#empEmail_add_input")) {
                return false;
            }
            if ($(this).attr("ajax_validate") === "error") {
                return false;
            }
            // 提交要保存的信息
            $.ajax({
                url:"${pageContext.request.contextPath}/emps",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function (result) {
                    if (result.code === 100) {
                        // 后端校验成功
                        $('#empAddModal').modal('hide');
                        toPage(totalRecord);
                    } else {
                        // 后端校验失败
                        //console.log(result);
                        if (undefined !== result.extend.errorFields.name) {
                            show_validate_msg("#empName_add_input", "error", result.extend.errorFields.name);
                        }
                        if (undefined !== result.extend.errorFields.email) {
                            show_validate_msg("#empEmail_add_input", "error", result.extend.errorFields.email);
                        }
                    }
                }
            });
        });

        // 校验表单数据是否为空
        function validate_add_form(element) {
            var elementVal = $(element).val();
            //alert("elementVal : " + elementVal);
            if (elementVal === "") {
                show_validate_msg(element, "error", "必填项");
                return false;
            } else {
                return true;
            }
        }

        // 校验表单数据
        $("#empName_add_input").change(function () {
            // 校验用户名是否合法
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if (!regName.test(empName)) {
                //alert("用户名必须是2-5位中文字符或者由6-16位英文和数字组成");
                show_validate_msg("#empName_add_input", "error", "用户名必须是2-5位中文字符或者由6-16位英文和数字组成");
                return false;
            } else {
                show_validate_msg("#empName_add_input", "success", "");
            }
            // 校验用户名是否重复
            $.ajax({
                url:"${pageContext.request.contextPath}/checkEmp?time=" + new Date().getTime(),
                data:"name=" + empName,
                type:"POST",
                success:function (result) {
                    if (result.code === 100) {
                        show_validate_msg("#empName_add_input", "success", "用户名可用");
                        $("#emp_save_btn").attr("ajax_validate", "success");
                    } else if (result.code === 200) {
                        show_validate_msg("#empName_add_input", "error", "用户名不可用");
                        $("#emp_save_btn").attr("ajax_validate", "error");
                    }
                }
            });
        });

        $("#empEmail_add_input").change(function () {
            // 校验邮箱
            var empEmail = $("#empEmail_add_input").val();
            var regEmail = /^([a-z0-9_.-]+)@([\da-z.-]+)\.([a-z.]{2,6})$/;
            if (!regEmail.test(empEmail)) {
                //alert("邮箱格式错误");
                show_validate_msg("#empEmail_add_input", "error", "邮箱格式错误");
                return false;
            } else {
                show_validate_msg("#empEmail_add_input", "success", "");
            }
        });

        // 显示校验提示信息
        function show_validate_msg(element, status, msg) {
            $(element).parent().removeClass("has-success has-error");
            $(element).next("span").text("");
            if (status === "success") {
                $(element).parent().addClass("has-success");
                $(element).next("span").text(msg);
            } else if (status === "error") {
                $(element).parent().addClass("has-error");
                $(element).next("span").text(msg);
            }
        }

        // 给编辑按钮绑定点击事件
        $(document).on("click", ".edit_btn", function () {
            // 清除邮箱的校验样式
            // 查询要修改的员工信息
            //alert($(this).attr("edit-id"));
            getEmp($(this).attr("edit-id"));
            // 查询部门信息
            getDepts("#emp_update_select");
            $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
            // 弹出模态框
            $("#empUpdateModal").modal({
                backdrop:"static"
            });
        });

        //查询员工信息
        function getEmp(id) {
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/" + id,
                type:"GET",
                success:function (result) {
                    var emp = result.extend.employee;
                    console.log(emp);
                    $("#empName_update_static").text(emp.name);
                    $("#empEmail_update_input").val(emp.email);
                    $("#empUpdateModal input[name=gender]").val([emp.gender]);
                    $("#emp_update_select").val([emp.deptId]);
                }
            });
        }

        // 保存修改的员工信息
        $("#emp_update_btn").click(function () {
            // 校验邮箱信息
            var empEmail = $("#empEmail_update_input").val();
            var regEmail = /^([a-z0-9_.-]+)@([\da-z.-]+)\.([a-z.]{2,6})$/;
            if (!regEmail.test(empEmail)) {
                show_validate_msg("#empEmail_update_input", "error", "邮箱格式错误");
                return false;
            } else {
                show_validate_msg("#empEmail_update_input", "success", "");
            }

            // 点击保存
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/" + $("#emp_update_btn").attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function (result) {
                    // 关闭模态框
                    $("#empUpdateModal").modal("hide");
                    // 跳转到当期页面
                    toPage(currentPage);
                }
            });
        });
    </script>
</body>
</html>
