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
    public static DecimalFormat doubleformat = new DecimalFormat("#.##");
    public static final String patternH = "HH:mm:ss";
    public static final String patternHmin = "HH:mm";
    public static final String patternid = "yyyyMMdd";
    public static final String patternSql = "yyyy-MM-dd";
    public static final String patternITA = "dd/MM/yyyy";
    public static final String timestamp = "yyyyMMddHHmmssSSS";
    public static final String timestampFAD = "yyyy-MM-dd HH:mm:ss.SSSSSS";
    public static final String timestampSQLZONE = "yyyy-MM-dd HH:mm:ss Z";
    public static final String timestampSQL = "yyyy-MM-dd HH:mm:ss";
    public static final String timestampITA = "dd/MM/yyyy HH:mm:ss";
    public static final String timestampITAcomplete = "dd/MM/yyyy HH:mm:ss.SSS";
    public static final SimpleDateFormat sd0 = new SimpleDateFormat(timestampSQL);
    public static final DateTimeFormatter dtf = DateTimeFormat.forPattern(patternSql);
    public static final DateTimeFormatter dtfad = DateTimeFormat.forPattern(timestampFAD);
    public static final DateTimeFormatter dtfh = DateTimeFormat.forPattern(patternHmin);
    public static final DateTimeFormatter dtfsql = DateTimeFormat.forPattern(timestampSQL);
    public static final SimpleDateFormat sdfITA = new SimpleDateFormat(patternITA);
    
    
    public static final String host_NEET = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_gestione_neet_prod";
    public static final String host_DD = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_gestione_dd_prod";
    public static final String host_NEET_ACCR = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_neet_prod";
    public static final String host_DD_ACCR = "clustermicrocredito.cluster-c6m6yfqeypv3.eu-south-1.rds.amazonaws.com:3306/enm_dd_prod";
}
