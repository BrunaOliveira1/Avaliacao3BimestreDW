<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Produtos da Terra</title>

        <!-- Bootstrap Core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

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

        <div id="wrapper">



            <div class="navbar-default sidebar" role="navigation">
                <nav> <img src="Logo.png" width="200"  /></nav>
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                        <li>
                            <a href=""><i class="fa fa-edit fa-fw"></i> Cadastros</a>

                        <li>
                            <a href="cadastroTipo.jsp">Cadastro Tipo</a>
                        </li>
                        <li>
                            <a href="cadastroMarca.jsp">Cadastro Marca</a>
                        </li>
                        <li>
                            <a href="cadastroUnidadeMedida.jsp">Cadastro Unidade de Medida</a>
                        </li>
                        <li>
                            <a href="cadastroProduto.jsp">Cadastro dos Produtos</a>
                        </li>
                        <li>
                            <a href="cadastroCliente.jsp">Cadastro dos Clientes</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-edit fa-fw"></i> Listas</a></li>
                        <li>
                            <a href="unidadeMedidaLista.jsp">Lista das Unidades de Medida</a>
                        </li>
                        <li>
                            <a href="tipoLista.jsp">Lista dos Tipos </a>
                        </li>
                        <li>
                            <a href="marcaLista.jsp">Lista das Marcas</a>
                        </li>
                        <li>
                            <a href="produtoLista.jsp">Lista dos Produtos</a>
                        </li>
                        <li>
                            <a href="clienteLista.jsp">Lista dos Clientes</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Cadastro Cliente</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Preencha os campos abaixo
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="${pageContext.request.contextPath}/cliente">
                                        <div class="form-group">
                                            <label>Digite o seu CPF</label>
                                            <input class="form-control" name="cpfCliente">
                                        </div>
                                        <div class="form-group">
                                            <label>Digite seu nome completo</label>
                                            <input class="form-control" name="nomeCliente" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite o seu celular para contato</label>
                                            <input class="form-control" name="celularCliente" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite seu endere�o</label>
                                            <input class="form-control" name="enderecoCliente" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite o n�mero da sua casa</label>
                                            <input class="form-control" name="numeroCasaCliente" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite o CEP</label>
                                            <input class="form-control" name="cepCliente" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite sua senha</label>
                                            <input type="password" class="form-control" name="senhaCliente" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite o n�mero do seu cart�o de cr�dito</label>
                                            <input class="form-control" name="numeroCartaoCliente" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite o n�mero do c�digo de seguran�a do seu cart�o de cr�dito</label>
                                            <input class="form-control" name="numeroCodSegCliente" >
                                        </div>

                                        <button type="submit" class="btn btn-default" name="ok">Salvar</button>
                                        <button type="reset" class="btn btn-default" name="no">Limpar</button>
                                    </form>
                                </div>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
