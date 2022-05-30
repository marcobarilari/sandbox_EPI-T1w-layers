function opt = high_res_get_option()
  %
  % Returns a structure that contains the options chosen by the user
  %
  % USAGE::
  %
  %  opt = high_res_get_option()
  %
  % :returns: - :opt: (struct)
  %
  % (C) Copyright 2021 CPP_SPM developers

  opt.dataDir = '/Users/barilari/Desktop/data_temp/Marco_HighRes/raw';
  opt.derivativesDir = '/Users/barilari/data/sandbox_EPI-T1w-layers/outputs/derivatives/cpp_spm-preproc';

  opt.subLabel = 'pilot005';

  opt.task = 'gratingBimodalMotion';

  opt.ses = '002';


  %% DO NOT TOUCH
  opt = checkOptions(opt);
  saveOptions(opt);

end
