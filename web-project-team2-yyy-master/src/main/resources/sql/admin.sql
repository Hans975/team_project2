--insert into admin(admin_id,password,name) values('admin1','1111','김경호');
--insert into admin(admin_id,password,name) values('admin2','2222','김진영');
--insert into admin(admin_id,password,name) values('admin3','3333','정태수');

--select
--select ADMIN_id, password,name from ADMIN;

--update
--update ADMIN
--set password='0000', name='보류중'
--where ADMIN_id='admin1';

--delete
--delete ADMIN where ADMIN_id='admin1';



--update
--update ADMIN
--set password='0000', name='보류중'
--where ADMIN_id='admin1';

--delete
delete ADMIN where ADMIN_id='admin1';
DELETE FROM admin WHERE admin_No = #{adminNo};

INSERT INTO admin (admin_No,admin_id,admin_password, admin_name)
VALUES (admin_admin_no_SEQ.nextval, #{adminId}, #{password}, #{name});

INSERT INTO admin (admin_No,admin_id,admin_password, admin_name)
VALUES (admin_admin_no_SEQ.nextval, 'admin1','1111','김경호');
INSERT INTO admin (admin_No,admin_id,admin_password, admin_name)
VALUES (admin_admin_no_SEQ.nextval, 'admin2','2222','김진영');
INSERT INTO admin (admin_No,admin_id,admin_password, admin_name)
VALUES (admin_admin_no_SEQ.nextval, 'admin3','3333','정태수');

INSERT INTO admin (admin_No,admin_id,admin_password, admin_name)
VALUES (admin_admin_no_SEQ.nextval, 'admin4','1111','000');
INSERT INTO admin (admin_No,admin_id,admin_password, admin_name)
VALUES (admin_admin_no_SEQ.nextval, 'admin5','2222','000');
INSERT INTO admin (admin_No,admin_id,admin_password, admin_name)
VALUES (admin_admin_no_SEQ.nextval, 'admin6','3333','000');
/*
 *  -------------------SELECT
 */
SELECT *
FROM admin;

SELECT *
FROM admin
WHERE admin_No = 4;

SELECT *
FROM admin
WHERE admin_Id = 'admin3';

/*
 *  -------------------UPDATE
 */
UPDATE admin SET admin_password = #{password}
WHERE admin_No = #{adminNo};

UPDATE admin SET admin_password = 1234
WHERE admin_No = 6;
UPDATE admin SET admin_id = #{adminId}
WHERE admin_No = #{adminNo};
UPDATE admin SET admin_id = 'bbbb'
WHERE admin_No = 5;


                        