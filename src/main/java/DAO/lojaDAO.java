// Classe DAO
package DAO;

import model.Loja;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LojaDAO {

    // Configuração do banco de dados
    private String jdbcURL = "jdbc:mysql://localhost:3307/loja";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345";

    // Comandos SQL
    private static final String INSERT_LOJA_SQL = "INSERT INTO loja (cpf, nome, telefone, email) VALUES (?, ?, ?, ?)";
    private static final String SELECT_LOJA_BY_ID = "SELECT * FROM loja WHERE id = ?";
    private static final String SELECT_ALL_LOJAS = "SELECT * FROM loja";
    private static final String DELETE_LOJA_SQL = "DELETE FROM loja WHERE id = ?";
    private static final String UPDATE_LOJA_SQL = "UPDATE loja SET cpf = ?, nome = ?, telefone = ?, email = ? WHERE id = ?";

    // Método para obter a conexão
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Método para inserir uma loja (Create)
    public void inserirLoja(Loja loja) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LOJA_SQL)) {
            preparedStatement.setString(1, loja.getCpf());
            preparedStatement.setString(2, loja.getNome());
            preparedStatement.setString(3, loja.getTelefone());
            preparedStatement.setString(4, loja.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para buscar uma loja pelo ID (Read)
    public Loja selectLoja(int id) {
        Loja loja = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LOJA_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String cpf = rs.getString("cpf");
                String nome = rs.getString("nome");
                String telefone = rs.getString("telefone");
                String email = rs.getString("email");
                loja = new Loja(cpf, nome, telefone, email);
                loja.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loja;
    }

    // Método para buscar todas as lojas (Read)
    public List<Loja> selectAllLojas() {
        List<Loja> lojas = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LOJAS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String cpf = rs.getString("cpf");
                String nome = rs.getString("nome");
                String telefone = rs.getString("telefone");
                String email = rs.getString("email");
                Loja loja = new Loja(cpf, nome, telefone, email);
                loja.setId(id);
                lojas.add(loja);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lojas;
    }

    // Método para atualizar uma loja (Update)
    public boolean updateLoja(Loja loja) throws SQLException {
        boolean linhaAtualizada;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_LOJA_SQL)) {
            preparedStatement.setString(1, loja.getCpf());
            preparedStatement.setString(2, loja.getNome());
            preparedStatement.setString(3, loja.getTelefone());
            preparedStatement.setString(4, loja.getEmail());
            preparedStatement.setInt(5, loja.getId());
            linhaAtualizada = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            linhaAtualizada = false;
        }
        return linhaAtualizada;
    }

    // Método para deletar uma loja (Delete)
    public boolean deleteLoja(int id) throws SQLException {
        boolean linhaDeletada;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_LOJA_SQL)) {
            preparedStatement.setInt(1, id);
            linhaDeletada = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            linhaDeletada = false;
        }
        return linhaDeletada;
    }
}
