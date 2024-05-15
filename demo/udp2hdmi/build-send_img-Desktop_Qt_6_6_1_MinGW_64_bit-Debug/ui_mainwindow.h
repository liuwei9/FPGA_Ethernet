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
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QSplitter>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QPushButton *sendBtn;
    QPushButton *startBtn;
    QWidget *layoutWidget;
    QVBoxLayout *verticalLayout_5;
    QSplitter *splitter;
    QWidget *layoutWidget1;
    QVBoxLayout *verticalLayout;
    QLabel *srcIP_label;
    QLineEdit *srcIP_edit;
    QWidget *layoutWidget2;
    QVBoxLayout *verticalLayout_2;
    QLabel *srcPort_label;
    QLineEdit *srcPort_edit;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout_3;
    QLabel *dstIP_label;
    QLineEdit *dstIP_edit;
    QVBoxLayout *verticalLayout_4;
    QLabel *dstPort_label;
    QLineEdit *dstPort_edit;
    QGroupBox *groupBox;
    QRadioButton *imgBtn;
    QRadioButton *ctrlBtn;
    QLabel *locolImglabel;
    QLabel *label_2;
    QPushButton *loadImgBtn;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(1920, 1080);
        MainWindow->setMinimumSize(QSize(1920, 1080));
        MainWindow->setMaximumSize(QSize(1920, 1080));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        sendBtn = new QPushButton(centralwidget);
        sendBtn->setObjectName("sendBtn");
        sendBtn->setGeometry(QRect(320, 1040, 75, 23));
        startBtn = new QPushButton(centralwidget);
        startBtn->setObjectName("startBtn");
        startBtn->setGeometry(QRect(410, 1040, 75, 23));
        layoutWidget = new QWidget(centralwidget);
        layoutWidget->setObjectName("layoutWidget");
        layoutWidget->setGeometry(QRect(10, 970, 280, 98));
        verticalLayout_5 = new QVBoxLayout(layoutWidget);
        verticalLayout_5->setObjectName("verticalLayout_5");
        verticalLayout_5->setContentsMargins(0, 0, 0, 0);
        splitter = new QSplitter(layoutWidget);
        splitter->setObjectName("splitter");
        splitter->setOrientation(Qt::Horizontal);
        layoutWidget1 = new QWidget(splitter);
        layoutWidget1->setObjectName("layoutWidget1");
        verticalLayout = new QVBoxLayout(layoutWidget1);
        verticalLayout->setObjectName("verticalLayout");
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        srcIP_label = new QLabel(layoutWidget1);
        srcIP_label->setObjectName("srcIP_label");

        verticalLayout->addWidget(srcIP_label);

        srcIP_edit = new QLineEdit(layoutWidget1);
        srcIP_edit->setObjectName("srcIP_edit");

        verticalLayout->addWidget(srcIP_edit);

        splitter->addWidget(layoutWidget1);
        layoutWidget2 = new QWidget(splitter);
        layoutWidget2->setObjectName("layoutWidget2");
        verticalLayout_2 = new QVBoxLayout(layoutWidget2);
        verticalLayout_2->setObjectName("verticalLayout_2");
        verticalLayout_2->setContentsMargins(0, 0, 0, 0);
        srcPort_label = new QLabel(layoutWidget2);
        srcPort_label->setObjectName("srcPort_label");

        verticalLayout_2->addWidget(srcPort_label);

        srcPort_edit = new QLineEdit(layoutWidget2);
        srcPort_edit->setObjectName("srcPort_edit");

        verticalLayout_2->addWidget(srcPort_edit);

        splitter->addWidget(layoutWidget2);

        verticalLayout_5->addWidget(splitter);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName("horizontalLayout");
        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName("verticalLayout_3");
        dstIP_label = new QLabel(layoutWidget);
        dstIP_label->setObjectName("dstIP_label");

        verticalLayout_3->addWidget(dstIP_label);

        dstIP_edit = new QLineEdit(layoutWidget);
        dstIP_edit->setObjectName("dstIP_edit");

        verticalLayout_3->addWidget(dstIP_edit);


        horizontalLayout->addLayout(verticalLayout_3);

        verticalLayout_4 = new QVBoxLayout();
        verticalLayout_4->setObjectName("verticalLayout_4");
        dstPort_label = new QLabel(layoutWidget);
        dstPort_label->setObjectName("dstPort_label");

        verticalLayout_4->addWidget(dstPort_label);

        dstPort_edit = new QLineEdit(layoutWidget);
        dstPort_edit->setObjectName("dstPort_edit");

        verticalLayout_4->addWidget(dstPort_edit);


        horizontalLayout->addLayout(verticalLayout_4);


        verticalLayout_5->addLayout(horizontalLayout);

        groupBox = new QGroupBox(centralwidget);
        groupBox->setObjectName("groupBox");
        groupBox->setGeometry(QRect(540, 980, 120, 80));
        imgBtn = new QRadioButton(groupBox);
        imgBtn->setObjectName("imgBtn");
        imgBtn->setGeometry(QRect(20, 30, 95, 19));
        ctrlBtn = new QRadioButton(groupBox);
        ctrlBtn->setObjectName("ctrlBtn");
        ctrlBtn->setGeometry(QRect(20, 60, 95, 19));
        locolImglabel = new QLabel(centralwidget);
        locolImglabel->setObjectName("locolImglabel");
        locolImglabel->setGeometry(QRect(30, 90, 321, 261));
        label_2 = new QLabel(centralwidget);
        label_2->setObjectName("label_2");
        label_2->setGeometry(QRect(32, 71, 48, 16));
        loadImgBtn = new QPushButton(centralwidget);
        loadImgBtn->setObjectName("loadImgBtn");
        loadImgBtn->setGeometry(QRect(390, 940, 75, 23));
        MainWindow->setCentralWidget(centralwidget);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        sendBtn->setText(QCoreApplication::translate("MainWindow", "\345\217\221\351\200\201", nullptr));
        startBtn->setText(QCoreApplication::translate("MainWindow", "\346\211\223\345\274\200/\345\205\263\351\227\255", nullptr));
        srcIP_label->setText(QCoreApplication::translate("MainWindow", "\346\272\220IP", nullptr));
        srcPort_label->setText(QCoreApplication::translate("MainWindow", "\346\272\220\347\253\257\345\217\243", nullptr));
        srcPort_edit->setText(QString());
        dstIP_label->setText(QCoreApplication::translate("MainWindow", "\347\233\256\347\232\204IP", nullptr));
        dstPort_label->setText(QCoreApplication::translate("MainWindow", "\347\233\256\347\232\204\347\253\257\345\217\243", nullptr));
        dstPort_edit->setText(QString());
        groupBox->setTitle(QCoreApplication::translate("MainWindow", "\344\274\240\350\276\223\345\215\217\350\256\256", nullptr));
        imgBtn->setText(QCoreApplication::translate("MainWindow", "\345\233\276\345\203\217\346\225\260\346\215\256", nullptr));
        ctrlBtn->setText(QCoreApplication::translate("MainWindow", "\346\216\247\345\210\266\345\221\275\344\273\244", nullptr));
        locolImglabel->setText(QString());
        label_2->setText(QCoreApplication::translate("MainWindow", "\346\234\254\345\234\260\345\233\276\347\211\207", nullptr));
        loadImgBtn->setText(QCoreApplication::translate("MainWindow", "\345\212\240\350\275\275\345\233\276\347\211\207", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
