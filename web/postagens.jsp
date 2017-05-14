<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Post"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.PostDao"%>
<%@page import="java.util.List"%>
<%@page import="util.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    
    Util.iniciarConexao();
    
    PostDao dao = new PostDao();
    
    List<Post> postagens = dao.getAll();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Postagens</title>
        
        <%@ include file="css.jsp" %>
    </head>
    <body>
        <h1>Postagens</h1>
        
        <%@ include file="menu.jsp" %>

        <table border="1">
            <thead>
                <tr>
                    <td>#</td>
                    <td>Categoria</td>
                    <td>Autor</td>
                    <td>Titulo</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <% for(Post postagem : postagens) { %>
                <tr>
                    <td><%= postagem.getIdpost() %></td>
                    <td><%= postagem.getCategoria().getIdcategoria() %></td>
                    <td><%= postagem.getAutor().getIdpessoa() %></td>
                    <td><%= postagem.getTitulo() %></td>
                    <td>
                        <a href="postagem-editar.jsp?id=<%= postagem.getIdpost() %>">[Editar]</a>
                        <a href="postagem-excluir.jsp?id=<%= postagem.getIdpost() %>">[Apagar]</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
