-- migrate:up
INSERT INTO 
users (email, password, name, phone_number, date_of_birth, gender, dormancy_prevention_period) 
VALUES 
('codekim@coder.com', '$2a$12$SzmVY3PuzHAWNEmgw5duO./wMF5jrd4V7YndKHWyeSPXZbWpCFYRi', 'Kimcode', '010-0000-0000', '1997-08-19', 'male', 1), 
('lee@coder.com', '$2a$12$/WFNzZAGLSP8/DFEDF3qmeQV1mpX2z738TpwhgU3BwzVaVVEgTf7C', 'Leecoder', '010-0000-0000', '1989-10-15', 'female', 5), 
('shimi@coder.com', '$2a$12$DYlug3qovCrLZZz5O7knEejAn4GKfYds6MmCs..RglR0Phqn8873q', 'Shimvalues', '010-0000-0000', Null, Null, Null), 
('k_data@coder.com', '$2a$12$jWXxm01Zdqsdx8B4.nSN.u5uQvai1tUmzxJhNH3qjAgGkAVfYXpm6', 'Kangdata', '010-0000-0000', Null, Null, Null), 
('quwrychoi@coder.com', '$2a$12$Y0/DwsrGgCIvmIhVd0kq1ueJsihGsJh03ORD9t1V6BRc0Sy7V82Sa', 'Choiquery', '010-0000-0000', '2003-01-31', 'male', 3), 
('nobug@coder.com', '$2a$12$2sx7ucm/nUsbuoFLWwlxieUNC6w77agTCuwp8INCBaU8AyuqMP49e', 'Jodebug', '010-0000-0000', '2007-05-30', 'female', 5)

-- migrate:down
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE users;
SET FOREIGN_KEY_CHECKS = 1;
