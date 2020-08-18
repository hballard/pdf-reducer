import QtQuick 2.12
import QtQuick.Controls 2.15
import pdfreducer 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    property alias dropArea: dropArea
    property alias radioGroup: radioGroup

    DropArea {
        id: dropArea
        anchors.fill: parent
    }

    Image {
        id: pdfImage
        x: 109
        y: 234
        width: 186
        height: 185
        sourceSize.height: 186
        sourceSize.width: 186
        source: "images/fa-file-pdf-o.svg"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: headerText
        x: 98
        y: 48
        width: 445
        height: 83
        color: Constants.headerText
        text: qsTr("PDF Reducer")
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        font.family: "Franklin Gothic"
        font.pixelSize: 73
    }

    Text {
        id: subHeaderText
        x: 236
        y: 146
        width: 168
        height: 30
        color: Constants.bodyText
        text: qsTr("Drop PDF Here")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 25
    }

    ButtonGroup {
        id: radioGroup
        buttons: radioColumn.children
    }

    Column {
        id: radioColumn
        x: 331
        y: 216
        width: 212
        height: 203
        visible: true
        spacing: 5

        RadioButton {
            id: radioButton330
            text: qsTr("HD (300 PPI)")
            checked: true
            font.pointSize: 18
        }

        RadioButton {
            id: radioButton225
            text: qsTr("Print (300 PPI)")
            font.pointSize: 18
        }

        RadioButton {
            id: radioButton150
            text: qsTr("Presentation (150 PPI)")
            font.pointSize: 18
        }

        RadioButton {
            id: radioButton96
            text: qsTr("Email (72 PPI)")
            font.pointSize: 18
        }
    }
}
