<%@ page contentType="image/jpeg" buffer="none" trimDirectiveWhitespaces="true" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.io.*, java.nio.file.*, java.sql.*" %>

<%
    String tweetIdParam = request.getParameter("tweet_id");

    if (tweetIdParam == null || tweetIdParam.trim().isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Tweet ID parameter.");
        return;
    }
    PreparedStatement ps=null;
    ResultSet rs=null;
    try {
        int tweetId = Integer.parseInt(tweetIdParam);

        String sql = "SELECT image_path FROM tweets WHERE id = ?";
         ps = connection.prepareStatement(sql);
        ps.setInt(1, tweetId);
 rs = ps.executeQuery();

        if (rs.next()) {
            String imagePath = rs.getString("image_path");

            if (imagePath != null) {
                File imageFile = new File(application.getRealPath("/") + imagePath);

                if (imageFile.exists()) {
                    response.reset();
                    response.setContentType("image/jpeg");

                    Files.copy(imageFile.toPath(), response.getOutputStream());
                    response.getOutputStream().flush();
                    response.flushBuffer();
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image file not found.");
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image path not found.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No data found.");
        }

        rs.close();
        ps.close();
    } catch (NumberFormatException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Tweet ID format.");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error displaying image.");
    }
    finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
