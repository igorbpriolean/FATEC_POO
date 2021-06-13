package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;

public class DbListener implements ServletContextListener {

    
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:mydb.db";
    
    //public static String step = null;
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        
        try{
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            
            String sql = "CREATE TABLE IF NOT EXISTS users("
                    + "name VARCHAR(200) NOT NULL,"
                    + "login VARCHAR(50) NOT NULL,"
                    + "password_hash LONG,"
                    + "role VARCHAR(20) NOT NULL"
                    + ")";
            stmt.execute(sql);
            sql = "INSERT INTO users(name, login, password_hash, role)"
                    + "VALUES ('Igor Batista Priolean', 'igor', '"+("1234".hashCode())+"', 'ADMIN')";
            stmt.execute(sql);
            
            sql = "CREATE TABLE IF NOT EXISTS disciplinas("
                    + "nome VARCHAR(200) NOT NULL,"
                    + "diasemana VARCHAR(50) NOT NULL,"
                    + "horario VARCHAR(20),"
                    + "qtdaulas VARCHAR(20) NOT NULL)";
            stmt.execute(sql);
            
            sql = "INSERT INTO disciplinas(nome, diasemana, horario, qtdaulas)"
                    + "VALUES ('Banco de Dados', 'Quinta-feira', '15h00', '4')";
            stmt.execute(sql);
            stmt.close();
            con.close();
        }catch (Exception ex){
            exception = ex;
        }         
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
