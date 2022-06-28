

docker run -it --rm \
-v /home/marcobar/Data/temp_ants:/data_ants \
kaczmarj/ants:v2.3.1-source

nifti_ext='.nii'

EPIT1=sub-pilot005_ses-002_task-gratingBimodalMotion_space-func_T1w.nii

UNIT1=sub-pilot005_ses-002_acq-r0p75_space-individual_desc-skullstripped_UNIT1.nii

antsRegistration \
        --verbose 1 \
        --dimensionality 3 \
        --float 1 \
        --output [rANTs_, rANTs_Warped.nii,rANTs_InverseWarped.nii] \
        --interpolation Linear \
        --use-histogram-matching 0 \
        --winsorize-image-intensities [0.005,0.995] \
        --transform Rigid[0.05] \
        --metric CC[$EPIT1,$UNIT1,0.7,32,Regular,0.1] \
        --convergence [1000x500,1e-6,10] \
        --shrink-factors 2x1 \
        --smoothing-sigmas 1x0vox \
        --transform Affine[0.1] \
        --metric MI[$EPIT1,$UNIT1,0.7,32,Regular,0.1] \
        --convergence [1000x500,1e-6,10] \
        --shrink-factors 2x1 \
        --smoothing-sigmas 1x0vox \
        --transform SyN[0.1,2,0] \
        --metric CC[$EPIT1,$UNIT1,1,2] \
        --convergence [500x100,1e-6,10] \
        --shrink-factors 2x1 \
        --smoothing-sigmas 1x0vox

antsRegistration \
        --verbose 1 \
        --dimensionality 3  \
        --float 0  \
        --collapse-output-transforms 1  \
        --interpolation Linear \
        --output [rrANTs_, rrANTs_Warped.nii,rrANTs_InverseWarped.nii] \
        --use-histogram-matching 0  \
        --winsorize-image-intensities [0.005,0.995]  \
        --transform Rigid[0.5]  \
        --metric MI[sub-pilot005_ses-002_task-gratingBimodalMotion_space-func_T1w.nii,sub-pilot005_ses-002_acq-r0p75_space-individual_desc-skullstripped_UNIT1.nii,1,32,Regular,0.1]  \
        --convergence [1000x500,1e-6,10]  \
        --shrink-factors 2x1  \
        --smoothing-sigmas 1x0vox  \
        --transform Affine[0.1]  \
        --metric MI[sub-pilot005_ses-002_task-gratingBimodalMotion_space-func_T1w.nii,sub-pilot005_ses-002_acq-r0p75_space-individual_desc-skullstripped_UNIT1.nii,1,32,Regular,0.25]  \
        --convergence [1000x500x250x100,1e-6,10]  \
        --shrink-factors 12x8x4x2  \
        --smoothing-sigmas 4x3x2x1vox  \
        --transform SyN[0.1,3,0]  \
        --metric CC[sub-pilot005_ses-002_task-gratingBimodalMotion_space-func_T1w.nii,sub-pilot005_ses-002_acq-r0p75_space-individual_desc-skullstripped_UNIT1.nii,1,4]  \
        --convergence [50x50x70x50x20,1e-6,10]  \
        --shrink-factors 4x4x2x1x1  \
        --smoothing-sigmas 5x3x2x1x0vox
