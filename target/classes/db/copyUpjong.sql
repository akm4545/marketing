create table UPJONG_CODE_COPY (
	UPJONG_CD_COPY varchar(20) not null,
	UPJONG_NM_COPY varchar(20) not null
);

alter table UPJONG_CODE_COPY modify UPJONG_CD_COPY varchar(40) not null;
alter table UPJONG_CODE_COPY modify UPJONG_NM_COPY varchar(40) not null;

select * from UPJONG_CODE_COPY;

update UPJONG_CODE_COPY set UPJONG_NM_COPY = "가방/가죽제품소매" where UPJONG_NM_COPY = "가방 및 기타 가죽제품 소매업";