package com.control.nlp;


import edu.stanford.nlp.pipeline.*;
import java.util.Properties;

public class StanfordNLPProcessor {
    private static StanfordCoreNLP pipeline;

    // Private constructor to prevent multiple instances
    private StanfordNLPProcessor() {}

    // Public method to get the single instance of the pipeline
    public static StanfordCoreNLP getPipeline() {
        if (pipeline == null) {
            synchronized (StanfordNLPProcessor.class) { // Ensure thread safety
                if (pipeline == null) {
                    System.out.println("Loading Stanford NLP Model...");
                    Properties props = new Properties();
                    props.setProperty("annotators", "tokenize, ssplit, pos, lemma, parse, sentiment");
                    pipeline = new StanfordCoreNLP(props);
                    System.out.println("Stanford NLP Model Loaded Successfully.");
                }
            }
        }
        return pipeline;
    }
}
