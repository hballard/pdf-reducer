import QtQuick 2.12
import view 1.0
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#252525"

    Image {
        id: image
        x: 109
        y: 234
        width: 186
        height: 185
        source: "images/fa-file-pdf-o.svg"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: element
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

    Text {
        id: element1
        x: 236
        y: 146
        width: 168
        height: 30
        color: "#ffffff"
        text: qsTr("Drop PDF Here")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 25
    }

    RadioButton {
        id: radioButton
        x: 377
        y: 271
        text: qsTr("Print (225 PPI)")
        font.family: "Tahoma"
        font.pointSize: 18
    }

    RadioButton {
        id: radioButton1
        x: 377
        y: 215
        text: "HD (330 PPI)"
        font.family: "Tahoma"
        enabled: true
        focusPolicy: Qt.StrongFocus
        wheelEnabled: true
        checked: true
        font.pointSize: 18
    }

    RadioButton {
        id: radioButton2
        x: 377
        y: 327
        text: qsTr("On-Screen (150 PPI)")
        font.family: "Tahoma"
        font.pointSize: 18
    }

    RadioButton {
        id: radioButton3
        x: 377
        y: 383
        text: qsTr("Email (96 PPI)")
        font.family: "Tahoma"
        font.pointSize: 18
    }
}



