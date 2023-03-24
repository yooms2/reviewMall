package com.lec.rm.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.rm.dao.ProductDao;
import com.lec.rm.dto.ProductDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductAddService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("photoUp");
		int maxSize = 1024*1024;
		// String paimage = "", pbimage = "";
		String[] images = {"",""};
		int result = 0;
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			int idx = 0;
			while(params.hasMoreElements()) {
				String param = params.nextElement();
				images[idx] = mRequest.getFilesystemName(param);
				System.out.println(idx + "번 : " + param);
				idx ++;
			}
			String pname = mRequest.getParameter("pname");
			int pprice = Integer.parseInt(mRequest.getParameter("pprice"));
			String psize = mRequest.getParameter("psize");
			String pcategory = mRequest.getParameter("pcategory");
			String paimage = images[1]==null ? "noimage.png" : images[1]; // 필수항목이라 대체이미지 사용할 일 없음
			ProductDao pDao = ProductDao.getInstance();
			ProductDto product = new ProductDto(0, pname, pprice, psize, pcategory, paimage, null, null);
			result = pDao.addProduct(product);
			if(result == ProductDao.SUCCESS) {
				HttpSession session = request.getSession();
				session.setAttribute("product", product);
				request.setAttribute("productAddResult", "상품이 등록 되었습니다");
			} else {
				request.setAttribute("productAddError", "상품 등록이 실패하였습니다");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		for(String img : images) {
			InputStream is = null;
			OutputStream os = null;
			File serverFile = new File(path + "/" + img);
			if(serverFile.exists() && result==ProductDao.SUCCESS) {
				try {
					is = new FileInputStream(serverFile);
					os = new FileOutputStream("C:/Project/reviewmall/WebContent/photoUp/" + img);
					byte[] bs = new byte[(int)serverFile.length()];
					while(true) {
						int readByteCnte = is.read(bs);
						if(readByteCnte==-1) break;
						os.write(bs, 0, readByteCnte);
					}
				} catch (IOException e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if(os!=null) os.close();
						if(is!=null) is.close();
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
				}
			}
		}
	}
}
