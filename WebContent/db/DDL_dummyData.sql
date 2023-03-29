---------------------------------------------------------------------------ADMIN
DROP TABLE BOARD;
DROP TABLE WISHLIST;
DROP TABLE PRODUCT;
DROP TABLE MEMBER;
DROP TABLE ADMIN;

CREATE TABLE ADMIN(
    aID VARCHAR2(100) PRIMARY KEY,
    aPW VARCHAR2(100) NOT NULL,
    aNAME VARCHAR2(100) NOT NULL
);
INSERT INTO ADMIN VALUES ('admin1', '1234', '관리자1');
INSERT INTO ADMIN VALUES ('admin2', '1234', '관리자2');
SELECT * FROM ADMIN;

--------------------------------------------------------------------------MEMBER
CREATE TABLE MEMBER(
    mID VARCHAR2(100) PRIMARY KEY,
    mPW VARCHAR2(100) NOT NULL,
    mNAME VARCHAR2(100) NOT NULL,
    mNICKNAME VARCHAR2(100) UNIQUE NOT NULL,
    mTEL VARCHAR2(100) UNIQUE,
    mEMAIL VARCHAR2(100) UNIQUE,
    mBIRTH DATE,
    mGENDER VARCHAR2(5),
    mADDRESS VARCHAR2(100),
    mRDATE DATE DEFAULT SYSDATE NOT NULL
);
INSERT INTO MEMBER (mID, mPW, mNAME, mNICKNAME, mTEL, mEMAIL, mBIRTH, mGENDER, mADDRESS)
    VALUES ('aaaa', '1111', '홍길동', '동동동', '010-1234-5678', 'hong@naver.com', '1999-09-09', 'm', '서울시 서대문구');
INSERT INTO MEMBER (mID, mPW, mNAME, mNICKNAME, mTEL, mEMAIL, mBIRTH, mGENDER, mADDRESS)
    VALUES ('bbbb', '1111', '홍길이', '이이이', '010-1111-5678', 'hd@naver.com', '2000-02-02', 'f', '서울시 강남구');
INSERT INTO MEMBER (mID, mPW, mNAME, mNICKNAME, mTEL, mEMAIL, mBIRTH, mGENDER, mADDRESS)
    VALUES ('cccc', '1111', '홍길은', '은은은', '010-2345-5678', 'hng@naver.com', '1997-09-18', 'm', '서울시 강북구');
INSERT INTO MEMBER (mID, mPW, mNAME, mNICKNAME, mTEL, mEMAIL, mBIRTH, mGENDER, mADDRESS)
    VALUES ('dddd', '1111', '홍길금', '금금금', '010-5855-5678', 'hn@naver.com', '1988-12-09', 'f', '서울시 강서구');
SELECT * FROM MEMBER;

-------------------------------------------------------------------------PRODUCT
DROP SEQUENCE PRONUM_SEQ;
CREATE TABLE PRODUCT(
    pID NUMBER(6) PRIMARY KEY,
    pNAME VARCHAR2(100) NOT NULL,
    pPRICE NUMBER(9) NOT NULL,
    pSIZE VARCHAR2(50) NOT NULL,
    pCATEGORY VARCHAR2(50) NOT NULL,
    pAIMAGE VARCHAR2(100) NOT NULL,
    pBIMAGE VARCHAR2(100),
    pCONTENT VARCHAR2(4000)
);
CREATE SEQUENCE PRONUM_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '그라픽 무지 맨투맨 그레이', 35000, 'S사이즈', '남성용', '1-1.png', '1-2.png', '그라픽(GRPICK)은 Graphic(인쇄디자인)+Pic(선택하다)의 합성어로, 1000개 이상의 그래픽 아카이브. 그 기본을 토대로 다양한 그래픽 디자인을 선보이는 브랜드입니다.');
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '그라픽 무지 맨투맨 그린', 38000, 'M사이즈', '남성용', '2-1.png', '2-2.png', '그라픽(GRPICK)은 Graphic(인쇄디자인)+Pic(선택하다)의 합성어로, 1000개 이상의 그래픽 아카이브. 그 기본을 토대로 다양한 그래픽 디자인을 선보이는 브랜드입니다.');
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '그라픽 무지 맨투맨 네이비', 32000, 'L사이즈', '남성용', '3-1.png', '3-2.png', '그라픽(GRPICK)은 Graphic(인쇄디자인)+Pic(선택하다)의 합성어로, 1000개 이상의 그래픽 아카이브. 그 기본을 토대로 다양한 그래픽 디자인을 선보이는 브랜드입니다.');
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '그라픽 무지 맨투맨 퍼플', 33500, 'XL사이즈', '남성용', '4-1.png', '4-2.png', '그라픽(GRPICK)은 Graphic(인쇄디자인)+Pic(선택하다)의 합성어로, 1000개 이상의 그래픽 아카이브. 그 기본을 토대로 다양한 그래픽 디자인을 선보이는 브랜드입니다.');
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '그라픽 무지 맨투맨 오렌지', 36500, 'XXL사이즈', '남성용', '5-1.png', '5-2.png', '그라픽(GRPICK)은 Graphic(인쇄디자인)+Pic(선택하다)의 합성어로, 1000개 이상의 그래픽 아카이브. 그 기본을 토대로 다양한 그래픽 디자인을 선보이는 브랜드입니다.');
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '앨빈클로 핀턱 무지 밴드 반바지 PAN1456 그레이', 22500, '30사이즈', '남성용', '6-1.png', NULL, '출시 연도: 2022년도 / 출시 계절: 여름 / 사용대상 구분: 남녀공용');
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '앨빈클로 핀턱 무지 밴드 반바지 PAN1456 블랙', 23500, '32사이즈', '남성용', '7-1.png', NULL, '출시 연도: 2022년도 / 출시 계절: 여름 / 사용대상 구분: 남녀공용');
INSERT INTO PRODUCT VALUES (PRONUM_SEQ.NEXTVAL, '앨빈클로 핀턱 무지 밴드 반바지 PAN1456 백염', 21500, '34사이즈', '남성용', '8-1.png', NULL, '출시 연도: 2022년도 / 출시 계절: 여름 / 사용대상 구분: 남녀공용');
SELECT * FROM PRODUCT;

