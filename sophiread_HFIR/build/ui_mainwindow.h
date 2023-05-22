/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.15.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>
#include "qwt_plot.h"

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QLabel *label;
    QLabel *elapsed_time;
    QLabel *label_2;
    QLabel *percent_complete;
    QLabel *infobox;
    QLabel *label_3;
    QLabel *totalhits;
    QLabel *label_4;
    QLabel *totalclusters;
    QwtPlot *qwthistoPlot;
    QPushButton *selectfile;
    QSpinBox *spinmaxrange;
    QSpinBox *spinminrange;
    QLabel *label_5;
    QLabel *label_6;
    QPushButton *updaterange;
    QPushButton *savedata;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(919, 836);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        label = new QLabel(centralWidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(170, 20, 141, 31));
        elapsed_time = new QLabel(centralWidget);
        elapsed_time->setObjectName(QString::fromUtf8("elapsed_time"));
        elapsed_time->setGeometry(QRect(280, 20, 71, 31));
        elapsed_time->setFrameShape(QFrame::Panel);
        elapsed_time->setFrameShadow(QFrame::Sunken);
        label_2 = new QLabel(centralWidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(140, 70, 131, 21));
        percent_complete = new QLabel(centralWidget);
        percent_complete->setObjectName(QString::fromUtf8("percent_complete"));
        percent_complete->setGeometry(QRect(280, 70, 71, 31));
        percent_complete->setFrameShape(QFrame::Panel);
        percent_complete->setFrameShadow(QFrame::Sunken);
        infobox = new QLabel(centralWidget);
        infobox->setObjectName(QString::fromUtf8("infobox"));
        infobox->setGeometry(QRect(10, 110, 651, 21));
        infobox->setFrameShape(QFrame::Panel);
        infobox->setFrameShadow(QFrame::Sunken);
        label_3 = new QLabel(centralWidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setGeometry(QRect(370, 30, 81, 20));
        totalhits = new QLabel(centralWidget);
        totalhits->setObjectName(QString::fromUtf8("totalhits"));
        totalhits->setGeometry(QRect(470, 20, 131, 31));
        totalhits->setFrameShape(QFrame::Panel);
        totalhits->setFrameShadow(QFrame::Sunken);
        label_4 = new QLabel(centralWidget);
        label_4->setObjectName(QString::fromUtf8("label_4"));
        label_4->setGeometry(QRect(370, 70, 111, 21));
        totalclusters = new QLabel(centralWidget);
        totalclusters->setObjectName(QString::fromUtf8("totalclusters"));
        totalclusters->setGeometry(QRect(470, 60, 131, 31));
        totalclusters->setFrameShape(QFrame::Panel);
        totalclusters->setFrameShadow(QFrame::Sunken);
        qwthistoPlot = new QwtPlot(centralWidget);
        qwthistoPlot->setObjectName(QString::fromUtf8("qwthistoPlot"));
        qwthistoPlot->setGeometry(QRect(10, 150, 881, 621));
        selectfile = new QPushButton(centralWidget);
        selectfile->setObjectName(QString::fromUtf8("selectfile"));
        selectfile->setGeometry(QRect(10, 0, 121, 41));
        spinmaxrange = new QSpinBox(centralWidget);
        spinmaxrange->setObjectName(QString::fromUtf8("spinmaxrange"));
        spinmaxrange->setGeometry(QRect(790, 10, 111, 26));
        spinmaxrange->setMinimum(1);
        spinmaxrange->setMaximum(1000000);
        spinmaxrange->setValue(100);
        spinminrange = new QSpinBox(centralWidget);
        spinminrange->setObjectName(QString::fromUtf8("spinminrange"));
        spinminrange->setGeometry(QRect(790, 40, 111, 26));
        spinminrange->setMaximum(1000000);
        label_5 = new QLabel(centralWidget);
        label_5->setObjectName(QString::fromUtf8("label_5"));
        label_5->setGeometry(QRect(690, 40, 101, 17));
        label_6 = new QLabel(centralWidget);
        label_6->setObjectName(QString::fromUtf8("label_6"));
        label_6->setGeometry(QRect(680, 10, 81, 17));
        updaterange = new QPushButton(centralWidget);
        updaterange->setObjectName(QString::fromUtf8("updaterange"));
        updaterange->setGeometry(QRect(780, 90, 111, 31));
        savedata = new QPushButton(centralWidget);
        savedata->setObjectName(QString::fromUtf8("savedata"));
        savedata->setGeometry(QRect(10, 60, 121, 41));
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QString::fromUtf8("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 919, 22));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QString::fromUtf8("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        label->setText(QCoreApplication::translate("MainWindow", "Elapsed Time", nullptr));
        elapsed_time->setText(QCoreApplication::translate("MainWindow", "0", nullptr));
        label_2->setText(QCoreApplication::translate("MainWindow", "Percent Complete", nullptr));
        percent_complete->setText(QCoreApplication::translate("MainWindow", "0", nullptr));
        infobox->setText(QString());
        label_3->setText(QCoreApplication::translate("MainWindow", "Total Hits", nullptr));
        totalhits->setText(QCoreApplication::translate("MainWindow", "0", nullptr));
        label_4->setText(QCoreApplication::translate("MainWindow", "Total Clusters", nullptr));
        totalclusters->setText(QCoreApplication::translate("MainWindow", "0", nullptr));
        selectfile->setText(QCoreApplication::translate("MainWindow", "Select File", nullptr));
        label_5->setText(QCoreApplication::translate("MainWindow", "Min Range", nullptr));
        label_6->setText(QCoreApplication::translate("MainWindow", "Max Range", nullptr));
        updaterange->setText(QCoreApplication::translate("MainWindow", "Update Range", nullptr));
        savedata->setText(QCoreApplication::translate("MainWindow", "Save Data", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
