/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import it.refill.action.Pdf_new;
import static it.refill.action.Pdf_new.verificaQR;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import static org.apache.commons.io.FileUtils.readFileToByteArray;

/**
 *
 * @author Administrator
 */
public class checkfile {
    public static void main(String[] args) {
//        
//        System.out.println("test.checkfile.main() "+Pdf_new.allegatoA_fase1("PMERIN6427").getPath());
//        System.out.println("test.checkfile.main() "+Pdf_new.allegatoB_fase1("PMERIN6427").getPath());
        
        
        try {
            String esitoqr = verificaQR("DONLA", "PMERIN6427", 
                    readFileToByteArray(new File("C:\\mnt\\mcn\\test\\temp\\PMERIN6427211220211419271.A_pdfA.pdf")));
            System.out.println(esitoqr);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
