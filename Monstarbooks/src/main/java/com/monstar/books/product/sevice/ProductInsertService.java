package com.monstar.books.product.sevice;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.ex.dao.ExDao;
import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dao.ProductDao;
import com.monstar.books.product.dto.BookCategoryDto;
import com.monstar.books.product.dto.BookDto;

@Service
public class ProductInsertService implements ProductService {

	//private lkasjdfDto;
	
	@Autowired
	private SqlSession session;
	
	// 생성자
	public ProductInsertService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>> INSERT SERVICE PROCESS >>>");
		
		ProductDao dao = session.getMapper(ProductDao.class);
		
		//map변환
		Map<String, Object> map = model.asMap();
		
		//map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		//"도서"테이블에 넣을 정보
//		int bookno = Integer.parseInt(request.getParameter("bookno"));
		int bisbn = Integer.parseInt(request.getParameter("bisbn"));
		String btitle = request.getParameter("btitle");
		String bsubtitle = request.getParameter("bsubtitle");
		String bpublisher = request.getParameter("bpublisher");
		String bwriter = request.getParameter("bwriter");
		String btranslator = request.getParameter("btranslator");
		String bpdate = request.getParameter("bpdate");
		int bprice = Integer.parseInt(request.getParameter("bprice"));
		int bpricesell = Integer.parseInt(request.getParameter("bpricesell"));
		int bdiscount = Integer.parseInt(request.getParameter("bdiscount"));
		String bstatus = request.getParameter("bstatus");
//		String bcdate = request.getParameter("bcdate");
//		String bmdate = request.getParameter("bmdate");
		int bstock = Integer.parseInt(request.getParameter("bstock"));
				
		
//		//selectCategory에서 카테고리를 불러옴
//		ArrayList<BookCategoryDto> dto = dao.selectCategory();
//		model.addAttribute("dto", dto);
				
		//"도서" 테이블에 정보 입력
		dao.insertBook(bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator,
				bpdate, bprice, bpricesell, bdiscount, bstatus, bstock);	
				
		
		
		
		//"디테일" 테이블에 넣을 정보
//		int bookno = request.getParameter("bookno");
		int bcategoryno = Integer.parseInt(request.getParameter("bcategoryno"));//라디오버튼
		String bimg = request.getParameter("bimg");
		String bimgdetail = request.getParameter("bimgdetail");
		String bdescription = request.getParameter("bdescription");
		int bpage = Integer.parseInt(request.getParameter("bpage"));
		String bsize = request.getParameter("bsize");
		String badge = request.getParameter("badge");
		
		System.out.println("bcategoryno: "+bcategoryno);
		
//		디테일 테이블에 도서 테이블과 같은 bookno를 넣는 법
//		1. 디테일 테이블에서도 시퀀스를 만들고 nextval로 쿼리 날림
//		2. 도서 테이블의 도서이름+ISBN 등 2가지 데이터를 합쳐서 날리고 
//			그 칼럼의 bookno를 가져오기
//		-> 일단 1번으로 고고
		
		
		
		//"디테일" 테이블에 정보 입력
		dao.insertBookDetail(bcategoryno, bimg, bimgdetail, bdescription,
				bpage, bsize, badge);
		
		
		
		
//		String bcategory1 = request.getParameter("bcategory1");
//		String bcategory2 = request.getParameter("bcategory2");
//				
//		ArrayList<BookCategoryDto> dto = dao.insertBookCategory(bcategory1, bcategory2);

		
		
	}// override method

}// class