require("overseer").setup({
  templates = { "builtin", "user.run_script" },
})

local augend = require("dial.augend")
require("dial.config").augends:register_group({
  default = {
    augend.constant.new({
      elements = { "yes", "no" },
      word = true,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { "Yes", "No" },
      word = true,
      cyclic = true,
    }),
  },
})

local neotree = require("neo-tree")
neotree.setup({
  window = {
    mappings = {
      ["u"] = function(state)
        local node = state.tree:get_node()
        print(node)
        local path = node:get_id()
        print(path)
        if path then
          vim.fn.jobstart({ "qlmanage", "-p", path }, { detach = true })
        end
      end,
    },
  },
})

--require("flash").jump({
--search = {
--forward = true,
--wrap = false,
--multi_window = false,
--mode = function(str)
--return "\\<" .. str
--end,
--},
--})
--local Flash = require("flash")

-----@param opts Flash.Format
--local function format(opts)
---- always show first and second label
--return {
--{ opts.match.label1, "FlashMatch" },
--{ opts.match.label2, "FlashLabel" },
--}
--end

--Flash.jump({
--search = { mode = "search" },
--label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
--pattern = [[\<]],
--action = function(match, state)
--state:hide()
--Flash.jump({
--search = { max_length = 0 },
--highlight = { matches = false },
--label = { format = format },
--matcher = function(win)
---- limit matches to the current label
--return vim.tbl_filter(function(m)
--return m.label == match.label and m.win == win
--end, state.results)
--end,
--labeler = function(matches)
--for _, m in ipairs(matches) do
--m.label = m.label2 -- use the second label
--end
--end,
--})
--end,
--labeler = function(matches, state)
--local labels = state:labels()
--for m, match in ipairs(matches) do
--match.label1 = labels[math.floor((m - 1) / #labels) + 1]
--match.label2 = labels[(m - 1) % #labels + 1]
--match.label = match.label1
--end
--end,
--})
--
