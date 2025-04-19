<%@ include file="connect.jsp" %>
<%
    String tweetId = request.getParameter("tweet_id");
    String userName =  (String) session.getAttribute("user");
	if (userName== null) {
	    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
	}
	  PreparedStatement checkPst = null, deletePst = null, deleteNotifPst = null, pst = null, tweetPst = null, notifPst = null;
	    ResultSet rs = null, tweetRs = null;
    
    try {
        // Check if already liked
        String checkSql = "SELECT * FROM tweet_likes WHERE tweet_id=? AND user_name=?";
       checkPst = connection.prepareStatement(checkSql);
        checkPst.setInt(1, Integer.parseInt(tweetId));
        checkPst.setString(2, userName);
         rs = checkPst.executeQuery();
        
        if(rs.next()) {
            // Remove like
            String deleteSql = "DELETE FROM tweet_likes WHERE tweet_id=? AND user_name=?";
             deletePst = connection.prepareStatement(deleteSql);
            deletePst.setInt(1, Integer.parseInt(tweetId));
            deletePst.setString(2, userName);
            deletePst.executeUpdate();
            
            // Remove notification
            String deleteNotifSql = "DELETE FROM tweet_notifications WHERE tweet_id=? AND from_user=? AND notification_type='like'";
           deleteNotifPst = connection.prepareStatement(deleteNotifSql);
            deleteNotifPst.setInt(1, Integer.parseInt(tweetId));
            deleteNotifPst.setString(2, userName);
            deleteNotifPst.executeUpdate();
        } else {
            // Add like
            String sql = "INSERT INTO tweet_likes(tweet_id, user_name) VALUES (?, ?)";
            pst = connection.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(tweetId));
            pst.setString(2, userName);
            pst.executeUpdate();
            
            // Get tweet owner
            String tweetSql = "SELECT tweeter FROM tweets WHERE id=?";
            tweetPst = connection.prepareStatement(tweetSql);
            tweetPst.setInt(1, Integer.parseInt(tweetId));
           tweetRs = tweetPst.executeQuery();
            
            if(tweetRs.next()) {
                String tweetOwner = tweetRs.getString("tweeter");
                // Add notification
                String notifSql = "INSERT INTO tweet_notifications(tweet_id, from_user, to_user, notification_type, message) VALUES (?, ?, ?, 'like', ?)";
                 notifPst = connection.prepareStatement(notifSql);
                notifPst.setInt(1, Integer.parseInt(tweetId));
                notifPst.setString(2, userName);
                notifPst.setString(3, tweetOwner);
                notifPst.setString(4, userName + " liked your tweet");
                notifPst.executeUpdate();
            }
        }
        
        response.sendRedirect("U_AllFriendsComm.jsp");
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }finally {
        // Close all resources safely
        try {
            if (rs != null) rs.close();
            if (tweetRs != null) tweetRs.close();
            if (checkPst != null) checkPst.close();
            if (deletePst != null) deletePst.close();
            if (deleteNotifPst != null) deleteNotifPst.close();
            if (pst != null) pst.close();
            if (tweetPst != null) tweetPst.close();
            if (notifPst != null) notifPst.close();
        } catch (Exception ex) {
            out.println("Error closing resources: " + ex.getMessage());
        }
    }
%>