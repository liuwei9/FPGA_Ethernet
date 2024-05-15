#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->udpIsRun = false;
    this->udpSocket = nullptr;
    this->ui->srcIP_edit->setText("192.168.1.101");
    this->ui->srcPort_edit->setText("8080");
    this->ui->dstIP_edit->setText("192.168.1.100");
    this->ui->dstPort_edit->setText("8081");
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_sendBtn_clicked()
{
    if(udpSocket == nullptr){
        QMessageBox::warning(this, "警告", "udp连接还未建立，请配置IP和端口信息后点击打开按钮");
    }
    else {
        sendHead(true, 1080, 1920, 100);
    }
}


void MainWindow::on_startBtn_clicked()
{
    if(udpIsRun){
        ui->srcIP_edit->setDisabled(false);
        ui->srcPort_edit->setDisabled(false);
        ui->dstIP_edit->setDisabled(false);
        ui->dstPort_edit->setDisabled(false);
        udpSocket->abort();
        delete udpSocket;
        this->udpSocket = nullptr;
    }
    else {
        ui->srcIP_edit->setDisabled(true);
        ui->srcPort_edit->setDisabled(true);
        ui->dstIP_edit->setDisabled(true);
        ui->dstPort_edit->setDisabled(true);
        srcPort = ui->srcPort_edit->text().toUInt();
        dstPort = ui->dstPort_edit->text().toUInt();
        srcIp = QHostAddress(ui->srcIP_edit->text());
        dstIp = QHostAddress(ui->dstIP_edit->text());

        udpSocket = new QUdpSocket;
        udpSocket->bind(srcIp, srcPort);

    }
    udpIsRun = !udpIsRun;
}

void MainWindow::sendHead(bool isData, int imgH, int imgW, int packetLen)
{
    if(isData){
        QString str_s = QString("7755221133661155");
        QString str_e = QString("5511663311225577");
        QByteArray bt;
        for(int i = 0; i < str_s.length(); i = i + 2){
            int t = (str_s[i].toLatin1()) * 16 + str_s[i + 1].toLatin1() - '0';
            bt.append(t);
        }
        bt.append(1);

        char hBytes[2];
        for (int i = 0; i < 2; ++i) {
            hBytes[i] = static_cast<char>((imgH >> (i * 8)) & 0xFF);
        }
        std::reverse(hBytes, hBytes + 2);
        bt.append(hBytes, 2);

        char wBytes[2];
        for (int i = 0; i < 2; ++i) {
            wBytes[i] = static_cast<char>((imgW >> (i * 8)) & 0xFF);
        }
        std::reverse(wBytes, wBytes + 2);
        bt.append(wBytes, 2);

        char pBytes[4];
        for (int i = 0; i < 4; ++i) {
            pBytes[i] = static_cast<char>((packetLen >> (i * 8)) & 0xFF);
        }
        std::reverse(pBytes, pBytes + 4);
        bt.append(pBytes, 4);
        for(int i = 0; i < str_e.length(); i = i + 2){
            int t = (str_e[i].toLatin1()) * 16 + str_e[i + 1].toLatin1() - '0';
            bt.append(t);
        }
        udpSocket->writeDatagram(bt, dstIp, dstPort);
    }
    else {
        QString str = "7755221133661155";
        udpSocket->writeDatagram(str.toLatin1(), dstIp, dstPort);
    }
}

