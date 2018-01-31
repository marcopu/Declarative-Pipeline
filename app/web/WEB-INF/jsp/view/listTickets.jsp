<%@ page session="false" import="java.util.Map" %>
<%
    @SuppressWarnings("unchecked")
    Map<Integer, Ticket> ticketDatabase =
            (Map<Integer, Ticket>)request.getAttribute("ticketDatabase");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consoft</title>
    </head>
    <body>
        <h2>Consoft Tickets</h2>
        <a href="<c:url value="/tickets">
            <c:param name="action" value="create" />
        </c:url>">Crea il tuo Ticket</a><br /><br />
        <%
            if(ticketDatabase.size() == 0)
            {
                %><i>Non e' presente alcun Ticket.</i><%
            }
            else
            {
                for(int id : ticketDatabase.keySet())
                {
                    String idString = Integer.toString(id);
                    Ticket ticket = ticketDatabase.get(id);
                    %>Ticket #<%= idString %>: <a href="<c:url value="/tickets">
                        <c:param name="action" value="view" />
                        <c:param name="ticketId" value="<%= idString %>" />
                    </c:url>"><%= ticket.getSubject() %></a> (Creato da:
        <%= ticket.getCustomerName() %>)<br /><%
                }
            }
        %>
    </body>
</html>
