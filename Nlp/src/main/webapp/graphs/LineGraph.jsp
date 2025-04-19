<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/connect.jsp" %>
<%@ page import="java.util.stream.Collectors" %>


<%
    List<String> dateList = new ArrayList<>();
    List<Integer> countList = new ArrayList<>();

    try {

        // Extract date portion from 'date' text field
        String query = "SELECT SUBSTRING(date, 1, 10) AS date, COUNT(*) AS count " +
                       "FROM tweets WHERE sentiment = 'negative' " +
                       "GROUP BY SUBSTRING(date, 1, 10)";
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            dateList.add("'" + rs.getString("date") + "'"); 
            countList.add(rs.getInt("count"));
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Line Graph - Negative Tweets Over Time</title>
<script src="<%= request.getContextPath() %>/sources/chart.umd.js"></script>
</head>
<body>
    <canvas id="lineGraph" width="600" height="300"></canvas>

    <script>
        const ctx = document.getElementById('lineGraph').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: [<%= String.join(",", dateList) %>], // Dates
                datasets: [{
                    label: 'Negative Tweets',
                    data: [<%= countList.stream()
                        .map(String::valueOf)    // Convert integers to strings
                        .collect(Collectors.joining(",")) %>]         ,
                        borderColor: '#00A8CC',
                    backgroundColor: 'rgba(178, 241, 255, 0.6)',
                    fill: true
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Negative Tweets Trend' }
                },
                scales: {
                    x: { title: { display: true, text: 'Date' } },
                    y: { title: { display: true, text: 'Negative Tweet Count' } }
                }
            }
        });
    </script>
</body>
</html>
