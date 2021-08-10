insert into tom_member_info (USERID, USERPW, NICKNAME, EMAIL, INTRODUCE)
values ('user1', '0001', '����1', 'user1@gmail.com', '�ȳ��ϼ���, ����1�Դϴ�.');
insert into tom_member_info (USERID, USERPW, NICKNAME, EMAIL)
values ('user2', '0002', '����2', 'user2@gmail.com');
insert into tom_member_info (USERID, USERPW, NICKNAME, EMAIL, INTRODUCE)
values ('user3', '0003', '����3', 'user3@gmail.com', '�ȳ��ϼ���, ����3�Դϴ�.');
insert into tom_member_info (USERID, USERPW, NICKNAME, EMAIL)
values ('user4', '0004', '����4', 'user4@gmail.com');
insert into tom_member_info (USERID, USERPW, NICKNAME, EMAIL, INTRODUCE)
values ('user5', '0005', '����5', 'user5@gmail.com', '�ȳ��ϼ���, ����5�Դϴ�.');

insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user1', '����', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user1', '�ȭ', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user1', '�Ȱ�', DEFAULT);
--
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user2', '��ø', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user2', '����', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user2', 'å', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user2', '�Һ�', DEFAULT);
--
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user3', '����', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user3', '�ȭ', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user3', '��ũ', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user3', '������', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user3', '�μ�', DEFAULT);
--
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user4', '������', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user4', '�Һ�', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user4', '������', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user4', '������', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user4', '�����', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user4', '����Ű', DEFAULT);
--
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user5', '������', 1);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user5', '��ø', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user5', '�Ȱ�', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user5', '������', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user5', '�����', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user5', '������', DEFAULT);
insert into tom_tag_user
values (SEQ_TOM_TAG_USER.NEXTVAL, 'user5', 'Ŀ��', DEFAULT);

insert into tom_siren
values (SEQ_TOM_SIREN.nextval,'user1', 'user5', '�弳', '���');
insert into tom_siren
values (SEQ_TOM_SIREN.nextval,'user2', 'user5', '���谨�� �ִ� ������', '�Խñ�');

insert into tom_board (bno, title, CONTENT, writer)
values (1, '���� ���� ��õ����', '�� ���� ���� ����� �ϴµ� ��õ ��. �ʹ� ��� �� ����.', 'user1' );
insert into tom_board (bno, title, CONTENT, writer)
values (2, '����Ű �̹� ���� �� ������', '���� ����Ű�� ���� �ϳ��� �� ����. �Ƶ�ٽ� ����� ��ü�� ����..', 'user4' );
insert into tom_board (bno, title, CONTENT, writer)
values (3, '���� �� �����', '�������ϳ�', 'user5' );

insert into tom_tag_board
values (SEQ_TOM_TAG_BOARD.nextval, 1, '����');
insert into tom_tag_board
values (SEQ_TOM_TAG_BOARD.nextval, 1, '���� ����');
insert into tom_tag_board
values (SEQ_TOM_TAG_BOARD.nextval, 1, '������');
--
insert into tom_tag_board
values (SEQ_TOM_TAG_BOARD.nextval, 2, '����Ű');
insert into tom_tag_board
values (SEQ_TOM_TAG_BOARD.nextval, 2, '�Ƶ�ٽ�');
insert into tom_tag_board
values (SEQ_TOM_TAG_BOARD.nextval, 2, '����');
insert into tom_tag_board
values (SEQ_TOM_TAG_BOARD.nextval, 2, '����Ű����');

insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, '1', '�������� ���� ���� �ȭ�� ��õ ����', 'user3');
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, '1', '�� ���̼ҿ��� ��', 'user4');
--
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, '2', '����Ű���� �Һ��� �� �����', 'user2');
--
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, '3', '��¼���; �ʳ� ����', 'user1');
insert into tom_reply (rno, bno, reply, replyer)
values (SEQ_TOM_REPLY.nextval, '3', '��ʱ�~~~���� �q��~~~~~~��������������', 'user5');





