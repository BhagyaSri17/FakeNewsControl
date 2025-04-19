package com.control.onnx;



import ai.djl.huggingface.tokenizers.HuggingFaceTokenizer;
import ai.onnxruntime.*;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Collections;
import java.util.Map;

@WebListener
public class ONNXModelLoader implements ServletContextListener {
    private static OrtEnvironment env;
    private static OrtSession session;
    private static HuggingFaceTokenizer tokenizer;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            String modelPath = "C:\\Users\\bhagy\\Eclipse Work Space Projects\\Nlp\\src\\main\\webapp\\WEB-INF\\lib\\fake_news_model1.onnx";
            String tokenizerPath = "bert-base-uncased"; // DJL auto-downloads

            env = OrtEnvironment.getEnvironment();
            OrtSession.SessionOptions options = new OrtSession.SessionOptions();
            session = env.createSession(modelPath, options);

            tokenizer = HuggingFaceTokenizer.newInstance(tokenizerPath);

            // Store in servlet context for reuse
            sce.getServletContext().setAttribute("onnxEnv", env);
            sce.getServletContext().setAttribute("onnxSession", session);
            sce.getServletContext().setAttribute("onnxTokenizer", tokenizer);

            System.out.println("ONNX Model and Tokenizer Loaded Successfully");

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load ONNX model or tokenizer", e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            if (session != null) session.close();
            if (env != null) env.close();
            System.out.println("ONNX Resources Released");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
