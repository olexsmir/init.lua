return {
  settings = {
    sqls = {
      connections = {
        {
          driver = "postgresql",
          -- dataSourceName = "host=localhost port=5432 user=postgres password=qwerty123 dbname=postgres sslmode=disable",
             dataSourceName = "host=0.0.0.0 port=5432 user=postgres password=qwerty123 dbname=postgres sslmode=disable"
          -- dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
        },
      },
    },
  },
}
