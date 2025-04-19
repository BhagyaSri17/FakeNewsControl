<%@ page import="java.io.*, java.util.*" %>
<%@ include file="NLPmodel.jsp" %>

<%
    // Define input and output file paths (Use double backslashes in Windows)
    String inputFilePath = "C:\\Users\\bhagy\\Downloads\\test_100_samples.csv"; 
    String outputFilePath = "C:\\Users\\bhagy\\Downloads\\NLP_predict.csv";

    File inputFile = new File(inputFilePath);
    File outputFile = new File(outputFilePath);

    if (inputFile.exists()) {
        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile));

        // Read the header from CSV file
        String header = reader.readLine();
        writer.write(header + ",Predicted_Sentiment"); // Append new column for sentiment
        writer.newLine();

        String line;
        while ((line = reader.readLine()) != null) {
            // Split CSV line to extract text data (Assuming text is in the first column)
            String[] columns = line.split(",");
            if (columns.length > 0) {
                String text = columns[0].replaceAll("\"", ""); // Remove double quotes if any
                String sentiment = analyzeSentiment(text);
                writer.write(line + "," + sentiment); // Append sentiment to original row
                writer.newLine();
            }
        }

        reader.close();
        writer.close();
        
        out.println("Sentiment analysis completed! Check in downloads");
    } else {
        out.println("Input file not found.");
    }
%>
