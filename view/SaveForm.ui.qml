import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.2
import pdfreducer 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    property alias backArrowMouseArea: mousearea
    property alias backArrow: backArrow
    property alias cancelButton: cancelButton
    property alias outputText: outputText
    property alias saveButton: saveButton
    property alias fileDialog: fileDialog

    Text {
        id: headerText
        x: 98
        y: 48
        width: 445
        height: 83
        color: "#6e6e6e"
        text: qsTr("PDF Reducer")
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        font.family: Constants.headerFont.name
        font.pixelSize: 73
    }

    Image {
        id: pdfImage
        x: 246
        y: 147
        width: 149
        height: 141
        source: "images/fa-file-pdf-o.svg"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: outputText
        x: 70
        y: 313
        width: 500
        height: 58
        color: "#ffffff"
        text: "File reduced from 10MB to 2MB (80%)"
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
        maximumLineCount: 2
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 23
    }

    Button {
        id: saveButton
        x: 264
        y: 389
        width: 113
        height: 43
        text: qsTr("Save")
        visible: true
        highlighted: true
        font.pointSize: 18
        font.bold: true
    }

    Button {
        id: cancelButton
        x: 264
        y: 389
        width: 113
        height: 43
        text: qsTr("Try Again")
        visible: false
        highlighted: true
        font.pointSize: 18
        font.bold: true
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a folder to save your file"
        folder: shortcuts.home
        selectExisting: false
        selectFolder: true
    }

    Image {
        id: backArrow
        x: 15
        y: 15
        width: 55
        height: 41
        sourceSize.height: 41
        sourceSize.width: 55
        source: "images/back-arrow.svg"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            id: mousearea
            anchors.fill: parent
        }
    }
}
