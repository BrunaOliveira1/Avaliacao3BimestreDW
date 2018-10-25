<%-- 
    Document   : testeProduto
    Created on : 22/05/2018, 16:34:21
    Author     : Jaque
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" type="image/png" href="fenix.png"/>
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
                        Clientes Cadastrados                      
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row"><div class="col-sm-12">
                                <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row">
                                            <th aria-label="CPF do Cliente" style="width: 10px;">CPF</th>
                                            <th aria-label="Nome do Cliente" style="width: 10px;">Nome</th>
                                            <th aria-label="Celular do Cliente" style="width: 10px;">Celular</th>
                                            <th aria-label="Endereco do Cliente" style="width: 10px;">Endereço</th>
                                            <th aria-label="Numero da Casa do Cliente" style="width: 100px;">Número da Casa</th>
                                            <th aria-label="CEP do Cliente" style="width: 10px;">CEP</th>
                                            <th aria-label="Senha do Cliente" style="width: 10px;">Senha</th>
                                            <th aria-label="Numero do Cartão de Crédito do Cliente" style="width: 180px;">Número do Cartão de Crédito</th>
                                            <th aria-label="Número do Código de Segurança  do Cliente" style="width: 330px;">Número do Código de Segurança do Cartão de Crédito</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${resultadoCliente}
                                    </tbody>
                                </table></div></div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>



            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').DataTable({
                        responsive: true
                    });
                });
            </script>
    </body>

</html>
