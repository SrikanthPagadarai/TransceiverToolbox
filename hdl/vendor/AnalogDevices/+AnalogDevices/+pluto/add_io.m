function add_io(hRD,type)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add AXI4 and AXI4-Lite slave interfaces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add AXI4 and AXI4-Lite slave interfaces
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection', 'axi_cpu_interconnect/M04_AXI', ...
    'BaseAddress',         '0x43C00000', ...
    'MasterAddressSpace',  'sys_ps7/Data');

% DMA Ready signal
hRD.addInternalIOInterface( ...
    'InterfaceID',    'DMA Ready', ...
    'InterfaceType',  'IN', ...
    'PortName',       'dma_rdy', ...
    'PortWidth',      1, ...
    'InterfaceConnection', 'axi_ad9361_adc_dma/s_axis_ready', ...
    'IsRequired',     false);

% % DMA Ready signal
% hRD.addInternalIOInterface( ...
%     'InterfaceID',    'DMA Ready', ...
%     'InterfaceType',  'IN', ...
%     'PortName',       'dma_rdy', ...
%     'PortWidth',      1, ...
%     'InterfaceConnection', 'util_cpack_0/adc_valid', ...
%     'IsRequired',     false);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rx Reference design interfaces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if contains(lower(type),'rx')
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Data Valid OUT', ...
        'InterfaceType',  'OUT', ...
        'PortName',       'dut_data_valid', ...
        'PortWidth',      1, ...
        'InterfaceConnection', 'util_cpack_0/fifo_wr_en', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Valid Rx Data IN', ...
        'InterfaceType',  'IN', ...
        'PortName',       'dut_data_valid', ...
        'PortWidth',      1, ...
        'InterfaceConnection', 'axi_ad9361/adc_valid_i0', ...
        'IsRequired',     false);
    
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Data 0 OUT', ...
        'InterfaceType',  'OUT', ...
        'PortName',       'dut_data_0', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'util_cpack_0/fifo_wr_data_0', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Data 1 OUT', ...
        'InterfaceType',  'OUT', ...
        'PortName',       'dut_data_1', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'util_cpack_0/fifo_wr_data_1', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'AD9361 ADC Data I0', ...
        'InterfaceType',  'IN', ...
        'PortName',       'sys_dma0_wdata', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'axi_ad9361/adc_data_i0', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'AD9361 ADC Data Q0', ...
        'InterfaceType',  'IN', ...
        'PortName',       'sys_dma1_wdata', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'axi_ad9361/adc_data_q0', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'AD9361 ADC Valid', ...
        'InterfaceType',  'IN', ...
        'PortName',       'dut_valid_in', ...
        'PortWidth',      1, ...
        'InterfaceConnection', 'axi_ad9361/adc_valid_i0', ...
        'IsRequired',     false);
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tx Reference design interfaces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if contains(lower(type),'tx')
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'AD9361 DAC Data I0', ...
        'InterfaceType',  'OUT', ...
        'PortName',       'axi_ad9361_dac_data_i0', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'axi_ad9361/dac_data_i0', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'AD9361 DAC Data Q0', ...
        'InterfaceType',  'OUT', ...
        'PortName',       'axi_ad9361_dac_data_q0', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'axi_ad9361/dac_data_q0', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Data 0 IN', ...
        'InterfaceType',  'IN', ...
        'PortName',       'util_dac_unpack_dac_data_00', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'util_upack_0/fifo_rd_data_0', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Data 1 IN', ...
        'InterfaceType',  'IN', ...
        'PortName',       'util_dac_unpack_dac_data_01', ...
        'PortWidth',      16, ...
        'InterfaceConnection', 'util_upack_0/fifo_rd_data_1', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Load Tx Data OUT', ...
        'InterfaceType',  'OUT', ...
        'PortName',       'util_dac_unpack_dac_valid_00', ...
        'PortWidth',      1, ...
        'InterfaceConnection', 'util_upack_0/fifo_rd_en', ...
        'IsRequired',     false);
    
    hRD.addInternalIOInterface( ...
        'InterfaceID',    'IP Valid Tx Data IN', ...
        'InterfaceType',  'IN', ...
        'PortName',       'util_dac_unpack_upack_valid_00', ...
        'PortWidth',      1, ...
        'InterfaceConnection', 'util_upack_0/fifo_rd_valid', ...
        'IsRequired',     false);
end