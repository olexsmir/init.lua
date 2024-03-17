;; sql
((call_expression
   (selector_expression field: (field_identifier) @_field)
   (argument_list (interpreted_string_literal) @sql))
   (#any-of? @_field "Exec" "ExecContext" "Query" "QueryContext" "QueryRow" "QueryRowContext")
   (#offset! @sql 0 1 0 -1))

((raw_string_literal) @injection.content
 (#contains? @injection.content
   "--sql" "-- sql" ; "select" "insert" "update" "delete" "from" "into" "values" "set" "where" "group by"
   "--SQL" "-- SQL" ; "SELECT" "INSERT" "UPDATE" "DELETE" "FROM" "INTO" "VALUES" "SET" "WHERE" "GROUP BY")
   )
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "sql"))

;; json
((const_spec
  name: (identifier) @_const
  value: (expression_list (raw_string_literal) @json))
 (#lua-match? @_const ".*[J|j]son.*"))

((short_var_declaration
    left: (expression_list (identifier) @_var)
    right: (expression_list (raw_string_literal) @json))
  (#lua-match? @_var ".*[J|j]son.*")
  (#offset! @json 0 1 0 -1))
