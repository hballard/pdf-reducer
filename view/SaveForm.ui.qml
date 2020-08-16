import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.2
import pdfreducer 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
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
        font.family: "Franklin Gothic"
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
        x: 124
        y: 321
        color: "#ffffff"
        text: qsTr("File reduced from 10MB to 2MB (80%)")
        fontSizeMode: Text.FixedSize
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 23
    }

    Button {
        id: saveButton
        x: 264
        y: 380
        width: 113
        height: 43
        text: qsTr("Save")
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
}
