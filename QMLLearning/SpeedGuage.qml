import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
Item
{
    id:speedguage
    visible: true
    width: 1000; height: 800
    property bool accelerating: false
    opacity: 0.0
    CircularGauge {
        value: speedguage.accelerating ? maximumValue : 0
        anchors.fill:parent
        maximumValue: 260
        tickmarksVisible: true
        stepSize: 1

        property bool accelerating: false
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0

        style: CircularGaugeStyle {
            tickmarkStepSize: 20
            background: Canvas{
                onPaint: {
                    color:"black"
                }
            }

            tickmark:
                Rectangle {
                visible: styleData.value < 180 || styleData.value % 10 == 0
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.06
                color: styleData.value >= 120 ? "#e34c22" : "#e5e5e5"
            }
        }

        Text {
            id: valueText
            text: "K/mh"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }

        Behavior on value {
            NumberAnimation {
                duration: 2000
            }
        }
    }
}

