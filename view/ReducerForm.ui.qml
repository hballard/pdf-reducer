import QtQuick 2.12
import QtQuick.Controls 2.15
import pdfreducer 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

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

    Image {
        id: largePDFImage
        x: 126
        y: 155
        width: 147
        height: 124
        sourceSize.width: 147
        source: "images/fa-file-pdf-o.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: arrowImage
        x: 378
        y: 180
        width: 89
        height: 75
        fillMode: Image.PreserveAspectFit
        source: "images/fa-file-pdf-o.svg"
    }

    Image {
        id: smallPDFImage
        x: 292
        y: 192
        width: 58
        height: 50
        sourceSize.height: 50
        sourceSize.width: 50
        verticalAlignment: Image.AlignVCenter
        fillMode: Image.PreserveAspectFit
        source: "images/fa-arrow-right.svg"
    }

    Text {
        id: footerText
        x: 237
        y: 402
        width: 168
        height: 30
        color: Constants.bodyText
        text: qsTr("Reducing...")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 25
    }

    BusyIndicator {
        id: busyIndicator
        x: 283
        y: 303
        width: 75
        height: 71
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#ffffff"}
}
##^##*/

