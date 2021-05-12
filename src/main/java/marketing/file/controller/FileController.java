package marketing.file.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FileController {
	
	@Resource(name = "jobLauncher")
	JobLauncher jobLauncher;
	
	@Resource(name = "csvJob")
	Job csvJob;
	
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
