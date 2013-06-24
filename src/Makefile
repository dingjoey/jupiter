#
export CC=gcc
export CXX=g++
export CPPFLAGS=
export CFLAGS=-g -O2
export CXXFLAGS=-g -O2
export LDFLAGS=

#
all: jupiter

#特殊的变量$@表示当前目标， $+表示当前目标的依赖列表
jupiter: main.c
		$(CC) $(CFLAGS) $(CPPCLAGS) -o $@ $+ 

#单元测试
check: all
		./jupiter | grep "Hello from .*jupiter!"
		@echo "*** ALL TESTS PASSED ***"

#
clean:
		[ -f ./jupiter ] && rm ./jupiter || echo "./jupiter not exists."

#安装/删除
install:
		mkdir -p $(bindir)
		cp ./jupiter $(bindir)
uninstall:
		[ -f $(bindir)/jupiter ] && rm  -f $(bindir)/jupiter


#.PHONY表示 clean是个伪rule, 不用查看其文件依赖，每次执行
.PHONY: clean check
.PHONY: install uninstall
