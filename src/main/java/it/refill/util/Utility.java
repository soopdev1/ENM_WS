package it.refill.util;

import static com.google.common.base.Splitter.on;
import static it.refill.action.ActionB.trackingAction;
import static it.refill.action.Constant.timestampITA;
import static it.refill.action.Constant.timestampSQL;
import it.refill.db.Db_Bando;
import it.refill.entity.Docbandi;
import it.refill.entity.FileDownload;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import static java.lang.Character.UnicodeBlock.BASIC_LATIN;
import static java.lang.Character.UnicodeBlock.of;
import static java.lang.Character.charCount;
import static java.lang.Character.codePointAt;
import static java.lang.Double.parseDouble;
import static java.lang.Integer.parseInt;
import static java.lang.Integer.toHexString;
import static java.lang.Math.ceil;
import static java.lang.String.format;
import static java.lang.String.valueOf;
import static java.lang.System.out;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.UnknownHostException;
import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.file.Files.createDirectories;
import static java.nio.file.Paths.get;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import static java.util.Locale.ITALY;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.apache.commons.codec.binary.Base64.decodeBase64;
import static org.apache.commons.codec.digest.DigestUtils.md5Hex;
import org.apache.commons.compress.archivers.ArchiveOutputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import static org.apache.commons.fileupload.servlet.ServletFileUpload.isMultipartContent;
import static org.apache.commons.io.FilenameUtils.getExtension;
import static org.apache.commons.io.IOUtils.copy;
import static org.apache.commons.lang3.RandomStringUtils.randomAlphanumeric;
import static org.apache.commons.lang3.StringUtils.replace;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.joda.time.DateTime;
import static org.joda.time.format.DateTimeFormat.forPattern;
import org.joda.time.format.DateTimeFormatter;

public class Utility {

    public static String generaId() {
        String random = randomAlphanumeric(5).trim();
        return new DateTime().toString("yyMMddHHmmssSSS") + random;
    }

    public static String generaId(int ra) {
        String random = randomAlphanumeric(ra - 15).trim();
        return new DateTime().toString("yyMMddHHmmssSSS") + random;
    }

    public static String randomP() {
        try {
            return randomAlphanumeric(6) + "!1";
        } catch (Exception e) {
            final SecureRandom random = new SecureRandom();
            String r = new BigInteger(130, random).toString(32);
            r = r.substring(0, 6);
            r = r + "!1";
            return r;
        }
    }

    public static String formatUTFtoLatin(String sequence) {
        try {
            StringBuilder out = new StringBuilder("");
            for (int i = 0; i < sequence.length(); i++) {
                char ch = sequence.charAt(i);
                if (of(ch) == BASIC_LATIN) {
                    out.append(ch);
                } else {
                    int codepoint = codePointAt(sequence, i);
                    i += charCount(codepoint) - 1;
                    out.append("&#x");
                    out.append(toHexString(codepoint));
                    out.append(";");
                }
            }
            return out.toString();
        } catch (Exception ex) {
        }
        return sequence;
    }

    public static String cp_toUTF(String ing) {
        try {
            String t = new String(ing.getBytes("Windows-1252"), "UTF-8");
            return t.trim();
        } catch (UnsupportedEncodingException ex) {

        }
        return ing;
    }

    public static String convMd5(String psw) {
        try {
            String md5Hex = md5Hex(psw);
            return md5Hex;
//            MessageDigest md = MessageDigest.getInstance("MD5");
//            md.update(psw.getBytes());
//            byte byteData[] = md.digest();
//            StringBuilder sb = new StringBuilder();
//            for (int i = 0; i < byteData.length; i++) {
//                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
//            }
//            return sb.toString().trim();
        } catch (Exception e) {
            trackingAction("ERROR SYSTEM", estraiEccezione(e));
            return "-";
        }
    }

    public static String replaeSpecialCharacter(String pas) {
        String out = pas;
        if (out.contains("€")) {
            out = replace(out, "€", "");
        }
        if (out.contains("ç")) {
            out = replace(out, "ç", "c");
        }
        char[] ch = "\"".toCharArray();
        for (int i = 0; i < ch.length; i++) {
            if (pas.contains(ch[i] + "")) {
                out = replace(out, valueOf(ch[i]), "");
            }

        }
        return out;
    }

