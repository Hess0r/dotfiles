vim.cmd([[
  let test#php#phpunit#executable = 'vendor/bin/phpunit'
  let test#php#phpunit#options = '--colors=always --testdox'

  let test#go#gotest#options = '-v'

  function! FloatermStrategy(cmd)
    execute 'silent FloatermKill test'
    execute 'FloatermNew --autoclose=2 --name=test ' . a:cmd . ' | bat --paging=always'
  endfunction

  let g:test#custom_strategies = { 'floaterm': function('FloatermStrategy') }
  let g:test#strategy = 'floaterm'
]])
