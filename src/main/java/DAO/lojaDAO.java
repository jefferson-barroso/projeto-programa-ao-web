// Classe DAO
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.loja;

public class lojaDAO {

    // Configuração do banco de dados
    private String jdbcURL = "jdbc:mysql://localhost:3307/loja?user=root&password=12345&useSSL=false&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345";

    // COMANDOS SQL
    private static final String INSERT_LOJA_SQL = 
        "INSERT INTO loja (cpf, nome, telefone, email) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_LOJA_SQL = 
        "UPDATE loja SET cpf = ?, nome = ?, telefone = ?, email = ? WHERE id = ?";

    // Método para obter a conexão
    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Carregar o driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            System.err.println("Erro ao conectar ao banco de dados: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.err.println("Driver JDBC não encontrado: " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }

    // Método para inserir uma loja no banco
    public void inserirLoja(loja loja) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LOJA_SQL)) {

            // Definindo os parâmetros da consulta
            preparedStatement.setString(1, loja.getCpf());
            preparedStatement.setString(2, loja.getNome());
            preparedStatement.setString(3, loja.getTelefone());
            preparedStatement.setString(4, loja.getEmail());

            // Executando a inserção
            preparedStatement.executeUpdate();
            System.out.println("Loja inserida com sucesso!");

        } catch (SQLException e) {
            System.err.println("Erro ao inserir loja: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Método para atualizar uma loja no banco
    public boolean updateLoja(loja loja) throws SQLException {
        boolean linhaUpdate;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_LOJA_SQL)) {

            // Definindo os parâmetros da consulta
            preparedStatement.setString(1, loja.getCpf());
            preparedStatement.setString(2, loja.getNome());
            preparedStatement.setString(3, loja.getTelefone());
            preparedStatement.setString(4, loja.getEmail());
            
            preparedStatement.setInt(4, loja.getId());  // Definindo o parâmetro ID para a condição WHERE

            // Executando a atualização
            linhaUpdate = preparedStatement.executeUpdate() > 0;

        } 
        return linhaUpdate;
    }
}
