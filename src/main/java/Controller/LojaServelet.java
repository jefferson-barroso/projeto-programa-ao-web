package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.lojaDAO;
import model.loja;

/**
 * Servlet implementation class LojaServlet
 */
@WebServlet("/loja")
public class LojaServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private lojaDAO lojaDAO;

    public LojaServelet() {
        super();
    }

    @Override
    public void init() {
        lojaDAO = new lojaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Armazena a ação de acordo com a opção do usuário
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "insert":
                    insertLoja(request, response);
                    break;
                case "update":
                	updateLoja(request, response);;
                	break;
                default:
                    response.sendRedirect("erro.jsp"); // Página de erro para ações inválidas
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e); // Corrigi a exceção propagada
        }
    }

    // Método para inserir uma loja no banco de dados
    private void insertLoja(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        loja loja = new loja(cpf, nome, telefone, email);
        lojaDAO.inserirLoja(loja);

        response.sendRedirect("lojaListaAtualizada.jsp"); // Redireciona após a inserção
    }

    // Método para atualizar uma loja no banco de dados
    private void updateLoja(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        loja loja = new loja(cpf, nome, telefone, email);
        loja.setId(id);
        lojaDAO.updateLoja(loja);

        response.sendRedirect("loja?action=list"); // Redireciona após a inserção
    }

}
