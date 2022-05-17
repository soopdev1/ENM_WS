/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.refill;

/**
 *
 * @author Administrator
 */
public class Pfstart {

    int idcorso, PostiDisponibili;
    String datacorso, TipoCorso, Provincia, Comune, SoggettoAttuatoreNome, TelSA, MailSA;
    String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String statusing) {
        if (statusing == null) {
            this.status = "ERRORE";
        } else {
            switch (statusing.toUpperCase().trim()) {
                case "DV":
                case "P":
                case "C":
                    this.status = "IN PARTENZA";
                    break;
                case "ATA":
                case "ATB":
                case "SOA":
                case "SOB":
                case "DVA":
                    this.status = "IN CORSO";
                    break;
                case "F":
                case "DVB":
                case "MA":
                case "IV":
                case "CK":
                case "EVI":
                case "CO":
                    this.status = "CONCLUSO";
                    break;
                default:
                    this.status = "ERRORE";
                    break;
            }
        }
    }

    public int getIdcorso() {
        return idcorso;
    }

    public void setIdcorso(int idcorso) {
        this.idcorso = idcorso;
    }

    public String getDatacorso() {
        return datacorso;
    }

    public void setDatacorso(String datacorso) {
        this.datacorso = datacorso;
    }

    public String getTipoCorso() {
        return TipoCorso;
    }

    public void setTipoCorso(String TipoCorso) {
        this.TipoCorso = TipoCorso;
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

    public String getSoggettoAttuatoreNome() {
        return SoggettoAttuatoreNome;
    }

    public void setSoggettoAttuatoreNome(String SoggettoAttuatoreNome) {
        this.SoggettoAttuatoreNome = SoggettoAttuatoreNome;
    }

    public int getPostiDisponibili() {
        return PostiDisponibili;
    }

    public void setPostiDisponibili(int PostiDisponibili) {
        this.PostiDisponibili = PostiDisponibili;
    }

    public String getTelSA() {
        return TelSA;
    }

    public void setTelSA(String TelSA) {
        this.TelSA = TelSA;
    }

    public String getMailSA() {
        return MailSA;
    }

    public void setMailSA(String MailSA) {
        this.MailSA = MailSA;
    }

}
