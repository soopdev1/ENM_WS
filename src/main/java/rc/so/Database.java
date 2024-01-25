/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rc.so;

import static rc.so.Utility.PATTERNITA;
import static rc.so.Utility.TIMESTAMPSQL;
import static rc.so.Utility.conf;
import static rc.so.Utility.estraiEccezione;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import org.joda.time.DateTime;

/**
 *
 * @author Administrator
 */
public class Database {

    private Connection c = null;

    public Database(String host) {

        String driver = "com.mysql.cj.jdbc.Driver";
        String user = conf.getString("db.user");
        String password = conf.getString("db.pass");

        try {
            Class.forName(driver).newInstance();
            Properties p = new Properties();
            p.put("user", user);
            p.put("password", password);
            p.put("characterEncoding", "UTF-8");
            p.put("passwordCharacterEncoding", "UTF-8");
            p.put("useSSL", "false");
            p.put("connectTimeout", "1000");
            p.put("useUnicode", "true");
            this.c = DriverManager.getConnection("jdbc:mysql://" + host, p);
        } catch (Exception ex) {
            if (this.c != null) {
                try {
                    this.c.close();
                } catch (Exception ex1) {
                }
            }
            this.c = null;
        }
    }

    public void closeDB() {
        try {
            if (this.c != null) {
                this.c.close();
            }
        } catch (Exception ex) {
        }
    }

    public Connection getConnection() {
        return c;
    }

    public List<Docenti> list_docenti(){
        SimpleDateFormat sdfITA = new SimpleDateFormat(PATTERNITA);
        List<Docenti> out = new ArrayList<>();
        try {
            String sql0 = "SELECT d.iddocenti,d.cognome,d.nome,d.codicefiscale,d.datanascita,d.fascia,d.datawebinair,d.email "
                    + "FROM docenti d WHERE d.stato='A' ORDER BY d.cognome";
            try (Statement st0 = this.c.createStatement(); ResultSet rs0 = st0.executeQuery(sql0)) {
                while (rs0.next()) {
                    int iddocenti = rs0.getInt(1);
                    String cognome = rs0.getString(2).toUpperCase();
                    String nome = rs0.getString(3).toUpperCase();
                    String codicefiscale = rs0.getString(4).toUpperCase();
                    String datanascita = sdfITA.format(rs0.getDate(5));
                    String fascia = rs0.getString(6).toUpperCase().endsWith("A") ? "A" : "B";
                    String datawebinair = sdfITA.format(rs0.getDate(7));
                    String piatt = "TOSCANA";
                    String email = rs0.getString(8).toLowerCase();
                    List<Integer> idpr = new ArrayList<>();

                    String sql1 = "SELECT idprogetti_formativi FROM progetti_docenti WHERE iddocenti=" + iddocenti;
                    try (Statement st1 = this.c.createStatement(); ResultSet rs1 = st1.executeQuery(sql1)) {
                        while (rs1.next()) {
                            idpr.add(rs1.getInt(1));
                        }
                    }

                    Docenti d1 = new Docenti();
                    d1.setCodicefiscale(codicefiscale);
                    d1.setCognome(cognome);
                    d1.setDatanascita(datanascita);
                    d1.setDatawebinair(datawebinair);
                    d1.setFascia(fascia);
                    d1.setIddocenti(iddocenti);
                    d1.setNome(nome);
                    d1.setPiattaforma(piatt);
                    d1.setIdpr(idpr);
                    d1.setEmail(email);
                    out.add(d1);
                }
            }
        } catch (Exception e) {
            insertTR("E", "SERVICE", estraiEccezione(e));
        }

        return out;
    }

