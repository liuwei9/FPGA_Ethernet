#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->udpIsRun = false;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_sendBtn_clicked()
{

}


void MainWindow::on_startBtn_clicked()
{
    if(udpIsRun){
        ui->srcIP_edit->setDisabled(false);
        ui->srcPort_edit->setDisabled(false);
        ui->dstIP_edit->setDisabled(false);
        ui->dstPort_edit->setDisabled(false);
    }
    else {
        ui->srcIP_edit->setDisabled(true);
        ui->srcPort_edit->setDisabled(true);
        ui->dstIP_edit->setDisabled(true);
        ui->dstPort_edit->setDisabled(true);
    }
    udpIsRun = !udpIsRun;
}

