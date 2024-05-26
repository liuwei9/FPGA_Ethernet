/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.6.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QLabel *locolImglabel;
    QLabel *label_2;
    QPushButton *sendBtn;
    QPushButton *loadImgBtn;
    QPushButton *startBtn;
    QGroupBox *groupBox;
    QRadioButton *imgBtn;
    QRadioButton *ctrlBtn;
    QLabel *dstPort_label;
    QLineEdit *dstPort_edit;
    QLabel *srcPort_label;
    QLineEdit *srcPort_edit;
    QLabel *srcIP_label;
    QLineEdit *srcIP_edit;
    QLineEdit *dstIP_edit;
    QLabel *dstIP_label;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(1011, 800);
        MainWindow->setMinimumSize(QSize(0, 0));
        MainWindow->setMaximumSize(QSize(1500, 800));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        locolImglabel = new QLabel(centralwidget);
        locolImglabel->setObjectName("locolImglabel");
        locolImglabel->setGeometry(QRect(20, 150, 16, 16));
        label_2 = new QLabel(centralwidget);
        label_2->setObjectName("label_2");
        label_2->setGeometry(QRect(20, 130, 48, 16));
        sendBtn = new QPushButton(centralwidget);
        sendBtn->setObjectName("sendBtn");
        sendBtn->setGeometry(QRect(720, 30, 75, 23));
        loadImgBtn = new QPushButton(centralwidget);
        loadImgBtn->setObjectName("loadImgBtn");
        loadImgBtn->setGeometry(QRect(801, 30, 75, 23));
        startBtn = new QPushButton(centralwidget);
        startBtn->setObjectName("startBtn");
        startBtn->setGeometry(QRect(882, 30, 75, 23));
        groupBox = new QGroupBox(centralwidget);
        groupBox->setObjectName("groupBox");
        groupBox->setGeometry(QRect(370, 20, 321, 91));
        imgBtn = new QRadioButton(groupBox);
        imgBtn->setObjectName("imgBtn");
        imgBtn->setGeometry(QRect(20, 30, 95, 19));
        ctrlBtn = new QRadioButton(groupBox);
        ctrlBtn->setObjectName("ctrlBtn");
        ctrlBtn->setGeometry(QRect(20, 60, 95, 19));
        dstPort_label = new QLabel(centralwidget);
        dstPort_label->setObjectName("dstPort_label");
        dstPort_label->setGeometry(QRect(190, 60, 48, 16));
        dstPort_edit = new QLineEdit(centralwidget);
        dstPort_edit->setObjectName("dstPort_edit");
        dstPort_edit->setGeometry(QRect(200, 60, 133, 21));
        srcPort_label = new QLabel(centralwidget);
        srcPort_label->setObjectName("srcPort_label");
        srcPort_label->setGeometry(QRect(190, 30, 36, 16));
        srcPort_edit = new QLineEdit(centralwidget);
        srcPort_edit->setObjectName("srcPort_edit");
        srcPort_edit->setGeometry(QRect(200, 30, 130, 21));
        srcIP_label = new QLabel(centralwidget);
        srcIP_label->setObjectName("srcIP_label");
        srcIP_label->setGeometry(QRect(10, 30, 23, 16));
        srcIP_edit = new QLineEdit(centralwidget);
        srcIP_edit->setObjectName("srcIP_edit");
        srcIP_edit->setGeometry(QRect(50, 30, 131, 21));
        dstIP_edit = new QLineEdit(centralwidget);
        dstIP_edit->setObjectName("dstIP_edit");
        dstIP_edit->setGeometry(QRect(50, 60, 133, 21));
        dstIP_label = new QLabel(centralwidget);
        dstIP_label->setObjectName("dstIP_label");
        dstIP_label->setGeometry(QRect(10, 60, 35, 16));
        MainWindow->setCentralWidget(centralwidget);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        locolImglabel->setText(QString());
        label_2->setText(QCoreApplication::translate("MainWindow", "\346\234\254\345\234\260\345\233\276\347\211\207", nullptr));
        sendBtn->setText(QCoreApplication::translate("MainWindow", "\345\217\221\351\200\201", nullptr));
        loadImgBtn->setText(QCoreApplication::translate("MainWindow", "\345\212\240\350\275\275\345\233\276\347\211\207", nullptr));
        startBtn->setText(QCoreApplication::translate("MainWindow", "\346\211\223\345\274\200/\345\205\263\351\227\255", nullptr));
        groupBox->setTitle(QCoreApplication::translate("MainWindow", "\344\274\240\350\276\223\345\215\217\350\256\256", nullptr));
        imgBtn->setText(QCoreApplication::translate("MainWindow", "\345\233\276\345\203\217\346\225\260\346\215\256", nullptr));
        ctrlBtn->setText(QCoreApplication::translate("MainWindow", "\346\216\247\345\210\266\345\221\275\344\273\244", nullptr));
        dstPort_label->setText(QCoreApplication::translate("MainWindow", ":", nullptr));
        dstPort_edit->setText(QString());
        srcPort_label->setText(QCoreApplication::translate("MainWindow", ":", nullptr));
        srcPort_edit->setText(QString());
        srcIP_label->setText(QCoreApplication::translate("MainWindow", "\346\272\220IP", nullptr));
        dstIP_label->setText(QCoreApplication::translate("MainWindow", "\347\233\256\347\232\204IP", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
