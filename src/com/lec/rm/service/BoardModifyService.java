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

import com.lec.rm.dao.BoardDao;
import com.lec.rm.dto.BoardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardModifyService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("fileUp");
		int maxSize = 1024*1024*2;
		String bfilename = "", dbBfilename = null;
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			bfilename = mRequest.getFilesystemName(param);
			dbBfilename = mRequest.getParameter("dbBfilename");
			if(bfilename == null) {
				bfilename = dbBfilename;
			}
			int bid = Integer.parseInt(mRequest.getParameter("bid"));
			String btitle = mRequest.getParameter("btitle");
			String bcontent = mRequest.getParameter("bcontent");
			BoardDao bDao = BoardDao.getInstance();
			BoardDto bDto = new BoardDto(bid, null, null, null, btitle, bcontent, bfilename, 0, 0, 0, 0, null);
			int result = bDao.boardModify(bDto);
			if(result == BoardDao.SUCCESS) {
				request.setAttribute("boardResult", "글을 수정하였습니다");
			} else {
				request.setAttribute("boardResult", "글을 수정하는데 실패하였습니다");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		if(dbBfilename!=null && !bfilename.equals(dbBfilename)) {
			InputStream is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path + "/" + bfilename);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:/Project/reviewmall/WebContent/fileUp/" + bfilename);
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