    public static DateTime formatDate(String dat, String pattern) {
        try {
            if (dat.length() == 21) {
                dat = dat.substring(0, 19);
            }
            if (dat.length() == pattern.length()) {
                DateTimeFormatter formatter = forPattern(pattern);
                DateTime dt = formatter.parseDateTime(dat);
                return dt;
            }
        } catch (Exception e) {
            trackingAction("ERROR SYSTEM", estraiEccezione(e));
        }
        return null;
    }

    public static String formatStringtoStringDate(String dat) {
        return formatStringtoStringDate(dat, timestampSQL, timestampITA, false);

    }

    public static String formatStringtoStringDate(String dat, String pattern1, String pattern2, boolean timestamp) {
        try {
            if (timestamp) {
                dat = dat.substring(0, dat.length() - 2);
            }
            if (dat.length() == pattern1.length()) {
                DateTimeFormatter fmt = forPattern(pattern1);
                DateTime dtout = fmt.parseDateTime(dat);
                return dtout.toString(pattern2, ITALY);
            }
        } catch (Exception e) {
            trackingAction("ERROR SYSTEM", estraiEccezione(e));
        }
        return "DATA ERRATA";
    }

    public static boolean zipListFiles(List<FileDownload> files, File targetZipFile) {
        try {
            try (OutputStream out = new FileOutputStream(targetZipFile); ArchiveOutputStream os = new ArchiveStreamFactory().createArchiveOutputStream("zip", out)) {
                for (int i = 0; i < files.size(); i++) {
                    FileDownload ing = files.get(i);
                    os.putArchiveEntry(new ZipArchiveEntry(ing.getName()));
                    copy(new ByteArrayInputStream(decodeBase64(ing.getContent())), os);
                    os.closeArchiveEntry();
                }
            }
            return targetZipFile.length() > 0;
        } catch (Exception ex) {
            trackingAction("ERROR SYSTEM", estraiEccezione(ex));
            return false;
        }
    }