------------------------------------------------------------------------WISHLIST
DROP SEQUENCE WISHNUM_SEQ;
CREATE TABLE WISHLIST(
    wID NUMBER(6) PRIMARY KEY,
    mID VARCHAR2(100) REFERENCES MEMBER(mID),
    pID NUMBER(6) REFERENCES PRODUCT(pID)
);
CREATE SEQUENCE WISHNUM_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'aaaa', 1);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'aaaa', 2);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'aaaa', 3);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'bbbb', 4);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'bbbb', 1);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'bbbb', 2);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'cccc', 3);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'cccc', 4);
INSERT INTO WISHLIST VALUES (WISHNUM_SEQ.NEXTVAL, 'cccc', 1);

---------------------------------------------------------------------------BOARD
DROP SEQUENCE BOARDNUM_SEQ;
CREATE TABLE BOARD(
    bID NUMBER(5) PRIMARY KEY,
    mID VARCHAR2(100) REFERENCES MEMBER(mID),
    bTITLE VARCHAR2(100) NOT NULL,
    bCONTENT VARCHAR2(4000) NOT NULL,
    bFILENAME VARCHAR2(100),
    bHIT NUMBER(6) DEFAULT 0,
    bGROUP NUMBER(6),
    bSTEP NUMBER(6),
    bINDENT NUMBER(6),
    bRDATE DATE DEFAULT SYSDATE NOT NULL
);
CREATE SEQUENCE BOARDNUM_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
INSERT INTO BOARD (bID, mID, bTITLE, bCONTENT, bFILENAME, bHIT, bGROUP, bSTEP, bINDENT)
    VALUES (BOARDNUM_SEQ.NEXTVAL, 'aaaa', '제목1', '내용1', '1.docx' , 0, BOARDNUM_SEQ.CURRVAL, 0, 0);
INSERT INTO BOARD (bID, mID, bTITLE, bCONTENT, bFILENAME, bHIT, bGROUP, bSTEP, bINDENT)
    VALUES (BOARDNUM_SEQ.NEXTVAL, 'bbbb', '제목1', '내용1', '2.docx' , 0, BOARDNUM_SEQ.CURRVAL, 0, 0);
INSERT INTO BOARD (bID, mID, bTITLE, bCONTENT, bFILENAME, bHIT, bGROUP, bSTEP, bINDENT)
    VALUES (BOARDNUM_SEQ.NEXTVAL, 'cccc', '제목입니다', '내용입니다', NULL, 0, BOARDNUM_SEQ.CURRVAL, 0, 0);
INSERT INTO BOARD (bID, mID, bTITLE, bCONTENT, bFILENAME, bHIT, bGROUP, bSTEP, bINDENT)
    VALUES (BOARDNUM_SEQ.NEXTVAL, 'aaaa', '제목1', '내용1', '1.docx' , 0, BOARDNUM_SEQ.CURRVAL, 0, 0);
INSERT INTO BOARD (bID, mID, bTITLE, bCONTENT, bFILENAME, bHIT, bGROUP, bSTEP, bINDENT)
    VALUES (BOARDNUM_SEQ.NEXTVAL, 'bbbb', '제목1', '내용1', '2.docx' , 0, BOARDNUM_SEQ.CURRVAL, 0, 0);
INSERT INTO BOARD (bID, mID, bTITLE, bCONTENT, bFILENAME, bHIT, bGROUP, bSTEP, bINDENT)
    VALUES (BOARDNUM_SEQ.NEXTVAL, 'cccc', '제목입니다', '내용입니다', NULL, 0, BOARDNUM_SEQ.CURRVAL, 0, 0);
SELECT * FROM BOARD;
COMMIT;








