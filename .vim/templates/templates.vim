" Read from remote file, write to local file
function! WriteRemoteContentToFile(remote, local)
  " let template_url = 'https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore'
  let content = system("curl -s " . a:remote) " -s : curl quiet
  " echom content
  call writefile(split(content, "\n", 1), a:local, 'b')
endfunction

" --------------
" .gitignore
" --------------
function! PullGitignore()
  let remote_url = 'https://gist.githubusercontent.com/suriyadeepan/75813c1d1318bd9e17991ab3715e18e2/raw/bc4987e86c6f2e0e5755aa046cfedfd2acfedd5c/gistfile1.txt'
  call WriteRemoteContentToFile(remote_url, '.gitignore')
endfunction

" --------------
" LICENSE
" --------------
function! PullLicense()
  call WriteRemoteContentToFile("https://raw.githubusercontent.com/suriyadeepan/graphical-scholar/master/LICENSE", 'LICENSE')
endfunction


" --------------
" PYTHON
" --------------

" main.py
function! PullPythonMain()
  call WriteRemoteContentToFile("https://raw.githubusercontent.com/suriyadeepan/tana/master/tana/main.py", 'main.py')
endfunction

" train.py 
function! PullPythonTrain()
  call WriteRemoteContentToFile("https://raw.githubusercontent.com/suriyadeepan/tana/master/tana/train.py", 'train.py')
endfunction