    public static void printRequest(HttpServletRequest request) throws ServletException, IOException {
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            for (String paramValue : paramValues) {
                out.println("NORMAL FIELD - " + paramName + " : " + paramValue);
            }
        }
        boolean isMultipart = isMultipartContent(request);
        if (isMultipart) {
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = iterator.next();
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        out.println("MULTIPART FIELD - " + fieldName + " : " + fieldValue);
                    } else {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getName();
                        out.println("MULTIPART FILE - " + fieldName + " : " + fieldValue);
                    }
                }
            } catch (Exception ex) {
                trackingAction("ERROR SYSTEM", estraiEccezione(ex));
            }
        }

    }

    public static void redirect(HttpServletRequest request, HttpServletResponse response, String destination) {
        try {
            if (response.isCommitted()) {
                RequestDispatcher dispatcher = request.getRequestDispatcher(destination);
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect(destination);
                return;
            }
        } catch (Exception ex) {
        }
    }

    public static int parseIntR(String value) {
        value = value.replaceAll("-", "").trim();
        if (value.contains(".")) {
            StringTokenizer st = new StringTokenizer(value, ".");
            value = st.nextToken();
        }
        int d1 = 0;
        try {
            d1 = parseInt(value);
        } catch (Exception e) {
            trackingAction("ERROR SYSTEM", estraiEccezione(e));
            d1 = 0;
        }
        return d1;
    }

    public static double fd(String si_t_old) {
        double d1 = 0.0D;
        si_t_old = si_t_old.replace(",", "").trim();
        try {
            d1 = parseDouble(si_t_old);
        } catch (Exception e) {
            d1 = 0.0D;
        }
        return d1;
    }

    public static String roundDoubleandFormat(double d, int scale) {
        return replace(format("%." + scale + "f", d), ",", ".");
    }

    public static String formatDoubleforMysql(String value) {
        if (value == null) {
            return "0.00";
        }
        if (value.equals("-") || value.equals("")) {
            return "0.00";
        }
        String add = "";
        if (value.contains("-")) {
            add = "-";
            value = value.replaceAll("-", "").trim();
        }

        if (!value.equals("0.00")) {
            if (value.contains(",")) {
                value = value.replaceAll("\\.", "");
                value = value.replaceAll(",", ".");
            } else {
                value = value.replaceAll("\\.", "");
                return value + ".00";
            }
        }
        return add + value;

    }

    public static String[] splitStringEvery(String s, int interval) {
        int arrayLength = (int) ceil(((s.length() / (double) interval)));
        String[] result = new String[arrayLength];
        int j = s.length();
        int lastIndex = result.length - 1;
        for (int i = lastIndex; i >= 0 && j >= interval; i--) {
            result[i] = s.substring(j - interval, j);
            j -= interval;
        } //Add the last bit
        if (result[0] == null) {
            result[0] = s.substring(0, j);
        }
        return result;
    }

    public static String formatAL(String cod, ArrayList<String[]> array, int index) {
        for (int i = 0; i < array.size(); i++) {
            if (cod.equals(array.get(i)[0])) {
                return array.get(i)[index];
            }
        }
        return "-";
    }

    public static String getRequestValue(HttpServletRequest request, String fieldname) {
        String out = request.getParameter(fieldname);
        if (out == null || out.trim().equals("null")) {
            out = "";
        } else {
            out = out.trim();
        }
        return out;
    }

    public static String getRequestCheckbox(HttpServletRequest request, String fieldname) {
        String out = request.getParameter(fieldname);
        if (out == null) {
            return "NO";
        }
        return "SI";
    }

    public static boolean checkFile(File file) {
        try {
            Db_Bando dbb = new Db_Bando();
            List<String> extaccettate = on(";").splitToList(dbb.getPath("docvalidi"));
            int dimmax = parseIntR(dbb.getPath("dim"));
            dbb.closeDB();
            boolean ver1 = extaccettate.contains(getExtension(file.getName()));
            boolean ver2 = dimmax >= file.length();
            return ver1 && ver2;
        } catch (Exception e) {
            trackingAction("ERROR SYSTEM", estraiEccezione(e));
            return false;
        }
    }

    public static boolean checkExtension(String name) {
        try {
            Db_Bando dbb = new Db_Bando();
            List<String> extaccettate = on(";").splitToList(dbb.getPath("docvalidi"));
            dbb.closeDB();
            return extaccettate.contains(getExtension(name));
        } catch (Exception e) {
            trackingAction("ERROR SYSTEM", estraiEccezione(e));
            return false;
        }

    }

    public static void createDir(String path) {
        try {
            createDirectories(get(path));
        } catch (Exception e) {
        }
    }

    public static Docbandi estraidaLista(ArrayList<Docbandi> lid, String cod) {
        try {
            return lid.stream().filter(de -> de.getCodicedoc().equals(cod)).findAny().orElse(new Docbandi());
        } catch (Exception e) {
        }
        return new Docbandi();
    }

    public static String estraiEccezione(Exception ec1) {
        try {
            String stack_nam = ec1.getStackTrace()[0].getMethodName();
            String stack_msg = ExceptionUtils.getStackTrace(ec1);
            return stack_nam + " - " + stack_msg;
        } catch (Exception e) {
        }
        return ec1.getMessage();

    }

