/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.refill;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class Docenti {

    int iddocenti;
    String nome, cognome, codicefiscale, datanascita, fascia, datawebinair,piattaforma,email;

    List<Integer> idpr = new ArrayList<>();

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Integer> getIdpr() {
        return idpr;
    }

    public void setIdpr(List<Integer> idpr) {
        this.idpr = idpr;
    }
    
    public int getIddocenti() {
        return iddocenti;
    }

    public void setIddocenti(int iddocenti) {
        this.iddocenti = iddocenti;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getCodicefiscale() {
        return codicefiscale;
    }

    public void setCodicefiscale(String codicefiscale) {
        this.codicefiscale = codicefiscale;
    }

    public String getDatanascita() {
        return datanascita;
    }

    public void setDatanascita(String datanascita) {
        this.datanascita = datanascita;
    }

    public String getFascia() {
        return fascia;
    }

    public void setFascia(String fascia) {
        this.fascia = fascia;
    }

    public String getDatawebinair() {
        return datawebinair;
    }

    public void setDatawebinair(String datawebinair) {
        this.datawebinair = datawebinair;
    }

    public String getPiattaforma() {
        return piattaforma;
    }

    public void setPiattaforma(String piattaforma) {
        this.piattaforma = piattaforma;
    }

    

    
    
}
