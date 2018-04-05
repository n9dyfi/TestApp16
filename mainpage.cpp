#include "mainpage.h"

MainPage::MainPage(QObject *qml, QObject *parent) :
    QObject(parent)
{
    // connect QML signals to MainPage slots
    connect(qml, SIGNAL(openHelpRequested()), this, SLOT(openHelpRequested()));

    // connect MainPage signals to QML signals
    connect(this, SIGNAL(openHelp()), qml, SIGNAL(openHelp()));

}

void MainPage::openHelpRequested()
{

    // Open the Help page
    emit(openHelp());

}

