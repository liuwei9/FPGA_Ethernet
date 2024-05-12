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
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
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
    QWidget *widget;
    QVBoxLayout *verticalLayout_5;
    QSplitter *splitter;
    QWidget *widget1;
    QVBoxLayout *verticalLayout;
    QLabel *srcIP_label;
    QLineEdit *srcIP_edit;
    QWidget *widget2;
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

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(800, 600);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        sendBtn = new QPushButton(centralwidget);
        sendBtn->setObjectName("sendBtn");
        sendBtn->setGeometry(QRect(320, 520, 75, 23));
        startBtn = new QPushButton(centralwidget);
        startBtn->setObjectName("startBtn");
        startBtn->setGeometry(QRect(410, 520, 75, 23));
        widget = new QWidget(centralwidget);
        widget->setObjectName("widget");
        widget->setGeometry(QRect(10, 450, 280, 98));
        verticalLayout_5 = new QVBoxLayout(widget);
        verticalLayout_5->setObjectName("verticalLayout_5");
        verticalLayout_5->setContentsMargins(0, 0, 0, 0);
        splitter = new QSplitter(widget);
        splitter->setObjectName("splitter");
        splitter->setOrientation(Qt::Horizontal);
        widget1 = new QWidget(splitter);
        widget1->setObjectName("widget1");
        verticalLayout = new QVBoxLayout(widget1);
        verticalLayout->setObjectName("verticalLayout");
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        srcIP_label = new QLabel(widget1);
        srcIP_label->setObjectName("srcIP_label");

        verticalLayout->addWidget(srcIP_label);

        srcIP_edit = new QLineEdit(widget1);
        srcIP_edit->setObjectName("srcIP_edit");

        verticalLayout->addWidget(srcIP_edit);

        splitter->addWidget(widget1);
        widget2 = new QWidget(splitter);
        widget2->setObjectName("widget2");
        verticalLayout_2 = new QVBoxLayout(widget2);
        verticalLayout_2->setObjectName("verticalLayout_2");
        verticalLayout_2->setContentsMargins(0, 0, 0, 0);
        srcPort_label = new QLabel(widget2);
        srcPort_label->setObjectName("srcPort_label");

        verticalLayout_2->addWidget(srcPort_label);

        srcPort_edit = new QLineEdit(widget2);
        srcPort_edit->setObjectName("srcPort_edit");

        verticalLayout_2->addWidget(srcPort_edit);

        splitter->addWidget(widget2);

        verticalLayout_5->addWidget(splitter);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName("horizontalLayout");
        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName("verticalLayout_3");
        dstIP_label = new QLabel(widget);
        dstIP_label->setObjectName("dstIP_label");

        verticalLayout_3->addWidget(dstIP_label);

        dstIP_edit = new QLineEdit(widget);
        dstIP_edit->setObjectName("dstIP_edit");

        verticalLayout_3->addWidget(dstIP_edit);


        horizontalLayout->addLayout(verticalLayout_3);

        verticalLayout_4 = new QVBoxLayout();
        verticalLayout_4->setObjectName("verticalLayout_4");
        dstPort_label = new QLabel(widget);
        dstPort_label->setObjectName("dstPort_label");

        verticalLayout_4->addWidget(dstPort_label);

        dstPort_edit = new QLineEdit(widget);
        dstPort_edit->setObjectName("dstPort_edit");

        verticalLayout_4->addWidget(dstPort_edit);


        horizontalLayout->addLayout(verticalLayout_4);


        verticalLayout_5->addLayout(horizontalLayout);

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
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
