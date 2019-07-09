In this process the only geometric model information that is maintained is classification.  It is stored in the '.osh' mesh.

Using the listed versions of simmodeler and simmodsuite are critical - there is incompatibility of old simmodsuite with newer simmodeler generated meshes.  If needed, we can rebuild omega-h as needed to match whatever new/latest version of simmodeler. 

##model translation##
ssh <rhel7system>
module load gcc mpich pumi/develop-int32-shared-sim-tml2cn2
simTranslate pisces.x_t pisces.smd

##mesh generation##
ssh <rhel7system>
module load simmetrix/simModeler/7.0-190513dev
<open model 'pisces.smd', generate mesh with absolute size of 0.005, save mesh as pisces-uniform40k.sms>

##conversion to omega_h##
ssh <rhel7system>
module load gcc mpich simmetrix-simmodsuite/14.0-190513dev-drlrpas
/lore/cwsmith/develop/build-omegah-meshSim-rhel7/src/meshsim2osh pisces-uniform40k.sms pisces.smd pisces-uniform40k.osh


