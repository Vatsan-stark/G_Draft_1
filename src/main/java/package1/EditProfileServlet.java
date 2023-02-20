package package1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@MultipartConfig



public class EditProfileServlet extends HttpServlet {
	ConnectionClass c = new ConnectionClass();
	Connection con =c.Conect();
	private static final long serialVersionUID = 1L;
       
    


//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int userid=Integer.parseInt(session.getAttribute("id").toString());
		final String path="/Users/vatsan-pt7014/eclipse-workspace/G_Draft_1/src/main/webapp/GramImages/ProfilePictures";
		final Part fi=request.getPart("ProfilePicture");
		final String fileName = getFileName(fi,userid);
		OutputStream otpStream = null;  
        InputStream iptStream = null;  
        final PrintWriter writer = response.getWriter(); 
        try 
        {  
            otpStream = new FileOutputStream(new File(path + File.separator + fileName));  
            iptStream = fi.getInputStream();  
  
            int read = 0;  
              
            final byte[] bytes = new byte[1024];  
              
            while ((read = iptStream.read(bytes)) != -1) 
            {  
                otpStream.write(bytes, 0, read);  
                
            }  
            String newfilename="GramImages/ProfilePictures/"+fileName;
            uploadProfile(newfilename, userid);
            
            response.sendRedirect("profile.jsp");
        }  catch (FileNotFoundException fne)
        {  
            writer.println("You either did not specify a file to upload or are trying to upload a file to a protected or nonexistent location.");  
            writer.println("<br/> ERROR: " + fne.getMessage()); 
            writer.println("<a href=newpost.jsp> try again</a> "); 
        }
        finally 
        {  
            if (otpStream != null) 
            {  
                otpStream.close();  
            }  
            if (iptStream != null) 
            {  
                iptStream.close();  
            }  
            if (writer != null) 
            {  
                writer.close();  
            }  
        }  
        
		
	}
	private boolean uploadProfile(String filename,int userid) {
		try {
			PreparedStatement ps = con.prepareStatement("update users  set profile_picture=? where id=?;");
			ps.setString(1, filename);
			ps.setInt(2, userid);
			ps.executeUpdate();
			System.out.println("dp update successfully");
			return  true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	private String getFileName(final Part part,int userid) 
	{  
	    final String partHeader = part.getHeader("content-disposition");  
	    System.out.println(partHeader);
	     String dp=userid+"profile";
	    for (String content : part.getHeader("content-disposition").split(";")) 
	    {  
	        if (content.trim().startsWith("filename")) 
	        {  
	            return dp+content.substring(content.indexOf('.')).trim().replace("\"", "");  	
	        }  
	    }  
	    return null;  
	}  

}
