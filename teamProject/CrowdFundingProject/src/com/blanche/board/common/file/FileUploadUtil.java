package com.blanche.board.common.file;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	private static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	/** 파일 압로드
	 * @param	MultipartFile $file
	 * @param	HttpServletRequest $request
	 * @return	String
	 */
	public static String fileUpload(MultipartFile file,	HttpServletRequest request) throws IOException {
		logger.info("fileUpload 호출 성공");
		
		String todate = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
		String folderName = "/upload/board/" + todate;
		String filePath = request.getSession().getServletContext().getRealPath(folderName);
		String fileName = file.getOriginalFilename();
		if (fileName != null && (!fileName.equals(""))) {
			fileName = rename(filePath, fileName);
		} else {
			return null;
		}
		
		if (fileName != null && (!fileName.equals(""))) {
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			File fileAdd = new File(filePath + "/" + fileName);
			file.transferTo(fileAdd);
		}
		
		return "" + folderName + "/" + fileName;
	}
	
	/** 파일 이름 변경
	 * @param	String $filePath
	 * @param	String $fileName
	 * @return	String
	 */
	private static String rename(String filePath, String fileName) {
		String fileBodyname = null;
		String fileExtension = null;
		int dot = fileName.lastIndexOf(".");
		if (dot > -1) {
			fileBodyname = fileName.substring(0, dot);
			fileExtension = fileName.substring(dot);
		} else {
			fileBodyname = fileName;
			fileExtension = "";
		}
		
		int count = 0;
		while (true) {
			File file = new File(filePath + "/" + fileName);
			if (!file.exists()) {
				break;
			}
			count++;
			fileName = fileBodyname + " (" + count + ")" + fileExtension;
			fileName = fileName.trim();
		}
		return fileName;
	}
}