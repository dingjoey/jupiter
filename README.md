### Makefile语法 ###

- Makfile组成部分
    1. 变量设置
    2. 规则
    3. 命令
- 引用shell中的变量要转义$；即$${SHELL_VAR}
- "automatic" variables 
    - $@表示当前目标
    - $+ 表示所有的依赖文件，这些依赖文件之间以空格分开，按照出现的先后为顺序，其中可能包含重复的依赖文件
    - $< 依赖项中的第一个依赖文件的名称
    - $^ 依赖项中，所有不重复的依赖文件，这些文件之间以空格分开
    - $? 依赖项中，所有目标文件时间戳晚的依赖文件，依赖文件之间以空格分开
- -C command-line option tells make to change to the specified directory
- .PHONY规则指定改命令不会去查找任何文件依赖，每次都执行
- .c.o: #表示缺省规则表示所有的 .o文件都是依赖与相应的.c文件的
    gcc -c $< -o $@

### GNU coding standards ###

- 需要提供一系列的rule
    - 所有：all programname
    - 单元测试： check
    - 源码分发打包/检查 ： dist distcheck
    - 清理：clean
- 需要提供和路径相关的变量
    - prefix          = /usr/local
    - exec-prefix     = $(prefix)
    - bindir          = $(exec_prefix)/bin
    - sbindir         = $(exec_prefix)/sbin
    - libexecdir      = $(exec_prefix)/libexec
    - datarootdir     = $(prefix)/share
    - datadir         = $(datarootdir)
    - sysconfdir      = $(prefix)/etc
    - sharedstatedir  = $(prefix)/comlocal
    - statedir   = $(prefix)/var
    - includedir      = $(prefix)/include
    - oldincludedir   = /usr/include
    - docdir          = $(datarootdir)/doc/$(package)
    - libdir          = $(exec_prefix)/lib
- 需要提供和编译相关的变量
    - CC         - the C compiler
    - CFLAGS     - C compiler flags
    - CXX        - the C++ compiler
    - CXXFLAGS   - C++ compiler flags  
    - LDFLAGS    - linker flags
    - CPPFLAGS   - C preprocessor flags

### 样本工程 ###

- jupiter

