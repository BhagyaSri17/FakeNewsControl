<%@ page import="java.util.*" %>
<%@ page import="edu.stanford.nlp.pipeline.*" %>
<%@ page import="edu.stanford.nlp.pipeline.CoreSentence" %>
<%@ page import="edu.stanford.nlp.pipeline.CoreDocument" %>
<%@ page import="com.control.nlp.StanfordNLPProcessor" %> <!-- Import Java Class -->

<%! 
    public String analyzeSentiment(String text) {
        // Get the NLP pipeline instance from the Singleton class
        StanfordCoreNLP pipeline = StanfordNLPProcessor.getPipeline(); 

        CoreDocument doc = new CoreDocument(text);
        pipeline.annotate(doc);

        int positiveCount = 0, negativeCount = 0, neutralCount = 0;

        for (CoreSentence sentence : doc.sentences()) {
            String sentiment = sentence.sentiment();
      
            if (sentiment.equalsIgnoreCase("Positive") || sentiment.equalsIgnoreCase("Very positive")) {
                positiveCount++;
            } else if (sentiment.equalsIgnoreCase("Negative") || sentiment.equalsIgnoreCase("Very negative")) {
                negativeCount++;
            } else {
                neutralCount++;
            }

        }

        // Prioritize negative sentiment
        if (negativeCount > 0) {
            return "Negative";
        } else if (positiveCount > 0) {
            return "Positive";
        } else {
            return "Neutral";
        }
    }
%>
