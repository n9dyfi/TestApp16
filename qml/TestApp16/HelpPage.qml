import QtQuick 1.1
import com.nokia.meego 1.0
import QtWebKit 1.0

Page {

    property int defaultMargin: appDefaults.cDEFAULT_MARGIN
    property int textSize: appDefaults.cFONT_SIZE
    property int headerHeight: appDefaults.cHEADER_HEIGHT

    property string buttonFontFamily : appDefaults.cFONT_FAMILY_BUTTON
    property int    buttonFontSize   : appDefaults.cFONT_SIZE_BUTTON
    property string buttonBackground : appDefaults.cBUTTON_BACKGROUND

    property int textWidth
    property string html
    property string helpUrl : "html/index.html"
    property string currentPage

    Header {
        id: header
        headerText: "Help"
    }

    Flickable {
        id: flick
        y: headerHeight
        width: parent.width
        height: parent.height-headerHeight-helpTools.height
        contentWidth: helpView.width
        contentHeight: helpView.height
        flickableDirection: Flickable.HorizontalAndVerticalFlick
        clip: true
        WebView {
            id: helpView
            settings.defaultFontSize : textSize
            settings.localContentCanAccessRemoteUrls: true
            preferredWidth: flick.width
            preferredHeight: flick.height
            url: Qt.resolvedUrl(helpUrl)
            onLoadFinished: {
                currentPage = title
            }
        }
    }

    // Toolbar for the HelpDlg page
    ToolBar {
        id: helpTools
        anchors.bottom: parent.bottom
        tools:
            ToolBarLayout {
            // Go back to previous page
            ToolIcon {
                platformIconId: inPortrait?"toolbar-back":
                                           "toolbar-back-landscape-dimmed-white"
                onClicked: {
                    if (currentPage=="TextEditor")
                        pageStack.pop()
                    else
                        helpView.back.trigger()
                }
            }
        }
    }
}
