// # Ghost Configuration
// Setup your Ghost install for various environments
// Documentation can be found at http://docs.ghost.org/usage/configuration/

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
                user     : "{{ database.ghost.user }}",
                password : "{{ database.ghost.password }}",
                database : "{{ database.ghost.name }}",
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

// Export config
module.exports = config;