return {
  -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
  line_insert = "DiffAdd",    -- Line-level insertions
  line_delete = "DiffDelete", -- Line-level deletions

  -- Character-level: accepts highlight group names or hex colors
  -- If specified, these override char_brightness calculation
  char_insert = nil, -- Character-level insertions (nil = auto-derive)
  char_delete = nil, -- Character-level deletions (nil = auto-derive)

  -- Brightness multiplier (only used when char_insert/char_delete are nil)
  -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
  char_brightness = nil, -- Auto-adjust based on your colorscheme

  -- Conflict sign highlights (for merge conflict views)
  -- Accepts highlight group names or hex colors (e.g., "#f0883e")
  -- nil = use default fallback chain
  conflict_sign = nil,          -- Unresolved: DiagnosticSignWarn -> #f0883e
  conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
  conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
  conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149

}
