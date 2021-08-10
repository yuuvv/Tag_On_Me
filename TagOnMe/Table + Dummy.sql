-- ���̺� ����
drop table TOM_TAGS;
drop table TOM_BOARD_ATTACH;
drop table TOM_REPLY;
drop table TOM_SIREN;
drop table TOM_TAG_BOARD;
drop table TOM_TAG_USER;
drop table TOM_BOARD;
drop table TOM_MEMBER_INFO;
-- ������ ����
DROP SEQUENCE seq_TOM_TAGS;
DROP SEQUENCE seq_TOM_MEMBER_INFO;
DROP SEQUENCE seq_TOM_TAG_USER;
DROP SEQUENCE seq_TOM_BOARD;
DROP SEQUENCE seq_TOM_BOARD_attach;
DROP SEQUENCE seq_TOM_reply;
DROP SEQUENCE seq_tom_tag_board;
DROP SEQUENCE seq_TOM_siren;

-- ���̺� ����
create table tom_profile_attach (
    uno number not null primary key,
    uuid varchar2(100) not null,
    filepath varchar2(100) not null,
    filename varchar2(100) not null
);

Create table TOM_TAGS(
    tno number not null primary key,
    tags varchar2(100) not null
--    CONSTRAINT FK_TAG_USER_UNO FOREIGN KEY(UNO) REFERENCES TOM_MEMBER_INFO(UNO)
);
CREATE SEQUENCE seq_TOM_TAGS INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache;

Create table TOM_MEMBER_INFO (
    uno number not null primary key,
    userid varchar2(50) not null,
    userpw varchar2(100) not null,
    nickname varchar2(100) not null,
    regdate date default sysdate not null, 
    enabled char(1) default '1',
    email varchar2(100) not null,
    introduce varchar2(100)
);
CREATE SEQUENCE seq_TOM_MEMBER_INFO INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache ;

Create table TOM_TAG_USER(
    tuno number not null primary key,
    UNO number not null,
    tno number not null,
    leader char(1) default '0' not null
--    CONSTRAINT FK_TAG_USER_UNO FOREIGN KEY(UNO) REFERENCES TOM_MEMBER_INFO(UNO)
);
CREATE SEQUENCE seq_TOM_TAG_USER INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache;

Create table TOM_BOARD(
    bno number not null primary key,
    hitcnt number default '0' not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer number not null,
    regdate date default sysdate, 
    replycnt number default '0' not null,
    boardup number default '0' not null,
    boarddown number default '0' not null,
    replyenabled char(1) default '1',
    deletedyn char(1) default 'N' not null
--    CONSTRAINT FK_BOARD_writer FOREIGN KEY(writer) REFERENCES TOM_MEMBER_INFO(uno)
);
CREATE SEQUENCE seq_TOM_BOARD INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache;

Create table TOM_BOARD_attach(
    bano number not null primary key,
    bno number not null,
    originalname varchar2(300) not null,
    savename varchar2(100) not null,
    filesize NUMBER not null,
    deletedyn char(1) default 'N' not null,
    regdate date default sysdate not null
--    CONSTRAINT FK_BOARD_attach_bno FOREIGN KEY(bno) REFERENCES TOM_BOARD(bno)
);
CREATE SEQUENCE seq_TOM_BOARD_attach INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache;

create table TOM_REPLY (
	rno number not null primary key,
	bno number not null,
	reply varchar2(1000) not null,
	replyer number not null,
	regdate date default sysdate,
    replyup number default '0' not null,
    replydown number default '0' not null,
	deletedyn char(1) default 'N' not null
--    CONSTRAINT FK_REPLY_bno FOREIGN KEY(bno) REFERENCES TOM_BOARD(bno),
--    CONSTRAINT FK_REPLY_replyer FOREIGN KEY(replyer) REFERENCES TOM_MEMBER_INFO(uno)
);
CREATE SEQUENCE seq_TOM_reply INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache ;
-- insert into TOM_REPLY(rno) values(seq_TOM_reply.nextval);

-- create table TOM_CHAT_INFO (
--    UNO varchar2(50) not null,
--    other varchar2(50) not null,
--    threedays_chat brob
-- );

create table tom_tag_board (
    tbno number not null primary key,
    bno number not null,
    tno number not null
--    constraint fk_tag_board_bno foreign key(bno) references tom_board(bno)
);
CREATE SEQUENCE seq_tom_tag_board INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache ;

