package util;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class MyLogger {

    // Ruta guarda log /Users/ignacio/GlassFish_Server/glassfish/domains/domain1/config
    public static void writeLogSevere(String mensaje) {
        Logger logger = Logger.getLogger("util.MyLogger");
        FileHandler fh;
        try {
            fh = new FileHandler("log.txt", true);
            logger.addHandler(fh);
            SimpleFormatter formatter = new SimpleFormatter();
            fh.setFormatter(formatter);
            logger.severe(mensaje);
            fh.close();
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    //MyLogger.writeLogSevere("Error en el comando");
}
