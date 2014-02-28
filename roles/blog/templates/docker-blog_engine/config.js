var path = require('path'),
    config;

config = {
  production: {
        url: "http://www.cochezconsult.be",
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
                host     : process.env.DB_PORT_5432_TCP_ADDR,
                user     : process.env.DB_ENV_POSTGRES_USER,
                password : process.env.DB_ENV_POSTGRES_PASSWORD,
                database : process.env.DB_ENV_POSTGRES_DB,
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
