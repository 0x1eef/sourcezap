PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/man/man8
LIBEXECDIR = $(PREFIX)/libexec/srczap
SHAREDIR = $(PREFIX)/share/srczap

install:
	install -d $(BINDIR) $(LIBEXECDIR) $(SHAREDIR) $(MANDIR)
	install -m 0755 bin/srczap $(BINDIR)
	install -m 0755 bin/setup-srczap $(BINDIR)
	install -m 0755 libexec/srczap/* $(LIBEXECDIR)
	install -m 0644 share/srczap/* $(SHAREDIR)
	install -m 0644 man/man8/srczap.8 $(MANDIR)

deinstall:
	rm $(BINDIR)/srczap
	rm $(BINDIR)/setup-srczap
	rm $(MANDIR)/srczap.8
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)

shellcheck:
	shellcheck bin/srczap
	shellcheck libexec/srczap/*
