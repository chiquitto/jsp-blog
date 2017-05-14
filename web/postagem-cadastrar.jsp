<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Pessoa"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.AdminDao"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Admin"%>
<%@page import="java.util.List"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Categoria"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.CategoriaDao"%>
<%@page import="util.Util"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.PostDao"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    Util.iniciarConexao();

    String erro = "";

    String idCategoriaString = "";
    int idCategoria = 0;
    String idAutorString = "";
    int idAutor = 0;
    String titulo = "";
    String texto = "";

    if (request.getMethod() == "POST") {

        idCategoriaString = request.getParameter("idcategoria");
        try {
            idCategoria = Integer.parseInt(idCategoriaString);
        } catch (NumberFormatException e) {

        }
        
        idAutorString = request.getParameter("idautor");
        
        try {
            idAutor = Integer.parseInt(idAutorString);
        } catch (NumberFormatException e) {
        }
        
        
        titulo = request.getParameter("titulo");
        texto = request.getParameter("texto");

        if (idCategoria == 0) {
            erro = "Favor informar a categoria";
        } else if (idAutor == 0) {
            erro = "Informar o autor";
        } else if (titulo.isEmpty()) {
            erro = "Informar o titulo";
        } else if (texto.isEmpty()) {
            erro = "Informar o texto";
        } else {

            Post post = new Post();

           

            post.setIdcategoria(idCategoria);
            post.setIdautor(idAutor);
            post.setTitulo(titulo);
            post.setTexto(texto);

            PostDao dao = new PostDao();
            dao.cadastrar(post);

            response.sendRedirect("postagens.jsp");
        }
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Postagem - Cadastrar</title>

        <%@ include file="css.jsp" %>
    </head>
    <body>
        <h1>Cadastrar postagem</h1>

        <%@ include file="menu.jsp" %>

        <% if (erro.isEmpty() == false) {%>
        <p>ERRO: <%= erro%></p>
        <% }%>

        <form method="POST">
            <p>Categoria <select name="idcategoria">
                    <option value="">Selecione uma categoria</option>
                    <%
                        CategoriaDao categoriaDao = new CategoriaDao();
                        List<Categoria> categorias = categoriaDao.getAll();

                        for (Categoria cat : categorias) {
                    %>
                    <option value="<%=cat.getIdcategoria()%>" 
                            <%
                                if (idCategoria == cat.getIdcategoria()) {

                            %>selected <% }%>>
                        <%= cat.getCategoria()%>
                    </option>

                    <% }
                    %>
                </select></p>
                <p>Autor: <select name="idautor">
                        <option value="" >Selecione um autor</option>
                        <% 
                            AdminDao adminDao = new AdminDao();
                            List<Pessoa> autores = adminDao.getAll();
                            
                            for (Pessoa p: autores){
                                %>
                          <option value="<%=p.getIdpessoa()%>"
          <% 
          if (idAutor == p.getIdpessoa()){
              out.print("selected");
          }
          %>> 
                                 <%=p.getNome()%>   
                                </option>
                                <%
                            }
                        %>
     
                    </select></p>
            <p>Título: <input type="text" name="titulo"
                              value="<%=titulo%>"/></p>
            <p>Texto: <textarea name="texto"><%=texto%></textarea></p>
            <p><input type="submit" value="Salvar" /></p>
        </form>
    </body>
</html>
