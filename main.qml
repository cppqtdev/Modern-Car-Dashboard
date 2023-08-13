import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
ApplicationWindow {
    id:root
    width: 1600
    height: 1200
    visible: true
    title: qsTr("Car Dashboard By Aksh")
    color: "#000000"

    //background
    background: Image{
        anchors.fill:parent
        source: "qrc:/icons/Background.png"
    }

    // Base Layer

    Image {
        anchors.centerIn: parent
        sourceSize: Qt.size(1492,717)
        source: "qrc:/icons/Base.svg"



        Image{
            id:topNavigation
            anchors{
                bottom:navigation_car.top
                bottomMargin: 50
                horizontalCenter: parent.horizontalCenter
            }

            source: "qrc:/icons/Top Navigation.svg"

            RowLayout{
                anchors.centerIn: parent
                spacing: 60
                MyButton{
                    setIcon: isGlow ? "qrc:/icons/light/bxs_music.svg" : "qrc:/icons/bxs_music.svg"
                    onClicked: isGlow = !isGlow
                }
                MyButton{
                    setIcon: isGlow ? "qrc:/icons/light/ep_menu.svg" :  "qrc:/icons/ep_menu.svg"
                    onClicked: isGlow = !isGlow
                }
                MyButton{
                    isGlow : true
                    setIcon: isGlow ? "qrc:/icons/light/Car_Icon.svg" : "qrc:/icons/Car_icon.svg"
                    onClicked: isGlow = !isGlow
                }

                MyButton{
                    setIcon: isGlow ? "qrc:/icons/light/eva_phone-call-fill.svg" :  "qrc:/icons/eva_phone-call-fill.svg"
                    onClicked: isGlow = !isGlow
                }
                MyButton{
                    setIcon: isGlow ? "qrc:/icons/light/clarity_settings-solid.svg" :  "qrc:/icons/clarity_settings-solid.svg"
                    onClicked: isGlow = !isGlow
                }
            }
        }


        SideGauge {
            id:leftGauge
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: parent.width / 11
            }
            property bool accelerating
            width: 400
            height: 400
            value: accelerating ? maximumValue : 0
            maximumValue: 250
            Component.onCompleted: forceActiveFocus()
            Behavior on value { NumberAnimation { duration: 1000 }}

            Keys.onSpacePressed: accelerating = true
            Keys.onReturnPressed: rightGauge.accelerating = true
            Keys.onReleased: {
                if (event.key === Qt.Key_Space) {
                    accelerating = false;
                    event.accepted = true;
                }else if(event.key === Qt.Key_Return){
                    rightGauge.accelerating = false;
                    event.accepted = true;
                }
            }
        }

        Image {
            id:navigation_car
            visible: false
            anchors.centerIn: parent
            source: "qrc:/icons/Navigation.png"
        }

        RowLayout{
            id:speedLimit
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 26.50 + 65
            Label{
                text: "P"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                color: "#FFFFFF"
            }

            Label{
                text: "R"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
            Label{
                text: "N"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
            Label{
                text: "D"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
        }

        Image {
            anchors{
                bottom: car.top
                bottomMargin: 60
                horizontalCenter:car.horizontalCenter
            }
            source: "qrc:/img/Model 3.png"
        }

        Image {
            anchors{
                bottom: car.top
                bottomMargin: -60
                horizontalCenter:car.horizontalCenter
            }
            source: "qrc:/icons/Headlights.svg"
        }

        Image {
            id:car
            anchors{
                bottom: speedLimit.top
                bottomMargin: 40
                horizontalCenter:speedLimit.horizontalCenter
            }
            source: "qrc:/icons/Car.svg"
        }

        // IMGonline.com.ua  ==> Compress Image With


        /*
          Left Road
        */

        Image {
            id: leftRoad
            width: 127
            height: 397
            anchors{
                left: speedLimit.left
                leftMargin: 100
                bottom: parent.bottom
                bottomMargin: 26.50 + 50
            }

            source: "qrc:/icons/Vector 2.svg"
        }

        RowLayout{
            spacing: 20

            anchors{
                left: parent.left
                leftMargin: 250
                bottom: parent.bottom
                bottomMargin: 26.50 + 65
            }

            RowLayout{
                spacing: 1
                Layout.topMargin: 10
                Rectangle{
                    width: 20
                    height: 15
                    color: leftGauge.value.toFixed(0) > 31.25 ? leftGauge.speedColor : "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: leftGauge.value.toFixed(0) > 62.5 ? leftGauge.speedColor : "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: leftGauge.value.toFixed(0) > 93.75 ? leftGauge.speedColor : "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: leftGauge.value.toFixed(0) > 125.25 ? leftGauge.speedColor : "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: leftGauge.value.toFixed(0) > 156.5 ? leftGauge.speedColor : "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: leftGauge.value.toFixed(0) > 187.75 ? leftGauge.speedColor : "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: leftGauge.value.toFixed(0) > 219 ? leftGauge.speedColor : "#01E6DC"
                }
            }

            Label{
                text: leftGauge.value.toFixed(0) + " MPH "
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                color: "#FFFFFF"
            }
        }

        /*
          Right Road
        */

        Image {
            id: rightRoad
            width: 127
            height: 397
            anchors{
                right: speedLimit.right
                rightMargin: 100
                bottom: parent.bottom
                bottomMargin: 26.50 + 50
            }

            source: "qrc:/icons/Vector 1.svg"
        }


        SideGauge {
            id:rightGauge
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: parent.width /11
            }
            property bool accelerating
            width: 400
            height: 400
            value: accelerating ? maximumValue : 0
            maximumValue: 250
            Behavior on value { NumberAnimation { duration: 1000 }}
        }
    }
}
