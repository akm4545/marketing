package marketing.file.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FileController {
	
	@javax.annotation.Resource(name = "jobLauncher")
	JobLauncher jobLauncher;
	
	@javax.annotation.Resource(name = "csvJob")
	Job csvJob;
	
	@RequestMapping(value = "/guideDownload", method = RequestMethod.GET, produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public void guideDownload(@RequestHeader("User-Agent")String agent, HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse){
		String saveDir = httpServletRequest.getSession().getServletContext().getRealPath("/guide");
		String fileName = "상권정보시스템매뉴얼.pdf";
		
		File guideFile = new File(saveDir + "/" + fileName);
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		try { 
			fis = new FileInputStream(guideFile);
			bis = new BufferedInputStream(fis);
			sos = httpServletResponse.getOutputStream();
			
			if(agent.contains("Trident")) {
				fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", " ");			
			} else if(agent.contains("Edge")) {
				fileName = URLEncoder.encode(fileName, "UTF-8");			
			} else {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");			
			}
			
			httpServletResponse.setContentType("application/octet-stream;charset=utf-8");
			httpServletResponse.addHeader("Content-Disposition", "attachment; filename=" + fileName);
			httpServletResponse.setContentLength((int)guideFile.length());
			
			int read = 0;
			
			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
		}catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				sos.close(); bis.close(); 
			}catch (IOException e) {
				e.printStackTrace(); 
			}
		}
	}
	
	//xml에 경로를 동적으로 바꾸는 방법을 몰라 파일 업로드 후 읽는 방식은 폐기
	/*@RequestMapping(value = "/excelFileUpload", method = RequestMethod.POST)
	public String excelFileUpload(HttpServletRequest request) throws FileUploadException{
		File saveDir = new File("D:\\");
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(saveDir);
		fileItemFactory.setSizeThreshold(1024 * 1024);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try {
			List<FileItem> items = fileUpload.parseRequest(request);
			for(FileItem item : items) {
				if(!item.isFormField()) {
					if(item.getSize() > 0) {
						String separator = File.separator;
						int index = item.getName().lastIndexOf(separator);
						String fileName = item.getName().substring(index + 1);
						File uploadFile = new File("D:\\" + fileName);
						
						item.write(uploadFile);
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	} */
	
	@RequestMapping(value = "/csvToDB", method = RequestMethod.GET)
	public String csvToDB () throws Exception{
		System.out.println("a");
		jobLauncher.run(csvJob, new JobParameters());
		
		return "index";
	}
}
