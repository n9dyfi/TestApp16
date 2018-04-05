import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    Header {
        id: header
        headerText: "TestApp15"
    }

    Button{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: header.height/2
        text: qsTr("Show Help")
        onClicked: openHelpRequested()
    }

    Connections {
        target: appWindow
        onOpenHelp: pageStack.push(Qt.resolvedUrl("HelpPage.qml"))
    }

}
