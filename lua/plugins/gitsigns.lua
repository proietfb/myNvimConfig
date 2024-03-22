return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      yadm = {
        enable = false
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc = "Next hunks"})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc = "Previous hunks"})

        -- Actions
        map('n', '<leader>vs', gs.stage_hunk, {desc = "Stage hunk"})
        map('n', '<leader>vr', gs.reset_hunk, {desc = "Reset hunk"})
        map('v', '<leader>vs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Stage selected hunk"})
        map('v', '<leader>vr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Reset selected hunk"})
        map('n', '<leader>vS', gs.stage_buffer, {desc = "Stage buffer"})
        map('n', '<leader>vu', gs.undo_stage_hunk, {desc = "Undo stage hunk"})
        map('n', '<leader>vR', gs.reset_buffer, {desc = "Reset Buffer"})
        map('n', '<leader>vp', gs.preview_hunk, {desc = "Preview hunk"})
        map('n', '<leader>vb', function() gs.blame_line{full=true} end, {desc = "Blame line"})
        map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = "Toggle current line blame"})
        map('n', '<leader>vd', gs.diffthis, {desc = "Diff this"})
        map('n', '<leader>vD', function() gs.diffthis('~') end, {desc = "Diff all"})
        map('n', '<leader>td', gs.toggle_deleted, {desc = "Toggle deleted"})

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
})
  end
}
