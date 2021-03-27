package kr.or.ddit.view;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.user.model.UserVo;


public class ExcelDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setContentType("application/vnd.ms-excel; charset=utf-8");
		String fileName = URLEncoder.encode("참여자.xlsx", "UTF-8");
		response.setHeader("Content-Disposition", "attachement; filename="+fileName);
		
		List<String> header = (List<String>) model.get("header");
		List<UserVo> data = (List<UserVo>)model.get("data");
		
		XSSFWorkbook book = new XSSFWorkbook();
		Sheet sheet = book.createSheet("사용자들");
		
		int rownum = 0;
		int colnum = 0;
		
		Row row = sheet.createRow(rownum++);
		
		for(String h : header) {
			Cell cell = row.createCell(colnum++);
			cell.setCellValue(h);
		}
		
		for(UserVo user : data) {
			colnum = 0;
			Row r = sheet.createRow(rownum++);
			r.createCell(colnum++).setCellValue(user.getUser_id());
			r.createCell(colnum++).setCellValue(user.getUser_nm());
			r.createCell(colnum++).setCellValue(user.getEmail());
			r.createCell(colnum++).setCellValue(user.getPhone());
		}
		
		book.write(response.getOutputStream());
		
	}
}
