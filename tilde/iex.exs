Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: :red,
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ],
  default_prompt:
    "#{IO.ANSI.green()}%prefix#{IO.ANSI.reset()}" <>
      "[#{IO.ANSI.cyan()}%counter#{IO.ANSI.reset()}]>",
  alive_prompt:
    "#{IO.ANSI.green()}%prefix#{IO.ANSI.reset()}" <>
      "(#{IO.ANSI.yellow()}%node#{IO.ANSI.reset()})" <>
      "[#{IO.ANSI.cyan()}%counter#{IO.ANSI.reset()}]>",
  history_size: 50,
  inspect: [
    pretty: true,
    limit: :infinity,
    width: 80,
    # Fix for map key sorting: `data = %{a: 1, b: 2, c: 3, d: 4}`
    custom_options: [sort_maps: true]
  ],
  width: 80
)
