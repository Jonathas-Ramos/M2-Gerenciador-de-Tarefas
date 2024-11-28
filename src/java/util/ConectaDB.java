package util;
import java.sql.*;


/**
 *
 * @author alunocmc
 */
public class ConectaDB {
    
    public static Connection conectar() throws ClassNotFoundException{
        Connection conexao = null;
        try{
            //Conectando ao banco de dados
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/gerenciadorTarefa","root","11231101358"); //colocar nome db
            return conexao;
        }catch(SQLException ex){ 
            System.out.println("Error: " + ex);
        }                  
        return conexao;        
    }
    
}
