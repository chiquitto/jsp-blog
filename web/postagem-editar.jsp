<%@page import="util.Util"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.PostDao"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    Util.iniciarConexao();
    
    PostDao dao = new PostDao();
    
    String erro = "";
    
    String idPostString = request.getParameter("id");
    int idPost = Integer.parseInt(idPostString);
    
    String idCategoriaString = "";
    int idCategoria = 0;
    
    String idAutorString = "";
    int idAutor = 0;
    
    String titulo = "";
    String texto = "";
    
    
    if (request.getMethod() == "POST") {
        
       idCategoriaString = request.getParameter("idcategoria");
       idAutorString = request.getParameter("idautor");
       titulo = request.getParameter("titulo");
       texto = request.getParameter("texto");
        
        if (idCategoriaString.isEmpty()) {
            erro = "Favor informar a categoria";
        } else if (idAutorString.isEmpty()){
            erro = "Informar o autor";
        } else if (titulo.isEmpty()) {
            erro = "Informar o titulo"; 
        } else if (texto.isEmpty()) {
            erro = "Informar o texto";
        } else {
            Post post = new Post();
            
            idCategoria = Integer.parseInt(idCategoriaString);
            idAutor = Integer.parseInt(idAutorString);
            
            post.setIdpost(idPost);
            post.setIdcategoria(idCategoria);
            post.setIdautor(idAutor);
            post.setTitulo(titulo);
            post.setTexto(texto);
            
            dao.editar(post);
            
            response.sendRedirect("postagens.jsp");
        }
    }else{
       Post post = dao.getOne(idPost);
       
       idCategoria = post.getCategoria().getIdcategoria();
       idCategoriaString = Integer.toString(idCategoria);
       
       idAutor = post.getAutor().getIdpessoa();
       idAutorString = Integer.toString(idAutor);
       
       titulo = post.getTitulo();
       texto = post.getTexto();
         
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
        <p>ERRO: <%= erro %></p>
        <% }%>

        <form method="POST">
            <p>Categoria <input type="number" name="idcategoria" 
                                value="<%=idCategoriaString %>"/></p>
            <p>Autor: <input type="number" name="idautor"
                             value="<%=idAutorString %>"/></p>
            <p>Título: <input type="text" name="titulo"
                              value="<%=titulo %>"/></p>
            <p>Texto: <textarea name="texto"><%=texto %></textarea></p>
            <p><input type="submit" value="Salvar" /></p>
        </form>
    </body>
</html>
