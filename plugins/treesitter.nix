{
  plugins.treesitter = {
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
  # :h treesitter-language-injections
 
  extraFiles = {
    "queries/go/injections.scm" = /*query*/
      ''
    (
      (short_var_declaration 
      left: (expression_list 
              (identifier) @_var_name (#eq? @_var_name "query")
              ) 
      right: (expression_list 
               (raw_string_literal) @injection.content))
      (#offset! @injection.content 0 1 0 -1)
      (#set! injection.language "sql")
    ) 
      '';
  };
}
