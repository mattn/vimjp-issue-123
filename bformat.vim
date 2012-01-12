scriptencoding utf-8
function! s:line(lhs, rhs)
  let per = str2float(a:rhs)/str2float(a:lhs) * 100
  let per = str2float(string(floor(per * 10.0)))/10.0
  echo printf("|%s|%s|%s|", a:lhs, a:rhs, string(per))
endfunction

function! s:show(name, comment)
  let lines = filter(map(readfile(a:name), 'matchstr(v:val, ''^\s*\zs.*\ze\s*$'')'), 'len(v:val) > 0')
  echo a:name
  echo "=======\n\n"
  echo a:comment
  echo "\n"
  echo "|originalpatched|%|"
  echo "|-------|-------|-|"
  call s:line(lines[0], lines[3])
  call s:line(lines[1], lines[4])
  call s:line(lines[2], lines[5])
  echo "\n"
endfunction

call s:show('foo.log', '4行連結が2000個と2000行連結が1個')
call s:show('bar.log', '2行連結が12000個')
call s:show('baz.log', '連結無しが10000個')
