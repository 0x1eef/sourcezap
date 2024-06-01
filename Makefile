PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/man/man8
LIBEXECDIR = $(PREFIX)/libexec/sourcezap
SHAREDIR = $(PREFIX)/share/sourcezap

install:
	install -d $(BINDIR) $(LIBEXECDIR) $(LIBEXECDIR)/commands $(LIBEXECDIR)/utils $(SHAREDIR) $(MANDIR)
	install -m 0755 bin/sourcezap $(BINDIR)
	install -m 0755 bin/setup-sourcezap $(BINDIR)
	install -m 0755 libexec/sourcezap/commands/* $(LIBEXECDIR)/commands
	install -m 0755 libexec/sourcezap/utils/* $(LIBEXECDIR)/utils
	install -m 0644 share/sourcezap/* $(SHAREDIR)
	install -m 0644 man/man8/sourcezap.8 $(MANDIR)

deinstall:
	rm $(BINDIR)/sourcezap
	rm $(BINDIR)/setup-sourcezap
	rm $(MANDIR)/sourcezap.8
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)

shellcheck:
	shellcheck bin/*
	shellcheck libexec/sourcezap/utils/*
	shellcheck libexec/sourcezap/commands/*
