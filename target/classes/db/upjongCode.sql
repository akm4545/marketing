create table UPJONG_CODE(
	INDSLCLSCD char(1) not null,     /* 상권정보 업종 대분류 코드 */
	INDSLCLSNM varchar(20) not null, /* 상권정보 업종 대분류 코드명 */
	INDSMCLSCD varchar(10) not null, /* 상권정보 업종 중분류 코드 */
	INDSMCLSNM varchar(20) not null, /* 상권정보 업종 중분류 코드명 */
	INDSSCLSCD varchar(10) not null, /* 상권정보 업종 소분류 코드명 */
	INDSSCLSNM varchar(20) not null /* 상권정보 업종 소분류 코드명 */
);

select * from UPJONG_CODE;