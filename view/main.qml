import QtQuick 2.12
import QtQuick.Window 2.3
import pdfreducer 1.0

Window {
    title: "PDF Reducer"
    minimumHeight: Constants.height
    maximumHeight: Constants.height
    minimumWidth: Constants.width
    maximumWidth: Constants.width
    visible: true

    Component {
        id: startform
        StartForm {
            dropArea.onDropped: function (drop) {
                console.log(drop.text)
                console.log(radioGroup.checkedButton.text)
                loader.sourceComponent = reducerform
            }
        }
    }

    Component {
        id: reducerform
        ReducerForm {
            progressBar.value: .2
            percentText.text: "20%"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    loader.sourceComponent = saveform
                }
            }
        }
    }

    Component {
        id: saveform
        SaveForm {
            saveButton.onClicked: function () {
                fileDialog.open()
            }

            fileDialog.onAccepted: function () {
                console.log(fileDialog.folder)
                loader.sourceComponent = startform
            }
        }
    }

    Loader {
        id: loader
        sourceComponent: startform
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

