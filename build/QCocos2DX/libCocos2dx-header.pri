## latest cocos2d-x using c++11 or c++0x, so you will see below.
CONFIG += c++11
#QMAKE_LFLAGS += -lc++
QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.7

# disble the Qt keywords extension here for cocos2d-x 3.x,
# there is some qt extension keywords in code.
DEFINES += QT_NO_KEYWORDS

SOURCE_ROOT_DIR = $$PWD/../..
COCOS2D_DIR = $$SOURCE_ROOT_DIR

DEFINES += CC_TARGET_QT5
DEFINES += USE_FILE32API
DEFINES += CC_KEYBOARD_SUPPORT

DEFINES += __QT__
DEFINES += CC_UNDER_QT
DEFINES += COCOS2D_DEBUG=1

macx {
    # system libraries.
    LIBS += -lz
    LIBS += -lcurl
    LIBS += -lsqlite3

    QMAKE_CXXFLAGS += -F/Library/Frameworks
    QMAKE_LFLAGS += -F/Library/Frameworks

    LIBS    += -framework Cocoa
    LIBS    += -framework Foundation
    LIBS    += -framework OpenAL
    LIBS    += -framework Ogg
    LIBS    += -framework Vorbis

    # prebuilt libraries
    INCLUDEPATH += $$PWD/../../external/png/include/mac
    LIBS += $$PWD/../../external/png/prebuilt/mac/libpng.a

    INCLUDEPATH += $$PWD/../../external/tiff/include/mac
    LIBS += $$PWD/../../external/tiff/prebuilt/mac/libtiff.a

    INCLUDEPATH += $$PWD/../../external/jpeg/include/mac
    LIBS += $$PWD/../../external/jpeg/prebuilt/mac/libjpeg.a

    INCLUDEPATH += $$PWD/../../external/freealut/include
    LIBS += $$PWD/../../external/freealut/prebuilt/mac/libalut.a

    INCLUDEPATH += $$PWD/../../external/freetype2/include/mac
    LIBS += $$PWD/../../external/freetype2/prebuilt/mac/libfreetype.a

    INCLUDEPATH += $$PWD/../../external/websockets/include/mac
    LIBS += $$PWD/../../external/websockets/prebuilt/mac/libwebsockets.a

    INCLUDEPATH += $$PWD/../../external/webp/include/mac
    LIBS += $$PWD/../../external/webp/prebuilt/mac/libwebp.a

    INCLUDEPATH += $$PWD/../../external/lua/luajit/include
    LIBS += -L$$PWD/../../external/lua/luajit/prebuilt/mac -lluajit

    INCLUDEPATH += /opt/local/include
    LIBS += /opt/local/lib/libGLEW.a

    contains(TEMPLATE, app) {
        APP_BUNDLE_PATH  = $${DESTDIR}/$${TARGET}.app
        DYLIB_PATH  = $${DESTDIR}/libcocos2d.dylib

        message(------------------------BEGIN------------------------------)
        ## checking `DESTDIR`, 3rd party programmer must define the `DESTDIR` before including ME in your own project.
        count(DESTDIR, 0) {
            message("`DESTDIR` is empty, Setting `DESTDIR` before including `libCocos2dx-header.pri`")
        }
        message($(QTDIR))
        message($$APP_BUNDLE_PATH)
        message($$DYLIB_PATH)
        message(-------------------------END-------------------------------)

        QMAKE_POST_LINK += $(QTDIR)/bin/macdeployqt $$APP_BUNDLE_PATH &
        QMAKE_POST_LINK += mkdir -p $$APP_BUNDLE_PATH/Contents/Frameworks &
        QMAKE_POST_LINK += cp $$DYLIB_PATH  $$APP_BUNDLE_PATH/Contents/Frameworks/libcocos2d.1.dylib &

    }
}

COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/2d
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/2d/platform
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/2d/platform/qt
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/2d/platform/renderer
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/audio/include
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/base
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/math/kazmath
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/storage/local-storage
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/ui
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/physics
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/physics/chipmunk
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/editor-support
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/editor-support/spine
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/editor-support/cocosbuilder
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/editor-support/cocostudio
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/scripting/lua-bindings/auto
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/cocos/scripting/lua-bindings/manual
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/chipmunk/include
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/chipmunk/include/chipmunk
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/edtaa3func
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/tinyxml2
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/unzip
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/xxhash
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/json
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/extensions
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/extensions/GUI
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/lua
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/lua/tolua
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/lua/luajit/include
COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/lua/luajit/src/src
#COCOS2D_INCLUDEPATH +=    $$COCOS2D_DIR/external/lua/luasocket


INCLUDEPATH += $$COCOS2D_INCLUDEPATH


