%data
% close all;
% clear all;
 figure








% measured sideband efficiency and the corresponding RF power

load('sideband_Eff_mod10.mat')

c_sideband_dB=sideband-offresonance


% constants
k               = 1.38e-23
T               = 300
kT              = k * T
q               = 1.6e-19
R0              = 50


% effective laser power and PD responsivity
Rpd             = 1

p_laser_ori_dBm = [7:-2:-1]; %what is the actual power hitting?

p_laser_ori_dBm=repmat(p_laser_ori_dBm',1,size(sideband,2))
eta_coupler_dB  = -3 % grating copler

p_laser_ref_dBm = p_laser_ori_dBm + eta_coupler_dB * 1
p_laser_sig_dBm = p_laser_ori_dBm + eta_coupler_dB * 3
% p_laser_eff_dBm = -10;

%
BW               = 5e9



Rf_loss=-5;
RF_applied=[-45:5:-25];
RF_applied=repmat(RF_applied,size(sideband,1),1);
p_RF_in_eff_dBm=Rf_loss+RF_applied;

% converting dB to magnitude
% p_laser_eff     = 10 ^ (p_laser_eff_dBm / 10) * 1e-3
p_laser_ref_in  = 10 .^ (p_laser_ref_dBm / 10) * 1e-3
eta_coupler     = 10 .^ (eta_coupler_dB / 10)
p_laser_sig_in  = 10 .^ (p_laser_sig_dBm / 10) * 1e-3
c_sideband_E    = 10 .^ (c_sideband_dB / 20) %energy
c_sideband_P    = 10 .^ (c_sideband_dB / 10) %power
p_RF_in_eff     = 10 .^ (p_RF_in_eff_dBm / 10) * 1e-3
vamp_RF_in_eff  = sqrt(p_RF_in_eff * 2 * R0)

% input signal and noise
vnsq_source_in  = 4 * kT * R0 / 4
SNR_source_norm = vamp_RF_in_eff.^ 2 ./ 2 ./ vnsq_source_in / BW

Idc_shot_pd     = 0.5 * Rpd * p_laser_ref_in
iamp_out        = 2 * c_sideband_E .* Idc_shot_pd *eta_coupler ^ (2 / 2) 
Gm_eff          = iamp_out ./ vamp_RF_in_eff
Gm_eff          = Gm_eff * 1

Gp_RF_eff       = (Gm_eff * R0).^ 2
Gp_RF_eff_dB    = 10 *log10(Gp_RF_eff)

insq_source_out = vnsq_source_in * Gm_eff .^ 2
insq_shot_out   = 2 * q * Idc_shot_pd

SNR_out_norm    = iamp_out .^ 2 ./ 2 ./ (insq_source_out + insq_shot_out) / BW

NF              = insq_shot_out ./ insq_source_out + 1
NF_dB           = 10 * log10(NF)

(NF_dB)

(10*log10(SNR_source_norm./SNR_out_norm))


figure;
plot(p_laser_ori_dBm, NF_dB, '-o','linewidth',1,'MarkerSize',12)
% plt.plot(10*np.log10(3), 43, marker="o", markersize=5)
% ax.legend(['This Design', '[4] w/o pre-amp'])
%

legend('RF power=-50 dbm','RF power=-45 dbm','RF power=-40 dbm','RF power=-35 dbm','RF power=-30 dbm','RF power=-25 dbm')
xlabel('Laser Source Power [dBm]', fontsize=20)
ylabel('NF [dB]', fontsize=20)
title('Noise figure')
grid on;