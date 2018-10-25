/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import DAOs.DAOCliente;
import DAOs.DAOCliente;
import Entidades.Cliente;
import Entidades.Cliente;
import Entidades.Cliente;
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
@WebServlet(name = "ClienteServlet", urlPatterns = {"/cliente"})
public class ClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAOCliente daoCliente = new DAOCliente();
    Cliente cliente = new Cliente();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cpfCliente = "";
        String nomeCliente = "";
        int celularCliente = 0;
        String enderecoCliente = "";
        int numeroCasaCliente = 0;
        int cepCliente = 0;
        String senhaCliente = "";
        int numeroCartaoCliente = 0;
        int numeroCodSegCliente = 0;

        String resultadoCliente = "";

        try (PrintWriter out = response.getWriter()) {
            cpfCliente = request.getParameter("cpfCliente");
            nomeCliente = request.getParameter("nomeCliente");
            celularCliente = Integer.valueOf(request.getParameter("celularCliente"));
            enderecoCliente = request.getParameter("enderecoCliente");
            numeroCasaCliente = Integer.valueOf(request.getParameter("numeroCasaCliente"));
            cepCliente = Integer.valueOf(request.getParameter("cepCliente"));
            senhaCliente = request.getParameter("senhaCliente");
            numeroCartaoCliente = Integer.valueOf(request.getParameter("numeroCartaoCliente"));
            numeroCodSegCliente = Integer.valueOf(request.getParameter("numeroCodSegCliente"));
            cliente.setCpf(cpfCliente);
            cliente.setNomeCompleto(nomeCliente);
            cliente.setCelular(celularCliente);
            cliente.setRua(enderecoCliente);
            cliente.setNumeroCasa(numeroCasaCliente);
            cliente.setCep(cepCliente);
            cliente.setSenha(senhaCliente);
            cliente.setNumeroCartao(numeroCartaoCliente);
            cliente.setCodigoSeguranca(numeroCodSegCliente);
            daoCliente.inserir(cliente);
            resultadoCliente = listaClientesCadastrados();
            request.getSession().setAttribute("resultadoCliente", resultadoCliente);
            response.sendRedirect(request.getContextPath() + "/paginas/clienteLista.jsp");
        }
    }

    protected String listaClienteCPF(String cpfCliente) {
        DAOCliente tipo = new DAOCliente();
        String tabela = "";
        List<Cliente> lista = tipo.listById(0);
        for (Cliente l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getCpf() + "</td>"
                    + "<td>" + l.getNomeCompleto() + "</td>"
                    + "<td>" + l.getCelular() + "</td>"
                    + "<td>" + l.getRua() + "</td>"
                    + "<td>" + l.getNumeroCasa() + "</td>"
                    + "<td>" + l.getCep() + "</td>"
                    + "<td>" + l.getSenha() + "</td>"
                    + "<td>" + l.getNumeroCartao() + "</td>"
                    + "<td>" + l.getCodigoSeguranca() + "</td>"
                    + "</tr>";
        }

        return tabela;
    }

    protected String listaClientesCadastrados() {
        DAOCliente tipo = new DAOCliente();
        String tabela = "";
        List<Cliente> lista = tipo.listInOrderNome();
        for (Cliente l : lista) {
            tabela += "<tr>"
                    + "<td>" + l.getCpf() + "</td>"
                    + "<td>" + l.getNomeCompleto() + "</td>"
                    + "<td>" + l.getCelular() + "</td>"
                    + "<td>" + l.getRua() + "</td>"
                    + "<td>" + l.getNumeroCasa() + "</td>"
                    + "<td>" + l.getCep() + "</td>"
                    + "<td>" + l.getSenha() + "</td>"
                    + "<td>" + l.getNumeroCartao() + "</td>"
                    + "<td>" + l.getCodigoSeguranca() + "</td>"
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
