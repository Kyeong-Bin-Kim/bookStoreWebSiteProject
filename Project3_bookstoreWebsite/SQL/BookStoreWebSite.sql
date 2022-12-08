-- Member 테이블
create table Member_info(
    mb_id varchar2(20) primary key
        constraint mb_id check (length(mb_id) between 4 and 20),
    mb_pw varchar2(20) not null
        constraint mb_pw check (length(mb_pw) between 8 and 20),
    mb_name varchar2(45) not null,
    mb_email varchar2(100) not null,
    mb_tel varchar2(15) not null,
    mb_date date 
        default sysdate not null,
    mb_deleted varchar2(7) 
        default '0' not null,
    mb_deleted_date date null
	);
	
-- date의 경우 db에서 자료를 가져올 때 형변환을 하여야 한다. db자체에는 원형태로 들어가는 것이 맞다.

insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('admin',12345678,'admin','admin@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun1',12345678,'test1','test1@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun2',12345678,'test2','test2@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun3',12345678,'test3','test3@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun4',12345678,'test4','test4@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun5',12345678,'test5','test5@gmail.com','010-1234-4567');

commit
select * from Member_info;


-- Delivery 테이블
create table Delivery_info(
    mb_id varchar2(20) not null,
    dv_nick varchar2(60) not null,
    dv_name varchar2(45) not null,
    dv_tel varchar2(15) not null,
    dv_address varchar2(180) not null,
    dv_pk varchar2(90) primary key
	);

insert into Delivery_info values('hyun3','집','house0','010-7894-1234','신림언저리0','hyun3.집');
insert into Delivery_info values('hyun3','회사','house1','010-7894-1234','신림언저리1','hyun3.회사');
insert into Delivery_info values('hyun3','편의점','house2','010-7894-1234','신림언저리2','hyun3.편의점');
insert into Delivery_info values('hyun3','학원','house3','010-7894-1234','신림언저리3','hyun3.학원');
insert into Delivery_info values('admin','망할','house4','010-7894-1234','신림언저리4','admin.망할');

select * from Delivery_info;

drop table delivery_info;


-- Book 테이블
create table Book_info(
    bk_number number(8) primary key,
    bk_title VARCHAR2(150) not null,
    bk_writer VARCHAR2(90) not null,
    bk_publisher VARCHAR2(60) not null,
    bk_pubdate date not null,
    bk_image VARCHAR2(600) not null,
    bk_local VARCHAR2(30) not null,
    bk_genre VARCHAR2(60) not null,
    bk_infodate date 
        default sysdate not null,
    bk_detail VARCHAR2(1500) not null,
    bk_quantity number(10) 
    	default 1 not null,
    bk_price number(10) not null,
    bk_title_upper varchar2(150) not null,
    bk_deleted varchar2(7) 
        default '0' not null
	);

-- bk_number 규칙
-- 년도 4자리 + 랜덤숫자 순서대로 4자리(0001, 0002, 0003...)

insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper)
    values(20220001,'Java교육','임우성','빨강출판사','2011-09-09','bk_image.jpg','국내','소설','책 디테일1',5,500,upper('Java교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220002,'Jsp교육','김경빈','파랑출판사','2014-10-18','bk_image.jpg','국내','인문','책 디테일2',16,2500,upper('Jsp교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220003,'CSS교육','이영호','노랑출판사','2012-12-15','bk_image.jpg','국내','취미','책 디테일3',1,26000,upper('CSS교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220004,'Spring교육','최우성','하양출판사','2008-08-06','bk_image.jpg','해외','경제','책 디테일4',200,1500,upper('Spring교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220005,'컴퓨터교육','박경수','검정출판사','2018-09-26','bk_image.jpg','해외','예술','책 디테일5',1000,13000,upper('컴퓨터교육'));
    
select * from BOOK_INFO;


-- Review 테이블
create table Review_info(
rv_number number(10) primary key,
bk_number number(8) not null,
    constraint rv_bk_number_fk foreign key(bk_number)
            references Book_info(bk_number),
mb_id varchar2(20) not null,
    constraint Review_mb_id_fk foreign key(mb_id)
        references Member_info(mb_id),
rv_date date
    default sysdate not null,
rv_score number(1) not null,
rv_content varchar2(1500) null,
rv_deleted varchar2(7)
    default '0' not null
);

create sequence review_seq
	start with 1
	increment by 1
	maxvalue 9999999999
	nocycle;

insert into review_info(rv_number, bk_number, mb_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun1', 4, '내용1');
insert into review_info(rv_number, bk_number, mb_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun2', 5, '내용2');
insert into review_info(rv_number, bk_number, mb_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun3', 3, '내용3');
insert into review_info(rv_number, bk_number, mb_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun4', 4, '내용4');
insert into review_info(rv_number, bk_number, mb_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun1', 5, '내용5');
insert into review_info(rv_number, bk_number, mb_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun2', 3, '내용6');

drop sequence review_seq;

delete review_info;

select * from review_info;


-- Cart 테이블
create table Cart_info(
	mb_id varchar2(20) not null,
		constraint ca_mb_id_fk foreign key(mb_id)
            references Member_info(mb_id),
    bk_number number(8) not null,
    	constraint ca_bk_number_fk foreign key(bk_number)
    		references book_info(bk_number),
	ca_bkcount number(3) default 1 not null,
	    constraint ca_bkcount check (ca_bkcount between 1 and 999)
);
  
insert into cart_info(mb_id,bk_number) values ('hyun1',20220001);
insert into cart_info(mb_id,bk_number) values ('hyun1',20220002);
insert into cart_info(mb_id,bk_number) values ('hyun1',20220003);

select * from cart_info;


-- Wish 테이블
create table Wish_info(
	mb_id varchar2(20) not null,
		constraint wi_mb_id_fk foreign key(mb_id)
            references Member_info(mb_id),
    bk_number number(8) not null,
    	constraint wi_bk_number_fk foreign key(bk_number)
    		references book_info(bk_number)
);

insert into Wish_info values('hyun1',20220004);
insert into Wish_info values('hyun1',20220005);

select * from wish_info;

drop table order_info;

commit;


-- Order 테이블
create table order_info(
    or_number varchar2(15) primary key,
    mb_id varchar2(20) not null,
        constraint or_mb_id_fk foreign key(mb_id)
            references Member_info(mb_id),
    mb_name varchar2(45) null,
    mb_tel varchar2(15) null,
    or_status varchar2(15)
    	default '0' not null,
    or_date date 
        default sysdate not null,
    or_delivery number(10) null,
    or_deliveryCost number (4)
    	default 3000 not null,
    dv_name varchar2(45) null,
    dv_tel varchar2(15) null,
    dv_address varchar2(180) null
    );

-- order number 규칙 (10자리)
-- 년도 뒤에 2자리 + 월의 영어로 앞의 3자리 + 랜덤번호 순서대로 5자리 (00001, 00002 ...)

insert into ORDER_INFO (or_number, mb_id)
    values('22NOVABC001','hyun1');
insert into ORDER_INFO (or_number, mb_id)
    values('22NOVZXY002','hyun2');
           
select * from order_INFO;

drop table order_info;


-- Order_items 테이블
create table order_items(
    or_number varchar2(15) not null,
	constraint or_number_fk foreign key(or_number)
	    references order_info(or_number),
    bk_number number(8) not null,
        constraint bk_number_fk foreign key(bk_number)
            references book_info(bk_number),
    bk_price number(10) not null,
    ori_bkdiscount number(3) 
        default 0 not null,
    ori_bkcount number(3) 
    	default 1 not null
 	);

insert into order_items (or_number, bk_number, bk_price, ori_bkcount)
    values('22NOVABC001',20220001,
            (select bk_price from book_info where bk_number = 20220001), 3);
insert into order_items (or_number, bk_number, bk_price, ori_bkcount)
    values('22NOVABC001',20220002,
            (select bk_price from book_info where bk_number = 20220002), 1);
insert into order_items (or_number, bk_number, bk_price, ori_bkcount)
    values('22NOVZXY002',20220003,
            (select bk_price from book_info where bk_number = 20220001), 2);
insert into order_items (or_number, bk_number, bk_price, ori_bkcount)
    values('22NOVZXY002',20220004,
            (select bk_price from book_info where bk_number = 20220002), 2);
            
select * from order_items;

drop table order_items;

commit;

