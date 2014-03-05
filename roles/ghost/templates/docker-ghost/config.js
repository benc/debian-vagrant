var path = require('path'), config;
var etcd = require('nodejs-etcd');

var etcdConfig = new etcd({
    url: 'http://127.0.0.1:4001'
})

etcdConfig.read({'db_host': '/postgres/ip', function (err, result, body) {
  if (err) throw err;
  assert(result.value);
});

etcdConfig.read({'db_user': '/postgres/user', function (err, result, body) {
  if (err) throw err;
  assert(result.value);
});

etcdConfig.read({'db_password': '/postgres/password', function (err, result, body) {
  if (err) throw err;
  assert(result.value);
});

etcdConfig.read({'db_database': '/postgres/database', function (err, result, body) {
  if (err) throw err;
  assert(result.value);
});

config = {
  production: {
        url: "http://www.cochez.io",
        mail: {
            transport: "SMTP",
            host: "{{ mandrill.host }}",
            options: {
                service: "Mandrill",
                auth: {
                    user: "{{ mandrill.user }}",
                    pass: "{{ mandrill.api_key }}"
                }
            }
        },
        database: {
            client: "postgres",
            connection: {
                host     : db_host,
                user     : db_user,
                password : db_password,
                database : db_database,
                charset  : "utf8"
            },
            debug: false
        },
        server: {
            host: "127.0.0.1",
            port: "2368"
        }
    }
};

module.exports = config;
