
package db;

import web.DbListener;
import java.sql.*;
import java.util.ArrayList;

public class User {
    
    private String name;
    private String login;
    private String role;

    
    
    private String nome;
    private String diasemana;
    private String horario;
    private String qtdaulas;
    
    public User(String nome, String diasemana, String horario, String qtdaulas) {
        this.nome = nome;
        this.diasemana = diasemana;
        this.horario = horario;
        this.qtdaulas = qtdaulas;
    }
    
    public User(String name, String login, String role) {
        this.name = name;
        this.login = login;
        this.role = role;
    }
    
    public static ArrayList<User> getUsers() throws Exception{
        ArrayList<User> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from users");
        while(rs.next()){
            list.add(new User(
                rs.getString("name"),
                rs.getString("login"),
                rs.getString("role")
            ));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static ArrayList<User> getDisciplinas() throws Exception{
        ArrayList<User> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from disciplinas");
        while(rs.next()){
            list.add(new User(
                rs.getString("nome"),
                rs.getString("diasemana"),
                rs.getString("horario"),
                rs.getString("qtdaulas")
            ));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }    
    
    
    
    
    public String getName() {
        return name;
    }

    public String getLogin() {
        return login;
    }

    public String getRole() {
        return role;
    }

    public String getNome() {
        return nome;
    }

    public String getDiasemana() {
        return diasemana;
    }

    public String getHorario() {
        return horario;
    }

    public String getQtdaulas() {
        return qtdaulas;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setDiasemana(String diasemana) {
        this.diasemana = diasemana;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public void setQtdaulas(String qtdaulas) {
        this.qtdaulas = qtdaulas;
    }
    
    
}
