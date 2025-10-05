{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = false;
      settings = {
        highlight = {
          enable = true;
        };
        indent = {
          enable = true;
        };
      };
    };
  };

  # :h treesitter-language-injections
  extraFiles = {
    "queries/go/injections.scm".text = /* query */''
        ; If a variable name is query assume it is sql
        (
          (short_var_declaration
            left: (expression_list
              (identifier) @_var_name (#eq? @_var_name "query")
              )
            right: (expression_list
              [
                (raw_string_literal)
                (interpreted_string_literal)
              ] @injection.content)
            )
          (#offset! @injection.content 0 1 0 -1)
          (#set! injection.language "sql")
        )

        ; If a function being called is any of the below names assume any string is sql
        (
          (call_expression
            (selector_expression
              field: (field_identifier) @_field_name (#any-of? @_field_name "Query" "QueryContext" "QueryRowContext" "QueryRow" "Exec" "ExecOne" "ExecContext")
              )
            (argument_list
              [
                (raw_string_literal)
                (interpreted_string_literal)
              ] @injection.content)

            )
          (#offset! @injection.content 0 1 0 -1)
          (#set! injection.language "sql")
        )
      '';
  };
}
