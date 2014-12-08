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

# Vivante

QMAKE_INCDIR           += $$[QT_SYSROOT]/usr/include
QMAKE_LIBDIR           += $$[QT_SYSROOT]/usr/lib $$[QT_SYSROOT]/opt/fsl/lib

QMAKE_LIBS_EGL         += -lEGL
QMAKE_LIBS_OPENGL_ES2  += -lGLESv2 -lEGL -lGAL
QMAKE_LIBS_OPENVG      += -lOpenVG -lEGL -lGAL

QMAKE_LFLAGS           += -Wl,-rpath-link,$$[QT_SYSROOT]/usr/lib

IMX6_CFLAGS             = -march=armv7-a -mfpu=neon -DLINUX=1 -DEGL_API_FB=1
QMAKE_CFLAGS           += $$IMX6_CFLAGS
QMAKE_CXXFLAGS         += $$IMX6_CFLAGS
INCLUDEPATH            += /opt/fsl/include
