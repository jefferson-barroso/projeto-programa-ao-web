package Controller;

import DAO.LojaDAO;
import model.Loja;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/loja")
public class LojaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LojaDAO lojaDAO;

    public void init() {
        lojaDAO = new LojaDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertLoja(request, response);
                    break;
                case "delete":
                    deleteLoja(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateLoja(request, response);
                    break;
                case "search": 
                    searchLoja(request, response);
                    break;
                default:
                    listLoja(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
 // Novo método para pesquisa de lojas
    private void searchLoja(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String query = request.getParameter("query");
        List<Loja> listLoja = lojaDAO.searchLojas(query);
        request.setAttribute("listLoja", listLoja);
        request.getRequestDispatcher("lojaListaAtualizada.jsp").forward(request, response);
    }

    // Método para listar todas as lojas
    private void listLoja(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Loja> listLoja = lojaDAO.selectAllLojas();
        request.setAttribute("listLoja", listLoja);
        request.getRequestDispatcher("lojaListaAtualizada.jsp").forward(request, response);
    }

    // Exibe o formulário para criar uma nova loja
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("FormularioCadastro.jsp").forward(request, response);
    }

    // Exibe o formulário de edição de loja
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Loja existingLoja = lojaDAO.selectLoja(id);
        request.setAttribute("loja", existingLoja);
        request.getRequestDispatcher("FormularioCadastro.jsp").forward(request, response);
    }

    // Insere uma nova loja no banco de dados
    private void insertLoja(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        Loja novaLoja = new Loja(cpf, nome, telefone, email);
        lojaDAO.inserirLoja(novaLoja);
        response.sendRedirect("loja?action=list");
    }

    // Atualiza uma loja existente
    private void updateLoja(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        Loja loja = new Loja(cpf, nome, telefone, email);
        loja.setId(id);
        lojaDAO.updateLoja(loja);
        response.sendRedirect("loja?action=list");
    }

    // Deleta uma loja
    private void deleteLoja(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        lojaDAO.deleteLoja(id);
        response.sendRedirect("loja?action=list");
    }
}
