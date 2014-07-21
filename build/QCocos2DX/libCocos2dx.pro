#-------------------------------------------------
#
# Project created by QtCreator 2014-04-28T14:22:11
#
#-------------------------------------------------

QT      += core gui opengl

TARGET      = libCocos2dx
TEMPLATE    = lib
CONFIG      += shared
#CONFIG      += staticlib

CONFIG      += precompile_header
PRECOMPILED_HEADER  += cocos2dx-qt.pch

#VER_MAJ     = 3
#VER_MIN     = 0
#VER_PAT     = 0

#COCOS2D_VERSION = $${VER_MAJ}.$${VER_MIN}.$${VER_PAT}

# the cocos2d-x-3.x library
include($$PWD/libCocos2dx.pri)
include($$PWD/../../external/log4qt/src/log4qt/log4qt.pri)

DESTDIR = $$PWD/../../bin

win32 {
    TARGET = libcocos2d
}
unix:macx {
    QMAKE_LFLAGS_SONAME = -Wl,-install_name,@executable_path/../Frameworks/
    TARGET = cocos2d
}

#unix:!symbian {
#    maemo5 {
#        target.path = /opt/usr/lib
#    } else {
#        target.path = /usr/lib
#    }
#    INSTALLS += target
#}


SOURCES +=

HEADERS += \

OTHER_FILES +=
