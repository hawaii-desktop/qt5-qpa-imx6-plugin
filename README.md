# Qt 5 QPA imx6 plugin

This QPA allows rendering on Vivante GPU even when qtbase is not built for i.MX6 which
is the case with some general purpose distributions.

## Build requirements

* Qt 5 devel package
* Vivante drivers in /opt/fsl

## How to build and install

```sh
cd imx6
qmake-qt5
make
sudo make install
```

## ArchLinux

To avoid linker errors on ArchLinux, please replace the ```qmake-qt5``` command with this:

```sh
qmake-qt5 QMAKE_LIBS_PRIVATE+="-lfontconfig -lfreetype -lXrender -lglib-2.0 -ludev -lmtdev"
```

Make sure you have the ```gpu-viv-bin-mx6q-fb``` package installed.
