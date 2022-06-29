<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String driverName = "org.sqlite.JDBC";
    String connectionUrl = "jdbc:sqlite:C:\\HitTastic\\HitTastic_Songs.db";
    String userId = "root";
    String password = "root";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<h2 align="center">HitTastic Music Database:</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
    <tr>

    </tr>
    <tr>
        <td><b>Song ID</b></td>
        <td><b>Song Title</b></td>
        <td><b>Song Artist</b></td>
        <td><b>Song Price</b></td>
        <td><b>Song Sales</b></td>
    </tr>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl, userId, password);
            statement=connection.createStatement();
            String sql ="SELECT * FROM Songs";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
    %>
    <tr>

        <td><%=resultSet.getString("Song_ID") %></td>
        <td><%=resultSet.getString("Song_Artist") %></td>
        <td><%=resultSet.getString("Song_Title") %></td>
        <td><%=resultSet.getString("Song_Price") %></td>
        <td><%=resultSet.getString("Song_Sales") %></td>

    </tr>

    <%
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>