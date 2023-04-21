
close all;
clear all;
%this one worked!

A=readtable('s21_lna_-20dbm_.csv')

figure;
c=3e8;
%T=load(str);
     %       ^^^^^^^^^------ your csv filename
grayColor = [.7 .7 .7];

x=[52,62,62,52]
y=[-40,-40,40,40]
patch(x,y, grayColor)
hold on;

plot(10^-9*A.Freq_Hz_,A.S21_DB_, 'LineWidth', 1.5)
   %     axis([F(end,1)/1e12, F(1,1)/1e12, -100, 0])
        grid on
        xlabel('Frequency, [THz]')
        ylabel('Power, [dBm]')
 
 hold on;
 
 
A=readtable('s21_lna_-25dbm_.csv')


c=3e8;
%T=load(str);
     %       ^^^^^^^^^------ your csv filename


plot(10^-9*A.Freq_Hz_,A.S21_DB_, 'LineWidth', 1.5)
   %     axis([F(end,1)/1e12, F(1,1)/1e12, -100, 0])
        grid on
        xlabel('Frequency, [THz]')
        ylabel('Power, [dBm]')
 
 hold on;
 
 
 
 A=readtable('s21_lna_-30dbm_.csv')


c=3e8;
%T=load(str);
     %       ^^^^^^^^^------ your csv filename


plot(10^-9*A.Freq_Hz_,A.S21_DB_, 'LineWidth', 1.5)
   %     axis([F(end,1)/1e12, F(1,1)/1e12, -100, 0])
        grid on
        xlabel('Frequency, [THz]')
        ylabel('Power, [dBm]')
 
 hold on;
 
 
 
 
 A=readtable('s21_lna_-35dbm_.csv')


c=3e8;
%T=load(str);
     %       ^^^^^^^^^------ your csv filename


plot(10^-9*A.Freq_Hz_,A.S21_DB_, 'LineWidth', 1.5)
   %     axis([F(end,1)/1e12, F(1,1)/1e12, -100, 0])
        grid on
        xlabel('Frequency, [THz]')
        ylabel('Power, [dBm]')
 
 hold on;
 
 
 
 A=readtable('s21_lna_-40dbm_.csv')


c=3e8;
%T=load(str);
     %       ^^^^^^^^^------ your csv filename


plot(10^-9*A.Freq_Hz_,A.S21_DB_, 'LineWidth', 1.5)
   %     axis([F(end,1)/1e12, F(1,1)/1e12, -100, 0])
        grid on
        xlabel('Frequency, [THz]')
        ylabel('Power, [dBm]')
 
 hold on;
 
 
 A=readtable('s21_lna_-45dbm_.csv')


c=3e8;
%T=load(str);
     %       ^^^^^^^^^------ your csv filename


plot(10^-9*A.Freq_Hz_,A.S21_DB_, 'LineWidth', 1.5)
   %     axis([F(end,1)/1e12, F(1,1)/1e12, -100, 0])
        grid on
        xlabel('Frequency, [THz]')
        ylabel('Power, [dBm]')
 
 hold on;
 
 
 A=readtable('s21_lna_-50dbm_.csv')


c=3e8;
%T=load(str);
     %       ^^^^^^^^^------ your csv filename


plot(10^-9*A.Freq_Hz_,A.S21_DB_, 'LineWidth', 1.5)
   %     axis([F(end,1)/1e12, F(1,1)/1e12, -100, 0])
        grid on
        xlabel('Frequency, [GHz]')
        ylabel('S21 [dB]')
        title('S21 vs freq')
 xlim([47.5 70])
 hold on;
 
ylabel('sideband efficiency(db)')
xlabel('Rf freq(GHz)')
title('Variation of sideband efficiency with RF freq')

 legend('LNA bandwidth','RF power=-25 dBm','RF power=-30 dBm','RF power=-35 dBm','RF power=-40 dBm','RF power=-45 dBm','RF power=-50 dBm','RF power=-55 dBm')