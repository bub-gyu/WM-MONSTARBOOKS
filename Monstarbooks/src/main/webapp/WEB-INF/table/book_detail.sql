CREATE TABLE M_BOOK_DETAIL (   
   BOOKNO NUMBER, 
   BCATEGORYNO NUMBER, 
   BIMG VARCHAR2(225), 
   BIMGDETAIL VARCHAR2(225), 
   BDESCRIPTION VARCHAR2(1000), 
   BPAGE NUMBER, 
   BSIZE VARCHAR2(100), 
   BADGE VARCHAR2(15), 
   BPDATE DATE
   );
   
   --도서 더미 데이터 

INSERT INTO M_BOOK_DETAIL (BOOKNO, BCATEGORYNO, BIMG, BIMGDETAIL, BDESCRIPTION, BPAGE, BSIZE, BADGE, BPDATE)
VALUES (12, 01, 'book12.jpg', 'book12_detail.jpg', '어린왕자 입니다.', 300, '150x230mm', 'Bestseller', TO_DATE('2023-01-28', 'YYYY-MM-DD'));


INSERT INTO M_BOOK_DETAIL (BOOKNO, BCATEGORYNO, BIMG, BIMGDETAIL, BDESCRIPTION, BPAGE, BSIZE, BADGE, BPDATE)
VALUES (13, 02, 'book13.jpg', 'book13_detail.jpg', '1984입니다.', 400, '140x210mm', 'New Arrival', TO_DATE('2023-03-15', 'YYYY-MM-DD'));


INSERT INTO M_BOOK_DETAIL (BOOKNO, BCATEGORYNO, BIMG, BIMGDETAIL, BDESCRIPTION, BPAGE, BSIZE, BADGE, BPDATE)
VALUES (14, 03, 'book14.jpg', 'book14_detail.jpg', '헤리포터 입니다.', 200, '180x250mm', 'Recommended', TO_DATE('2023-07-10', 'YYYY-MM-DD'));