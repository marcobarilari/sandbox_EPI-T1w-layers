% (C) Copyright 2021 Remi Gau, Marco Barilari

% Script to copy the func data from sessions 8 and the MP2RAGE
% and change their suffix

clear;

clc;

initEnv();

contrast = {'bold', 'vaso'};

for i = 1:numel(contrast)

    opt = getOptionPreproc(contrast{i});

%     %% copy anat
%     if ismember(contrast{i}, {'bold', 'mp2rage'})
% 
%         opt.query = opt.bidsFilterFile.t1w;
%         bidsCopyInputFolder(opt);
% 
%     end

    %% copy functional
    if ismember(contrast{i}, {'bold', 'vaso'})

        opt.query = opt.bidsFilterFile.bold;
        opt.query.suffix = 'boldcbv'; % necessary otherwise no file will be copied
        bidsCopyInputFolder(opt);

        %% change suffix functional
        % this is the folder where we need to change the suffix (eg `boldcbv` -> `bold`)
        opt.dir.input = fullfile(opt.dir.derivatives, 'cpp_spm-preproc');

        newSuffix = contrast{i};
        filter = struct('suffix', 'boldcbv');

        bidsChangeSuffix(opt, newSuffix, ...
                         'filter', filter, ...
                         'force', false);

        %% update metadata
        BIDS = bids.layout(opt.dir.input, 'use_schema', false);
        files = bids.query(BIDS, 'data', 'suffix', newSuffix);
        metadata = bids.query(BIDS, 'metadata', 'suffix', newSuffix);

        for iFile = 1:numel(files)
            metadata{iFile}.RepetitionTime = 3.85;
            bf = bids.File(files{iFile});
            json_file = fullfile(spm_fileparts(files{iFile}), bf.json_filename);
            bids.util.jsonencode(json_file, metadata{iFile});
        end

    end

end
