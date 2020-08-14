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
        x: 228
        y: 148
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

    Button {
        id: button
        x: 264
        y: 380
        width: 113
        height: 43
        text: qsTr("Save")
        autoRepeat: false
        flat: false
        highlighted: true
        checkable: false
        autoExclusive: false
        checked: false
        wheelEnabled: true
        font.pointSize: 18
        font.bold: true
    }
}
