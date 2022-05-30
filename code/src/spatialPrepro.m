% (C) Copyright 2021 Remi Gau

% Script to run the spatial preprocessing
%
% BOLD
% - realign (estimate)
% - segment T1w
% - coregister to T1w
% - reslice
% - rename
%
% VASO
% - realign (estimate)
% - apply coregistration computed on BOLD
% - reslice
% - rename

clear;

clc;

initEnv();

action = 'smooth'; % preproc / smooth
% for smoothing the FWHM must be changed in the options

opt.dryRun = false;

nbDummies = 4;

contrast = {'bold', 'vaso'};

for i = 1

    opt = getOptionPreproc(contrast{i});

    if strcmp(action, 'preproc')

        % needs to be set manually for remove dummies
        opt.dir.input = opt.dir.preproc;
        % Can be run several time: will only be applied once
        % as long as force == false and the the metadata.NumberOfVolumesDiscardedByUser
        % is not changed
        bidsRemoveDummies(opt, 'dummyScans', nbDummies, 'force', false);

        if strcmp(contrast{i}, 'bold')
            bidsSpatialPrepro(opt);

        elseif strcmp(contrast{i}, 'vaso')
            bidsRealignReslice(opt);
            reorientVaso(opt);

        end

    elseif strcmp(action, 'smooth')

        bidsSmoothing(opt);

    end

end
