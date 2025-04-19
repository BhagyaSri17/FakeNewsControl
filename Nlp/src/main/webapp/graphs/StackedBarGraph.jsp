<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ include file="/connect.jsp" %>

<%
int positiveTweets = 0, negativeTweets = 0, neutralTweets = 0;
int positiveRetweets = 0, negativeRetweets = 0;


    try {
    

        // Tweets Data
        String tweetQuery = "SELECT sentiment, COUNT(*) AS count FROM tweets GROUP BY sentiment";
     
        ResultSet rs1 = connection.prepareStatement(tweetQuery).executeQuery();
  
   
        while (rs1.next()) {
        
            String sentiment = rs1.getString("sentiment").trim(); // Handles extra spaces
         
            

            if (sentiment.equalsIgnoreCase("Positive")) {
                positiveTweets = rs1.getInt("count");
            } else if (sentiment.equalsIgnoreCase("Negative")) {
                negativeTweets = rs1.getInt("count");
            } else if (sentiment.equalsIgnoreCase("Neutral")) {
                neutralTweets = rs1.getInt("count");  // Add this only if you want to track Neutral
            }
 
        }

        // Retweets Data
        String retweetQuery = "SELECT sentiment, COUNT(*) AS count FROM retweets GROUP BY sentiment";
        ResultSet rs2 = connection.prepareStatement(retweetQuery).executeQuery();
        while (rs2.next()) {
            if (rs2.getString("sentiment").equalsIgnoreCase("Positive")) {
                positiveRetweets = rs2.getInt("count");
            } else if (rs2.getString("sentiment").equalsIgnoreCase("Negative")) {
                negativeRetweets = rs2.getInt("count");
            }
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Stacked Bar Graph - Tweets & Retweets</title>
<script src="<%= request.getContextPath() %>/sources/chart.umd.js"></script>
</head>
<body>

    <canvas id="stackedBarGraph" width="600" height="300"></canvas>

    <script>
        const ctx = document.getElementById('stackedBarGraph').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Tweets', 'Retweets'],
                datasets: [
                    {
                        label: 'Positive',
                        data: [<%= positiveTweets %>, <%= positiveRetweets %>],
                        backgroundColor: '#00A8CC'
                    },
                    {
                        label: 'Negative',
                        data: [<%= negativeTweets %>, <%= negativeRetweets %>],
                        backgroundColor: '	#FF6F61'
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Positive vs. Negative - Tweets & Retweets' }
                },
                scales: {
                    x: { stacked: true },
                    y: { stacked: true, beginAtZero: true }
                }
            }
        });
    </script>
</body>
</html>