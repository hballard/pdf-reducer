pragma Singleton

import QtQuick 2.10

QtObject {
    readonly property int width: 640
    readonly property int height: 480

    readonly property FontLoader mySystemFont: FontLoader {
        name: "Tahoma"
    }

    property alias fontDirectory: directoryFontLoader.fontDirectory
    property alias relativeFontDirectory: directoryFontLoader.relativeFontDirectory

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             "family": mySystemFont.name,
                                             "pixelSize": Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  "family": mySystemFont.name,
                                                  "pixelSize": Qt.application.font.pixelSize * 1.6
                                              })
    readonly property color backgroundColor: "#252525"
    readonly property color headerText: "#6e6e6e"
    readonly property color bodyText: "#ffffff"

    property DirectoryFontLoader directoryFontLoader: DirectoryFontLoader {
        id: directoryFontLoader
    }
}