    public List<Discenti> list_discenti() {
        SimpleDateFormat sdfITA = new SimpleDateFormat(PATTERNITA);
        List<Discenti> out = new ArrayList<>();
        try {
            String sql0 = "SELECT a.idallievi,a.cognome,a.nome,a.codicefiscale,a.sesso,a.email,a.datanascita,a.comune_residenza,a.idprogetti_formativi "
                    + "FROM allievi a WHERE a.idprogetti_formativi IS NOT NULL AND a.id_statopartecipazione IN ('13','14','15','18','19') ORDER BY a.cognome";            
            try (Statement st0 = this.c.createStatement(); ResultSet rs0 = st0.executeQuery(sql0)) {
                while (rs0.next()) {
                    int idpr = rs0.getInt("a.idprogetti_formativi");
                    int idallievi = rs0.getInt(1);
                    String cognome = rs0.getString(2).toUpperCase();
                    String nome = rs0.getString(3).toUpperCase();
                    String codicefiscale = rs0.getString(4).toUpperCase();
                    String sesso = rs0.getString(5).toUpperCase();
                    String email = rs0.getString(6).toLowerCase();
                    String datanascita = sdfITA.format(rs0.getDate(7));
                    String target = "TOSCANA";
                    String sql2 = "SELECT nome_provincia,nome FROM comuni WHERE idcomune = " + rs0.getInt(8);
                    try (Statement st2 = this.c.createStatement(); ResultSet rs2 = st2.executeQuery(sql2)) {
                        if (rs2.next()) {
                            String place_Provincia = rs2.getString(1).toUpperCase();
                            String place_Comune = rs2.getString(2).toUpperCase();

                            Discenti d1 = new Discenti();
                            d1.setCodicefiscale(codicefiscale);
                            d1.setCognome(cognome);
                            d1.setComune(place_Comune);
                            d1.setDatanascita(datanascita);
                            d1.setEmail(email);
                            d1.setIdallievi(idallievi);
                            d1.setNome(nome);
                            d1.setProvincia(place_Provincia);
                            d1.setSesso(sesso);
                            d1.setTarget(target);
                            d1.setIdpr(idpr);
                            out.add(d1);

                        }
                    }
                }
            }

        } catch (Exception e) {
            insertTR("E", "SERVICE", estraiEccezione(e));
        }

        return out;
    }

    public List<Pfstart> list_pfstart() {
        SimpleDateFormat sdfITA = new SimpleDateFormat(PATTERNITA);
        List<Pfstart> out = new ArrayList<>();
        String TipoCorso = "TOSCANA";
        try {
            String sql0 = "SELECT idprogetti_formativi,start,idsoggetti_attuatori FROM progetti_formativi p WHERE p.stato IN ('DV','P','DC')";
            try (Statement st0 = this.c.createStatement(); ResultSet rs0 = st0.executeQuery(sql0)) {
                while (rs0.next()) {
                    int idcorso = rs0.getInt(1);
                    String datacorso = sdfITA.format(rs0.getDate(2));
                    String sql1 = "SELECT ragionesociale,cell_sa,email,comune FROM soggetti_attuatori WHERE idsoggetti_attuatori = " + rs0.getInt(3);
                    try (Statement st1 = this.c.createStatement(); ResultSet rs1 = st1.executeQuery(sql1)) {
                        if (rs1.next()) {
                            String SoggettoAttuatoreNome = rs1.getString(1).toUpperCase();
                            String TelSA = rs1.getString(2);
                            String MailSA = rs1.getString(3).toLowerCase();
                            String sql2 = "SELECT nome_provincia,nome FROM comuni WHERE idcomune = " + rs1.getInt(4);
                            try (Statement st2 = this.c.createStatement(); ResultSet rs2 = st2.executeQuery(sql2)) {
                                if (rs2.next()) {
                                    String place_Provincia = rs2.getString(1);
                                    String place_Comune = rs2.getString(2);
                                    String sql3 = "SELECT COUNT(*) FROM allievi WHERE idprogetti_formativi = " + idcorso + " AND id_statopartecipazione IN ('13','14','15','18','19')";
                                    try (Statement st3 = this.c.createStatement(); ResultSet rs3 = st3.executeQuery(sql3)) {
                                        if (rs3.next()) {
                                            int PostiDisponibili = 12 - rs3.getInt(1);

                                            Pfstart p1 = new Pfstart();
                                            p1.setComune(place_Comune);
                                            p1.setDatacorso(datacorso);
                                            p1.setIdcorso(idcorso);
                                            p1.setMailSA(MailSA);
                                            p1.setPostiDisponibili(PostiDisponibili);
                                            p1.setProvincia(place_Provincia);
                                            p1.setSoggettoAttuatoreNome(SoggettoAttuatoreNome);
                                            p1.setTelSA(TelSA);
                                            p1.setTipoCorso(TipoCorso);
                                            out.add(p1);

                                        }
                                    }
                                }
                            }
                        }
                    }

                }
            }

        } catch (Exception e) {
            insertTR("E", "SERVICE", estraiEccezione(e));
        }

        return out;
        //
    }

