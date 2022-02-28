-- See :help ddc-options
-- Global config
vim.call('ddc#custom#patch_global', {
  sources = { 'nvim-lsp', 'vsnip', 'around', 'buffer' },
  sourceOptions = {
    ['_'] = {
      matchers = { 'matcher_fuzzy' },
      sorters = { 'sorter_fuzzy' },
      converters = { 'converter_fuzzy' },
    },
    ['nvim-lsp'] = {
      mark = 'LS',
      forceCompletionPattern = '\\.\\w*|:\\w*|->\\w*',
      maxCandidates = 10,
    },
    vsnip = {
      mark = 'S',
      maxCandidates = 5,
    },
    around = {
      mark = 'A',
      maxCandidates = 3,
    },
    buffer = {
      mark = 'B',
      maxCandidates = 3,
    },
  },
  sourceParams = {
    ['nvim-lsp'] = {
      kindLabels = {
        Class = 'ﴯ Class',
        Color = ' Color',
        Constant = ' Cons',
        Constructor = ' New',
        Enum = ' Enum',
        EnumMember = ' Enum',
        Event = ' Event',
        Field = 'ﰠ Field',
        File = ' File',
        Folder = ' Dir',
        Function = ' Fun',
        Interface = ' Int',
        Keyword = ' Key',
        Method = ' Method',
        Module = ' Mod',
        Operator = ' Op',
        Property = 'ﰠ Prop',
        Reference = ' Ref',
        Snippet = ' Snip',
        Struct = 'פּ Struct',
        Text = ' Text',
        TypeParameter = '',
        Unit = '塞 Unit',
        Value = ' Value',
        Variable = ' Var',
      },
    },
  },
})

-- Different source for markdown filetype
vim.call('ddc#custom#patch_filetype', 'markdown', { sources = { 'around', 'buffer' } })

-- Enable on VimEnter
vim.augroup.set('ddc_user_events', {
  { 'VimEnter', '*', 'call popup_preview#enable() | call ddc#enable()' }
})
