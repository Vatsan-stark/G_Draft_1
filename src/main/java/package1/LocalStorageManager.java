package package1;

import java.io.File;


public class LocalStorageManager {
	
	
	public void createNewDir(int id) {
		String path="/Users/vatsan-pt7014/eclipse-workspace/G_Draft_1/src/main/webapp/GramImages/";
		File dirName = new File(path+id);
		if(dirName.mkdir())
		System.out.println("new user Signed-up new directory created successfully");
		
	}
	public void deleteDir(int id) {
		String path="/Users/vatsan-pt7014/eclipse-workspace/G_Draft_1/src/main/webapp/GramImages/";
		File dirName = new File(path+id);
		deleteDirectory(dirName);
		if(dirName.delete());
			System.out.println("user specific directory deleted successfully");
	}

	public static void deleteDirectory(File file)
    {
		
        
        for (File subfile : file.listFiles()) {
 
            
            if (subfile.isDirectory()) 
            {
                deleteDirectory(subfile);
            }
 
            subfile.delete();
        }
    }
}
