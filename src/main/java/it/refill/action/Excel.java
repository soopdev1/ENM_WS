/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.refill.action;
//
//import it.refill.db.Db_Bando;
//import java.io.File;
//import java.io.FileInputStream;
//import java.sql.PreparedStatement;
//import org.apache.poi.hssf.usermodel.HSSFRow;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 *
 * @author raffaele
 */
public class Excel {


//    public static void insertateco(File excelin) {
//        try {
//            HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(excelin));
//            HSSFSheet sh1 = wb.getSheetAt(0);
//
//            int rows = sh1.getPhysicalNumberOfRows();
//            int maxdescr = 0;
//            for (int r = 0; r < rows; r++) {
//                HSSFRow row = sh1.getRow(r);
//                if (row != null) {
//                    String codice = row.getCell((short) 0).getStringCellValue().toUpperCase();
//                    String descrizione = row.getCell((short) 1).getStringCellValue().toUpperCase();
//                    String[] cod = codice.split("\\.");
//                    if (cod.length == 3 && cod[0].length() > 1 && cod[1].length() > 1 && cod[2].length() > 1) {
//                        if (descrizione.length() > maxdescr) {
//                            maxdescr = descrizione.length();
//                        }
//                        Db_Bando db1 = new Db_Bando();
//                        try (PreparedStatement ps1 = db1.getConnection().prepareStatement("INSERT INTO ateco_cr VALUES (?,?)")) {
//                            ps1.setString(1, codice);
//                            ps1.setString(2, descrizione);
//                            ps1.executeUpdate();
//                        }
//                        db1.closeDB();
//                    }
//                }
//            }
//        } catch (Exception e) {
//        }
//
//    }
//
//    public static void insertcomuni(File excelin) {
//        try {
//
//            HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(excelin));
//            HSSFSheet sh1 = wb.getSheetAt(3);
//
//            int rows = sh1.getPhysicalNumberOfRows();
//            for (int r = 0; r < rows; r++) {
//                HSSFRow row = sh1.getRow(r);
//                if (row != null) {
//
//                    int id = (int) row.getCell((short) 0).getNumericCellValue();
//
//                    String nome = row.getCell((short) 1).getStringCellValue().toUpperCase();
//                    String regione = row.getCell((short) 2).getStringCellValue().toUpperCase();
//                    String provincia = row.getCell((short) 3).getStringCellValue().toUpperCase();
//                    String codiceprovincia = row.getCell((short) 4).getStringCellValue().toUpperCase();
//                    String codicefiscale = row.getCell((short) 5).getStringCellValue().toUpperCase();
//                    String codiceregione = row.getCell((short) 6).getStringCellValue().toUpperCase();
//
//                    Db_Bando db1 = new Db_Bando();
//                    try (PreparedStatement ps1 = db1.getConnection().prepareStatement("INSERT INTO comuni_rc VALUES (?,?,?,?,?,?,?)")) {
//                        ps1.setInt(1, id);
//                        ps1.setString(2, codicefiscale);
//                        ps1.setString(3, nome);
//                        ps1.setString(4, codiceregione);
//                        ps1.setString(5, regione);
//                        ps1.setString(6, codiceprovincia);
//                        ps1.setString(7, provincia);
//                        ps1.executeUpdate();
//                    }
//                    db1.closeDB();
//
//                }
//            }
//
//        } catch (Exception e) {
//        }
//
//    }
//
////    public static void main(String[] args) {
////        insertateco(new File("ateco-2007-struttura.xls"));
////        insertcomuni(new File("Elenco-comuni-italiani.xls"));
////        excel(new File("TemplateGradParz.xls"), new File("TemplateGradParz__1.xls"));
////    }

}
