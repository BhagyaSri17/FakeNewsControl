package com.control.onnx;


import ai.djl.huggingface.tokenizers.HuggingFaceTokenizer;
import ai.onnxruntime.*;

import javax.servlet.ServletContext;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;

public class ONNXModelInference {

    public static String predict(ServletContext context, String text) throws OrtException {
        // Fetch preloaded model and tokenizer
        OrtEnvironment env = (OrtEnvironment) context.getAttribute("onnxEnv");
        OrtSession session = (OrtSession) context.getAttribute("onnxSession");
        HuggingFaceTokenizer tokenizer = (HuggingFaceTokenizer) context.getAttribute("onnxTokenizer");
        session.getInputInfo().keySet().forEach(System.out::println);

        if (env == null || session == null || tokenizer == null) {
            throw new IllegalStateException("ONNX Model is not initialized. Check ServletContextListener.");
        }

        // Tokenize input text
        Map<String, OnnxTensor> inputs = tokenizeText(env, tokenizer, text);

        // Run inference
        OrtSession.Result result = session.run(inputs);
        OnnxValue outputValue = result.get(0);
        float[][] outputArray = (float[][]) outputValue.getValue();

        // Debugging: Print raw output values
        System.out.println("Raw Model Output: " + Arrays.toString(outputArray[0]));

        // Apply softmax
        float[] probabilities = softmax(outputArray[0]);

        // Get predicted label
        int prediction = argMax(probabilities);
        String[] labels = {"Real News", "Fake News"};

        return labels[prediction];
    }

    private static Map<String, OnnxTensor> tokenizeText(OrtEnvironment env, HuggingFaceTokenizer tokenizer, String text) throws OrtException {
        int maxLength = 13;
        long[] tokenIds = tokenizer.encode(text).getIds();

        long[] inputIds = new long[maxLength];
        int length = Math.min(tokenIds.length, maxLength);
        System.arraycopy(tokenIds, 0, inputIds, 0, length);

        OnnxTensor inputTensor = OnnxTensor.createTensor(env, new long[][]{inputIds});
        return Collections.singletonMap("input", inputTensor);
    }

    private static float[] softmax(float[] logits) {
        float maxLogit = Float.NEGATIVE_INFINITY;
        for (float logit : logits) maxLogit = Math.max(maxLogit, logit);

        float[] expValues = new float[logits.length];
        float sumExp = 0.0f;
        for (int i = 0; i < logits.length; i++) {
            expValues[i] = (float) Math.exp(logits[i] - maxLogit);
            sumExp += expValues[i];
        }

        for (int i = 0; i < logits.length; i++) {
            expValues[i] /= sumExp;
        }
        return expValues;
    }

    private static int argMax(float[] array) {
        int maxIndex = 0;
        for (int i = 1; i < array.length; i++) {
            if (array[i] > array[maxIndex]) maxIndex = i;
        }
        return maxIndex;
    }
}
