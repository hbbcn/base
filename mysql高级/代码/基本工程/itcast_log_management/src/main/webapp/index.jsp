<%--

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>日志列表</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/plugins/adminLTE/css/skins/_all-skins.min.css">


    <link href="/css/zpageNav.css" rel="stylesheet" />
    <script src="/plugins/vue/vue.js"></script>
    <script src="/plugins/vue/zpageNav.js"></script>
    <script src="/plugins/vue/axios-0.18.0.js"></script>

</head>

<body class="hold-transition skin-purple sidebar-mini" >

<div class="wrapper" >

    <div id="app">
        <!-- 页面头部 -->
        <header class="main-header">


            <!-- Logo -->
            <a href="all-admin-index.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>数据</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>数据</b>后台管理</span>
            </a>


            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

            </nav>
        </header>
        <!-- 页面头部 /-->



        <!-- 导航侧栏 -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>张猿猿</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                    </div>
                </div>

                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">菜单</li>

                    <li id="admin-index"><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

                    <!-- 菜单 -->
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-cogs"></i> <span>日志管理</span>
                            <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                        </a>
                        <ul class="treeview-menu">

                            <li id="system-setting">
                                <a href="log-datalist.html">
                                    <i class="fa fa-files-o"></i>日志查询
                                </a>
                            </li>

                        </ul>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
        <!-- 导航侧栏 /-->

        <!-- 内容区域 -->
        <div class="content-wrapper">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    日志查询
                    <small>数据列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i>日志管理</a></li>
                    <li class="active">日志查询</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        操作人 : <input type="text" v-model="searchEntity.operateUser" class="form-control input-sm" placeholder="操作人">&nbsp;&nbsp;
                                        操作方法 : <input type="text" v-model="searchEntity.operateMethod" class="form-control input-sm" placeholder="操作方法">&nbsp;&nbsp;
                                        返回值类型 : <input type="text" v-model="searchEntity.returnClass" class="form-control input-sm" placeholder="返回值类型">&nbsp;&nbsp;
                                        操作耗时(ms) :<input type="text" v-model="searchEntity.costTime" class="form-control input-sm" placeholder="操作耗时">&nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>

                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                    <button type="button" class="btn btn-primary" title="查询" @click="page=1;search()"> 查询 <i class="fa  fa-search"></i></button>
                                </div>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <th class="">ID</th>
                                    <th class="">操作类</th>
                                    <th class="">操作方法</th>
                                    <th class="">返回值类型</th>
                                    <th class="">返回值</th>
                                    <th class="">操作人</th>
                                    <th class="">操作时间</th>
                                    <th class="">耗时</th>
                                    <th class="">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr v-for="item in dataList">
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>{{item.id}}</td>
                                    <td>{{item.operateClass}}</td>
                                    <td>{{item.operateMethod}}</td>
                                    <td>{{item.returnClass}}</td>
                                    <td>{{item.returnValue}}</td>
                                    <td>{{item.operateUser}}</td>
                                    <td>{{item.operateTime}}</td>
                                    <td>{{item.costTime}}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs">详情</button>
                                        <button type="button" class="btn bg-olive btn-xs">删除</button>
                                    </td>
                                </tr>

                                </tbody>
                            </table>


                        </div>

                        <!-- /.box-body -->

                        <!-- /.box-footer-->

                    </div>

                    <div class="wrap" id="wrap">
                        <zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage"  v-on:pagehandler="pageHandler"></zpagenav>
                    </div>

                </div>

            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- @@close -->
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0.0
            </div>
            <strong>Copyright &copy; 2014-2019 <a href="http://www.itcast.cn">传智播客 - 黑马程序员</a>.</strong> All rights reserved.
        </footer>
        <!-- 底部导航 /-->
    </div>
</div>


<div class="modal fade" id="loadingModal" backdrop="static" keyboard="false">
    　　<div style="width: 200px;height:20px; z-index: 20000; position: absolute; text-align: center; left: 50%; top: 50%;margin-left:-100px;margin-top:-10px">
    　　　　<h3 id="loadText" style="color: white">loading...</h3>
    　　</div>
</div>




<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/iCheck/icheck.min.js"></script>
<script src="/plugins/adminLTE/js/app.min.js"></script>

<script>
    var vm = new Vue({
        el: '#app',
        data: {
            dataList:[],
            searchEntity:{
                operateUser:'',
                operateMethod:'',
                returnClass:'',
                costTime:''
            },

            page: 1,  //显示的是哪一页
            pageSize: 10, //每一页显示的数据条数
            total: 0, //记录总数
            maxPage:0  //最大页数
        },
        methods: {
            pageHandler: function (page) {
                this.page = page;
                this.search();
            },

            search: function () {
                var _this = this;
                //发送ajax请求, 查询数据
                axios.post('/operationLog/findByPage.do?pageNum='+_this.page+"&rows="+_this.pageSize,_this.searchEntity).then(function(response){
                    _this.total = response.data.total;
                    _this.dataList = response.data.dataList;
                })
            },

            showLoading: function () {
                $('#loadingModal').modal({backdrop: 'static', keyboard: false});
            },

            hideLoading: function () {
                $('#loadingModal').modal('hide');
            },
        },

        created:function(){
            this.pageHandler(1);
        }
    });

</script>
</body>

</html>--%>
