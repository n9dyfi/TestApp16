#ifndef MAINPAGE_H
#define MAINPAGE_H

#include <QObject>
#include <QStringList>
#include <QVariant>

class MainPage : public QObject
{
    Q_OBJECT
public:
    explicit MainPage(QObject *qml, QObject *parent = 0);

signals:
    void openHelp();

public slots:
    void openHelpRequested();

};

#endif // MAINPAGE_H
