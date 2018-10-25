<%-- 
    Document   : testeProduto
    Created on : 22/05/2018, 16:34:21
    Author     : Jaque
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,
        DAOs.DAOProduto,
        Entidades.Produto,
        java.text.NumberFormat"%>
<%
    Locale ptBr = new Locale("pt", "BR");
    NumberFormat formatoDinheiro = NumberFormat.getCurrencyInstance(ptBr);

    DAOProduto dao = new DAOProduto();
    List<Produto> produtos = dao.listInOrderNome();
%>


<!DOCTYPE html>
<html>
    <head>
        <title>Produtos da Terra</title>
        <!-- Bootstrap Core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <img src="Logo.png" width="70" />
                    Produtos da Terra, a sua loja on-line de produtos naturais.
                </div>
                    <a href="cadastroTipo.jsp">Cadastro Tipo    |</a>
                    <a href="cadastroMarca.jsp">Cadastro Marca  |</a>
                    <a href="cadastroUnidadeMedida.jsp">Cadastro Unidade de Medida  |</a>
                    <a href="cadastroProduto.jsp">Cadastro dos Produtos | </a>
                    <a href="cadastroCliente.jsp">Cadastro dos Clientes | </a>
                    <a href="unidadeMedidaLista.jsp">Lista das Unidades de Medida   |</a>
                    <a href="tipoLista.jsp">Lista dos Tipos | </a>
                    <a href="marcaLista.jsp">Lista das Marcas   |</a>
                    <a href="produtoLista.jsp">Lista dos Produtos   |</a>
                    <a href="clienteLista.jsp">Lista dos Clientes   </a>
                </div></div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Produtos Cadastrados
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                        <div class="row"><div class="col-sm-12">
                                <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row">
                                            <th aria-label="Id do Produto" style="width: 30px;">Id</th>
                                            <th aria-label="Nome do Produto" style="width: 60px;">Nome</th>
                                            <th aria-label="Data de Validade" style="width: 170px;">Data de Validade</th>
                                            <th aria-label="Data de Fabricacao" style="width: 190px;">Data de Fabricação</th>
                                            <th aria-label="beneficios para saude" style="width: 230px;">Benefícios para saúde</th>
                                            <th aria-label="preco" style="width: 60px;">Preço</th>
                                            <th aria-label="marca" style="width: 60px;">Marca</th>
                                            <th aria-label="tipo" style="width: 60px;">Tipo</th>
                                            <th aria-label="unidade de medida" style="width: 170px;">Unidade de Medida</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${tabela}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').DataTable({
                        responsive: true
                    });
                });
            </script>
    </body>

</html>
