function opt = getOptionPreproc(contrast)
    %
    % (C) Copyright 2022 Remi Gau, Marco Barilari

    if nargin < 1
        contrast = 'bold';
    end

    opt = commonOptions(contrast);

    opt.pipeline.type = 'preproc';

    opt.fwhm.func = 6;

%     opt.bidsFilterFile.bold.ses = '008';
    opt.bidsFilterFile.bold.suffix = contrast;


    %% DO NOT TOUCH
    opt = checkOptions(opt);
    saveOptions(opt);

end
