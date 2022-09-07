# Pro-Coders
### [Pro-Coders 사이트 방문하기]

---

## Introduction

### [JUSTCODE 6시 1st Project] Pro-Coders     

JUSTCODE 6기 첫번째 프로젝트 7팀 Prospecs 사이트 클론 코딩 프로젝트의 백엔드 세션입니다.    

- 프로젝트 Information     
  - 프로젝트 목표       
    스포츠 웨어 브랜드인 Prospecs 공식 사이트 클론 코딩을 통해 이커머스 사이트의 기본 구조와 API를 구현하기    
    [원본 사이트 - 프로스펙스](https://www.prospecs.com/)   
  
  - 사이트 선정 이유 (백엔드)       
    이커머스 사이트의 특성을 잘 가지고 있으면서 동일 상품이 사이즈, 색상별로 분류되어 있기 때문에 모델링 및 DB 작성에 있어 좀 더 풍부한 경험을 할 수 있을 것이라 생각하여 본 사이트를 선정하였습니다. 

  - 팀 구성   
    Front-end (3명): 봉원희, 이다익, 최승철    
    Back-end (2명): 이신희, 조윤식  
  
  - 기간 2022. 08. 27 ~ 2022. 09. 08.   
   
  - [프론트엔드 GitHub](https://github.com/wecode-bootcamp-korea/justcode-6-1st-pro-coders-front)   
  - [백엔드 GitHub](https://github.com/wecode-bootcamp-korea/justcode-6-1st-pro-coders-back)   
  - [프로젝트 Notion Page](https://www.notion.so/wecode/7team-Pro-Coders-6ed4512003274604aac55e2ee781e953)   
  
## Demo

## DB modeling

<img src = "https://user-images.githubusercontent.com/107532513/188799644-ddb8932d-c2f7-4ead-9ed2-8638218efd4e.png">

## Technologies

- Javascript
- Node js
- MySQL
- Git, GitHub

## Features

**User**

- 회원가입   
  사용자 정보를 받아 새로운 사용자를 생성합니다.
  
- 로그인   
  사용자 정보를 받아 사용자 유효성을 확인하고 토큰을 반환합니다.
  
- 장바구니   
  토큰을 받아 사용자의 장바구니 정보를 불러옵니다.    
  제품 추가, 삭제, 장바구니 전체 삭제가 가능합니다.

**Product**

- 제품 정보 조회   
  제품의 타입, 카테고리, 제품 id를 받아 제품 정보를 반환합니다.

**Search**

- 검색   
  검색어를 받아 해당 검색어를 포함하는 제품 목록을 반환합니다.

**Store**

- 점포 조회   
  전체 매장의 정보를 반환합니다.

## API Document

- [API Document 1](https://documenter.getpostman.com/view/23155227/VUxSsm3G)   
- [API Document 2](https://documenter.getpostman.com/view/22725460/VV56Lse1#dcb1bd31-4612-4794-abc0-e41d6723de22)
