/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import DAOs.DAOMarca;
import DAOs.DAOProduto;
import DAOs.DAOTipo;
import DAOs.DAOUnidadeMedida;
import Entidades.Marca;
import Entidades.Produto;
import Entidades.Tipo;
import Entidades.UnidadeMedida;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jaque
 */
@WebServlet(name = "ProdutoServlet", urlPatterns = {"/produto"})
public class ProdutoServlet extends HttpServlet {

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Locale ptBr = new Locale("pt", "BR");
    NumberFormat formatoDinheiro = NumberFormat.getCurrencyInstance(ptBr);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        int idProduto = 0;
        String nomeProduto = "";
        Date dataValidade;
        Date dataFabricacao;
        String beneficioSaude = "";
        double precoProduto = 0;
        int marcaId = 0;
        int tipoId = 0;
        int unidadeMedidaId = 0;

        try (PrintWriter out = response.getWriter()) {

            String resultadoProduto = "";
            
                //parametros do form
                //aqui pq se passar do if não serão nulos

                //tudo que vem do formulario é string, por isso aqui alguns precisam de conversão
                idProduto = Integer.parseInt(request.getParameter("idProduto"));
                nomeProduto = request.getParameter("nomeProduto");
                dataValidade = sdf.parse(request.getParameter("dataValidade"));
                dataFabricacao = sdf.parse(request.getParameter("dataFabricacao"));
                beneficioSaude = request.getParameter("beneficioSaude");
                Double produtoPreco = Double.parseDouble(request.getParameter("preco"));
                marcaId = Integer.parseInt(request.getParameter("marcaProduto"));
                tipoId = Integer.parseInt(request.getParameter("tipoProduto"));
                unidadeMedidaId = Integer.parseInt(request.getParameter("unidadeMedidaProduto"));

                DAOProduto daoProduto = new DAOProduto();
                DAOMarca daoMarca = new DAOMarca();
                DAOTipo daoTipo = new DAOTipo();
                DAOUnidadeMedida daoUnidadeMedida = new DAOUnidadeMedida();
                Produto produto = new Produto();

                //busca a categoria do id selecionado no select do form
                //busca com o listById para criar um objeto de entidade completo, 
                //que é o parâmetro que o set de categoria pede
                Marca marca = daoMarca.listById(marcaId).get(0);
                Tipo tipo = daoTipo.listById(tipoId).get(0);
                UnidadeMedida unidadeMedida = daoUnidadeMedida.listById(unidadeMedidaId).get(0);

                //seta informacoes do produto na entidade
                //essa tabela nao tem id automatico no banco, então precisa setar
                //para nao pedir p/ usuario no formulario e correr o risco de repetição
                //use a função do dao p/ calcular o id
                produto.setIdProduto(daoProduto.autoIdProduto());
                produto.setNomeProduto(nomeProduto);
                produto.setDataValidade(dataValidade);
                produto.setDataFabricacao(dataFabricacao);
                produto.setBeneficioSaude(beneficioSaude);
                produto.setPreco(produtoPreco);
                //seta a categoria do produto, que vai gravar apenas o id como fk no produto  no banco
                //porém, aqui é orientado a objeto, então o categoria é um objeto da entidade categoria
                produto.setCadastroMarcaIdMarca(marca);
                produto.setCadastroTipoIdTipo(tipo);
                produto.setUnidadeMedidaIdUnidadeMedida(unidadeMedida);

                //insere o produto no banco
                daoProduto.inserir(produto);
                //faz a busca p/ direcionar p/ uma lista atualizada
                //só se sua lista usa servlet, se for com JSTL ou scriplet é só redirecionar
                resultadoProduto = listaProdutosCadastrados();
            
            request.getSession().setAttribute("resultadoProduto", resultadoProduto);
            response.sendRedirect(request.getContextPath() + "/paginas/produtoLista.jsp");
        }
    }

    protected String listaProdutoNome(String nomeProduto) {
        DAOProduto produto = new DAOProduto();
        String tabela = "";
        List<Produto> lista = produto.listByNome(nomeProduto);
        for (Produto l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getIdProduto() + "</td>"
                    + "<td>" + l.getNomeProduto() + "</td>"
                    + "<td>" + sdf.format(l.getDataValidade()) + "</td>"
                    + "<td>" + sdf.format(l.getDataFabricacao()) + "</td>"
                    + "<td>" + l.getBeneficioSaude()+ "</td>"
                    + "<td>" + formatoDinheiro.format(l.getPreco()) + "</td>"
                    + "<td>" + l.getCadastroMarcaIdMarca().getNomeMarca() + "</td>"
                    + "<td>" + l.getCadastroTipoIdTipo().getNomeTipo() + "</td>"
                    + "<td>" + l.getUnidadeMedidaIdUnidadeMedida().getNomeUnidadeMedida() + "</td>"
                    + "</tr>";
        }

        return tabela;
    }

    protected String listaProdutosCadastrados() {
        DAOProduto produto = new DAOProduto();
        String tabela = "";
        List<Produto> lista = produto.listInOrderNome();
        for (Produto l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getIdProduto() + "</td>"
                    + "<td>" + l.getNomeProduto() + "</td>"
                    + "<td>" + sdf.format(l.getDataValidade()) + "</td>"
                    + "<td>" + sdf.format(l.getDataFabricacao()) + "</td>"
                    + "<td>" + l.getBeneficioSaude()+ "</td>"
                    + "<td>" + formatoDinheiro.format(l.getPreco()) + "</td>"
                    + "<td>" + l.getCadastroMarcaIdMarca().getNomeMarca() + "</td>"
                    + "<td>" + l.getCadastroTipoIdTipo().getNomeTipo() + "</td>"
                    + "<td>" + l.getUnidadeMedidaIdUnidadeMedida().getNomeUnidadeMedida() + "</td>"
                    + "</tr>";
        }

        return tabela;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("teste doget");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("teste dopost");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
