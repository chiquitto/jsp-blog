<%
if (session.getAttribute("adminId") == null) {
    session.invalidate();
    response.sendRedirect("login.jsp");
}
%>