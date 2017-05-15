<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Pessoa"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Admin"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.AdminDao"%>
<%@page import="java.util.List"%>
<%@page import="util.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    
    Util.iniciarConexao();
    
    AdminDao dao = new AdminDao();
    
    List<Pessoa> usuarios = dao.getAll();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários</title>
        
        <%@ include file="css.jsp" %>
    </head>
    <body>
        <h1>Usuários</h1>
        
        <%@ include file="menu.jsp" %>

        <table border="1">
            <thead>
                <tr>
                    <td>#</td>
                    <td>Nome</td>
                    <td>Email</td>
                    <td>Senha</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    for(Pessoa pessoa : usuarios) {
                        Admin usuario = (Admin) pessoa;
                %>
                <tr>
                    <td><%= usuario.getIdpessoa()%></td>
                    <td><%= usuario.getNome() %></td>
                    <td><%= usuario.getEmail() %></td>
                    <td><%= usuario.getSenha() %></td>
                    <td>
                        <a href="usuario-editar.jsp?id=<%= usuario.getIdpessoa() %>">[Editar]</a>
                        <a href="usuario-excluir.jsp?id=<%= usuario.getIdpessoa() %>">[Apagar]</a>
                        <a href="usuario-foto.jsp?id=<%= usuario.getIdpessoa() %>">[Foto]</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
