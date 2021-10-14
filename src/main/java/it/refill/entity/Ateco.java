/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.refill.entity;

import static it.refill.util.Utility.cp_toUTF;

/**
 *
 * @author rcosco
 */
public class Ateco {
    String codice,descrizione;

    public Ateco(String codice, String descrizione) {
        this.codice = codice;
        this.descrizione = cp_toUTF(descrizione);
    }
    
    

    public String getCodice() {
        return codice;
    }

    public void setCodice(String codice) {
        this.codice = codice;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    
}
