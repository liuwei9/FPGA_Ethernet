#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>
#include <QFileDialog>
#include <synchapi.h>
#include <unistd.h>
#include<QElapsedTimer>
#include<QBuffer>
#include <chrono>
#include <thread>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->udpIsRun = false;
    this->imgIsOpen = false;
    this->udpSocket = nullptr;
    this->ui->srcIP_edit->setText("192.168.1.101");
    this->ui->srcPort_edit->setText("8080");
    this->ui->dstIP_edit->setText("192.168.1.100");
    this->ui->dstPort_edit->setText("8081");
    this->ui->locolImglabel->setFixedSize(640, 480);
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
        if(ui->imgBtn->isChecked()){
            sendHead(true, 1080, 1920, 2979);
            sendData();
            sendFoot();
        }
        else {
            sendHead(false, 1080, 1920, 2979);
        }

    }
}


void MainWindow::on_startBtn_clicked()
{
    // if(imgIsOpen == false){
    //     QMessageBox::information(this, "信息", "请先打开一张图片");
    //     return;
    // }

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

void MainWindow::delayMicroseconds(double nsecs) {
    QElapsedTimer timer;
    timer.start();
    while (timer.nsecsElapsed() < nsecs) {
        // 循环直到达到所需的微秒数
    }
}


void MainWindow::sendData()
{
    QByteArray bt;
    QByteArray bt_img;
    int k = 500000;
    QElapsedTimer mstimer;


    uchar *bits = img.bits();

    // 计算图像的行数
    int height = img.height();
    int width = img.width();

    // 确保QByteArray足够大以存储所有像素数据
    bt_img.resize(height * width * 2 + 960); // 每个像素占用2个字节
    memcpy(bt_img.data(), bits, height * width * 2);
    mstimer.start();

    double time_Start = (double)clock();
    for(int i = 0; i < 2980; i++){
        char indexBytes[4];
        for (int j = 0; j < 4; ++j) {
            indexBytes[j] = static_cast<char>((i >> (j * 8)) & 0xFF);
        }
        std::reverse(indexBytes, indexBytes + 4);
        bt.append(indexBytes, 4);
        char lenBytes[2];
        for (int j = 0; j < 2; ++j) {
            lenBytes[j] = static_cast<char>((1392 >> (j * 8)) & 0xFF);
        }
        std::reverse(lenBytes, lenBytes + 2);
        bt.append(lenBytes, 2);
        bt.append(bt_img.mid(i*1392,1392));
        udpSocket->writeDatagram(bt, dstIp, dstPort);
        bt.clear();
        delayMicroseconds(1000*10);
    }
    double time_End = (double)clock();


    float time = (double)mstimer.nsecsElapsed()/(double)1000000;
    qDebug()<<(time_End - time_Start)/1000.0<<"s";
    qDebug() << time;
    qDebug() << "ok";
}


void MainWindow::on_loadImgBtn_clicked()
{
    QString caption = "选择文件";

    // 设置文件过滤器，例如 "所有文件 (*)"
    QString filter = "Image files (*.png *.xpm *.jpg *.jpeg *.bmp *.tiff *.gif *.webp)";

    // 获取用户选择的文件URL
    QString fileUrl = QFileDialog::getOpenFileName(nullptr,
                                               caption,
                                               QString("./"),
                                               filter);
    // 检查用户是否取消了选择
    if (!fileUrl.isEmpty()) {
        QImage image(fileUrl);
        img = image.copy().scaled(1920, 1080).convertToFormat(QImage::Format_RGB16);
        // img = image.copy().scaled(1920, 1080);
        // img = image.copy().scaled(1920, 1080);
        QImage new_img = image.scaled(640, 480);
        if (image.isNull()) {
            QMessageBox::warning(this, "警告", "无法打开图片，请检查文件路径");
        }
        else {
            this->imgIsOpen = true;
            // 设置QLabel的图片
            ui->locolImglabel->setPixmap(QPixmap::fromImage(new_img));
        }
    }
}

void MainWindow::sendFoot(void)
{
    QByteArray bt;
    QString str_s = QString("66337755332244117733998811446633336644118899337711");
    for(int i = 0; i < str_s.length(); i = i + 2){
        int t = (str_s[i].toLatin1()) * 16 + str_s[i + 1].toLatin1() - '0';
        bt.append(t);
    }
    udpSocket->writeDatagram(bt, dstIp, dstPort);

}

