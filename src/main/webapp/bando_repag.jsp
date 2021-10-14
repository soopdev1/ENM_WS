<%-- 
    Document   : bando_index2
    Created on : 28-lug-2017, 15.43.51
    Author     : rcosco
--%>

<%@page import="it.refill.entity.Items"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="it.refill.entity.Reportistica"%>
<%@page import="it.refill.entity.Domandecomplete"%>
<%@page import="it.refill.entity.Docbandi"%>
<%@page import="it.refill.entity.Docuserbandi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.refill.action.Liste"%>
<%@page import="it.refill.action.Constant"%>
<%@page import="it.refill.action.ActionB"%>
<%@page import="it.refill.util.Utility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("username") == null) {
        Utility.redirect(request, response, "home.jsp");
    } else {
%>
<html>
    <head>
        <meta charset="utf-8" />
        <title><%=Constant.nomevisual%></title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="assets/seta/fontg/fontsgoogle1.css" rel="stylesheet" type="text/css" />

        <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/layouts/layout/css/themes/grey.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> 
        <script src="assets/seta/js/Chart.bundle.js"></script>
    </head>
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-closed">
        <%@ include file="menu/header.jsp"%>
        <!-- BEGIN HEADER -->
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN MENU -->
            <!-- END MENU -->
            <%@ include file="menu/menuR1.jsp"%>
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    <!-- BEGIN THEME PANEL -->
                    <!--    VUOTO RAF  -->
                    <!-- END THEME PANEL -->
                    <!-- BEGIN PAGE BAR -->
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <div class="row">
                        <div class="col-md-9">
                            <h3 class="page-title">Homepage</h3>
                        </div>
                        <div class="col-md-3" style="text-align: right;">
                            <img src="assets/seta/img/logo_blue_1.png" alt="logo" height="70px"/>
                        </div>
                    </div>
                    <%
                        String bandorif = session.getAttribute("bandorif").toString();

                        String[] excelreport = ActionB.excelreport();
                        ArrayList<Reportistica> lr = ActionB.getListReports(bandorif);

                        if (lr.size() > 0) {
                            for (int i = 0; i < lr.size(); i++) {
                                Reportistica re = lr.get(i);
                                String colmd = "";
                                if (re.getTipo().equals("0")) {
                                    colmd = "col-md-3";
                                } else {
                                    colmd = "col-md-6";
                                }
                                String click = "";
                                if (re.getLink() != null) {
                                    click = "onclick = \"return document.getElementById('form" + re.getCodice() + "').submit();\"";
                                }

                    %>
                    <%if (re.getTipo().equals("0")) {
                            if (re.getLink() != null) {%>
                    <form action="<%=re.getLink()%>" method="POST" id="form<%=re.getCodice()%>"></form>
                    <%}%>
                    <div class="<%=colmd%>">
                        <div class="dashboard-stat <%=re.getColor()%>" <%=click%>>
                            <div class="visual">
                                <i class=" <%=re.getIcona()%>"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    <%=re.getValore()%>
                                </div>
                                <div class="desc">                           
                                    <%=re.getDescrizione()%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                            }
                        }
                        if (excelreport != null) {
                            String mime = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                            String dt = Utility.formatStringtoStringDate(excelreport[0], Constant.timestampITA, Constant.timestamp, false);
                            String name = "Report_Excel_" + dt + ".xlsx";
                    %>
                    <a class="col-md-3"
                       href="data:<%=mime%>;base64,<%=excelreport[1]%>" download="<%=name%>">
                        <div class="dashboard-stat green-dark">
                            <div class="visual">
                                <i class="fa fa-file-excel-o"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    Scarica
                                </div>
                                <div class="desc">                           
                                    Agg: <%=excelreport[0]%>
                                </div>
                            </div>
                        </div>
                    </a>
                    <%}%>

                </div>




            </div>
            <!-- END CONTENT -->
            <!-- BEGIN QUICK SIDEBAR -->
            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="page-footer">
            <div class="page-footer-inner"><%=Constant.nomevisual%> v. <%=Constant.version%></div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>

        <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/seta/js/select2.full.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/dashboard.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/components-bootstrap-select.min.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
        <script src="assets/seta/js/form-input-mask.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/components-bootstrap-select.min.js" type="text/javascript"></script>
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
        <script src="assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
    </body>
</html>
<%}%>
