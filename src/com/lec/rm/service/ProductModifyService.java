package com.lec.rm.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.rm.dao.ProductDao;
import com.lec.rm.dto.ProductDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductModifyService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("photoUp");
		int maxSize = 1024*1024;
		String[] images = {"",""};
		String[] dbimages = null;
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			int idx = 0;
			while(params.hasMoreElements()) {
				String param = params.nextElement();
				images[idx] = mRequest.getFilesystemName(param);
				idx ++;
			}
			int pid = Integer.parseInt(mRequest.getParameter("pid"));
			String pname = mRequest.getParameter("pname");
			int pprice = Integer.parseInt(mRequest.getParameter("pprice"));
			String psize = mRequest.getParameter("psize");
			String pcategory = mRequest.getParameter("pcategory");
			String paimage = images[1]==null? "noimage.png" : images[1];
			ProductDao pDao = ProductDao.getInstance();
			ProductDto product = new ProductDto(pid, pname, pprice, psize, pcategory, paimage, null, null);
			int result = pDao.modifyProduct(product);
			if(result == pDao.SUCCESS) {
				request.setAttribute("productResult", "상품 수정이 완료되었습니다");
			} else {
				request.setAttribute("productError", "상품을 수정하는데 실패하였습니다");
			}
			request.setAttribute("pageNum", mRequest.getParameter("pageNum"));
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		if(dbimages!=null && images.equals(dbimages)) {
			for(String img : images) {
				InputStream is = null;
				OutputStream os = null;
				File serverFile = new File(path + "/" + img);
				try {
					is = new FileInputStream(serverFile);
					os = new FileOutputStream("C:/Project/reviewmall/WebContent/photoUp/" + img);
					byte[] bs = new byte[(int)serverFile.length()];
					while(true) {
						int readByteCnt = is.read(bs);
						if(readByteCnt==-1) break;
						os.write(bs, 0, readByteCnt);
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
