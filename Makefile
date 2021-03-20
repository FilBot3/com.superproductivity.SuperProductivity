.PHONY: deps build test repo install run uninstall clean

deps:
	flatpak --user install --assumeyes flathub org.freedesktop.Platform//20.08
	flatpak --user install --assumeyes flathub org.freedesktop.Sdk//20.08

build:
	flatpak-builder --force-clean build-dir com.superproductivity.SuperProductivity.yml

test:
	flatpak-builder --user --force-clean --install build-dir com.superproductivity.SuperProductivity.yml
	flatpak run com.superproductivity.SuperProductivity

repo:
	flatpak-builder --repo=repo --force-clean build-dir com.superproductivity.SuperProductivity.yml
	flatpak build-update-repo repo

install:
	flatpak --user remote-add --if-not-exists --no-gpg-verify tutorial-repo repo
	flatpak --user install --assumeyes tutorial-repo com.superproductivity.SuperProductivity

run:
	flatpak run org.flatpak.Hello

uninstall:
	flatpak uninstall --assumeyes org.flatpak.Hello

clean:
	rm -rf ./build-dir
	rm -rf ./.flatpak-builder
	rm -rf ./repo
