const request = require('supertest');
const { createApp } = require('../app');
const { myDataSource } = require('../models/typeorm-client');
//실행은 npm test

describe('설명', () => {
  //테스트 설명
  beforeAll(async () => {
    app = createApp();
    await myDataSource.initialize();
    await myDataSource.query('');
  });
  afterAll(async () => {
    await myDataSource.query('TRUNCATE cart');
    await myDataSource.destroy();
  });

  test('', async () => {
    await request(app)
      .get('endpoint') //method, endpoint
      .send() //body내용
      .expect('코드') //status code 혹은 response
      .expect('res');
  });
});

///////////////서식

//검색
describe('', () => {
  //테스트 설명
  beforeAll(async () => {
    app = createApp();
    await myDataSource.initialize();
    await myDataSource.query('');
  });
  afterAll(async () => {
    await myDataSource.query('TRUNCATE cart');
    await myDataSource.destroy();
  });

  test('', async () => {
    await request(app)
      .get('endpoint') //method, endpoint
      .send() //body내용
      .expect('코드') //status code 혹은 response
      .expect('res');
  });
});

//카트(get, add, delete, delete all)<- 나누는게 좋을듯
describe('', () => {
  //테스트 설명
  beforeAll(async () => {
    app = createApp();
    await myDataSource.initialize();
    await myDataSource.query('');
  });
  afterAll(async () => {
    await myDataSource.query('TRUNCATE cart');
    await myDataSource.destroy();
  });

  test('', async () => {
    await request(app)
      .get('endpoint') //method, endpoint
      .send() //body내용
      .expect('코드') //status code 혹은 response
      .expect('res');
  });
});

//products (key 3종 )
describe('get Product Data', () => {
  //테스트 설명
  beforeAll(async () => {
    app = createApp();
    await myDataSource.initialize();
    await myDataSource.query('');
  });
  afterAll(async () => {
    await myDataSource.query('TRUNCATE cart');
    await myDataSource.destroy();
  });

  test('Success: get Products summary by Type', async () => {
    await request(app)
      .get('endpoint') //method, endpoint
      .send() //body내용
      .expect('코드') //status code 혹은 response
      .expect('res');
  });

  test('Success: get Products summary by Type', async () => {
    await request(app)
      .get('endpoint') //method, endpoint
      .send() //body내용
      .expect('코드') //status code 혹은 response
      .expect('res');
  });

  test('Success: Get Product Detail by Id', async () => {
    await request(app)
      .get('endpoint') //method, endpoint
      .send() //body내용
      .expect('코드') //status code 혹은 response
      .expect('res');
  });

  test('Fail: Wrong Request', async () => {
    await request(app)
      .get('endpoint') //method, endpoint
      .send() //body내용
      .expect('코드') //status code 혹은 response
      .expect('res');
  });
});

describe('get Store Data', () => {
  //테스트 설명
  beforeAll(async () => {
    app = createApp();
    await myDataSource.initialize();
    await myDataSource.query('');
  });
  afterAll(async () => {
    await myDataSource.query('TRUNCATE cart');
    await myDataSource.destroy();
  });
  test('Success: get All Store Data', async () => {
    await request(app).get('/store').expect('200');
  });
});
