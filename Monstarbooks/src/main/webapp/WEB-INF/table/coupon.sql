CREATE TABLE M_COUPON 
   (	CPNO NUMBER, 
	CPNAME VARCHAR2(100), 
	CPDESCRIPTION VARCHAR2(225), 
	CPPRICE NUMBER, 
	CPCREATED DATE, 
	CPVALID DATE, 
	CPSTATUS VARCHAR2(10)
   );

Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) 
		values (1,'할인 쿠폰 10원','10원 할인 쿠폰',10,to_date('23/08/26','RR/MM/DD'),to_date('23/12/31','RR/MM/DD'),'TRUE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) 
		values (2,'신규 가입 할인 쿠폰','신규 가입 고객을 위한 할인 쿠폰',10000,to_date('23/08/26','RR/MM/DD'),to_date('23/10/31','RR/MM/DD'),'TRUE');
