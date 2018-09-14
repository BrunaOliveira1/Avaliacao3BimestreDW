/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import DAOs.DAOTipo;
import Entidades.Tipo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jaque
 */
@WebServlet(name = "TipoServlet", urlPatterns = {"/tipoLista"})
public class TipoServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int idTipo = 0;
        String nomeTipo = "";
        DAOTipo daoTipo = new DAOTipo();
        Tipo tipo = new Tipo();
        try (PrintWriter out = response.getWriter()) {
            idTipo = Integer.parseInt(request.getParameter("idTipo"));
            nomeTipo = request.getParameter("nomeTipo");
            tipo.setIdTipo(idTipo);
            tipo.setNomeTipo(nomeTipo);

            daoTipo.inserir(tipo);
            String resultadoTipo = "";

            resultadoTipo = listaTiposCadastrados();

            request.getSession().setAttribute("resultadoTipo", resultadoTipo);
            response.sendRedirect(request.getContextPath() + "/Paginas/tipoLista.jsp");
        }
    }

    protected String listaTipoId(String idTipo) {
        DAOTipo tipo = new DAOTipo();
        String tabela = "";
        List<Tipo> lista = tipo.listById(0);
        for (Tipo l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getIdTipo() + "</td>"
                    + "<td>" + l.getNomeTipo() + "</td>"
                    + "</tr>";
        }

        return tabela;
    }

    protected String listaTiposCadastrados() {
        DAOTipo tipo = new DAOTipo();
        String tabela = "";
        List<Tipo> lista = tipo.listInOrderNome();
        for (Tipo l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getIdTipo() + "</td>"
                    + "<td>" + l.getNomeTipo() + "</td>"
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
