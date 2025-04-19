<title>Insert tweets  Data</title>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>


<%
					ArrayList list = new ArrayList();
					ServletContext context = getServletContext();
					String dirName =context.getRealPath("Gallery\\");
					String paramname=null;
					String file=null;
					String a=null,b=null,c=null,d=null,image=null;
					String ee[]=null;
					String checkBok=" ";
					int ff=0;
					String bin = "";
					String tname=null;     
					String desc=null;
					int rank=0;
					String sentiment=null;
					String uname=(String)session.getAttribute("user");
					
						if (uname== null) {
						    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
						}
						  

						PreparedStatement ps=null;
				
					FileInputStream fs=null;
					File file1 = null;	
					String type=request.getParameter("type");
					try {
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
						Enumeration params = multi.getParameterNames();
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							if(paramname.equalsIgnoreCase("tname"))
							{
								tname=multi.getParameter(paramname);
							}
							
							if(paramname.equalsIgnoreCase("desc"))
							{
								desc=multi.getParameter(paramname);
							}
							
													
							if(paramname.equalsIgnoreCase("pic"))
							{
								image=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("sentiment"))
							{
							    sentiment = multi.getParameter(paramname);
							    if (sentiment == null || sentiment.trim().isEmpty()) {
							        sentiment = "Neutral"; // Default value if sentiment is missing
							    }
							}
                           
						
						}
							
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = context.getRealPath("Gallery\\"+image);
								
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
							
								String ss=fPath;
								FileInputStream fis = new FileInputStream(ss);
								StringBuffer sb1=new StringBuffer();
								int i = 0;
						
							}		
						}
						FileInputStream fs1 = null;
						//name=dirName+"\\Gallery\\"+image;
						int lyke=0;
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
          ps = connection.prepareStatement("insert into tweets(tweeter, tname, image_path, description, date, `rank`,sentiment) values(?, ?, ?, ?, ?, ?,?)");
							ps.setString(1,uname);
							ps.setString(2,tname);
							ps.setString(3, "Gallery/" + (image != null ? image : ""));
							ps.setString(4,desc);	
							ps.setString(5,dt);
							ps.setInt(6,rank);		
						ps.setString(7, sentiment);
						int x=ps.executeUpdate();
						if(x>0)
						{
							request.setAttribute("msg","successfull");
							out.print("Tweet posted Successfully");
							
			%>
			<p><a href="U_AddTweets.jsp">Back</a>         <a href="U_Main.jsp">Home</a> </p>

			
			<%
					   }
			   
		}
					catch (Exception e) 
					{
						out.println(e.getMessage());
						e.printStackTrace();
					}finally {
					    // Close resources in finally block
					    try {
					        if (fs != null) {
					            fs.close();
					        }
					        if (ps != null) {
					            ps.close();
					        }
					    } catch (Exception ex) {
					        out.println("Error closing resources: " + ex.getMessage());
					    }
					}
				%>
