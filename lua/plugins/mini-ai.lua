-- Luau support
return {
  "nvim-mini/mini.ai",
  opts = function(_, opts)
    vim.treesitter.query.set(
      "luau",
      "textobjects",
      [[
      ; functions
      (function_definition) @function.outer
      (function_definition body: (block) @function.inner)

      (function_declaration) @function.outer
      (function_declaration body: (block) @function.inner)

      ; calls
      (function_call) @call.outer
      (function_call arguments: (arguments) @call.inner)

      ; conditionals
      (if_statement) @conditional.outer
      (if_statement consequence: (block) @conditional.inner)

      ; loops
      (for_statement) @loop.outer
      (for_statement body: (block) @loop.inner)

      (while_statement) @loop.outer
      (while_statement body: (block) @loop.inner)

      (repeat_statement) @loop.outer
      (repeat_statement body: (block) @loop.inner)
    ]]
    )
    return opts
  end,
}
