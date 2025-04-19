<title>Insert Data</title>
<%@page
	import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.Date"%>


<%
ArrayList list = new ArrayList();
ServletContext context = getServletContext();
String dirName = context.getRealPath("Gallery\\");
String paramname = null;
String file = null;
String a = null, b = null, c = null, d = null, image = null;
String ee[] = null;
String checkBok = " ";
int ff = 0;
String bin = "";
String uname = null;
String pass = null;
String email = null;
String mno = null;
String addr = null;
String dob = null;
String location = null;
String sk = "Rejected";
String gender = null;
String network = null;
String pincode = null;
String utype = null;

FileInputStream fs = null;
File file1 = null;
String type = request.getParameter("type");
Statement st1 =null;
ResultSet rs1=null;
try {
	MultipartRequest multi = new MultipartRequest(request, dirName, 10 * 1024 * 1024); // 10MB

	Enumeration params = multi.getParameterNames();
	while (params.hasMoreElements()) {
		paramname = (String) params.nextElement();
		if (paramname.equalsIgnoreCase("userid")) {
	uname = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("pass")) {
	pass = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("email")) {
	email = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("mobile")) {
	mno = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("address")) {
	addr = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("dob")) {
	dob = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("gender")) {
	gender = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("pincode")) {
	pincode = multi.getParameter(paramname);
		}
		if (paramname.equalsIgnoreCase("network")) {
	network = multi.getParameter(paramname);
		}

		if (paramname.equalsIgnoreCase("pic")) {
	image = multi.getParameter(paramname);
	if (image == null) {
		out.print("Image upload failed. Please try again.");
		return;
	}

		}

	}


	int f = 0;
	Enumeration files = multi.getFileNames();
	while (files.hasMoreElements()) {
		paramname = (String) files.nextElement();

		if (paramname != null) {
	f = 1;
	image = multi.getFilesystemName(paramname);
	String fPath = context.getRealPath("Gallery\\" + image);
	file1 = new File(fPath);
	fs = new FileInputStream(file1);
	list.add(fs);

	String ss = fPath;
	FileInputStream fis = new FileInputStream(ss);
		}
		FileInputStream fs1 = null;
		//name=dirName+"\\Gallery\\"+image;
		int lyke = 0;
		//String as="0";
		//image = image.replace(".", "_b.");

		String query1 = "select * from user  where username='" + uname + "'";
		st1 = connection.createStatement();
		 rs1 = st1.executeQuery(query1);

		if (rs1.next()) {
	out.print("User Name Already Exist");
%>
<p>
	<a href="U_Login.jsp">Click here to Login</a> <a href="index.html">Home</a>
</p>


<%
} else {
String status = "waiting";
PreparedStatement ps = connection.prepareStatement(
		"insert into user(username,password,email,mobile,dob,gender,address,pincode,network,status,image_path) values(?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1, uname);
ps.setString(2, pass);
ps.setString(3, email);
ps.setString(4, mno);
ps.setString(5, dob);
ps.setString(6, gender);
ps.setString(7, addr);
ps.setString(8, pincode);
ps.setString(9, network);

ps.setString(10, status);

ps.setString(11, "Gallery/" + image);
int x = ps.executeUpdate();
if (x > 0) {
    request.setAttribute("msg", "successfull");
    out.print("Registered Successfully");
%>
<p>
    <a href="U_Login.jsp">Click here to Login</a> 
    <a href="index.html">Home</a>
</p>
<%
}}}}
catch (Exception e) {
    out.println(e.getMessage());
    e.printStackTrace();
}
finally {
    try {
        if (rs1 != null) rs1.close();
        if (st1 != null) st1.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
