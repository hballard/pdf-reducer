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
        x: 126
        y: 161
        width: 147
        height: 124
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
        x: 237
        y: 402
        width: 168
        height: 30
        color: "#ffffff"
        text: qsTr("Reducing...")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 25
    }

    Text {
        id: element2
        x: 237
        y: 357
        width: 168
        height: 30
        color: "#ffffff"
        text: qsTr("75%")
        font.bold: true
        font.pixelSize: 35
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Image {
        id: image1
        x: 378
        y: 186
        width: 89
        height: 75
        fillMode: Image.PreserveAspectFit
        source: "images/fa-file-pdf-o.svg"
    }

    Image {
        id: image2
        x: 292
        y: 198
        width: 58
        height: 50
        verticalAlignment: Image.AlignVCenter
        mipmap: false
        fillMode: Image.PreserveAspectFit
        source: "images/fa-arrow-right.svg"
    }

    ProgressBar {
        id: progressBar
        x: 126
        y: 324
        width: 389
        height: 8
        wheelEnabled: false
        spacing: 0
        font.pointSize: 15
        indeterminate: false
        value: 0.7
    }
}
