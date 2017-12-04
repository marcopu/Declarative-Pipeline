<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Creazione Ticket</title>
    </head>
    <body>
        <h2>Crea il tuo Ticket</h2>
        <form method="POST" action="tickets" enctype="multipart/form-data">
            <input type="hidden" name="action" value="create"/>
            Owner<br/>
            <input type="text" name="customerName"><br/><br/>
            Nome Ticket<br/>
            <input type="text" name="subject"><br/><br/>
            Contenuto<br/>
            <textarea name="body" rows="5" cols="30"></textarea><br/><br/>
            <b>Allegati</b><br/>
            <input type="file" name="file1"/><br/><br/>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
