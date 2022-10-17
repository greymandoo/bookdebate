package org.project.command;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.project.DAO.BookDAO;

public class BookInsertCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("책 등록");
		
		Map<String, String> bookMap = new HashMap<String, String>();
		
		String BOOK_COVER_REPO = "C:\\Users\\DKK\\Desktop\\project01\\webProject0806\\WebContent\\img\\upload";
		
		File currentDirPath = new File(BOOK_COVER_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			List<?> items = upload.parseRequest(request);
			Iterator<?> iter = items.iterator();
			
			while(iter.hasNext()) {
				FileItem item = (FileItem)iter.next();
				
				if(item.isFormField()) {
					String key = item.getFieldName();
					String value = item.getString("utf-8");
					bookMap.put(key, value);
				} else {
					System.out.println("file size:"+item.getSize()+"bytes");
					if(item.getSize() > 0) {
						String fileName = item.getName();
						System.out.println("file name:"+fileName);
						bookMap.put(item.getFieldName(), fileName);
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
						item.write(uploadFile);
					}
				}
			}
			
			String cover = bookMap.get("cover");
			String bookNo = bookMap.get("bookNo");
			
			if(cover != null && cover.length() != 0) {
				File srcFile = new File(BOOK_COVER_REPO + "\\temp\\" + cover);
				File destDir = new File(BOOK_COVER_REPO + "\\" + bookNo);
				destDir.mkdirs();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "";
		
		BookDAO dao = BookDAO.getINSTANCE();
		int rs = dao.addBookDo(bookMap);
		
		if(rs == 1) {
			System.out.println("성공");
			url = "bookListForAdmin.do";
		} else {
			System.out.println("실패");
			url = "index.mo";
		}
		
		request.setAttribute("url", url);
	}
}
