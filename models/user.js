const { myDataSource } = require('./typeorm-client');

const createUser = async (
  account,
  user_password,
  user_name,
  email,
  phone_number
) => {
  const [userCheck] = await myDataSource.query(
    `SELECT account from users where account = ?`,
    [account]
  );
  if (!userCheck) {
    const userData = await myDataSource.query(
      `INSERT INTO users(
        account,
        user_password,
        user_name,
        email,
        phone_number
        ) VALUES (?,?,?,?,?);`,
      [account, user_password, user_name, email, phone_number]
    );
    return userData;
  } else if (userCheck.account === account) {
    let error = new Error('ERROR : already has user data');
    error.statusCode = 400;
    throw error;
  }
};

module.exports = { createUser };
