<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html lang="en">
    <jsp:useBean id="daoMarca" class="DAOs.DAOMarca"/>
    <jsp:useBean id="daoTipo" class="DAOs.DAOTipo"/>
    <jsp:useBean id="daoUnidadeMedida" class="DAOs.DAOUnidadeMedida"/>
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
                            <a href="clienteLista.jsp">Lista dos Cliente</a>
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
                    <h1 class="page-header">Cadastro de Produtos</h1>
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
                                    <form role="form" action="${pageContext.request.contextPath}/produto">
                                        <div class="form-group">
                                            <label>Digite o Id do Produto</label>
                                            <input class="form-control" name="idProduto">
                                        </div>
                                        <div class="form-group">
                                            <label>Digite o nome do Produto</label>
                                            <input class="form-control" name="nomeProduto" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite a data de validade do Produto</label>
                                            <input class="form-control" name="dataValidade" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite a data de fabricação do Produto</label>
                                            <input class="form-control" name="dataFabricacao" >
                                        </div>
                                        <div class="form-group">
                                            <label>Digite os benefícios para saúde que o Produto nos oferece</label>
                                            <input class="form-control" name="beneficioSaude" >
                                        </div>                                            
                                        <div class="form-group">
                                            <label>Digite o preço do Produto</label>
                                            <input class="form-control" name="precoProduto" >
                                        </div>

                                        <div class="form-group">
                                            <label>Selecione a marca do Produto</label>
                                            <select class="form-control" name="marcaProduto">
                                                <option value="">SELECIONE</option>
                                                <c:forEach var="marc" items="${daoMarca.listInOrderNome()}">
                                                    <option value="${marc.getIdMarca()}">${marc.getNomeMarca()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Selecione o tipo do Produto</label>
                                            <select class="form-control" name="tipoProduto">
                                                <option value="">SELECIONE</option>
                                                <c:forEach var="tipo" items="${daoTipo.listInOrderNome()}">
                                                    <option value="${tipo.getIdTipo()}">${tipo.getNomeTipo()}</option>                                              
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Selecione a unidade de medida do Produto</label>
                                            <select class="form-control" name="unidadeMedidaProduto">
                                                <option value="">SELECIONE</option>
                                                <c:forEach var="unidade" items="${daoUnidadeMedida.listInOrderId()}">                                                                                                   
                                                    <option value="${unidade.getIdUnidadeMedida()}">${unidade.getNomeUnidadeMedida()}</option>                                              
                                                </c:forEach>
                                            </select>
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
