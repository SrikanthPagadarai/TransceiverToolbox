cd(fileparts((mfilename('fullpath'))));
p = pwd;

version = '22.1.1';
ml = ver('MATLAB');
ml = ml.Release(2:end-1);
app_name = 'LTEPA';

fprintf('Compiling application to create installer for LTE PA app...\n');
res=compiler.build.standaloneApplication('LTEApp.m',...
    'ExecutableName',app_name,'ExecutableVersion','1.0',...
    'ExecutableSplashScreen', '.\img\LTEAPP_splash.png', ...
    'AdditionalFiles',[".\img\play.png",...
    ".\img\stop.png",".\img\doc.png",".\img\refresh.png",...
    ".\img\Analog_Devices_Logo.png",".\img\grid.png",".\img\step.png",...
    ".\@LTEAppInternals\lte10_filter_rx.mat",...
    ".\@LTEAppInternals\lte10_filter_tx.mat",...
    ".\@LTEAppInternals\lte15_filter_rx.mat",...
    ".\@LTEAppInternals\lte15_filter_tx.mat",...
    ".\@LTEAppInternals\lte20_filter_rx.mat",...
    ".\@LTEAppInternals\lte20_filter_tx.mat",...
    ".\@LTEAppInternals\lte3_filter_rx.mat",...
    ".\@LTEAppInternals\lte3_filter_tx.mat",...
    ".\@LTEAppInternals\lte5_filter_rx.mat",...
    ".\@LTEAppInternals\lte5_filter_tx.mat",...
    ".\@LTEAppInternals\LTEAppInternals.m",...
    ".\@LTEAppInternals\PlutoRadio.m",...
    ".\@LTETestModelWaveform\DemodSymbs.m",...
    ".\@LTETestModelWaveform\EstimateChannel.m",...
    ".\@LTETestModelWaveform\EVMSubframe.m",...
    ".\@LTETestModelWaveform\frequencyOffsetCellRS.m",...
    ".\@LTETestModelWaveform\getEVMWindow.m",...
    ".\@LTETestModelWaveform\LTETestModelWaveform.m",...
    ".\@LTETestModelWaveform\Sync.m"],...
    'AutoDetectDataFiles','on');
compiler.package.installer(res, ...
    'AuthorCompany', 'Analog Devices Inc.', ...
    'InstallerName', 'LTEPAInstaller');


