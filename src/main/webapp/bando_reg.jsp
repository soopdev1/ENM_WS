<%@page import="java.util.List"%>
<%@page import="it.refill.util.Utility"%>
<%@page import="it.refill.entity.Items"%>
<%@page import="it.refill.entity.Comuni_rc"%>
<%@page import="it.refill.entity.Prov_rc"%>
<%@page import="it.refill.action.Constant"%>
<%@page import="it.refill.action.ActionB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.refill.entity.Registrazione"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
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

        <script src="https://www.google.com/recaptcha/api.js?render=<%=ActionB.getPath("recaptchapublic")%>"></script>
        <script id="registration" src="assets/seta/js/Registration.js"
        data-context="<%=request.getContextPath()%>" data-gKey="<%=ActionB.getPath("recaptchapublic")%>" type="text/javascript"></script>
        <script src="assets/seta/js/jscontrolli.js"></script>
        <script src="assets/seta/js/validate.min.js"></script>


        <!-- BEGIN CORE PLUGINS -->
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
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->

        <script src="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>

        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <link href="assets/global/plugins/select2/css/select2.min.css" rel="stylesheet"/>
        <script src="assets/global/plugins/select2/js/select2.min.js"></script>
        <script src="assets/global/plugins/select2/js/i18n/it.js"></script>
        <script src="assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/components-bootstrap-select.min.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
        <script src="assets/seta/js/form-input-mask.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
        <script src="assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>

        <script type="text/javascript">
            <%
                String bando = request.getParameter("bando");
                if (bando == null || bando.equalsIgnoreCase("null")) {
                    bando = Constant.bando;
                }
                ArrayList<Registrazione> lijs = ActionB.listaCampiReg(bando, null);
            %>

            function fieldOnlyNumber(fieldid) {
                var stringToReplace = document.getElementById(fieldid).value;
                stringToReplace = stringToReplace.replace(/\D/g, '');
                document.getElementById(fieldid).value = stringToReplace;
            }

            function controllaReg() {

                var output = "0";
                var msg = "";

                var accreditato = document.getElementById('accreditato').value.trim();


            <%if (lijs.size() > 0) {
                    for (int js = 0; js < lijs.size(); js++) {
                        Registrazione rg = lijs.get(js);
            %>
                var idfield = "<%=rg.getCampo()%>";
                var obfield = "<%=rg.getObbligatorio()%>";
                var classfield = "<%=rg.getTestomodello()%>";
                var desc = "<%=rg.getEtichetta()%>";
                var typefield = "<%=rg.getTipocampo()%>";
                var maxlengthfield = parseInt("<%=rg.getLunghezza()%>");
                var valfield = document.getElementById(idfield).value.trim();

                if ((idfield === 'accreditato') || (accreditato === 'SI' && classfield === 'registrazionenuova') || (accreditato === 'NO' && classfield === 'registrazionenormale')) {
                    if (obfield === "SI") {
                        if (valfield === "" || valfield === "...") {
                            msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; obbligatorio.<br>";
                            output = "1";
                        }
                    }
                    if (typefield === "0002") { //numerico
                        if (valfield.length > 0) {
                            if (!isNumeric(valfield)) {
                                msg += "Il campo <span style='color:red;'>" + desc + "</span> accetta solo valori numerici.<br>";
                                output = "2"; //CAMPO NUMERICO ERRATO
                            }
                        }
                    }
                    if (typefield === "0002") { //numerico
                        if (idfield === 'cell') {
                            if (valfield.length < 7 || !valfield.startsWith("3")) {
                                msg += "Il campo <span style='color:red;'>" + desc + "</span> deve contenere un numero di cellulare.<br>";
                                output = "2"; //CAMPO NUMERICO ERRATO                        
                            }
                        }
                    }
                    if (typefield === "0003") { //CODICE FISCALE
                        if (valfield.length > 0) {
                            valfield = valfield.toUpperCase();
                            if (!checkCF(valfield)) {
                                msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; errato in quanto non conforme ad un Codice Fiscale.<br>";
                                output = "3"; //CAMPO CF ERRATO
                            } else {
                                var surname = document.getElementById("cognome").value.trim().toUpperCase();
                                var name = document.getElementById("nome").value.trim().toUpperCase();
                                var checksurname = getStringSurname(surname);
                                var checkname = getStringName(name);
                                if (checksurname !== 'XXX') {
                                    if (valfield.substring(0, 3) !== checksurname) {
                                        msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; errato in quanto non conforme al COGNOME inserito.<br>";
                                        output = "3"; //CAMPO CF ERRATO
                                    }
                                }
                                if (checkname !== 'XXX') {
                                    if (valfield.substring(3, 6) !== checkname) {
                                        msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; errato in quanto non conforme al NOME inserito.<br>";
                                        output = "3"; //CAMPO CF ERRATO                                   
                                    }
                                }



                            }
                        }
                    }
                    if (typefield === "0004") { //MAIL
                        if (valfield.length > 0) {
                            var v1 = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+.([a-zA-Z])+([a-zA-Z])+/;
                            var valid = v1.test(valfield);
                            if (!valid) {
                                msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; errato in quanto non conforme ad un indirizzo Email/PEC.<br>";
                                output = "4"; //CAMPO MAIL ERRATO
                            }
                        }
                    }
                    if (typefield === "0006") { //DATA
                        if (valfield.length > 0) {
                            if (!checkDate(valfield)) {
                                msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; errato in quanto non conforme ad una Data.<br>";
                                output = "5"; //CAMPO DATA ERRATO
                            }
                        }
                    }
                    if (typefield === "0008" || typefield === "0015") { //PARTITA IVA -  //CF - PARTITA IVA
                        if (valfield.length > 0) {
                            if (!checkIva(valfield) && !checkCF(valfield)) {
                                msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; errato in quanto non conforme ad una Partita IVA.<br>";
                                output = "5"; //CAMPO DATA ERRATO
                            } else {
                                var ok1 = 0;
                                $.ajax({
                                    async: false,
                                    url: "Query?tipo=verificaok&value=" + valfield,
                                    dataType: "text",
                                    success: function (msg) {
                                        if (msg === "KO") {
                                            ok1--;
                                        }
                                    },
                                    error: function () {
                                        ok1--;
                                    }
                                });
                                if (ok1 < 0) {
                                    document.getElementById("valoretxt").innerHTML = "Il campo <span style='color:red;'>" + desc + "</span> corrisponde a quello di un SA gi&#224; accreditato per questo bando.<br> <b><u>Impossibile continuare la registrazione</u></b>.<br>";
                                    document.getElementById("static").className = document.getElementById("static").className + " in";
                                    document.getElementById("static").style.display = "block";
                                    document.getElementById("btnmodal1").focus();
                                    return false;
                                }
                            }
                        }
                    }
                    if (maxlengthfield > 0) {
                        if (valfield.length > maxlengthfield) {
                            msg += "Il campo <span style='color:red;'>" + desc + "</span> &#232; errato in quanto supera la lungezza massima consentita (" + maxlengthfield + " Caratteri).<br>";
                            output = "6"; //CAMPO TROPPO LUNGO
                        }
                    }
                }
            <%}
                }%>





                var privacy1 = document.getElementById("privacy1").checked;
                if (!privacy1) {
                    msg += "Il campo <span style='color:red;'>PRIVACY</span> &#232; obbligatorio.<br>";
                    output = "1";
                }

                grecaptcha.execute(g_key).then(function (token) {
                    $('#g-recaptcha-response').val(token);
                });

                if (output !== "0") {
                    document.getElementById("valoretxt").innerHTML = msg;
                    document.getElementById("static").className = document.getElementById("static").className + " in";
                    document.getElementById("static").style.display = "block";
                    document.getElementById("btnmodal1").focus();
                    return false;
                }

                if (accreditato === 'SI') {
                    var verificato = 0;
                    $.ajax({
                        async: false,
                        url: "Query?tipo=verificaneet",
                        type: 'post',
                        data: $("#formregist").serializeArray(),
                        dataType: "json",
                        success: function (resp) {
                            if (resp.result) {
                                verificato++;
                            } else {
                                verificato = 0;
                                msg = resp.message;
                            }
                        },
                        error: function () {
                            verificato = 0;
                        }
                    });

                    if (verificato > 0) {
                        window.location.href = 'home.jsp?esito=okr1';
                    } else {
                        document.getElementById("valoretxt").innerHTML = msg;
                        document.getElementById("static").className = document.getElementById("static").className + " in";
                        document.getElementById("static").style.display = "block";
                        document.getElementById("btnmodal1").focus();
                        return false;
                    }
                    return false;
                } else {
                    document.getElementById("confirm").className = document.getElementById("confirm").className + " in";
                    document.getElementById("confirm").style.display = "block";
                    return false;
                }
                return false;
            }

            function ldpage() {
                $('.registrazionenormale').toggle(false);
                $('.registrazionenuova').toggle(false);
                $('.registrazioneunica').toggle(false);
            }
            function submitfor() {
                document.forms["formregist"].submit();
            }
        </script>
    </head>
    <!-- END HEAD -->
    <body class="page-full-width page-header-fixed page-content-white" onload="return ldpage();">
        <!-- BEGIN HEADER -->
        <div class="modal fade" id="static" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title font-red uppercase"><b>Errore</b></h4>
                    </div>
                    <div class="modal-body" id="valoretxt"></div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-outline red" id="btnmodal1" onclick="return dismiss('static');">Chiudi</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <div id="confirm" class="modal fade" tabindex="-1" data-backdrop="confirm" data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Conferma Registrazione</h4>
                    </div>
                    <div class="modal-body">
                        <p>
                            <u>L'operazione non potr&#224; pi&#249; essere annullata e non sar&#224; possibile modificare i dati inseriti in tale fase.</u>
                            <br>
                            Sei sicuro di voler procedere con la registrazione? 
                        </p>
                    </div>
                    <div class="modal-footer" id="groupbtn2">
                        <button type="button" class="btn green" onclick="return submitfor();">SI</button>
                        <button type="button" data-dismiss="modal" class="btn red" onclick="return dismiss('confirm');">NO</button>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="menu/menu1.jsp" %>

        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN MENU -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content" style="background-image: url(assets/pages/img/bg-3.jpg);">
                    <!-- BEGIN PAGE HEADER-->
                    <!-- BEGIN THEME PANEL -->
                    <!--    VUOTO RAF  -->
                    <!-- END THEME PANEL -->
                    <!-- BEGIN PAGE BAR -->
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <div class="container min-hight"  style="background-image: url(assets/pages/img/bg-3.jpg);">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3"><h3 class="page-title">Accreditamento</h3> </div>
                                <div class="col-md-9"><center>
                                        <table>
                                            <tr>
                                                <td><img src="assets/seta/img/l3-cu.png" alt="" height="54px"/></td>
                                                <td><img src="assets/seta/img/spao.jpg" alt="" height="54px"/></td>
                                                <td><img src="assets/seta/img/l1-an.png" alt="" height="54px"/></td>
                                            </tr>
                                            <tr>
                                                <td><img src="assets/seta/img/logo_blue_1.png" alt="" height="54px"/></td>
                                                <td><img src="assets/seta/img/se.png" alt="" height="54px"/></td>
                                                <td><img src="assets/seta/img/l4-yis.png" alt="" height="54px"/></td>
                                            </tr>
                                        </table>
                                    </center> 
                                </div>
                            </div> 
                            <div class="col-md-12">
                                <hr>
                            </div>
                        </div>


                        <!-- END PAGE TITLE -->
                        <!-- END PAGE HEADER -->
                        <!-- SELECT BUY/SELL -->
                        <%
                            //String bando = request.getParameter("bando");
                            //String descbando = ActionB.getDescrizioneBando(bando);
                            String descbandoB = ActionB.getHTMLBando(bando);
                            boolean attivo = ActionB.verificaBando(bando);
                            String es = request.getParameter("esito");
                            if (es != null) {
                                String msg = "";
                                String cl = "";
                                if (es.equals("0")) {
                                    cl = "alert-success";
                                    msg = "successo.";
                                } else if (es.equals("KO1") || es.equals("KO2") || es.equals("KO7") || es.equals("KO9")) {
                                    cl = "alert-danger";
                                    msg = "Si &#232; verificato un errore durante l'inserimento dei dati, riprovare.";
                                } else if (es.equals("KO3") || es.equals("KO6")) {
                                    cl = "alert-danger";
                                    msg = "Si &#232; verificato un errore durante l'invio del codice OTP. Contattare il supporto tecnico.";
                                } else if (es.equals("KO4") || es.equals("KO5") || es.equals("KO8")) {
                                    cl = "alert-danger";
                                    msg = "Si &#232; verificato un errore durante l'invio della mail. Controllare l'indirizzo inserito o contattare il supporto tecnico.";
                                } else if (es.equals("KO10")) {
                                    cl = "alert-danger";
                                    msg = "I dati inseriti non corrispondono a quelli di un soggetto attuatore accreditato. Controllare i dati.";
                                }
                        %>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="alert <%=cl%>" style="text-align: center;">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                                    <strong><%=msg%></strong>
                                </div>
                            </div>
                        </div>
                        <%}%>

                        <div class="row lead">
                            <div class="col-md-12 text-center">
                                <%=descbandoB%>
                            </div>
                        </div>
                        <%if (Constant.demo) {%>
                        <div class="row">
                            <div class="row lead text-center">
                                <img src="assets/seta/img/Presto-Online-768x614.png" alt=""/> 
                            </div>
                        </div>
                        <%} else {%>
                        <div class="row">
                            <div class="row lead text-center uppercase">
                                <%if (attivo) { %>
                                <div class="col-md-12">
                                    <em><i class="fa fa-check-circle font-green"></i></em>
                                    <span class="bold">L'accreditamento a questo bando è attivo</span>
                                </div>
                                <%} else {%>
                                <div class="col-md-12">
                                    <em><i class="fa fa-exclamation-circle font-red"></i></em>
                                    <span class="bold">L'accreditamento a questo bando non è disponibile.</span>
                                </div>
                                <%}%>
                            </div>
                            <!-- END LEFT SIDEBAR -->
                            <!-- BEGIN RIGHT SIDEBAR -->            
                            <!-- END RIGHT SIDEBAR -->            
                        </div>
                        <%if (attivo) {%>
                        <%
                            if (lijs.size() > 0) {
                        %>
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="bold text-center">DATI REGISTRAZIONE </h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="alert alert-info uppercase text-justify">
                                    Con la registrazione in piattaforma si avvia la domanda di partecipazione all'Avviso. Inserire correttamente i dati del firmatario della domanda di partecipazione e i dati del soggetto che presenta la candidatura. Completata la registrazione non sarà possibile modificare i dati ma solo fare una nuova registrazione.
                                </div>
                            </div>
                            <%
                                String link = ActionB.getPath("linkmanuale");
                                if (link != null) {%>
                            <div class="col-md-6">
                                <iframe height="150" src="https://www.youtube.com/embed/8x-em_a9dGQ" frameborder="0" 
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>

                                </iframe>
                            </div>
                            <%}%>
                            <div class="col-md-12">
                                <hr>
                            </div>
                        </div>
                        <form id="formregist" name="formregist" role="form" enctype="multipart/form-data" 
                              action="<%="Operazioni?action=reg"%>" method="post" onsubmit="return controllaReg();">
                            <input type="hidden" name="g-recaptcha-response" id="g-recaptcha-response">
                            <input type="hidden" name="bandorif" value="<%=bando%>"/>
                            <div class="row">
                                <div class="col-md-12">
                                    <%

                                        ArrayList<String> yesno = ActionB.SiNo();
                                        int colonne = 0;
                                        for (int i = 0; i < lijs.size(); i++) {
                                            Registrazione re = lijs.get(i);
                                            boolean obbl = re.getObbligatorio().equals("SI");
                                            if (re.getOrdinamento() == 0) {%>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-body">
                                                    <div class="form-group">
                                                        <label for="<%=re.getCampo()%>"><%=re.getEtichetta()%> 
                                                            <%if (obbl) {%>
                                                            <span class="font-red popovers" data-trigger="hover" 
                                                                  data-container="body" data-placement="bottom"
                                                                  data-content="CAMPO OBBLIGATORIO"> &#42;</span>
                                                            <%}%>
                                                        </label>
                                                        <%if (re.getEtichetta().contains("ACCREDITATO PER YISU")) {%>
                                                        <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom" data-html="true"
                                                           data-content="L'OPZIONE <u>'SI'</u> CONSENTE DI ABBREVIARE IL PROCESSO DI ACCREDITAMENTO, RENDENDO <b>OBBLIGATORIO</b> IL CARICAMENTO DI UNA MANIFESTAZIONE DI INTERESSE." 
                                                           data-original-title="ACCREDITATO PER YISU 2021 NEET?"></i>
                                                        <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="...">
                                                            <option value="">...</option>
                                                            <%for (int p = 0; p < yesno.size(); p++) {%>
                                                            <option value="<%=yesno.get(p)%>"><%=yesno.get(p)%></option>
                                                            <%}%>
                                                        </select>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                theme: "classic",
                                                                language: 'it'
                                                            }).on('select2:select', function (e) {
                                                                var data = e.params.data;
                                                                if (data.id === "SI") {
                                                                    $('.registrazionenormale').toggle(false);
                                                                    $('.registrazionenuova').toggle(true);
                                                                    $('.registrazioneunica').toggle(true);
                                                                } else {
                                                                    $('.registrazionenormale').toggle(true);
                                                                    $('.registrazionenuova').toggle(false);
                                                                    $('.registrazioneunica').toggle(true);
                                                                }
                                                            });
                                                        </script>
                                                        <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <hr>
                                    </div>
                                    <%} else {%>
                                    <div class="col-md-6 <%=re.getTestomodello()%>">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-body">
                                                    <div class="form-group">
                                                        <%if (re.getTipocampo().equals("0018")) {%>
                                                        <div id="s1l"> 
                                                            <label for="<%=re.getCampo()%>"><%=re.getEtichetta()%>
                                                                <%if (obbl) {%>
                                                                <span class="font-red popovers" data-trigger="hover" 
                                                                      data-container="body" data-placement="bottom"
                                                                      data-content="CAMPO OBBLIGATORIO"> &#42;</span>
                                                                <%}%>
                                                            </label>
                                                        </div>
                                                        <%} else {%>
                                                        <label for="<%=re.getCampo()%>"><%=re.getEtichetta()%> 
                                                            <%if (obbl) {%><span class="font-red popovers" data-trigger="hover" 
                                                                  data-container="body" data-placement="bottom"
                                                                  data-content="CAMPO OBBLIGATORIO"> &#42;</span><%}%>
                                                        </label>
                                                        <%}%>   
                                                        <%if (re.getTestomodello().equals("registrazionenuova")) {%>
                                                            <%if (re.getEtichetta().startsWith("PARTITA IVA")) {%>
                                                            <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                               data-content="Inserire il dato indicato nello stesso campo dell'Allegato A per il bando NEET." 
                                                               data-original-title="PARTITA IVA"></i>
                                                            <%}%>
                                                            <%if (re.getEtichetta().startsWith("CODICE FISCALE")) {%>
                                                            <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                               data-content="Inserire il dato indicato nello stesso campo del titolare della domanda dell'Allegato A per il bando NEET." 
                                                               data-original-title="CODICE FISCALE"></i>
                                                            <%}%>
                                                            <%if (re.getEtichetta().startsWith("PROTOCOLLO DOMANDA")) {%>
                                                            <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                               data-content="Visibile su esito pubblicato o all'interno della piattaforma YISU NEET." 
                                                               data-original-title="PROTOCOLLO DOMANDA"></i>
                                                            <%}%>
                                                            <%if (re.getEtichetta().startsWith("NUMERO DECRETO")) {%>
                                                            <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                               data-content="Inserire il numero della Determina con cui il SA è stato ammesso per YISU NEET (cfr. anche esito pubblicato o mail di accettazione)." 
                                                               data-original-title="NUMERO DECRETO"></i>
                                                            <%}%>
                                                            <%if (re.getEtichetta().startsWith("DATA DECRETO")) {%>
                                                            <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                               data-content="Inserire la data della Determina con cui il SA è stato ammesso per YISU NEET (cfr. anche esito pubblicato o mail di accettazione)." 
                                                               data-original-title="DATA DECRETO"></i>
                                                            <%}%>
                                                        <%}%>
                                                        <%if (re.getEtichetta().equalsIgnoreCase("CODICE ATECO (PRINCIPALE)")) {%>
                                                        <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                           data-content="Obbligatorio per tutti tranne per ente/istituzione pubblica" 
                                                           data-original-title="CODICE ATECO (PRINCIPALE)"></i>
                                                        <%}%>
                                                        <%if (re.getEtichetta().toUpperCase().startsWith("NUMERO DI CELLULARE")) {%>
                                                        <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                           data-content="Verrà inviato un codice OTP da inserire al primo accesso" 
                                                           data-original-title="Numero Cellulare"></i>
                                                        <%}%>
                                                        <%if (re.getEtichetta().equalsIgnoreCase("Indirizzo Email")) {%>
                                                        <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                           data-content="Verranno inviate le credenziali di accesso" 
                                                           data-original-title="Indirizzo Email"></i>
                                                        <%}%>
                                                        <%if (re.getEtichetta().equalsIgnoreCase("Numero documento riconoscimento")) {%>
                                                        <i class="fa fa-info-circle popovers" data-trigger="hover" data-container="body" data-placement="bottom"
                                                           data-content="Deve essere indicato il numero del documento di riconoscimento che verrà poi caricato 
                                                           in seguito in fase di invio della domanda" 
                                                           data-original-title="Numero documento riconoscimento."></i>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0001") || re.getTipocampo().equals("0003") || re.getTipocampo().equals("0015") || re.getTipocampo().equals("0008")) {%>
                                                        <input class="form-control" id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" placeholder="...." type="text"  onchange="return fieldNoEuro(this.id);"/>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0002")) {%>
                                                        <input class="form-control" id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" placeholder="...." type="text"  onchange="return fieldOnlyNumber(this.id);"/>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0004")) {%>

                                                        <div class="input-icon right">
                                                            <i id="check_<%=re.getCampo()%>" class="fa"></i>
                                                            <input type="text" 
                                                                   class="form-control" 
                                                                   name="<%=re.getCampo()%>" 
                                                                   placeholder="..." 
                                                                   id="<%=re.getCampo()%>"
                                                                   onchange="return fieldNoEuroMail(this.id);" />
                                                        </div>
                                                        <script type="text/javascript">
                                                            var v1 = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+.([a-zA-Z])+([a-zA-Z])+/;
                                                            $('#' + '<%=re.getCampo()%>').on('keyup', function () {
                                                                if (this.value.length > 0) {
                                                                    var valid = v1.test(this.value) && this.value.length;
                                                                    if (!valid) {
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("fa-check");
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("font-green-jungle");
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').addClass("fa-times");
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').addClass("font-red");
                                                                    } else {
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').addClass("fa-check");
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').addClass("font-green-jungle");
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("fa-times");
                                                                        $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("font-red");
                                                                    }
                                                                } else {
                                                                    $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("fa-check");
                                                                    $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("fa-times");
                                                                    $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("font-green-jungle");
                                                                    $('#' + 'check_' + '<%=re.getCampo()%>').removeClass("font-red");
                                                                }
                                                            });
                                                        </script>         
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0005")) {
                                                                ArrayList<Prov_rc> pr = ActionB.query_province_rc();%>
                                                        <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="...">
                                                            <option value="">...</option>
                                                            <%for (int p = 0; p < pr.size(); p++) {%>
                                                            <option value="<%=pr.get(p).getCodiceprovincia()%>"><%=pr.get(p).getProvincia()%></option>
                                                            <%}%>
                                                        </select>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                theme: "classic",
                                                                language: 'it'
                                                            });
                                                        </script>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0006")) {%>

                                                        <%
                                                            if (re.getCampo().equals("datasc1")) {%>
                                                        <input class="form-control form-control-inline date-picker_r1" size="16" type="text" id="<%=re.getCampo()%>" name="<%=re.getCampo()%>"/>
                                                        <script type="text/javascript">
                                                            $("#datasc1").change(function () {
                                                                var varDate = $("#datasc1").datepicker('getDate');
                                                                if (varDate !== null) {
                                                                    var today = new Date();
                                                                    today.setHours(0, 0, 0, 0);
                                                                    if (varDate < today) {
                                                                        document.getElementById("valoretxt").innerHTML = "La 'Data di Scadenza' deve essere maggiore o uguale alla data odierna!";
                                                                        document.getElementById("static").className = document.getElementById("static").className + " in";
                                                                        document.getElementById("static").style.display = "block";
                                                                        $("#datasc1").datepicker('setDate', null);
                                                                        document.getElementById("btnmodal1").focus();
                                                                        return false;
                                                                    }
                                                                }
                                                            });

                                                        </script>
                                                        <%} else {%>
                                                        <input class="form-control form-control-inline date-picker_r" size="16" type="text" id="<%=re.getCampo()%>" name="<%=re.getCampo()%>"/>
                                                        <%}
                                                            }
                                                        %>
                                                        <%if (re.getTipocampo().equals("0013")) {%>
                                                        <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="...">
                                                            <option value="">...</option>
                                                            <% ArrayList<Items> tipodoc = ActionB.tipoDoc();
                                                                for (int p = 0; p < tipodoc.size(); p++) {%>
                                                            <option value="<%=tipodoc.get(p).getCod()%>"><%=tipodoc.get(p).getDescrizione()%></option>
                                                            <%}%>
                                                        </select>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                theme: "classic",
                                                                language: 'it'
                                                            });
                                                        </script>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0009")) {%>
                                                        <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="...">
                                                            <option value="">...</option>
                                                            <% ArrayList<String[]> statieur = ActionB.statieur();
                                                                for (int p = 0; p < statieur.size(); p++) {%>
                                                            <option value="<%=statieur.get(p)[0]%>"><%=statieur.get(p)[1]%></option>
                                                            <%}%>
                                                        </select>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                theme: "classic",
                                                                language: 'it'
                                                            });
                                                        </script>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0020")) {%>
                                                        <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="..." >
                                                            <%for (int p = 0; p < yesno.size(); p++) {%>
                                                            <option value="<%=yesno.get(p)%>"><%=yesno.get(p)%></option>
                                                            <%}%>
                                                        </select>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                theme: "classic",
                                                                language: 'it'
                                                            });
                                                        </script>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0021")) {%>
                                                        <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="...">
                                                        </select>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                minimumInputLength: 3,
                                                                placeholder: "Seleziona Codice ATECO",
                                                                theme: "classic",
                                                                language: 'it',
                                                                ajax: {
                                                                    url: "Query?tipo=ateco",
                                                                    dataType: 'json',
                                                                    delay: 250,
                                                                    data: function (params) {
                                                                        return {
                                                                            q: params.term, // search term
                                                                            page: params.page
                                                                        };
                                                                    },
                                                                    processResults: function (data, params) {
                                                                        params.page = params.page || 1;
                                                                        return {
                                                                            results: data.items,
                                                                            pagination: {
                                                                                more: (params.page * 30) < data.total_count
                                                                            }
                                                                        };
                                                                    },
                                                                    cache: true
                                                                },
                                                                escapeMarkup: function (markup) {
                                                                    return markup; // let our custom formatter work
                                                                },
                                                                templateResult: function (repo) {
                                                                    if (repo.loading)
                                                                        return repo.text;
                                                                    return repo.full_name;
                                                                },
                                                                templateSelection: function (repo) {
                                                                    return repo.full_name || repo.text;
                                                                }
                                                            });
                                                        </script>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0022")) {
                                                                ArrayList<Prov_rc> reg = ActionB.query_regione_rc();%>
                                                        <div>
                                                            <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="...">
                                                                <option value="">...</option>
                                                                <%for (int p = 0; p < reg.size(); p++) {%>
                                                                <option value="<%=reg.get(p).getCodiceprovincia()%>"><%=reg.get(p).getProvincia()%></option>
                                                                <%}%>
                                                            </select>
                                                        </div>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                theme: "classic",
                                                                language: 'it'
                                                            });
                                                        </script>
                                                        <%}%>
                                                        <%if (re.getTipocampo().equals("0023")) {%>
                                                        <select id="<%=re.getCampo()%>" name="<%=re.getCampo()%>" class="form-control select2" data-placeholder="..."></select>
                                                        <script type="text/javascript">
                                                            $('#' + '<%=re.getCampo()%>').select2({
                                                                allowClear: true,
                                                                minimumInputLength: 3,
                                                                placeholder: "Seleziona Comune",
                                                                language: 'it',
                                                                width: 'resolve',
                                                                theme: "classic",
                                                                ajax: {
                                                                    url: "Query?tipo=comune",
                                                                    dataType: 'json',
                                                                    delay: 250,
                                                                    data: function (params) {
                                                                        return {
                                                                            q: params.term, // search term
                                                                            page: params.page
                                                                        };
                                                                    },
                                                                    processResults: function (data, params) {
                                                                        params.page = params.page || 1;
                                                                        return {
                                                                            results: data.items,
                                                                            pagination: {
                                                                                more: (params.page * 30) < data.total_count
                                                                            }
                                                                        };
                                                                    },
                                                                    cache: true
                                                                },
                                                                escapeMarkup: function (markup) {
                                                                    return markup; // let our custom formatter work
                                                                },
                                                                templateResult: function (repo) {
                                                                    if (repo.loading)
                                                                        return repo.text;
                                                                    return repo.full_name;
                                                                },
                                                                templateSelection: function (repo) {
                                                                    return repo.full_name || repo.text;
                                                                }
                                                            });

                                                            $('#' + '<%=re.getCampo()%>').on('select2:select', function (e) {
                                                                var data = e.params.data;
                                                                var regdest = '';
                                                                var provdest = '';
                                                                if ('<%=re.getCampo()%>' === 'sedecomune') {
                                                                    regdest = 'sederegione';
                                                                    provdest = 'sedeprov';
                                                                } else if ('<%=re.getCampo()%>' === 'comunecciaa') {
                                                                    provdest = 'proccciaa';
                                                                    regdest = 'regccciaa';
                                                                }

                                                                if (regdest !== '') {
                                                                    $('#' + regdest).val(data.reg).trigger('change');
                                                                }
                                                                if (provdest !== '') {
                                                                    $('#' + provdest).val(data.prov).trigger('change');
                                                                }
                                                            });
                                                            $('#' + '<%=re.getCampo()%>').on("select2:unselecting", function (e) {
                                                                var regdest = '';
                                                                var provdest = '';
                                                                if ('<%=re.getCampo()%>' === 'sedecomune') {
                                                                    regdest = 'sederegione';
                                                                    provdest = 'sedeprov';
                                                                } else if ('<%=re.getCampo()%>' === 'comunecciaa') {
                                                                    provdest = 'proccciaa';
                                                                    regdest = 'regccciaa';
                                                                }
                                                                if (regdest !== '') {
                                                                    $('#' + regdest).val($('#' + regdest + ' option:first-child').val()).trigger('change');
                                                                }
                                                                if (provdest !== '') {
                                                                    $('#' + provdest).val($('#' + provdest + ' option:first-child').val()).trigger('change');
                                                                }
                                                            });
                                                        </script>
                                                        <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        colonne++;
                                        if (colonne % 2 == 0) {%>
                                </div>
                                <div class="col-md-12">
                                    <%}
                                            }
                                        }%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-body">
                                        <div class="form-group text-justify uppercase">
                                            <label>Privacy <span class="font-red popovers" data-trigger="hover" 
                                                                 data-container="body" data-placement="bottom"
                                                                 data-content="CAMPO OBBLIGATORIO"> &#42;</span></label>
                                            <div class="md-checkbox">
                                                <input type="checkbox" name="privacy1" id="privacy1" class="md-checkbox" /> 
                                                <label for="privacy1">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <%=Utility.cp_toUTF(ActionB.getPath("desc.privacy"))%>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <center><button type="submit" class="btn btn-lg red btn-block"><i class="fa fa-save"></i> CONFERMA DATI</button></center>
                                </div>                            
                            </div> 
                        </form>
                        <!-- END BEGIN BLOG -->
                        <%}%>
                        <%}%>
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
        </div>
        <!-- END FOOTER -->
        <!--[if lt IE 9]>
    <script src="../assets/global/plugins/respond.min.js"></script>
    <script src="../assets/global/plugins/excanvas.min.js"></script> 
    <![endif]-->

        <!-- END THEME LAYOUT SCRIPTS -->



    </body>
</html>