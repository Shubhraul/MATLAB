fs = 1e6;
PRF = [5000,10000];
waveform = phased.PhaseCodedWaveform('SampleRate',fs,...
    'Code','Zadoff-Chu','PRFSelectionInputPort',true,...
    'ChipWidth',5e-6,'NumChips',16,'PRF',PRF,...
    'OutputFormat','Pulses','NumPulses',2);
wav = [];
wav1 = waveform(1);
wav = [wav; wav1];
wav1 = waveform(2);
wav = [wav; wav1];
wav1 = waveform(1);
wav = [wav; wav1];
nsamps = size(wav,1);
t = [0:(nsamps-1)]/fs;
figure(1)
plot(t*1e6,real(wav))
xlabel('Time (\mu sec)')
ylabel('Amplitude')

figure(2)
waveform = phased.PhaseCodedWaveform('Code','Barker','NumChips',5, ...
    'CoefficientsOutputPort',true,'PRF',[1e4 2e4],'ChipWidth',5e-6, ...
    'OutputFormat','Samples','NumSamples',150);
[wav,coeff] = waveform();
[wav,coeff] = waveform();
mf = phased.MatchedFilter('CoefficientsSource','Input port');
mfOut = mf(wav,coeff);
subplot(211),plot(real(wav));
xlabel('Samples'),ylabel('Amplitude'),title('Waveform Output');
subplot(212),plot(abs(mfOut));
xlabel('Samples'),ylabel('Amplitude'),title('Matched Filter Output');