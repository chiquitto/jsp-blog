<%@page import="br.com.chiquitto.aula.jdbcblog.dao.CategoriaDao"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Categoria"%>
<%@page import="util.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    Util.iniciarConexao();
    CategoriaDao dao = new CategoriaDao();
    
    String idParam = request.getParameter("id");
    int id = Integer.parseInt(idParam);

    String erro = "";
    
    String categoria = "";
    
    if (request.getMethod() == "POST") {
        
        categoria = request.getParameter("categoria");
        
        if (categoria.isEmpty()) {
            erro = "Categoria deve ser preenchida";
        }
        
        if (erro.isEmpty()) {
            Categoria categoriaVo = new Categoria();
            categoriaVo.setCategoria(categoria);
            categoriaVo.setIdcategoria(id);
            
            dao.editar(categoriaVo);
            
            response.sendRedirect("categorias.jsp");
        }
        
    } else {
        Categoria categoriaVo = dao.getOne(id);
        categoria = categoriaVo.getCategoria();
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria - Editar</title>
        
        <%@ include file="css.jsp" %>
    </head>
    <body>
        <h1>Editar categoria</h1>
        
        <%@ include file="menu.jsp" %>

        <% if (erro.isEmpty() == false) {%>
        <p>ERRO: <%= erro %></p>
        <% }%>

        <form method="POST">
            <p>Categoria: <input type="text" name="categoria"
                                 value="<%= categoria %>" /></p>
            <p><input type="submit" value="Salvar" /></p>
        </form>
    </body>
</html>
