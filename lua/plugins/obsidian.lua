local obsidian_opts = {
  workspaces = {
    {
      name = "personal",
      path = "~/Dropbox/obsidian/personal",
    },
    {
      name = "reckon",
      path = "~/Dropbox/obsidian/reckon",
    },
  },

  -- Optional, if you keep notes in a specific subdirectory of your vault.
  notes_subdir = "notes",


  -- Where to put new notes. Valid options are
  --  * "current_dir" - put new notes in same directory as the current buffer.
  --  * "notes_subdir" - put new notes in the default notes subdirectory.
  new_notes_location = "current_dir",

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "notes/dailies",

    -- Optional, default tags to add to each new daily note created.
    default_tags = { "daily-notes" },
  },
  -- see below for full list of options 👇
  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  -- Optional, customize how note file names are generated given the ID, target directory, and title.
  ---@param spec { id: string, dir: obsidian.Path, title: string|? }
  ---@return string|obsidian.Path The full path to the new note.
  note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local path = spec.dir / tostring(spec.id)
    return path:with_suffix(".md")
  end,

  -- Optional, customize how wiki links are formatted. You can set this to one of:
  --  * "use_alias_only", e.g. '[[Foo Bar]]'
  --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
  --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
  --  * "use_path_only", e.g. '[[foo-bar.md]]'
  -- Or you can set it to a function that takes a table of options and returns a string, like this:
  wiki_link_func = function(opts)
    return require("obsidian.util").wiki_link_id_prefix(opts)
  end,

  -- Optional, customize how markdown links are formatted.
  markdown_link_func = function(opts)
    return require("obsidian.util").markdown_link(opts)
  end,

  -- Either 'wiki' or 'markdown'.
  preferred_link_style = "wiki",

  -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
  ---@return string
  image_name_func = function()
    -- Prefix image names with timestamp.
    return string.format("%s-", os.time())
  end,

  -- Optional, boolean or a function that takes a filename and returns a boolean.
  -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  ---@return table
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    local out = { id = note.id, aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,

}


-- Setup keyboard shortcuts
local setup_whichkey = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
      local which_key_ok, which_key = pcall(require, "which-key")
      if not which_key_ok then
        return
      end

      local current_buff_num = vim.api.nvim_get_current_buf()

      local which_key_normal_opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        buffer = current_buff_num, -- Local mappings
        silent = true,             -- use `silent` when creating keymaps
        noremap = true,            -- use `noremap` when creating keymaps
        nowait = true,             -- use `nowait` when creating keymaps
      }

      local which_key_visual_opts = {
        mode = "v", -- VISUAL mode
        prefix = "<leader>",
        -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        buffer = current_buff_num, -- Local mappings
        silent = true,             -- use `silent` when creating keymaps
        noremap = true,            -- use `noremap` when creating keymaps
        nowait = true,             -- use `nowait` when creating keymaps
      }

      local normal_mappings = {
        o = {
          'Obsidian',
          ['30'] = { ':ObsidianDailies -30 0<cr>', 'Last 30 days notes' },
          ['7'] = { ':ObsidianDailies -7 0<cr>', 'Last 7 days notes' },
          b = { ':ObsidianBackLinks<cr>', 'Back links' },
          c = { "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", "Toggle checkbox" },
          d = { ':ObsidianDailies <cr>', 'Dailies notes' },
          f = { ':ObsidianFollowLink<cr>', 'Follow link' },
          i = { ':ObsidianPasteImg ', 'Paste image from clipboard' },
          l = { ':ObsidianLinks<cr>', 'Show links' },
          n = { ':ObsidianNew ', 'New' },
          o = { ':ObsidianOpen ', 'Open in app' },
          T = { ':ObsidianTomorrow<cr>', 'Tomorrow\'s note' },
          q = { ':ObsidianQuickSwitch<cr>', 'Quick switch' },
          s = { ':ObsidianSearch ', 'Search' },
          t = { ':ObsidianToday<cr>', 'Today\'s note' },
          y = { ':ObsidianYesterday<cr>', 'Yesterday\'s note' },
          w = {
            'Switch workspace',
            w = { ':ObsidianWorkspace<cr>', 'Select Workspace' },
            p = { ':ObsidianWorkspace personal<cr>', 'personal' },
            r = { ':ObsidianWorkspace reckon<cr>', 'reckon' },
          },
        },
      }

      local visual_mappings = {
        o = {
          'Obsidian',
          e = { ':ObsidianExtractNote ', 'Extract selected text to new note' },
          l = { ':ObsidianLink<cr>', 'Link selected text' },
          n = { ':ObsidianLinkNew ', 'Link selected text to new note' },
        },
      }

      which_key.register(normal_mappings, which_key_normal_opts)
      which_key.register(visual_mappings, which_key_visual_opts)
    end,
  })
end


local setup_obsidian = function()
  vim.opt.conceallevel = 1

  local obsidian = require('obsidian')
  obsidian.setup(obsidian_opts)
  setup_whichkey()
  print("Obsidian Setup Complete")
end

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  -- opts = obsidian_opts,

  config = setup_obsidian,

}