    public List<Pfstart> list_pf() {
        SimpleDateFormat sdfITA = new SimpleDateFormat(PATTERNITA);
        List<Pfstart> out = new ArrayList<>();
        String TipoCorso= "TOSCANA";
        

        try {
            String sql0 = "SELECT idprogetti_formativi,start,idsoggetti_attuatori,stato FROM progetti_formativi p ORDER BY START desc";
            try (Statement st0 = this.c.createStatement(); ResultSet rs0 = st0.executeQuery(sql0)) {
                while (rs0.next()) {
                    int idcorso = rs0.getInt(1);
                    String datacorso = sdfITA.format(rs0.getDate(2));
                    String status = rs0.getString(4);
                    String sql1 = "SELECT ragionesociale,cell_sa,email,comune FROM soggetti_attuatori WHERE idsoggetti_attuatori = " + rs0.getInt(3);
                    try (Statement st1 = this.c.createStatement(); ResultSet rs1 = st1.executeQuery(sql1)) {
                        if (rs1.next()) {
                            String SoggettoAttuatoreNome = rs1.getString(1).toUpperCase();
                            String TelSA = rs1.getString(2);
                            String MailSA = rs1.getString(3).toLowerCase();
                            String sql2 = "SELECT nome_provincia,nome FROM comuni WHERE idcomune = " + rs1.getInt(4);
                            try (Statement st2 = this.c.createStatement(); ResultSet rs2 = st2.executeQuery(sql2)) {
                                if (rs2.next()) {
                                    String place_Provincia = rs2.getString(1);
                                    String place_Comune = rs2.getString(2);
                                    String sql3 = "SELECT COUNT(*) FROM allievi WHERE idprogetti_formativi = " + idcorso + " AND id_statopartecipazione IN ('13','14','15','18','19')";
                                    try (Statement st3 = this.c.createStatement(); ResultSet rs3 = st3.executeQuery(sql3)) {
                                        if (rs3.next()) {
                                            int PostiDisponibili = 0;
                                            if (status.equals("DV") || status.equals("P") || status.equals("C")) {
                                                PostiDisponibili = 12 - rs3.getInt(1);
                                            }
                                            Pfstart p1 = new Pfstart();
                                            p1.setComune(place_Comune);
                                            p1.setDatacorso(datacorso);
                                            p1.setIdcorso(idcorso);
                                            p1.setMailSA(MailSA);
                                            p1.setPostiDisponibili(PostiDisponibili);
                                            p1.setProvincia(place_Provincia);
                                            p1.setSoggettoAttuatoreNome(SoggettoAttuatoreNome);
                                            p1.setTelSA(TelSA);
                                            p1.setTipoCorso(TipoCorso);
                                            p1.setStatus(status);
                                            out.add(p1);

                                        }
                                    }
                                }
                            }
                        }
                    }

                }
            }

        } catch (Exception e) {
            insertTR("E", "SERVICE", estraiEccezione(e));
        }

        return out;
        //
    }

