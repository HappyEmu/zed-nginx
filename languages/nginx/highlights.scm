(comment) @comment

(number) @number

(metric) @number

(regex) @regex

(variable) @variable

(modifier) @operator

(simple_directive
  name: (directive) @function)

(block_directive
  name: (directive) @function)

((block_directive
  name: (directive) @keyword)
  (#match? @keyword "^(http|server|location|events|upstream|stream|mail|map|geo|types|if|limit_except)$"))

((simple_directive
  name: (directive) @keyword)
  (#match? @keyword "^(listen|include|return|rewrite|set|try_files)$"))

(lua_block_directive
  "access_by_lua_block" @function)

(generic) @string

((generic) @boolean
  (#match? @boolean "^(off|on|true|false|yes|no)$"))

(string) @string

(scheme) @string

(ipv4) @number

";" @delimiter

[
  "{"
  "}"
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

(lua_code) @definition.type
