<%@ page language="java" pageEncoding="UTF-8" session="false"%>

<%@page import="it.refill.entity.Faq"%>
<%@page import="java.util.List"%>
<%@page import="it.refill.action.ActionB"%>
<%@page import="it.refill.action.Label"%>
<%@page import="it.refill.action.Constant"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

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
        <link href="assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="assets/pages/css/login-2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/pages/css/faq.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class="login" style="background-image: url(assets/pages/img/bg-3.jpg);">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <img src="assets/seta/img/l3-cu.png" alt="" height="54px"/>
            <img src="assets/seta/img/spao.jpg" alt="" height="54px"/>
            <img src="assets/seta/img/l1-an.png" alt="" height="54px"/>
            <img src="assets/seta/img/se.png" alt="" height="54px"/>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content_r">
            <hr>
            <div class="text-center">
                <span class="bold text-center text-primary center-block h3">YES I STARTUP 2021/2022 <br>FAQ</span>
                    <%if (Constant.test) {%>
                <br>
                <span class="bold text-center text-primary center-block"><img src="assets/seta/img/beta.png" alt="" height="100"/></span>
                    <%}%>
            </div>
            <div>
                <hr>
            </div>
            <%
                List<Faq> al = ActionB.elencoFAQ("2");
            %>

            <div class="faq-page faq-content-1">
                <div class="faq-content-container" id="faq-list">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="search-bar bordered">
                                <strong>CERCA FAQ</strong>
                                <div class="input-group" id="filter-form"><input type="text" class="form-control noEnterSubmit" placeholder="..."  id="filter" /></div>
                                <small><span id="filter-help-block" class="help-block"></span></small>
                            </div>
                        </div>
                    </div>
                    <%if (al.size() > 0) {%>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="faq-section bordered">
                                <div class="panel-group accordion faq-content" id="accordion1">
                                    <%for (int x = 0; x < al.size(); x++) {
                                            Faq f1 = al.get(x);
                                            String domandavis = f1.getDomanda_mod();
                                            if (domandavis == null || domandavis.trim().equals("")) {
                                                domandavis = f1.getDomanda();
                                            }
                                    %>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">

                                                <i class="fa fa-circle"></i>

                                                <a class="accordion-toggle collapsed" data-toggle="collapse" 
                                                   data-parent="#accordion1" 
                                                   href="#collapse_<%=x%>" aria-expanded="false">
                                                    <span class="uppercase"><%=domandavis%></span>
                                                    <small>(<%=f1.getDate_ask()%>)</small>
                                                </a>
                                            </h4>
                                        </div>
                                        <br>
                                        <div id="collapse_<%=x%>" class="panel-collapse collapse"
                                             aria-expanded="false" style="height: 0px;">
                                            <div class="panel-body uppercase">
                                                <%=f1.getRisposta()%>
                                            </div>
                                        </div>
                                            
                                    </div>
                                    <div>
                                        <hr>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <%} else {%>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="alert alert-warning bold">
                                NON &#200; PRESENTE ALCUNA FAQ.
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="form-actions">
                <a href="home.jsp" class="btn blue btn-block uppercase"><i class="fa fa-home"></i> Homepage</a>
            </div>

            <hr>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
        </div>

        <div class="logo"> 
            <img src="assets/seta/img/logo_blue_1.png" alt="" height="75"/>
            <img src="assets/seta/img/l4-yis.png" alt="" height="75"/>
        </div>
        <!-- END LOGIN -->
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        <script type="text/javascript">

            $(document).ready(function () {

                (function ($) {
                    var $form = $('#filter-form');
                    var $helpBlock = $("#filter-help-block");
                    $('#filter').keyup(function () {
                        var filter = $(this).val();
                        $form.removeClass("has-success has-error");
                        if (filter === "") {
                            $helpBlock.text("");
                            $('.faq-content .panel').show();
                        } else {
                            $('.collapse.in').removeClass('in');
                            $('.faq-content .panel').hide();
                            var regex = new RegExp(filter, 'i');
                            var filterResult = $('.faq-content .panel').filter(function () {
                                return regex.test($(this).text());
                            });
                            if (filterResult) {
                                if (filterResult.length !== 0) {
                                    $form.addClass("has-success");
                                    if (filterResult.length > 1) {
                                        $helpBlock.text(filterResult.length + " FAQ TROVATE.");
                                    } else {
                                        $helpBlock.text(filterResult.length + " FAQ TROVATA.");
                                    }
                                    filterResult.show();
                                } else {
                                    $form.addClass("has-error").removeClass("has-success");
                                    $helpBlock.text("NESSUNA FAQ CORRISPONDENTE.");
                                }
                            } else {
                                $form.addClass("has-error").removeClass("has-success");
                                $helpBlock.text("NESSUNA FAQ CORRISPONDENTE.");
                            }
                        }
                    });
                }($));
            });
            $('.noEnterSubmit').keypress(function (e) {
                if (e.which === 13)
                    e.preventDefault();
            });

        </script>
    </body>

</html>