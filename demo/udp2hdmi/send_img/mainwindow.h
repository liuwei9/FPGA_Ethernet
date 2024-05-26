#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QUdpSocket>
#include <QHostAddress>

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_sendBtn_clicked();

    void on_startBtn_clicked();

    void on_loadImgBtn_clicked();

private:
    Ui::MainWindow *ui;
    bool udpIsRun;
    bool imgIsOpen;
    QHostAddress srcIp;
    QHostAddress dstIp;
    qint16 srcPort;
    qint16 dstPort;
    QUdpSocket *udpSocket;
    QImage img;

    void sendHead(bool isData, int imgH, int imgW, int packetLen);
    void sendFoot(void);
    void sendData();
    void delayMicroseconds(double microseconds);
};
#endif // MAINWINDOW_H
