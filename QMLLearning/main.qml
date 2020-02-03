import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import com.mycompany.mediainfo 1.0

Window {
    id: root
    visible: true
    width: 1280; height: 720
    title: "VechileGuage"
    Mediainfo{
        id:media
    }
    Rectangle{
        id:rootRect
        color:"black"
        anchors.fill: parent
        FuelGuage {
            id:fuelguage
            x: 0
            y: 518
            width: 349
            height: 271
            icon:"qrc:/img/fuel_icon_color.png"
            onAcceleratingChanged: {
                console.log("Fuel is accelerating!!!!")
                accfuel(accelerating)
            }
        }

        Connections{
            target: fuelguage
            onAccfuel:{
                console.log("state is: " + state)
            }
        }

        SpeedGuage {
            id:speedguage
            anchors.fill: parent
            anchors.verticalCenterOffset: 7
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }



        SequentialAnimation{
            id:startAnimation
            NumberAnimation {
                targets: [speedguage]
                property: "opacity"
                duration: 1000
                from: 0.0
                to:1.0
                easing {type: Easing.InBack}
            }
            NumberAnimation {
                targets: [fuelguage]
                property: "opacity"
                duration: 1000
                from: 0.0
                to:1.0
                easing {type: Easing.InBack}
            }
        }

        Button {
            id: button
            x: 1161
            y: 52
            text: qsTr("Start")
            onClicked: {
                startAnimation.start()
                rootRect.forceActiveFocus()
            }
        }

        TextEdit {
            id: textEdit
            x: 1161
            y: 115
            width: 100
            height: 25
            text: qsTr("Text Edit")
            font.pixelSize: 12
            onTextChanged: {
                media.medianame = text
            }
        }

        Connections{
            target: media
            onMediastart:
            {
                console.log("media start!!!!")
            }
        }

        Component.onCompleted:
        {

        }

        Keys.onSpacePressed: {
            speedguage.accelerating = true
            fuelguage.accelerating = true
        }
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                speedguage.accelerating  = false;
                fuelguage.accelerating = false;
                event.accepted = true;
            }
        }
    }
}
