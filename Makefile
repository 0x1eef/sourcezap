PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/man/man8
LIBEXECDIR = $(PREFIX)/libexec/sourcezap
SHAREDIR = $(PREFIX)/share/sourcezap

install:
	@find bin/ libexec/ share/ -type d -exec install -v -d $(PREFIX)/"{}" \;
	@find bin/ libexec/ -type f -exec install -v -m 0755 "{}" $(PREFIX)/"{}" \;
	@find share/ man/ -type f -exec install -v -m 0644 "{}" $(PREFIX)/"{}" \;

deinstall:
	rm $(BINDIR)/sourcezap
	rm $(BINDIR)/setup-sourcezap
	rm $(MANDIR)/sourcezap.8
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)

shellcheck:
	find bin/ libexec/ -type f -exec shellcheck "{}" \;
