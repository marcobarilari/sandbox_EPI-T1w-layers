function opt = commonOptions(contrast)
    %
    % (C) Copyright 2022 Remi Gau, Marco Barilari

    root_dir = fullfile(fileparts(mfilename('fullpath')), '..', '..');

    opt.subjects = {'pilot001', 'pilot004', 'pilot005'};

    opt.dir.raw = fullfile(root_dir, 'inputs', 'raw');
    opt.dir.derivatives = fullfile(root_dir, 'outputs', 'derivatives');
    opt.dir.preproc =  fullfile(opt.dir.derivatives, 'cpp_spm-preproc');
    opt.dir.stats =  fullfile(opt.dir.derivatives, 'cpp_spm-stats');

    opt.taskName = 'gratingBimodalMotion';

    firstVasoVolume = 1;
    firstBoldVolume = 2;

    if strcmpi(contrast, 'bold')
        opt.funcVolToSelect = firstBoldVolume:2:1000;

    elseif strcmpi(contrast, 'vaso')
        opt.funcVolToSelect = firstVasoVolume:2:1000;

    end

    opt.space = 'individual';

end