//    public static String base64HTML(String path, String ing) {
//        if (ing == null) {
//            return "-";
//        }
//        try {
//            File f1 = new File(path + Utility.generaId(150) + ".html");
//            FileOutputStream is = new FileOutputStream(f1);
//            OutputStreamWriter osw = new OutputStreamWriter(is);
//            BufferedWriter w = new BufferedWriter(osw);
//            w.write(ing);
//            w.close();
//            osw.close();
//            is.close();
//            String base64 = new String(Base64.encodeBase64(FileUtils.readFileToByteArray(f1)));
//            f1.delete();
//            return base64;
//        } catch (Exception ex) {
//            trackingAction("ERROR SYSTEM", estraiEccezione(ex));
//        }
//        return null;
//    }
//
//    public static String getBase64HTML(String base64) {
//        byte[] ing = Base64.decodeBase64(base64.getBytes());
//        String s = new String(ing);
//        return s;
//    }

    public static String utf8(String var) {
        try {
            
            return new String(var.getBytes(ISO_8859_1), "UTF-8");
        } catch (Exception ex) {
            trackingAction("ERROR SYSTEM", estraiEccezione(ex));
        }
        return var;
    }

    public static String printClientInfo(HttpServletRequest request) {
//        final String referer = getReferer(request);
//        final String fullURL = getFullURL(request);

        try {
            String clientIpAddr = getClientIpAddr(request);
            String clientOS = getClientOS(request);
            String clientBrowser = getClientBrowser(request);
            String userAgent = getUserAgent(request);
            
            return ("\nUser Agent \t" + userAgent + "\n"
                    + "Operating System\t" + clientOS + "\n"
                    + "Browser Name\t" + clientBrowser + "\n"
                    + "IP Address\t" + clientIpAddr //  + "\n"        + "Full URL\t" + fullURL + "\n"
                    //                + "Referrer\t" + referer
                    );
            
        } catch (Exception e) {
            trackingAction("ERROR SYSTEM", estraiEccezione(e));
        }
        return "NO INFO";

    }

    private static String getReferer(HttpServletRequest request) {
        final String referer = request.getHeader("referer");
        return referer;
    }

    private static String getFullURL(HttpServletRequest request) {
        final StringBuffer requestURL = request.getRequestURL();
        final String queryString = request.getQueryString();

        final String result = queryString == null ? requestURL.toString() : requestURL.append('?')
                .append(queryString)
                .toString();

        return result;
    }

    private static String getClientIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        if (ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
            try {
                InetAddress inetAddress = InetAddress.getLocalHost();
                String ipAddress = inetAddress.getHostAddress();
                ip = ipAddress;
            } catch (UnknownHostException ex) {
            }
        }

        return ip;
    }

    private static String getClientOS(HttpServletRequest request) {
        final String browserDetails = request.getHeader("User-Agent");

        //=================OS=======================
        final String lowerCaseBrowser = browserDetails.toLowerCase();
        if (lowerCaseBrowser.contains("windows")) {
            return "Windows";
        } else if (lowerCaseBrowser.contains("mac")) {
            return "Mac";
        } else if (lowerCaseBrowser.contains("x11")) {
            return "Unix";
        } else if (lowerCaseBrowser.contains("android")) {
            return "Android";
        } else if (lowerCaseBrowser.contains("iphone")) {
            return "IPhone";
        } else {
            return "UnKnown, More-Info: " + browserDetails;
        }
    }

    private static String getClientBrowser(HttpServletRequest request) {
        final String browserDetails = request.getHeader("User-Agent");
        final String user = browserDetails.toLowerCase();

        String browser = "";

        //===============Browser===========================
        if (user.contains("msie")) {
            String substring = browserDetails.substring(browserDetails.indexOf("MSIE")).split(";")[0];
            browser = substring.split(" ")[0].replace("MSIE", "IE") + "-" + substring.split(" ")[1];
        } else if (user.contains("safari") && user.contains("version")) {
            browser = (browserDetails.substring(browserDetails.indexOf("Safari")).split(" ")[0]).split(
                    "/")[0] + "-" + (browserDetails.substring(
                            browserDetails.indexOf("Version")).split(" ")[0]).split("/")[1];
        } else if (user.contains("opr") || user.contains("opera")) {
            if (user.contains("opera")) {
                browser = (browserDetails.substring(browserDetails.indexOf("Opera")).split(" ")[0]).split(
                        "/")[0] + "-" + (browserDetails.substring(
                                browserDetails.indexOf("Version")).split(" ")[0]).split("/")[1];
            } else if (user.contains("opr")) {
                browser = ((browserDetails.substring(browserDetails.indexOf("OPR")).split(" ")[0]).replace("/",
                        "-")).replace(
                                "OPR", "Opera");
            }
        } else if (user.contains("chrome")) {
            browser = (browserDetails.substring(browserDetails.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1) || (user.indexOf(
                "mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf(
                "mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1)) {
            //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
            browser = "Netscape-?";

        } else if (user.contains("firefox")) {
            browser = (browserDetails.substring(browserDetails.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
        } else if (user.contains("rv")) {
            browser = "IE";
        } else {
            browser = "UnKnown, More-Info: " + browserDetails;
        }

        return browser;
    }

    private static String getUserAgent(HttpServletRequest request) {
        return request.getHeader("User-Agent");
    }
    

}
