CC=valac
CFLAGS=--pkg gtk+-3.0
INSTALL=install
INSTALL_PROGRAM=$(INSTALL) -Dpm 0755
INSTALL_DATA=$(INSTALL) -Dpm 0644
INSTALL_DIRECTORY=$(INSTALL) -dpm 0644

all: elegance-colors-gui

elegance-colors-gui: elegance-colors-gui.vala
	$(CC) $(CFLAGS) elegance-colors-gui.vala -o elegance-colors-gui

clean:
	rm -f elegance-colors-gui

install: elegance-colors-gui
	$(INSTALL_PROGRAM) elegance-colors $(DESTDIR)/usr/bin/elegance-colors
	$(INSTALL_PROGRAM) elegance-colors-gui $(DESTDIR)/usr/bin/elegance-colors-gui
	$(INSTALL_DATA) elegance-colors.desktop $(DESTDIR)/usr/share/applications/elegance-colors.desktop
	$(INSTALL_DATA) README $(DESTDIR)/usr/share/elegance-colors/README
	$(INSTALL_DATA) elegance-colors-process.desktop $(DESTDIR)/etc/xdg/autostart/elegance-colors-process.desktop
	$(INSTALL) -dm755 $(DESTDIR)/usr/share/elegance-colors/gnome-shell
	$(INSTALL_DATA) gnome-shell/* $(DESTDIR)/usr/share/elegance-colors/gnome-shell
	$(INSTALL) -dm755 $(DESTDIR)/usr/share/elegance-colors/presets
	$(INSTALL_DATA) presets/* $(DESTDIR)/usr/share/elegance-colors/presets

uninstall:
	rm -f $(DESTDIR)/usr/bin/elegance-colors*
	rm -f $(DESTDIR)/usr/share/applications/elegance-colors*
	rm -f $(DESTDIR)/etc/xdg/autostart/elegance-colors*
	rm -rf $(DESTDIR)/usr/share/elegance-colors/
