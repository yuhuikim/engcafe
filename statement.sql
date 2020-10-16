--user
create table user_info (
  user_id               varchar2(10) primary key, --pk
  user_nickname         varchar2(10) not null,
  user_name             VARCHAR2(10) not null,
  user_age              NUMBER not null,
  user_phone            varchar2(20) not null,
  user_email            varchar2(30) not null,
  user_ip               VARCHAR2(20) not null,
  user_level            NUMBER default 1,
  user_del              char(1) default 'n',
  user_regdate          date default sysdate,
  user_update           date default sysdate
);
--빅 카테고리
create table big_category (
    bc_num              NUMBER,                 --pk
    bc_step             NUMBER not null,
    bc_subject          VARCHAR2(20) not null,
    CONSTRAINT bc_num_pk PRIMARY KEY (bc_num)
);
--카테고리
create table category (
    c_num               NUMBER,                 --pk
    c_bc_num            NUMBER not null,        --fk
    c_step              NUMBER not null,
    c_subject           VARCHAR2(20) not null,
    c_intro             VARCHAR2(100) not null,
    c_reg_id            VARCHAR2(10) not null,  --fk
    c_reg_nick          VARCHAR2(10) not null,  
    c_regdate           DATE default sysdate,
    c_reader_level      NUMBER,
    c_del               CHAR(1) default 'n',
    CONSTRAINT c_num_pk PRIMARY KEY (c_num),
    FOREIGN KEY (c_bc_num) REFERENCES big_category (bc_num),
    FOREIGN KEY (c_reg_id) REFERENCES user_info (user_id)
);   
--게시판
create table board (
    b_num               NUMBER,                 --pk
    b_c_num             NUMBER not null,        --fk
    b_subject           VARCHAR2(50) not null,
    b_id                VARCHAR2(10) not null,  --fk
    b_nick              VARCHAR2(10) not null,
    b_content           VARCHAR2(1000),
    b_read_cnt          NUMBER,
    b_reply_cnt         NUMBER,
    b_like_cnt          NUMBER,
    b_regdate           DATE default sysdate,
    b_update            DATE default sysdate,
    b_ip                VARCHAR2(20) not null,
    b_notice            CHAR(1) default 'n', 
    b_del               CHAR(1) default 'n',
    CONSTRAINT b_num_pk PRIMARY KEY (b_num),
    FOREIGN KEY (b_c_num) REFERENCES category (c_num),
    FOREIGN KEY (b_id) REFERENCES user_info (user_id)
);    
--업로드 파일
create table file_upload (
    f_num               NUMBER,                 --pk
    f_b_num             NUMBER not null,        --fk
    f_id                VARCHAR2(10) not null,  --fk
    f_filename          VARCHAR2(50) not null,
    f_del               CHAR(1) default 'n',
    CONSTRAINT f_num_pk PRIMARY KEY (f_num),
    FOREIGN KEY (f_b_num) REFERENCES board (b_num),
    FOREIGN KEY (f_id) REFERENCES user_info (user_id)
); 

select * from file_upload;
select * from board;
select * from category;
select * from big_category;
select * from user_info;
select * from login_ip_history;
select * from message;
select * from reply;

drop table file_upload;
drop table board;
drop table category;
drop table big_category;
drop table user_info;
drop table login_ip_history;
drop table message;
drop table reply;

-- 로그인 ip 기록
CREATE table login_ip_history (
    i_num               NUMBER,                 --pk
    i_id                VARCHAR2(10) not null,  --fk
    i_ip                VARCHAR2(20) not null,
    i_logdate           DATE default sysdate,
    CONSTRAINT i_num_pk PRIMARY KEY (i_num),
    FOREIGN KEY (i_id) REFERENCES user_info (user_id) 
);
-- 쪽지
CREATE table message (
    m_num               NUMBER,                 --pk
    m_sender_id         VARCHAR2(10) not null,  --fk
    m_sender_nick       VARCHAR2(10) not null,
    m_sender_ip         VARCHAR2(20) not null,
    m_sender_del        CHAR(1) default 'n',
    m_receiver_id       VARCHAR2(10) not null,  --fk
    m_receiver_nick     VARCHAR2(10) not null,
    m_receiver_del      CHAR(1) default 'n',
    m_subject           VARCHAR2(100) not null,
    m_content           VARCHAR2(500) not null,    
    m_send_date         DATE default sysdate,
    CONSTRAINT m_num_pk PRIMARY KEY (m_num),
    FOREIGN KEY (m_sender_id) REFERENCES user_info (user_id), 
    FOREIGN KEY (m_receiver_id) REFERENCES user_info (user_id) 
);
-- 댓글

CREATE table reply (
    r_num               NUMBER,                 --pk
    r_b_num             NUMBER not null,        --fk
    r_ref               NUMBER not null,
    r_level             NUMBER not null,
    r_step              NUMBER not null,    
    r_id                varchar2(10) not null,  --fk
    r_nick              varchar2(10) not null,
    r_content           varchar2(500) not null,
    r_regdate           DATE default sysdate,
    r_update            DATE default sysdate,
    r_ip                VARCHAR2(20) not null,
    r_del               CHAR(1) default 'n',
    CONSTRAINT r_num_pk PRIMARY KEY (r_num)
);    

CREATE table reply (
    r_num               NUMBER,                 --pk
    r_b_num             NUMBER not null,        --fk
    r_ref               NUMBER not null,
    r_level             NUMBER not null,
    r_step              NUMBER not null,    
    r_id                varchar2(10) not null,  --fk
    r_nick              varchar2(10) not null,
    r_content           varchar2(500) not null,
    r_regdate           DATE default sysdate,
    r_update            DATE default sysdate,
    r_ip                VARCHAR2(20) not null,
    r_del               CHAR(1) default 'n',
    CONSTRAINT r_num_pk PRIMARY KEY (r_num),
    FOREIGN KEY (r_b_num) REFERENCES board (b_num), 
    FOREIGN KEY (r_id) REFERENCES user_info (user_id) 
);    
