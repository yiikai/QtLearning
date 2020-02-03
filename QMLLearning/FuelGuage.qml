import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
Item
{
    id:fuelguage
    visible: true
    width: 200; height: 100
    property bool accelerating: false
    property string icon: ""
    signal accfuel(bool state)
    opacity: 0.0
    CircularGauge {
        value: fuelguage.accelerating ? maximumValue : 0
        anchors.fill:parent
        maximumValue: 1.0
        tickmarksVisible: true
        stepSize: 0.01

        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0

        Behavior on value{
            NumberAnimation {
                duration: 2000
            }
        }

        style: CircularGaugeStyle {
            minimumValueAngle: -80.0
            maximumValueAngle: 80.0
            tickmarkStepSize: 0.20
            tickmarkLabel:  Text {
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: {
                    if(styleData.index === 0)
                    {
                        return "Low"
                    }
                    else if(styleData.index === 5)
                    {
                        return "High"
                    }
                    else
                    {
                        return ""
                    }
                }
                color: {
                    if(styleData.index ===0)
                        return "red"
                    else
                        return "white"
                }

                antialiasing: true
            }
            tickmark:
                Rectangle {
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.06
                color: styleData.value <= 0.4 ? "#e34c22" : "#e5e5e5"
            }
        }

        Image {
            id: image
            y: 8
            anchors.bottom: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 40
            height: 28
            anchors.horizontalCenterOffset: 3
            anchors.bottomMargin: 14
            fillMode: Image.PreserveAspectFit
            source: fuelguage.icon
        }


    }
}

