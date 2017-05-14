<%@page import="br.com.chiquitto.aula.jdbcblog.dao.AdminDao"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Admin"%>
<%@page import="util.Util"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.CategoriaDao"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Categoria"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    String idUsuarioString = request.getParameter("id");
    int idUsuario = Integer.parseInt(idUsuarioString);

    String nome = "";
    String email = "";
    String senha = "";

    String erro = "";

    if (request.getMethod() == "POST") {
        nome = request.getParameter("nome");
        email = request.getParameter("email");
        senha = request.getParameter("senha");
        
        if (nome.isEmpty()) {
            erro = "Nome do usuário deve ser informado";
        }
        if (email.isEmpty()) {
            erro = "Email deve ser informado";
        }
        if (senha.isEmpty()) {
            erro = "Senha deve ser informado";
        }

        if (erro.isEmpty()) {
            Util.iniciarConexao();
    
            Admin adminVo = new Admin();
            adminVo.setIdpessoa(idUsuario);
            adminVo.setNome(nome);
            adminVo.setEmail(email);
            adminVo.setSenha(senha);

            AdminDao dao = new AdminDao();
            dao.editar(adminVo);
            
            response.sendRedirect("usuarios.jsp");
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuário - Cadastrar</title>
        
        <%@ include file="css.jsp" %>
    </head>
    <body>
        <h1>Cadastrar usuário</h1>
        
        <%@ include file="menu.jsp" %>

        <% if (erro.isEmpty() == false) {%>
        <p>ERRO: <%= erro%></p>
        <% }%>

        <form method="POST">
            <p>Nome: <input type="text" name="nome" value="<%= nome %>" /></p>
            <p>Email: <input type="email" name="email" value="<%= email %>" /></p>
            <p>Senha: <input type="password" name="senha" value="<%= senha %>" /></p>
            <p><input type="submit" value="Salvar" /></p>
        </form>
    </body>
</html>
