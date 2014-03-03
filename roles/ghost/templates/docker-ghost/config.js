var path = require('path'), config;

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
                host     : process.env.POSTGRES_HOST,
                user     : process.env.POSTGRES_USER,
                password : process.env.POSTGRES_PASSWORD,
                database : process.env.POSTGRES_DB,
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
