.PHONY: deps build test repo install run uninstall clean electron2 export

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
	flatpak run com.superproductivity.SuperProductivity

uninstall:
	flatpak uninstall --assumeyes com.superproductivity.SuperProductivity

clean: uninstall
	rm -rf ./build-dir
	rm -rf ./.flatpak-builder
	rm -rf ./repo
	flatpak remote-delete tutorial-repo

electron2:
	flatpak --user install --assumeyes flathub org.electronjs.Electron2.BaseApp//20.08

export:
	flatpak build-bundle repo com.superproductivity.SuperProductivity.flatpak com.superproductivity.SuperProductivity
