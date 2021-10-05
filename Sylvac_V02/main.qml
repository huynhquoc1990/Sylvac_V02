import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0

//import "../Sylvac_V2/Component"

import Generators 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Smart DiaTest Ver 02")
    id: root

    Flow {
        Button {
            text: "Give me a number!"
            onClicked: numberGenerator.giveNumber();
        }
        Label {
            id: numberLabel
            text: "no number"
        }
    }


    NumberGenerator {
        id: numberGenerator

        // Signal argument names are not propagated from Python to QML, so we need to re-emit the signal
        signal reNextNumber(int number)
        Component.onCompleted: numberGenerator.nextNumber.connect(reNextNumber)
    }

    Connections {
        target: numberGenerator
        onReNextNumber: numberLabel.text = number
    }
}
