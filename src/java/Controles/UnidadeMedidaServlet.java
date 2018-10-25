/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import DAOs.DAOUnidadeMedida;
import Entidades.UnidadeMedida;
import Entidades.UnidadeMedida;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jaque
 */
@WebServlet(name = "UnidadeMedidaServlet", urlPatterns = {"/unidade"})
public class UnidadeMedidaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAOUnidadeMedida daoUnidadeMedida = new DAOUnidadeMedida();
    UnidadeMedida unidadeMedida = new UnidadeMedida();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String resultadoUnidade = "";
        String nomeUnidadeMedida = "";
        int idUnidadeMedida = 0;
        try (PrintWriter out = response.getWriter()) {
            idUnidadeMedida = Integer.parseInt(request.getParameter("idUnidadeMedida"));
            nomeUnidadeMedida = request.getParameter("nomeUnidadeMedida");
            unidadeMedida.setIdUnidadeMedida(daoUnidadeMedida.autoIdUnidadeMedida());
            unidadeMedida.setNomeUnidadeMedida(nomeUnidadeMedida);
            daoUnidadeMedida.inserir(unidadeMedida);
            resultadoUnidade = listaUnidadeMedidasCadastrados();

            request.getSession().setAttribute("resultadoUnidade", resultadoUnidade);
            response.sendRedirect(request.getContextPath() + "/paginas/unidadeMedidaLista.jsp");
        }
    }

    protected String listaUnidadeMedidaId(String idUnidadeMedida) {
        DAOUnidadeMedida unidadeMedida = new DAOUnidadeMedida();
        String tabela = "";
        List<UnidadeMedida> lista = unidadeMedida.listById(0);
        for (UnidadeMedida l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getIdUnidadeMedida() + "</td>"
                    + "<td>" + l.getNomeUnidadeMedida() + "</td>"
                    + "</tr>";
        }

        return tabela;
    }

    protected String listaUnidadeMedidasCadastrados() {
        DAOUnidadeMedida unidadeMedida = new DAOUnidadeMedida();
        String tabela = "";
        List<UnidadeMedida> lista = unidadeMedida.listInOrderNome();
        for (UnidadeMedida l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getIdUnidadeMedida() + "</td>"
                    + "<td>" + l.getNomeUnidadeMedida() + "</td>"
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
        processRequest(request, response);
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
        processRequest(request, response);
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
