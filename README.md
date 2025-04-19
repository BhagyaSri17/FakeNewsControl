# Control Mechanism for Managing Information Spread in Online Social Networks

## **Project Overview**
This project aims to detect and control the spread of misinformation and negative content on social media platforms using Natural Language Processing and a machine learning model. It combines user and admin functionalities with strategies to manage and limit the spread of harmful content.



### **User Module**
- Post tweets.
- View tweets from friends.
- Retweet posts.
- Receive warnings when posting negative content.

### **Admin Module**
- Authorize users.
- View all tweets and retweets.
- Filter and view tweets based on sentiment (positive/negative).
- Analyze information spread using graphs:
    - **Line Graph**: Tracks negative tweets over time.
    - **Stacked Bar Graph**: Compares positive vs. negative tweets and retweets.
    - **User-Based Bar Graph**: Highlights top users with most negative content.
- Search users and view detailed sentiment-based tweet history.
- Block users based on repeated negative posting.
- View positive and negative retweets for each tweet.

## **Technologies Used**
- **Frontend**: HTML, CSS, JavaScript  
- **Backend**: Java (JSP)  
- **Database**: MySQL  
- **Machine Learning Model**: BERT Base Uncased model fine-tuned on the FakeNewsNet dataset, exported to ONNX format  
- **Model Integration**: ONNX Runtime with Java  
- **NLP Library**: Stanford CoreNLP for sentiment analysis  

## **Control Strategies Implemented**
- **Warning**: Alerts users about negative sentiment in their tweets.  
- **Correction**:Blocks tweet submission until negative content is revised.


## **System Requirements**
- **Java Version**: 1.8  
- **Apache Tomcat**: Version 9  
- **MySQL**: Recommended version 5.7 or higher  
- **Eclipse**: With Dynamic Web Project support  

## **How to Run**
1. Import the project into Eclipse as a Dynamic Web Project.  
2. Set up MySQL and import the provided database schema.  
3. Make sure the ONNX model file is placed in the correct path as specified in the Java code.  
4. Right-click on the Dynamic Web Project, click on **Properties**, then **Project Facets**:  
      - Enable **Dynamic Web Module** and set version to **3.1**.  
      - Set **Java** to **1.8**.  
      - Set **JavaScript** to **1.0**.  
   
5. In the **Project Facets** section, select **Tomcat 9** under **Runtimes**, then click **Apply** and **Apply and Close**.  
6. Add the **MySQL Connector** to the project through the build path.  
7. Configure the database connection in your Java backend using JDBC.  
8. Deploy the project on **Apache Tomcat 9**.  
9. Launch the application in a browser and log in as a user or admin.
<br>
<br>
