/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/GenericResource.java to edit this template
 */
package it.refill;

import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import static it.refill.Utility.HOSTDD;
import static it.refill.Utility.HOSTNEET;
import static it.refill.Utility.TIMESTAMPSQL;
import static it.refill.Utility.estraiEccezione;
import static it.refill.Utility.insertTR;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;
import javax.ws.rs.FormParam;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;
import org.codehaus.jackson.map.ObjectMapper;
import org.joda.time.format.DateTimeFormat;

/**
 * REST Web Service
 *
 * @author Administrator
 */
@Path("export")
public class Export {

    /**
     * Creates a new instance of Export
     */
    public Export() {
        Logger.getLogger("Export").info("");
    }

    @GET
    @Path("/testservices")
    @Produces("application/json")
    public Response testservices() {
        ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
        LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
        mapesito.put("result", "The service is active.");
        esito.add(mapesito);
        return Response.status(200).entity(new Gson().toJson(esito)).build();
    }

    @POST
    @Path("/list_pf")
    @Produces("application/json")
    public Response list_pf(@FormParam("username") String username, @FormParam("password") String password) {
        if (username == null) {
            username = "";
        }
        if (password == null) {
            password = "";
        }
        if (checkcredentials(username, password)) {
            List<Pfstart> out = new ArrayList<>();
            //NEET
            try {
                Database db1 = new Database(HOSTNEET);
                List<Pfstart> neet = db1.list_pfstart(true);
                db1.closeDB();
                out.addAll(neet);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            //D&D
            try {
                Database db1 = new Database(HOSTDD);
                List<Pfstart> ded = db1.list_pfstart(false);
                db1.closeDB();
                out.addAll(ded);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            return Response.status(200).entity(new Gson().toJson(out)).build();
        } else {
            ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
            LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
            mapesito.put("result", "false");
            mapesito.put("error", "unauthorized");
            mapesito.put("error_description", "Credentials invalid");
            esito.add(mapesito);
            return Response.status(401).entity(new Gson().toJson(esito)).build();
        }
    }

    @POST
    @Path("/list_pf_all")
    @Produces("application/json")
    public Response list_pf_all(@FormParam("username") String username, @FormParam("password") String password) {
        if (username == null) {
            username = "";
        }
        if (password == null) {
            password = "";
        }
        if (checkcredentials(username, password)) {
            List<Pfstart> out = new ArrayList<>();
            //NEET
            try {
                Database db1 = new Database(HOSTNEET);
                List<Pfstart> neet = db1.list_pf(true);
                db1.closeDB();
                out.addAll(neet);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            //D&D
            try {
                Database db1 = new Database(HOSTDD);
                List<Pfstart> ded = db1.list_pf(false);
                db1.closeDB();
                out.addAll(ded);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            return Response.status(200).entity(new Gson().toJson(out)).build();
        } else {
            ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
            LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
            mapesito.put("result", "false");
            mapesito.put("error", "unauthorized");
            mapesito.put("error_description", "Credentials invalid");
            esito.add(mapesito);
            return Response.status(401).entity(new Gson().toJson(esito)).build();
        }
    }

    @POST
    @Path("/list_allievi")
    @Produces("application/json")
    public Response list_allievi(@FormParam("username") String username, @FormParam("password") String password) {
        if (checkcredentials(username, password)) {
            List<Discenti> out = new ArrayList<>();
            //NEET
            try {
                Database db1 = new Database(HOSTNEET);
                List<Discenti> neet = db1.list_discenti(true);
                db1.closeDB();
                out.addAll(neet);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            //D&D
            try {
                Database db1 = new Database(HOSTDD);
                List<Discenti> ded = db1.list_discenti(false);
                db1.closeDB();
                out.addAll(ded);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            return Response.status(200).entity(new Gson().toJson(out)).build();
        } else {
            ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
            LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
            mapesito.put("result", "false");
            mapesito.put("error", "unauthorized");
            mapesito.put("error_description", "Credentials invalid");
            esito.add(mapesito);
            return Response.status(401).entity(new Gson().toJson(esito)).build();
        }
    }

    @POST
    @Path("/list_sa")
    @Produces("application/json")
    public Response list_sa(@FormParam("username") String username, @FormParam("password") String password) {
        if (checkcredentials(username, password)) {
            List<SA> out = new ArrayList<>();
            //NEET
            try {
                Database db1 = new Database(HOSTNEET);
                List<SA> neet = db1.list_sa(true);
                db1.closeDB();
                out.addAll(neet);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            //D&D
            try {
                Database db1 = new Database(HOSTDD);
                List<SA> ded = db1.list_sa(false);
                db1.closeDB();
                out.addAll(ded);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            return Response.status(200).entity(new Gson().toJson(out)).build();
        } else {
            ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
            LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
            mapesito.put("result", "false");
            mapesito.put("error", "unauthorized");
            mapesito.put("error_description", "Credentials invalid");
            esito.add(mapesito);
            return Response.status(401).entity(new Gson().toJson(esito)).build();
        }
    }

    @POST
    @Path("/list_docenti")
    @Produces("application/json")
    public Response list_docenti(@FormParam("username") String username, @FormParam("password") String password) {
        if (checkcredentials(username, password)) {
            List<Docenti> out = new ArrayList<>();
            //NEET
            try {
                Database db1 = new Database(HOSTNEET);
                List<Docenti> neet = db1.list_docenti(true);
                db1.closeDB();
                out.addAll(neet);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            //D&D
            try {
                Database db1 = new Database(HOSTDD);
                List<Docenti> ded = db1.list_docenti(false);
                db1.closeDB();
                out.addAll(ded);
            } catch (Exception e) {
                insertTR("E", "SERVICE", estraiEccezione(e));
            }
            return Response.status(200).entity(new Gson().toJson(out)).build();
        } else {
            ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
            LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
            mapesito.put("result", "false");
            mapesito.put("error", "unauthorized");
            mapesito.put("error_description", "Credentials invalid");
            esito.add(mapesito);
            return Response.status(401).entity(new Gson().toJson(esito)).build();
        }
    }

    @POST
    @Path("/risposte_questionari")
    @Produces("application/json")
    public Response risposte_questionari(@FormParam("username") String username, @FormParam("password") String password, @FormParam("jsoninput") String jsoninput) {
        if (checkcredentials(username, password)) {
            try {
                JsonObject convertedObject = new Gson().fromJson(jsoninput, JsonObject.class);

                Long idallievo = convertedObject.get("id").getAsBigDecimal().toBigInteger().longValue();
                String tipo = convertedObject.get("tipo").getAsString().trim();
                String ip = convertedObject.get("ip").getAsString().trim();
                String mac = convertedObject.get("mac").getAsString().trim();
                String risposte = convertedObject.get("risposte").getAsString().trim();
                Date data = DateTimeFormat.forPattern(TIMESTAMPSQL).parseDateTime(convertedObject.get("data").getAsString()).toDateTime().toDate();

                ObjectMapper objectMapper = new ObjectMapper();
                objectMapper.writerWithDefaultPrettyPrinter();
                AtomicInteger error = new AtomicInteger(0);
                try {
                    List<Survey_answer> payload = objectMapper.readValue(jsoninput, objectMapper.getTypeFactory()
                            .constructCollectionType(List.class, Survey_answer.class));

                    payload.forEach(risposta -> {
                        String host = risposta.getTipo().startsWith("N") ? HOSTNEET : HOSTDD;
                        Database db = new Database(host);
                        db.inserisci_risposta(risposta);
                        db.closeDB();
                    });

                } catch (Exception ex1) {
                    insertTR("E", "SERVICE", estraiEccezione(ex1));
                }

                Survey_answer risposta = new Survey_answer(idallievo, tipo, risposte, ip, mac, data);
                String host = tipo.startsWith("N") ? HOSTNEET : HOSTDD;

                Database db = new Database(host);
                String out = db.inserisci_risposta(risposta);
                db.closeDB();

                if (out.equals("1")) {
                    ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
                    LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
                    mapesito.put("result", "true");
                    mapesito.put("error", "");
                    mapesito.put("error_description", "");
                    esito.add(mapesito);
                    return Response.status(200).entity(new Gson().toJson(esito)).build();
                } else {
                    ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
                    LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
                    mapesito.put("result", "false");
                    mapesito.put("error", "DB ERROR");
                    if (out.equals("0")) {
                        mapesito.put("error_description", "QUESTIONARIO GIA' COMPILATO IN PRECEDENZA");
                    } else {
                        mapesito.put("error_description", out);
                    }
                    esito.add(mapesito);
                    return Response.status(500).entity(new Gson().toJson(esito)).build();
                }
            } catch (Exception e) {
                ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
                LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
                mapesito.put("result", "false");
                mapesito.put("error", "JSON ERROR");
                mapesito.put("error_description", e.getMessage());
                esito.add(mapesito);
                return Response.status(500).entity(new Gson().toJson(esito)).build();
            }
        } else {
            ArrayList<LinkedHashMap<String, String>> esito = new ArrayList<>();
            LinkedHashMap<String, String> mapesito = Maps.newLinkedHashMap();
            mapesito.put("result", "false");
            mapesito.put("error", "unauthorized");
            mapesito.put("error_description", "Credentials invalid");
            esito.add(mapesito);
            return Response.status(401).entity(new Gson().toJson(esito)).build();
        }
    }

    private static boolean checkcredentials(String username, String password) {
        String[] sito = {"enm2021", "4965b65150f3bdf002a3922bb7e9f9a5"};//"Enm221!!";
        String[] cerv = {"cer2021", "4965b65150f3bdf002a3922bb7e9f9a5"};//"Enm221!!";
        try {
            if (sito[0].equals(username.trim()) && sito[1].equals(password.trim())) {
                return true;
            } else if (cerv[0].equals(username.trim()) && cerv[1].equals(password.trim())) {
                return true;
            }
        } catch (Exception ex10) {
        }
        return false;
    }

}
