# Source code

# Main functions

1. `src/importFromRaw.m`

2. `src/motion_correction.m`

3. check that within run, bold and vaso are aligned. If not, run coregister batch (manual)

4. `lib/CPP_HighRes_fMRI/src/makeT1wEPI`

5. Align all the T1w runs to the first one

6. Make T1w mean of all the runs

7. Upsample T1w (SPM coregister reslice manually) (not necessary, ants takes much more time, we cna upsample the deformation matrix)

8. Coregister unit1 upsampled ses1 to ses2

9. Copy the ROI masks

10. `lib/CPP_HighRes_fMRI/src/coregister_anat_to_func.py` x2 (1 per each mask)

- run ants registration with 0.375 unitt1 sess1 and ept1w (unit1 is resliced to t1w res)

- rename files properly

- check it worked

- reslice warp field image (this also upsample to hihires) + layers with 0.375 unit1 sess1 + epit1w

- ants apply to layers and mask

