-- migrate:up
INSERT INTO
subcategory (name) 
VALUES 
('X-FIN '), ('X-40 RUN'), ('메타소닉'), ('데일리워크'), ('프로라이트'), 
('코트 프라임'), ('서브포인트'), ('드리블'), ('크로스 워커'), ('크로스 GT'), 
('크로스 엑스 '), ('에어스카이'), ('에어스카이 R'), ('샤이너'), ('데이토나'), 
('페이키'), ('OTH'), ('ORT'), ('OSL'), ('CAE'), 
('윙'), ('KS'), ('모피어스 R'), ('에어 플로우 인솔'), ('맞춤형 성형 인솔'),
('에너젯'), ('브리즈'), ('블레이드 BX'), ('원더풀 MJ'), ('수퍼쿠션'),
('ODX'), ('SPB')

-- migrate:down
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE subcategory;
SET FOREIGN_KEY_CHECKS = 1;
