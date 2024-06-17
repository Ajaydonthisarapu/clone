package com.raj.utill;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;

import com.raj.entity.CitizenEntity;
import com.raj.repo.CitizenPalnRepository;

@Component
public class ExcelGenerator {
	
	private CitizenPalnRepository ctRepo;
	@SuppressWarnings("resource")
	public void genaretor(HttpServletResponse response,List<CitizenEntity> list, File file)throws IOException{
		Workbook workbook = new HSSFWorkbook();
		 Sheet sheet = workbook.createSheet("Plans-Data");
		
		 Row headerRow = sheet.createRow(0);
		 headerRow.createCell(0).setCellValue("Id");
		 headerRow.createCell(1).setCellValue("Citizen Name");
		 headerRow.createCell(2).setCellValue("Plan Name");
		 headerRow.createCell(3).setCellValue("Plan Status");
		 headerRow.createCell(4).setCellValue("Plan Start Date");
		 headerRow.createCell(5).setCellValue("PlanEnd Date");
		 headerRow.createCell(6).setCellValue("Benefit Amt");
		// List<CitizenEntity> list = planRepo.findAll();
		 int dataRowIndex=1;
		 if(!list.isEmpty()) {
		 for( CitizenEntity plan : list) {
		 Row dataRow = sheet.createRow(dataRowIndex);
		 
		 dataRow.createCell(0).setCellValue(plan.getCitizenId());
		 dataRow.createCell(1).setCellValue(plan.getCitizenName());
		 dataRow.createCell(2).setCellValue(plan.getPlanNames());
		 dataRow.createCell(3).setCellValue(plan.getPlanStatus());
		 if(null != plan.getPlanStartDate()) {
			 dataRow.createCell(4).setCellValue(plan.getPlanStartDate()+"");
		 }
		 else{
			 dataRow.createCell(4).setCellValue("N/A");
			 
		 }
		 if(null !=plan.getPlanEndDate()) {
			 
			 dataRow.createCell(5).setCellValue(plan.getPlanEndDate()+" ");
		 }
		 else {
			 dataRow.createCell(5).setCellValue("N/A");
		 }
		
		 if(null !=plan.getBenifiAmmount())  dataRow.createCell(6).setCellValue(plan.getBenifiAmmount());
		 else dataRow.createCell(6).setCellValue("N/A");
		 dataRowIndex++;
		 }
		 FileOutputStream fileOutputStream = new FileOutputStream(file);
		 workbook.write(fileOutputStream);
		 fileOutputStream.close();
		 
		
		 ServletOutputStream outputStream = response.getOutputStream();
		 workbook.write(outputStream);
		 workbook.close();
		  		
		 }
	}
	

}
