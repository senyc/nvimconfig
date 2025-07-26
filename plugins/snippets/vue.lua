local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("vcomp", fmt([[
<template>
    {}
</template>

<script setup lang="ts">
</script>
  ]], {
    i(1, "Content goes here"),
  })),
}
