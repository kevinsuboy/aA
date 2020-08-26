require 'pg'

def execute(sql)
    connection = PG::Connection.open(dbname: 'lecture') # opens our postgress lecture
    query = connection.exec(sql) # executes sql query in DB
    query_result = query.values # gets the result
    connection.close # closes DB connection
    query_result
end

def example_query
    # query = "SELECT name FROM app_academy;"
    query = <<-SQL
        SELECT
            name
        FROM
            app_academy;
        SQL
    execute(query)
end

p example_query