TARGET = imx6

PLUGIN_TYPE = platforms
PLUGIN_CLASS_NAME = QEglFSIntegrationPlugin
load(qt_plugin)

INCLUDEPATH += .
DEPENDPATH += .

SOURCES += $$PWD/main.cpp

QT += core-private gui-private platformsupport-private

# Avoid X11 header collision
DEFINES += MESA_EGL_NO_X11_HEADERS

SOURCES +=  $$PWD/qeglfsintegration.cpp \
            $$PWD/qeglfswindow.cpp \
            $$PWD/qeglfsscreen.cpp \
            $$PWD/qeglfshooks_stub.cpp \
            $$PWD/qeglfscontext.cpp \
            $$PWD/qeglfshooks_imx6.cpp

HEADERS +=  $$PWD/qeglfsintegration.h \
            $$PWD/qeglfswindow.h \
            $$PWD/qeglfsscreen.h \
            $$PWD/qeglfshooks.h \
            $$PWD/qeglfscontext.h

QMAKE_LFLAGS += $$QMAKE_LFLAGS_NOUNDEF

INCLUDEPATH += $$PWD

CONFIG += egl qpa/genericunixfontdatabase

RESOURCES += $$PWD/cursor.qrc

OTHER_FILES += \
    $$PWD/imx6.json
