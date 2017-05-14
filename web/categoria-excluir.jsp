<%@page import="util.Util"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Categoria"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.CategoriaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%
    
    Util.iniciarConexao();

    // Pegar o ID enviado pelo usuario
    String idParam = request.getParameter("id");
    
    // Converter o ID em Inteiro
    int id = Integer.parseInt(idParam);
    
    // Instanciar DAO
    CategoriaDao dao = new CategoriaDao();
    
    // Apagar Categoria
    Categoria categoria = new Categoria();
    categoria.setIdcategoria(id);
    dao.apagar(categoria);
    
    // Enviar usuario para tela categorias
    response.sendRedirect("categorias.jsp");
    
%>