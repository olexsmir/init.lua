;; extends

((let
   pattern: (identifier) @_identifier
   (#any-of? @_identifier "sql" "q" "query")
   value: (string (quoted_content) @injection.content))
 (#set! injection.language "sql"))
