/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.refill;

import java.util.List;

/**
 *
 * @author Administrator
 */
public class SA {
   
    String cellulare,mail,pivacf,societa,Provincia,Comune,target;
    
    List<SedeFormazione> aule;

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public List<SedeFormazione> getAule() {
        return aule;
    }

    public void setAule(List<SedeFormazione> aule) {
        this.aule = aule;
    }
    
    
    public String getCellulare() {
        return cellulare;
    }

    public void setCellulare(String cellulare) {
        this.cellulare = cellulare;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPivacf() {
        return pivacf;
    }

    public void setPivacf(String pivacf) {
        this.pivacf = pivacf;
    }

    public String getSocieta() {
        return societa;
    }

    public void setSocieta(String societa) {
        this.societa = societa;
    }

    public String getProvincia() {
        return Provincia;
    }

    public void setProvincia(String Provincia) {
        this.Provincia = Provincia;
    }

    public String getComune() {
        return Comune;
    }

    public void setComune(String Comune) {
        this.Comune = Comune;
    }
    
    
    
}
