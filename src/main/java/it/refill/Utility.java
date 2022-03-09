/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.refill;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author Administrator
 */
public class Utility {

    public static final DecimalFormat DOUBLEFORMAT = new DecimalFormat("#.##");
    public static final String PATTERNH = "HH:mm:ss";
    public static final String PATTERNHMIN = "HH:mm";
    public static final String PATTERNID = "yyyyMMdd";
    public static final String PATTERNSQL = "yyyy-MM-dd";
    public static final String PATTERNITA = "dd/MM/yyyy";
    public static final String TIMESTAMP = "yyyyMMddHHmmssSSS";
    public static final String TIMESTAMPFAD = "yyyy-MM-dd HH:mm:ss.SSSSSS";
    public static final String TIMESTAMPSQLZONE = "yyyy-MM-dd HH:mm:ss Z";
    public static final String TIMESTAMPSQL = "yyyy-MM-dd HH:mm:ss";
    public static final String TIMESTAMPITA = "dd/MM/yyyy HH:mm:ss";
    public static final String TIMESTAMPITACOMPLETE = "dd/MM/yyyy HH:mm:ss.SSS";
    public static final DateTimeFormatter DTF = DateTimeFormat.forPattern(PATTERNSQL);
    public static final DateTimeFormatter DTFAD = DateTimeFormat.forPattern(TIMESTAMPFAD);
    public static final DateTimeFormatter DTFH = DateTimeFormat.forPattern(PATTERNHMIN);
    public static final DateTimeFormatter DTFSQL = DateTimeFormat.forPattern(TIMESTAMPSQL);
    public static final String HOSTNEET = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_gestione_neet_prod";
    public static final String HOSTDD = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_gestione_dd_prod";
    public static final String HOSTNEETACCR = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_neet_prod";
    public static final String HOSTDDACCR = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_dd_prod";
}
