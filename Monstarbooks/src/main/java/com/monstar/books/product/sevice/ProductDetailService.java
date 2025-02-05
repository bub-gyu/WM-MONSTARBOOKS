package com.monstar.books.product.sevice;

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
import com.monstar.books.product.dto.BookDto;


@Service
public class ProductDetailService implements ProductService {

	@Autowired
	private SqlSession session;

	// 생성자
	public ProductDetailService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>> DETAIL SERVICE >>>");
		
		//map변환
		Map<String, Object> map = model.asMap();
		
		//map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//상품번호로 디테일페이지 진입
		String bookno = request.getParameter("bookno");
		System.out.println("bookno: "+bookno);
		
		ProductDao dao = session.getMapper(ProductDao.class);
		BookDto dto = dao.detail(bookno);
		
//		System.out.println(dto);
		
		model.addAttribute("dto", dto);
		

	}// override method

}// class