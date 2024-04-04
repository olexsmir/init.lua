;; sql
((call_expression
 (selector_expression field: (field_identifier) @_field)
 (argument_list (interpreted_string_literal) @sql))
 (#any-of? @_field
           "Exec" "ExecContext" "Query" "QueryContext" "QueryRow" "QueryRowContext")
 (#offset! @sql 0 1 0 -1))

((raw_string_literal) @injection.content
 (#contains? @injection.content
             "--sql" "-- sql" "--SQL" "-- SQL")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "sql"))
