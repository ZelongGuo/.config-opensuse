### Notes about my vimrc

Usually in a vim window, you can use:
```bash
# Note here the '!' represent a outside filter to excecute command
:! ls
```
to list all files in the current directory, but the current vim window would be colosed temporally and the results will be listed in the terminal. Thus this is somewhat troublesome. You can use **AsyncRun.vim** to remedy this problem (just need to add **AsyncRun** before the '**!**').

- [x] About the **AsyncRun.vim**, it can used for outputting the standard output to **quickfix** window, it is very useful when we plot figures with GMT or runnig the shell programs because we don't need to quit from the current window.  
   
   In the vimrc, we use a function (**CompileRunGcc**) to invoke the *AsyncRun.vim*, read this function carefully and you should note something important about the **buffers** of vim:  
   ```bash
   # in vim, type the following command to see the current buffers:
   :buffers
   # the above command is equal to 
   :ls
   # or
   :files
   ```
   In the output result you can see the currently active buffer **(%)** and swap buffer **(#)** etc.
   
- [x] In the vimrc:
   ```vim
   " Quickly Run with One Click and Standard Output to quickfix (with
   " asyncrun.vim plugin)
   map <F5> :call CompileRunGcc()<CR>
   func CompileRunGcc()
   	" save the file firstly
   	exec 'w'
   	if &filetype == 'sh'
   		":!time bash %
   		:AsyncRun time bash %
   		:copen
   	elseif &filetype == 'py'
   		exec "AsyncRun time python %"  
		" Note here the copen must below the AsyncRun command
   		exec "copen"
   	elseif &filetype == 'c'
   		exec "AsyncRun g++ % -o %<"
   		exec "copen"
   	elseif &filetype == 'cpp'
   		exec "AsyncRun g++ % -o %<"
   		exec "copen"
   	endif
   endfunc
   ```
- [x]   You could use 
   ```vim
   AsyncStop
   ```
   to stop the function runing.
   

