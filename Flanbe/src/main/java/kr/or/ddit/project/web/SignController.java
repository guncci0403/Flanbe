package kr.or.ddit.project.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("sign")
@Controller
public class SignController {
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);

	@RequestMapping(path="saveSign" , method = RequestMethod.POST)
	public String saveImage(@RequestParam(value="file" , required = true) MultipartFile file , Model model  ) {
		//서버로 무사히 넘어오는지 확인
		logger.debug("fileName 파일 이름 확인 : {} " , file.getOriginalFilename());
		logger.debug("fileSize 파일 확인 : {} " , file.getSize()); 
		
		String fileName = file.getOriginalFilename();
		String realFileName = UUID.randomUUID().toString() + ".png";
		
		logger.debug("fileName 파일 이름 확인 : {} " , file.getOriginalFilename());
		logger.debug("realFileName 파일 확인 : {} " , realFileName); 
		try {
			file.transferTo(new File("d:\\upload\\" + realFileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//이건 경로 (파일이 저장된 경로와 이름)
		String pathName = "d:\\upload\\" + realFileName;
		//경로 + 저장파일이름 ,id 를 db에 저장해줌. 
		
		
		
		
		//model.addAttribute("realFileName", realFileName);
		//model.addAttribute("pathName", pathName);
		model.addAttribute("id", "sally");
		
		return "jsonView";
	}
	@RequestMapping("viewSign")
	public void viewSign(String id , HttpServletResponse resp) {
		//db 에서 id랑 id 에 대한 내용 가져오기 
		// FILEPATH 나 FILENAME 가져와서ㅓ 경로 마련해주기
		String path = ""; 
		path = "d:\\upload\\6471b551-9840-46a6-b6c8-890052c9cc4d.png";
		
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos =  resp.getOutputStream();
			
			byte[] buff = new byte[512];
			
			while(fis.read(buff) != -1) {
				sos.write(buff);
			}
			
			fis.close();
			sos.close();
			
		}catch(Exception e) {	
			e.printStackTrace();
		}
		
	
	}
}
