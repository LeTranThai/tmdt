<%@ page import="java.util.List" %>
<%@ page import="qht.shopmypham.com.vn.model.Product" %>
<%@ page import="qht.shopmypham.com.vn.model.Account" %>
<%@ page import="qht.shopmypham.com.vn.model.Review" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="qht.shopmypham.com.vn.model.CheckOut" %>
<%@ page import="qht.shopmypham.com.vn.service.CheckOutService" %>
<%@ page import="qht.shopmypham.com.vn.tools.Format" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html class="no-js " lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">
    <title>QST || Admin</title>
    <link rel="icon" href="admin-template/assets/images/icon_admin.jpg" type="image/x-icon">
    <link rel="stylesheet" href="admin-template/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin-template/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.min.css"/>
    <link rel="stylesheet" href="admin-template/assets/plugins/charts-c3/plugin.css"/>
    <link rel="stylesheet" href="admin-template/assets/plugins/morrisjs/morris.min.css"/>
    <link rel="stylesheet" href="admin-template/assets/css/style.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="theme-blush">

<jsp:include page="header.jsp"></jsp:include>

<!-- Main Content -->

<section class="content">
    <div class="">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Dashboard</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin-home"><i class="zmdi zmdi-home"></i> Admin</a></li>
                        <li class="breadcrumb-item active">Tổng quan</li>
                    </ul>
                    <button class="btn btn-primary btn-icon mobile_menu" type="button"><i
                            class="zmdi zmdi-sort-amount-desc"></i></button>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12">
                    <button class="btn btn-primary btn-icon float-right right_icon_toggle_btn" type="button"><i
                            class="zmdi zmdi-arrow-right"></i></button>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card widget_2 big_icon traffic">
                        <% List<Account> accountList = (List<Account>) request.getAttribute("accountList");%>
                        <div class="body">
                            <h6>Tài khoản</h6>
                            <h2><%=accountList.size()%> <small class="info">tài khoản</small></h2>
                            <small>Cao hơn 2% so với tháng trước</small>
                            <div class="progress">
                                <div class="progress-bar l-amber" role="progressbar" aria-valuenow="45"
                                     aria-valuemin="0" aria-valuemax="100" style="width: 45%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card widget_2 big_icon sales">
                        <div class="body">
                            <% List<Product> productList = (List<Product>) request.getAttribute("productList");%>
                            <h6>Sản phẩm</h6>
                            <h2><%=productList.size()%> <small class="info">sản phẩm</small></h2>
                            <small>Cao hơn 20% so với tháng trước</small>
                            <div class="progress">
                                <div class="progress-bar l-blue" role="progressbar" aria-valuenow="38" aria-valuemin="0"
                                     aria-valuemax="100" style="width: 38%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card widget_2 big_icon email">
                        <div class="body">
                            <%
                                List<CheckOut> checkOutList = (List<CheckOut>) request.getAttribute("checkOutList");
                            %>
                            <h6>Đơn hàng</h6>
                            <h2><%=checkOutList.size()%><small class="info"> đơn</small></h2>
                            <small>Tổng đơn hàng</small>
                            <div class="progress">
                                <div class="progress-bar l-purple" role="progressbar" aria-valuenow="39"
                                     aria-valuemin="0" aria-valuemax="100" style="width: 39%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    NumberFormat nf = NumberFormat.getInstance();
                    nf.setMinimumFractionDigits(0);
                %>

                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="card widget_2 big_icon domains">
                        <div class="body">
                            <% List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");%>
                            <h6>Đánh giá</h6>
                            <h2><%=reviewList.size()%> <small class="info">đánh giá</small></h2>
                            <small>Tổng số lượt đánh giá</small>
                            <div class="progress">
                                <div class="progress-bar l-green" role="progressbar" aria-valuenow="89"
                                     aria-valuemin="0" aria-valuemax="100" style="width: 89%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="header">
                            <h2><strong><i class="zmdi zmdi-chart"></i> Báo cáo</strong> bán hàng</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
                                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                                        aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                    <ul class="dropdown-menu dropdown-menu-right slideUp">
                                        <li><a href="javascript:void(0);">Sửa</a></li>
                                        <li><a href="javascript:void(0);">Xáo</a></li>
                                        <li><a href="javascript:void(0);">Báo cáo</a></li>
                                    </ul>
                                </li>
                                <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="body mb-2">
                            <div class="row clearfix">
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="state_w1 mb-1 mt-1">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <h5><%=nf.format(Product.revenue())%>đ </h5>
                                                <span><i class="zmdi zmdi-balance"></i> Doanh thu</span>
                                            </div>
                                            <div class="sparkline" data-type="bar" data-width="97%" data-height="55px"
                                                 data-bar-Width="3" data-bar-Spacing="5" data-bar-Color="#868e96">
                                                5,2,3,7,6,4,8,1
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="state_w1 mb-1 mt-1">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <h5>365</h5>
                                                <span><i class="zmdi zmdi-turning-sign"></i> Trở lại</span>
                                            </div>
                                            <div class="sparkline" data-type="bar" data-width="97%" data-height="55px"
                                                 data-bar-Width="3" data-bar-Spacing="5" data-bar-Color="#2bcbba">
                                                8,2,6,5,1,4,4,3
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="state_w1 mb-1 mt-1">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <h5>65</h5>
                                                <span><i class="zmdi zmdi-alert-circle-o"></i> TRuy vấn</span>
                                            </div>
                                            <div class="sparkline" data-type="bar" data-width="97%" data-height="55px"
                                                 data-bar-Width="3" data-bar-Spacing="5" data-bar-Color="#82c885">
                                                4,4,3,9,2,1,5,7
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="state_w1 mb-1 mt-1">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <h5><%=Format.formatPrice(CheckOutService.getAllCheckOut().size())%>
                                                </h5>
                                                <span><i class="zmdi zmdi-print"></i> Hóa đơn</span>
                                            </div>
                                            <div class="sparkline" data-type="bar" data-width="97%" data-height="55px"
                                                 data-bar-Width="3" data-bar-Spacing="5" data-bar-Color="#45aaf2">
                                                7,5,3,8,4,6,2,9
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 col-lg-8">
                    <div class="card">
                        <div class="header">
                            <h2><strong>THỐNG KÊ DOANH THU</strong> THEO THờI GIAN TÙY CHỌN</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
                                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                                        aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                    <ul class="dropdown-menu dropdown-menu-right slideUp">
                                        <li><a href="javascript:void(0);">Hành động</a></li>
                                        <li><a href="javascript:void(0);">Hành động khác</a></li>
                                        <li><a href="javascript:void(0);">Khác</a></li>
                                    </ul>
                                </li>
                                <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="body" style="min-height: 600px; display: flex; flex-direction: column; justify-content: space-between;">
                            <canvas id="revenueChart" width="400" height="200"></canvas>
                            <form id="dateForm" style="padding: 20px 0;
                                                        display: flex;
                                                        justify-content: center;
                                                        align-items: center;
                                                        gap: 20px">
                                <label style="margin: 0">
                                    Ngày bắt đầu: <input type="date" id="startDate" name="startDate">
                                </label>
                                <label style="margin: 0">
                                    Ngày kết thúc: <input type="date" id="endDate" name="endDate">
                                </label>
                                <button class="btn btn-info" type="button" onclick="fetchData()">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="header">
                            <h2><strong>THỐNG KÊ DOANH THU THEO</strong> DOANH MỤC</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
                                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                                        aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                    <ul class="dropdown-menu dropdown-menu-right slideUp">
                                        <li><a href="javascript:void(0);">Sửa</a></li>
                                        <li><a href="javascript:void(0);">Xóa</a></li>
                                        <li><a href="javascript:void(0);">Báo cáo</a></li>
                                    </ul>
                                </li>
                                <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="body text-center" style="min-height: 600px; display: flex; flex-direction: column; justify-content: space-between;">
                            <canvas id="categoryRevenueChart" width="400" height="200"></canvas>
                            <form id="categoryForm" style="padding: 20px 0;
                                                        display: flex;
                                                        justify-content: center;
                                                        align-items: center;
                                                        gap: 20px">
                                <label style="margin: 0">
                                    Tháng: <input type="month" id="month" name="month">
                                </label>
                                <button class="btn btn-info" type="button" onclick="fetchCategoryData()">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="header">
                            <h2><strong>Nguồn</strong> giao thông</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
                                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                                        aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                    <ul class="dropdown-menu dropdown-menu-right slideUp">
                                        <li><a href="javascript:void(0);">Sửa</a></li>
                                        <li><a href="javascript:void(0);">Xóa</a></li>
                                        <li><a href="javascript:void(0);">Báo cáo</a></li>
                                    </ul>
                                </li>
                                <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row">
                                <div class="col-lg-8 col-md-6 col-sm-12">
                                    <div id="chart-area-step" class="c3_chart d_traffic"></div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <span> Hơn 30% phần trăm người dùng đến từ các liên kết trực tiếp. Kiểm tra trang chi tiết để biết thêm thông tin.</span>
                                    <div class="progress mt-4">
                                        <div class="progress-bar l-amber" role="progressbar" aria-valuenow="45"
                                             aria-valuemin="0" aria-valuemax="100" style="width: 45%;"></div>
                                    </div>
                                    <div class="d-flex bd-highlight mt-4">
                                        <div class="flex-fill bd-highlight">
                                            <h5 class="mb-0">21,521 <i class="zmdi zmdi-long-arrow-up"></i></h5>
                                            <small>Hôm nay</small>
                                        </div>
                                        <div class="flex-fill bd-highlight">
                                            <h5 class="mb-0">%12.35 <i class="zmdi zmdi-long-arrow-down"></i></h5>
                                            <small>Tháng trước %</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Jquery Core Js -->
