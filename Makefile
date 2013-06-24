#默认安装路径，可以make 时覆盖变量值
export prefix=~/usr/local
export exec_prefix=$(prefix)
export bindir=$(exec_prefix)/bin

#
package = jupiter
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)

######################
# 使用-C 参数，进入src目录后执行命令 make
# 实现递归make
#####################
all jupiter:
		$(MAKE) -C src $@

####################
#
###################
clean:
		$(MAKE) -C src $@

####################
# 单元测试
###################
check:
		$(MAKE) -C src $@
	
####################
# 安装删除
###################
install uninstall:
		$(MAKE) -C src $@


######################
# build 源码分发包
#####################
#
dist: $(distdir).tar.gz

#
distcheck:$(distdir).tar.gz
		#解压源码包，进入解压后的distdir目录尝试构建
		gzip -cd $+ | tar xvf -
		$(MAKE) -C $(distdir) all check 
		$(MAKE) -C $(distdir) prefix=./$(distdir)/_install install uninstall
		$(MAKE) -C $(distdir) clean 
		rm -rf $(distdir)
		@echo " *** Package $(distdir).tar.gz\
				ready for distibution."

distclean:
		#[ -d $(distdir) ] && rm -rf $(distdir) || echo "*** $(distdir) not exits."
		#[ -f $(distdir).tar.gz ] && rm -rf $(distdir).tar.gz  || echo "*** $(distdir).tar.gz not exits."
		rm -rf $(distdir) &> /dev/null 
		rm -rf $(distdir).tar.gz &> /dev/null

# 打包、压缩源码包
$(distdir).tar.gz: FORCE $(distdir)
		tar chof - $(distdir) | gzip -9 -c >$(distdir).tar.gz
		rm -rf $(distdir)

# 拷贝工程中所有需要作为源码分发包的文件到distdir中
$(distdir):
		mkdir -p $(distdir)/src
		cp Makefile $(distdir)
		cp src/Makefile $(distdir)/src
		cp src/main.c $(distdir)/src

# 每次制作源码包时强制删除原有内容，保证最新
FORCE:
		-rm $(distdir).tar.gz &> /dev/null
		-rm -rf $(distdir) &> /dev/null


.PHONY: all clean check dist distcheck distclean FORCE
.PHONY: install uninstall