create table tom_siren(
    sno number not null primary key,
    kicker number not null,
    kicked number not null,
    reason varchar2(1000) not null,
    kickloc varchar2(100) not null
--    CONSTRAINT FK_UNO_kickker FOREIGN KEY(kicker) REFERENCES TOM_MEMBER_INFO(uno),
--    CONSTRAINT FK_UNO_kicked FOREIGN KEY(kicked) REFERENCES TOM_MEMBER_INFO(UNO)
);
CREATE SEQUENCE seq_TOM_siren INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE nocache;
-- insert into tom_siren(sno) values(seq_TOM_siren.nextval);

-- ������ ������ ��ȣ ��ȸ
SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_TOM_SIREN';

commit;

-- ���̵�����
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '����');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '�ȭ');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '�Ȱ�');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '��ø');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, 'å');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '�Һ�');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '��ũ');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '������');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '�μ�');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '������');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '������');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '�����');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '����Ű');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '��ø');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '������');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, 'Ŀ��');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '��������');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '������');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '�Ƶ�ٽ�');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '����');
insert into tom_tags
values (SEQ_TOM_TAGS.NEXTVAL, '����Ű����');

insert into tom_member_info (UNO, USERID, USERPW, NICKNAME, EMAIL, INTRODUCE)
values (SEQ_tom_member_info.NEXTVAL, 'user1', '0001', '����1', 'user1@gmail.com', '�ȳ��ϼ���, ����1�Դϴ�.');
insert into tom_member_info (UNO, USERID, USERPW, NICKNAME, EMAIL)
values (SEQ_tom_member_info.NEXTVAL, 'user2', '0002', '����2', 'user2@gmail.com');
insert into tom_member_info (UNO, USERID, USERPW, NICKNAME, EMAIL, INTRODUCE)
values (SEQ_tom_member_info.NEXTVAL, 'user3', '0003', '����3', 'user3@gmail.com', '�ȳ��ϼ���, ����3�Դϴ�.');
insert into tom_member_info (UNO, USERID, USERPW, NICKNAME, EMAIL)
values (SEQ_tom_member_info.NEXTVAL, 'user4', '0004', '����4', 'user4@gmail.com');
insert into tom_member_info (UNO, USERID, USERPW, NICKNAME, EMAIL, INTRODUCE)
values (SEQ_tom_member_info.NEXTVAL, 'user5', '0005', '����5', 'user5@gmail.com', '�ȳ��ϼ���, ����5�Դϴ�.');

insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 1, 1, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 1, 2, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 1, 3, DEFAULT);
--
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 2, 4, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 2, 1, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 2, 5, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 2, 6, DEFAULT);
--
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 3, 1, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 3, 2, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 3, 7, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 3, 8, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 3, 9, DEFAULT);
--
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 4, 8, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 4, 6, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 4, 10, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 4, 11, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 4, 12, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 4, 13, DEFAULT);
--
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 5, 10, 1);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 5, 14, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 5, 3, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 5, 8, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 5, 12, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 5, 15, DEFAULT);
insert into tom_tag_user
values (SEQ_tom_tag_user.NEXTVAL, 5, 16, DEFAULT);

insert into tom_siren
values (SEQ_TOM_SIREN.nextval, 1, 5, '�弳', '���');
insert into tom_siren
values (SEQ_TOM_SIREN.nextval, 2, 5, '���谨�� �ִ� ������', '�Խñ�');

insert into tom_board (bno, title, CONTENT, writer)
values (1, '���� ���� ��õ����', '�� ���� ���� ����� �ϴµ� ��õ ��. �ʹ� ��� �� ����.', 1);
insert into tom_board (bno, title, CONTENT, writer)
values (2, '����Ű �̹� ���� �� ������', '���� ����Ű�� ���� �ϳ��� �� ����. �Ƶ�ٽ� ����� ��ü�� ����..', 4);
insert into tom_board (bno, title, CONTENT, writer)
values (3, '���� �� �����', '�������ϳ�', 5);

insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 1, 1);
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 1, 17);
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 1, 18);
--
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 2, 13);
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 2, 19);
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 2, 20);
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 2, 21);
--
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 3, 18);
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 3, 15);
insert into tom_tag_board
values (SEQ_tom_tag_board.nextval, 3, 20);

insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, 1, '�������� ���� ���� �ȭ�� ��õ ����', 3);
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, 1, '�� ���̼ҿ��� ��', 4);
--
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, 2, '����Ű���� �Һ��� �� �����', 2);
--
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, 3, '��¼���', 1);
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, 3, '�ǤǤǤǤǤ�', 5);

create or replace NONEDITIONABLE function set_file_no
return number is
file_no tom_board_attach.bano%type;
begin 
    select seq_tom_board_attach.nextval
    into file_no
    from dual;
    return file_no;
end;

commit;