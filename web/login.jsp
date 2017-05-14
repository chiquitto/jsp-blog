<%@page import="br.com.chiquitto.aula.jdbcblog.exception.ValidationFailedException"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.exception.RowNotFoundException"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Admin"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.AdminDao"%>
<%@page import="util.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String erro = "";
    
    String email = "";
    String senha = "";

    if (request.getMethod() == "POST") {
        
        email = request.getParameter("email");
        senha = request.getParameter("senha");
        
        Admin admin = new Admin();
        admin.setEmail(email);
        admin.setSenha(senha);
        
        Util.iniciarConexao();
        
        AdminDao dao = new AdminDao();
        
        try {
            admin = dao.login(admin);
            
            request.getSession().setAttribute("adminId", admin.getIdpessoa());
            request.getSession().setAttribute("adminNome", admin.getNome());
            response.sendRedirect("index.jsp");
        } catch (RowNotFoundException e) {
            erro = "Login/Senha incorretos.";
        } catch (ValidationFailedException e) {
            erro = "Login/Senha incorretos.";
        }
        
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        <%@ include file="css.jsp" %>
    </head>
    <body>

        <% if (erro.isEmpty() == false) {%>
        <p>ERRO: <%= erro%></p>
        <% }%>

        <form method="POST">
            <p>Email: <input type="email" name="email" /></p>
            <p>Senha: <input type="password" name="senha" /></p>
            <p><input type="submit" value="Entrar" /></p>
        </form>
    </body>
</html>
