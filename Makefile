PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/man/man8
LIBEXECDIR = $(PREFIX)/libexec/sourcezap
SHAREDIR = $(PREFIX)/share/sourcezap

install:
	install -d $(BINDIR) $(LIBEXECDIR) $(SHAREDIR) $(MANDIR)
	install -m 0755 bin/sourcezap $(BINDIR)
	install -m 0755 bin/setup-sourcezap $(BINDIR)
	install -m 0755 libexec/sourcezap/* $(LIBEXECDIR)
	install -m 0644 share/sourcezap/* $(SHAREDIR)
	install -m 0644 man/man8/sourcezap.8 $(MANDIR)

deinstall:
	rm $(BINDIR)/sourcezap
	rm $(BINDIR)/setup-sourcezap
	rm $(MANDIR)/sourcezap.8
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)

shellcheck:
	shellcheck bin/sourcezap
	shellcheck libexec/sourcezap/*
