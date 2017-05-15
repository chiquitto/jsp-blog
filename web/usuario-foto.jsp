<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.dao.AdminDao"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.vo.Admin"%>
<%@page import="util.Util"%>
<%@page import="br.com.chiquitto.aula.jdbcblog.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="testarLogin.jsp" %>
<%    Util.iniciarConexao();
    AdminDao dao = new AdminDao();

    String idUsuarioString = request.getParameter("id");
    int idUsuario = Integer.parseInt(idUsuarioString);

    Admin adminVo = (Admin) dao.getOne(idUsuario);

    String nome = adminVo.getNome();

    String erro = "";

    if (request.getMethod() == "POST") {
        // https://www.tutorialspoint.com/jsp/jsp_file_uploading.htm

        File file;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;
        ServletContext context = pageContext.getServletContext();
        String filePath = context.getInitParameter("file-upload");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List fileItems = upload.parseRequest(request);

            Iterator i = fileItems.iterator();

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();

                if (!fi.isFormField()) {
                    String arquivoNome = "/usuario" + adminVo.getIdpessoa() + ".jpg";
                    file = new File(filePath + arquivoNome);
                    fi.write(file);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuário - Foto</title>

        <%@ include file="css.jsp" %>
    </head>
    <body>
        <h1>Foto usuário</h1>

        <%@ include file="menu.jsp" %>

        <% if (erro.isEmpty() == false) {%>
        <p>ERRO: <%= erro%></p>
        <% }%>

        <form method="POST" enctype="multipart/form-data">
            <p>Nome: <strong><%= nome%></strong></p>
            <p>Foto: <img src="${pageContext.request.contextPath}/upload/usuario<%= idUsuario %>.jpg?x=<%= new Date() %>" /></p>
            <p><input type="file" name="arquivo" /></p>
            <p><input type="submit" value="Salvar" /></p>
        </form>
    </body>
</html>
