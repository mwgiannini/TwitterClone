var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'kwitterdb'
});

module.exports = db;