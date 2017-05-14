<%@page import="java.util.List"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.CategoriaDao"%>
<%@page import="util.Util"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    
    Util.iniciarConexao();
    
    CategoriaDao dao = new CategoriaDao();
    
    List<Categoria> categorias = dao.getAll();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
        
        <%@ include file="css.jsp" %>
    </head>
    <body>
        <h1>Categorias</h1>
        
        <%@ include file="menu.jsp" %>

        <table border="1">
            <thead>
                <tr>
                    <td>#</td>
                    <td>Categoria</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <% for(Categoria categoria : categorias) { %>
                <tr>
                    <td><%= categoria.getIdcategoria() %></td>
                    <td><%= categoria.getCategoria() %></td>
                    <td>
                        <a href="categoria-editar.jsp?id=<%= categoria.getIdcategoria() %>">[Editar]</a>
                        <a href="categoria-excluir.jsp?id=<%= categoria.getIdcategoria() %>">[Apagar]</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