    public List<SA> list_sa() {
        List<SA> out = new ArrayList<>();
        String table = "bando_toscana_mcn";
        String target = "TOSCANA";
            
        try {
            String h_accr = Utility.HOSTACCR;
            Database accr = new Database(h_accr);

            String sql0 = "SELECT a.id,a.username,a.cellulare,a.mail,a.pivacf,a.societa,a.sedecomune,a.sedeindirizzo "
                    + " FROM " + table + " a WHERE a.stato_domanda='A' AND a.dataupconvenzionefinale<>'-'";
            try (Statement st0 = accr.getConnection().createStatement(); ResultSet rs0 = st0.executeQuery(sql0)) {
                while (rs0.next()) {
                    String telefono = rs0.getString(3);
                    String mail = rs0.getString(4).toLowerCase();
                    String pivacf = rs0.getString(5).toUpperCase();
                    String societa = rs0.getString(6).toUpperCase();
                    String place_Indirizzo = rs0.getString(8).toUpperCase();

                    String sql2 = "SELECT nome_provincia,nome FROM comuni WHERE idcomune = " + rs0.getInt(7);
                    try (Statement st2 = this.c.createStatement(); ResultSet rs2 = st2.executeQuery(sql2)) {
                        if (rs2.next()) {
                            String place_Provincia = rs2.getString(1);
                            String place_Comune = rs2.getString(2);

                            List<SedeFormazione> aule = new ArrayList<>();
                            String sql3 = "SELECT numaule,"
                                    + "mailresponsabile1,responsabile1,telresponsabile1,citta1,"
                                    + "mailresponsabile2,responsabile2,telresponsabile2,citta2,"
                                    + "mailresponsabile3,responsabile3,telresponsabile3,citta3,"
                                    + "mailresponsabile4,responsabile4,telresponsabile4,citta4,"
                                    + "mailresponsabile5,responsabile5,telresponsabile5,citta5 "
                                    + "FROM allegato_a a WHERE username='" + rs0.getString(2) + "'";

                            try (Statement st3 = accr.getConnection().createStatement(); ResultSet rs3 = st3.executeQuery(sql3)) {
                                if (rs3.next()) {
                                    int numaule = Integer.parseInt(rs3.getString("numaule"));
                                    for (int i = 1; i <= numaule; i++) {
                                        String denominazione = societa + " - SEDE " + i;
                                        String referente = rs3.getString("responsabile" + i);
                                        String cellulare = rs3.getString("telresponsabile" + i);
                                        String email = rs3.getString("mailresponsabile" + i);
                                        String sql4 = "SELECT nome_provincia,nome FROM comuni WHERE idcomune = " + rs3.getInt("citta" + i);
                                        try (Statement st4 = this.c.createStatement(); ResultSet rs4 = st4.executeQuery(sql4)) {
                                            if (rs4.next()) {
                                                String aula_Provincia = rs4.getString(1);
                                                String aula_Comune = rs4.getString(2);
                                                SedeFormazione s1 = new SedeFormazione();
                                                s1.setCellulare(cellulare);
                                                s1.setComune(aula_Comune);
                                                s1.setDenominazione(denominazione);
                                                s1.setEmail(email);
                                                s1.setProvincia(aula_Provincia);
                                                s1.setReferente(referente);
                                                aule.add(s1);
                                            }
                                        }

                                    }
                                }

                            }

                            SA sa = new SA();

                            sa.setAule(aule);
                            sa.setCellulare(telefono);
                            sa.setComune(place_Comune);
                            sa.setMail(mail);
                            sa.setPivacf(pivacf);
                            sa.setProvincia(place_Provincia);
                            sa.setIndirizzo(place_Indirizzo);
                            sa.setSocieta(societa);
                            sa.setTarget(target);
                            out.add(sa);

                        }
                    }

                }
            }

            accr.closeDB();

        } catch (Exception e) {
            insertTR("E", "SERVICE", estraiEccezione(e));
        }

        return out;
    }

    public String inserisci_risposta(Survey_answer risposta) {
        try {
            String ins = "INSERT INTO survey_answer VALUES (?,?,?,?,?,?)";
            try (PreparedStatement ps = this.c.prepareStatement(ins)) {
                ps.setLong(1, risposta.getIdallievo());
                ps.setString(2, risposta.getTipo());
                ps.setString(3, risposta.getRisposte());
                ps.setString(4, risposta.getIp());
                ps.setString(5, risposta.getMac());
                ps.setDate(6, new java.sql.Date(risposta.getDate().getTime()));
                ps.execute();
            }
            return "1";
        } catch (Exception e) {
            if (e.getMessage().toLowerCase().contains("duplicate")) {
                return "0";
            }
            insertTR("E", "SERVICE", estraiEccezione(e));
            return e.getMessage();
        }
    }

    public void insertTR(String type, String user, String descr) {
        try {
            PreparedStatement ps = this.c.prepareStatement("INSERT INTO tracking (azione,iduser,timestamp) VALUES (?,?,?)");
            ps.setString(1, descr);
            ps.setString(2, user);
            ps.setString(3, getNow());
            ps.execute();
        } catch (SQLException ex) {
        }
    }

    public String getNow() {
        try {
            String sql = "SELECT now()";
            PreparedStatement ps = this.c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception ex) {
        }
        return new DateTime().toString(TIMESTAMPSQL);
    }
}
