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
    property string inputFile
    property string quality
    property string resultMessage
    property bool saveButtonVisibility: true
    property bool cancelButtonVisibility: false
    property bool backArrowVisibility: true

    Component {
        id: startform
        StartForm {
            dropArea.onDropped: function (drop) {
                inputFile = drop.text
                quality = radioGroup.checkedButton.text
                loader.sourceComponent = reducerform
            }
        }
    }

    Component {
        id: reducerform
        ReducerForm {

            Component.onCompleted: {
                controller.compress_file(inputFile, quality)
            }

            Connections {
                target: controller
                function onCompressionResult(result) {
                    resultMessage = result[1]
                    if (result[0] === 'error') {
                        saveButtonVisibility = false
                        backArrowVisibility = false
                        cancelButtonVisibility = true
                    }
                    loader.sourceComponent = saveform
                }
            }
        }
    }

    Component {
        id: saveform
        SaveForm {
            saveButton.visible: saveButtonVisibility
            cancelButton.visible: cancelButtonVisibility
            backArrow.visible: backArrowVisibility
            outputText.text: resultMessage

            backArrowMouseArea.onClicked: function () {
                loader.sourceComponent = startform
                cancelButtonVisibility = false
                saveButtonVisibility = true
                backArrowVisibility = true
            }

            saveButton.onClicked: function () {
                fileDialog.open()
            }

            cancelButton.onClicked: function () {
                loader.sourceComponent = startform
                cancelButtonVisibility = false
                saveButtonVisibility = true
                backArrowVisibility = true
            }

            fileDialog.onAccepted: function () {
                var result = controller.copy_file(fileDialog.folder)
                if (result[0] === 'error') {
                    saveButtonVisibility = false
                    backArrowVisibility = false
                    cancelButtonVisibility = true
                    resultMessage = result[1]
                } else {
                    loader.sourceComponent = startform
                }
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

