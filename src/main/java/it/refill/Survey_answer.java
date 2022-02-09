/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.refill;

import java.util.Date;

/**
 *
 * @author Administrator
 */
public class Survey_answer {

    Long idallievo;
    String tipo, risposte, ip, mac;
    Date date;

    public Survey_answer() {
    }

    public Survey_answer(Long idallievo, String tipo, String risposte, String ip, String mac, Date date) {
        this.idallievo = idallievo;
        this.tipo = tipo;
        this.risposte = risposte;
        this.ip = ip;
        this.mac = mac;
        this.date = date;
    }
    
    public Long getIdallievo() {
        return idallievo;
    }

    public void setIdallievo(Long idallievo) {
        this.idallievo = idallievo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getRisposte() {
        return risposte;
    }

    public void setRisposte(String risposte) {
        this.risposte = risposte;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
    
}
