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
    QHBoxLayout *horizontalLayout_2;
    QVBoxLayout *verticalLayout_5;
    QSplitter *splitter;
    QWidget *layoutWidget;
    QVBoxLayout *verticalLayout;
    QLabel *srcIP_label;
    QLineEdit *srcIP_edit;
    QWidget *layoutWidget1;
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
    QLabel *locolImglabel;
    QLabel *label_2;
    QPushButton *sendBtn;
    QPushButton *loadImgBtn;
    QPushButton *startBtn;
    QGroupBox *groupBox;
    QRadioButton *imgBtn;
    QRadioButton *ctrlBtn;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(1920, 1080);
        MainWindow->setMinimumSize(QSize(0, 0));
        MainWindow->setMaximumSize(QSize(1920, 1080));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        horizontalLayout_2 = new QHBoxLayout(centralwidget);
        horizontalLayout_2->setObjectName("horizontalLayout_2");
        verticalLayout_5 = new QVBoxLayout();
        verticalLayout_5->setObjectName("verticalLayout_5");
        splitter = new QSplitter(centralwidget);
        splitter->setObjectName("splitter");
        splitter->setOrientation(Qt::Horizontal);
        layoutWidget = new QWidget(splitter);
        layoutWidget->setObjectName("layoutWidget");
        verticalLayout = new QVBoxLayout(layoutWidget);
        verticalLayout->setObjectName("verticalLayout");
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        srcIP_label = new QLabel(layoutWidget);
        srcIP_label->setObjectName("srcIP_label");

        verticalLayout->addWidget(srcIP_label);

        srcIP_edit = new QLineEdit(layoutWidget);
        srcIP_edit->setObjectName("srcIP_edit");

        verticalLayout->addWidget(srcIP_edit);

        splitter->addWidget(layoutWidget);
        layoutWidget1 = new QWidget(splitter);
        layoutWidget1->setObjectName("layoutWidget1");
        verticalLayout_2 = new QVBoxLayout(layoutWidget1);
        verticalLayout_2->setObjectName("verticalLayout_2");
        verticalLayout_2->setContentsMargins(0, 0, 0, 0);
        srcPort_label = new QLabel(layoutWidget1);
        srcPort_label->setObjectName("srcPort_label");

        verticalLayout_2->addWidget(srcPort_label);

        srcPort_edit = new QLineEdit(layoutWidget1);
        srcPort_edit->setObjectName("srcPort_edit");

        verticalLayout_2->addWidget(srcPort_edit);

        splitter->addWidget(layoutWidget1);

        verticalLayout_5->addWidget(splitter);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName("horizontalLayout");
        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName("verticalLayout_3");
        dstIP_label = new QLabel(centralwidget);
        dstIP_label->setObjectName("dstIP_label");

        verticalLayout_3->addWidget(dstIP_label);

        dstIP_edit = new QLineEdit(centralwidget);
        dstIP_edit->setObjectName("dstIP_edit");

        verticalLayout_3->addWidget(dstIP_edit);


        horizontalLayout->addLayout(verticalLayout_3);

        verticalLayout_4 = new QVBoxLayout();
        verticalLayout_4->setObjectName("verticalLayout_4");
        dstPort_label = new QLabel(centralwidget);
        dstPort_label->setObjectName("dstPort_label");

        verticalLayout_4->addWidget(dstPort_label);

        dstPort_edit = new QLineEdit(centralwidget);
        dstPort_edit->setObjectName("dstPort_edit");

        verticalLayout_4->addWidget(dstPort_edit);


        horizontalLayout->addLayout(verticalLayout_4);


        verticalLayout_5->addLayout(horizontalLayout);


        horizontalLayout_2->addLayout(verticalLayout_5);

        locolImglabel = new QLabel(centralwidget);
        locolImglabel->setObjectName("locolImglabel");

        horizontalLayout_2->addWidget(locolImglabel);

        label_2 = new QLabel(centralwidget);
        label_2->setObjectName("label_2");

        horizontalLayout_2->addWidget(label_2);

        sendBtn = new QPushButton(centralwidget);
        sendBtn->setObjectName("sendBtn");

        horizontalLayout_2->addWidget(sendBtn);

        loadImgBtn = new QPushButton(centralwidget);
        loadImgBtn->setObjectName("loadImgBtn");

        horizontalLayout_2->addWidget(loadImgBtn);

        startBtn = new QPushButton(centralwidget);
        startBtn->setObjectName("startBtn");

        horizontalLayout_2->addWidget(startBtn);

        groupBox = new QGroupBox(centralwidget);
        groupBox->setObjectName("groupBox");
        imgBtn = new QRadioButton(groupBox);
        imgBtn->setObjectName("imgBtn");
        imgBtn->setGeometry(QRect(20, 30, 95, 19));
        ctrlBtn = new QRadioButton(groupBox);
        ctrlBtn->setObjectName("ctrlBtn");
        ctrlBtn->setGeometry(QRect(20, 60, 95, 19));

        horizontalLayout_2->addWidget(groupBox);

        MainWindow->setCentralWidget(centralwidget);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        srcIP_label->setText(QCoreApplication::translate("MainWindow", "\346\272\220IP", nullptr));
        srcPort_label->setText(QCoreApplication::translate("MainWindow", "\346\272\220\347\253\257\345\217\243", nullptr));
        srcPort_edit->setText(QString());
        dstIP_label->setText(QCoreApplication::translate("MainWindow", "\347\233\256\347\232\204IP", nullptr));
        dstPort_label->setText(QCoreApplication::translate("MainWindow", "\347\233\256\347\232\204\347\253\257\345\217\243", nullptr));
        dstPort_edit->setText(QString());
        locolImglabel->setText(QString());
        label_2->setText(QCoreApplication::translate("MainWindow", "\346\234\254\345\234\260\345\233\276\347\211\207", nullptr));
        sendBtn->setText(QCoreApplication::translate("MainWindow", "\345\217\221\351\200\201", nullptr));
        loadImgBtn->setText(QCoreApplication::translate("MainWindow", "\345\212\240\350\275\275\345\233\276\347\211\207", nullptr));
        startBtn->setText(QCoreApplication::translate("MainWindow", "\346\211\223\345\274\200/\345\205\263\351\227\255", nullptr));
        groupBox->setTitle(QCoreApplication::translate("MainWindow", "\344\274\240\350\276\223\345\215\217\350\256\256", nullptr));
        imgBtn->setText(QCoreApplication::translate("MainWindow", "\345\233\276\345\203\217\346\225\260\346\215\256", nullptr));
        ctrlBtn->setText(QCoreApplication::translate("MainWindow", "\346\216\247\345\210\266\345\221\275\344\273\244", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
