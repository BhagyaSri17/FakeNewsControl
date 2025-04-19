<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ include file="/connect.jsp" %>

<%
    List<String> userList = new ArrayList<>();
    List<Integer> countList = new ArrayList<>();

    try {
        

        String query = "SELECT username, negativeCount FROM negative_post_tracker ORDER BY negativeCount DESC LIMIT 5";
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            userList.add("'" + rs.getString("username") + "'");  // Add quotes for correct JS array format
            countList.add(rs.getInt("negativeCount"));
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User-Based Bar Graph - Top Negative Posters</title>
    <script src="<%= request.getContextPath() %>/sources/chart.umd.js"></script>
</head>
<body>
    <canvas id="userBarGraph" width="600" height="300"></canvas>

    <script>
        const ctx = document.getElementById('userBarGraph').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [<%= String.join(",", userList) %>],   // Usernames
                datasets: [{
                    label: 'Negative Tweets',
                    data: [<%= countList.stream().map(String::valueOf).collect(Collectors.joining(",")) %>],
                    backgroundColor: '#00A8CC'
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Top 5 Users with Most Negative Tweets' }
                },
                scales: {
                    y: { beginAtZero: true, suggestedMax: 10 }
                }
            }
        });
    </script>
</body>
</html>