<script src="admin-template/assets/bundles/libscripts.bundle.js"></script>
<!-- Lib Scripts Plugin Js ( jquery.v3.2.1, Bootstrap4 js) -->
<script src="admin-template/assets/bundles/vendorscripts.bundle.js"></script>
<!-- slimscroll, waves Scripts Plugin Js -->

<script src="admin-template/assets/bundles/jvectormap.bundle.js"></script> <!-- JVectorMap Plugin Js -->
<script src="admin-template/assets/bundles/sparkline.bundle.js"></script> <!-- Sparkline Plugin Js -->
<script src="admin-template/assets/bundles/c3.bundle.js"></script>

<script src="admin-template/assets/bundles/mainscripts.bundle.js"></script>
<script src="admin-template/assets/js/pages/index.js"></script>

<script>
    var revenueChart; // Biến toàn cục lưu trữ biểu đồ doanh thu
    var categoryRevenueChart; // Biến toàn cục lưu trữ biểu đồ doanh thu theo danh mục

    function initializeCharts() {
        var ctxRevenue = document.getElementById('revenueChart').getContext('2d');
        revenueChart = new Chart(ctxRevenue, {
            type: 'bar',
            data: {
                labels: [],
                datasets: [{
                    label: 'Doanh thu',
                    data: [],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        var ctxCategory = document.getElementById('categoryRevenueChart').getContext('2d');
        categoryRevenueChart = new Chart(ctxCategory, {
            type: 'pie',
            data: {
                labels: [],
                datasets: [{
                    label: 'Doanh thu theo danh mục',
                    data: [],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                return context.label + ': ' + context.raw + ' VND';
                            }
                        }
                    }
                }
            }
        });
    }

    function fetchData() {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;

        $.ajax({
            url: 'RevenueServlet',
            type: 'POST',
            data: {
                startDate: startDate,
                endDate: endDate
            },
            success: function (data) {
                var labels = [];
                var revenues = [];
                data.forEach(function (record) {
                    labels.push(record.date);
                    revenues.push(record.totalRevenue);
                });

                // Cập nhật dữ liệu biểu đồ
                revenueChart.data.labels = labels;
                revenueChart.data.datasets[0].data = revenues;
                revenueChart.update();
            }
        });
    }

    function fetchCategoryData() {
        var monthInput = document.getElementById('month').value;
        var month = monthInput.split("-")[1];
        var year = monthInput.split("-")[0];

        $.ajax({
            url: 'CategoryRevenueServlet',
            type: 'POST',
            data: {
                month: month,
                year: year
            },
            success: function (data) {
                var categoryLabels = [];
                var categoryRevenues = [];
                data.forEach(function (record) {
                    categoryLabels.push(record.categoryName);
                    categoryRevenues.push(record.totalRevenue);
                });

                // Cập nhật dữ liệu biểu đồ
                categoryRevenueChart.data.labels = categoryLabels;
                categoryRevenueChart.data.datasets[0].data = categoryRevenues;
                categoryRevenueChart.update();
            }
        });
    }

    // Khởi tạo biểu đồ khi trang được tải
    document.addEventListener('DOMContentLoaded', function () {
        initializeCharts();
    });
</script>
</body>


</html>