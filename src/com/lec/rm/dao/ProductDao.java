package com.lec.rm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.rm.dto.ProductDto;

public class ProductDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds;
	private ProductDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	private static ProductDao instance = new ProductDao();
	public static ProductDao getInstance() {
		return instance;
	}
	// (1) 상품목록 리스트
	public ArrayList<ProductDto> productList(int startRow, int endRow, String pname) {
		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * " + 
				"    FROM (SELECT ROWNUM RN, A.* FROM " + 
				"        (SELECT * FROM PRODUCT WHERE pNAME LIKE '%'||TRIM(UPPER(?))||'%' ORDER BY pID DESC) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pid");
				pname = rs.getString("pname");
				int pprice = rs.getInt("pprice");
				String psize = rs.getString("psize");
				String pcategory = rs.getString("pcategory");
				String paimage = rs.getString("paimage");
				products.add(new ProductDto(pid, pname, pprice, psize, pcategory, paimage, null, null));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "list");
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return products;
	}
	// (2) 상품 개수
	public int productCount() {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM PRODUCT";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return count;
	}
	// (2) 상품 개수
		public int productCount(String pname) {
			int count = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT COUNT(*) CNT FROM PRODUCT WHERE pNAME LIKE '%'||TRIM(UPPER(?))||'%'";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pname);
				rs = pstmt.executeQuery();
				rs.next();
				count = rs.getInt("cnt");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			return count;
		}
	// (3) 상품검색
	public ArrayList<ProductDto> getProducts(String pname) {
		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT" + 
				"    WHERE pNAME LIKE '%'||TRIM(UPPER(?))||'%'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pid");
				int pprice = rs.getInt("pprice");
				String psize = rs.getString("psize");
				String pcategory = rs.getString("pcategory");
				String paimage = rs.getString("paimage");
				String pbimage = rs.getString("pbimage");
				String pcontent = rs.getString("pcontent");
				products.add(new ProductDto(pid, pname, pprice, psize, pcategory, paimage, pbimage, pcontent));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return products;
	}
	// (4) 상품번호로 DTO가져오기(상품 상세보기)
	public ProductDto productContent(int pid) {
		ProductDto product = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE pID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String pname = rs.getString("pname");
				int pprice = rs.getInt("pprice");
				String psize = rs.getString("psize");
				String pcategory = rs.getString("pcategory");
				String paimage = rs.getString("paimage");
				String pbimage = rs.getString("pbimage");
				String pcontent = rs.getString("pcontent");
				product = new ProductDto(pid, pname, pprice, psize, pcategory, paimage, pbimage, pcontent);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return product;
		
	}
	// (5) 상품등록
	public int addProduct(ProductDto product) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setInt(2, product.getPprice());
			pstmt.setString(3, product.getPsize());
			pstmt.setString(4, product.getPcategory());
			pstmt.setString(5, product.getPaimage());
			pstmt.setString(6, product.getPbimage());
			pstmt.setString(7, product.getPcontent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// (6) 상품수정
	public int modifyProduct(ProductDto product) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE PRODUCT" + 
				"    SET pNAME = ?," + 
				"        pPRICE = ?," + 
				"        pSIZE = ?," + 
				"        pCATEGORY = ?," + 
				"        pAIMAGE = ?," + 
				"        pBIMAGE = ?," + 
				"        pCONTENT = ?" + 
				"    WHERE pID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setInt(2, product.getPprice());
			pstmt.setString(3, product.getPsize());
			pstmt.setString(4, product.getPcategory());
			pstmt.setString(5, product.getPaimage());
			pstmt.setString(6, product.getPbimage());
			pstmt.setString(7, product.getPcontent());
			pstmt.setInt(8, product.getPid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// (7) 상품삭제
	public int deleteProduct(int pid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM PRODUCT WHERE pID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
