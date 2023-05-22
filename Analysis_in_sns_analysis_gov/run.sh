### Analyze one file########
# run this file in /Users/fumiaki/Desktop/Detector_test_sta/HFIR/NOWG/IPTS-31333/Analysis/

# Put the file number as an argument
# ex) ./run.sh 000002

## Output
# Create H5_DIR and IMAG_DIR folder in Analyzed_DATA folder
# Save the event data in H5_DIR 
# Save the image file in IMAG_DIR

# 

RUM_NUM=$1
DSCALE="1" # Number of pixels in one axis =256*DSCALE
ROTATION="1.0" # Rotation angle for the image. Need to be float number !!!!!!!!!!!!!!!
####  Create initial configuration   #####
Pre_DIR="../raw/"
H5_DIR="../Analyzed_DATA/H5/"
IMG_DIR="../Analyzed_DATA/IMG/"
CSV_DIR="../Analyzed_DATA/CSV/"
PathtoSphiread="/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/"
PathtoUser_Para="/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/"

##########################################

#### RUN one time (Creat Analyzed data folder) ###########
mkdir "../Analyzed_DATA/"
mkdir ${H5_DIR}
mkdir ${IMG_DIR}
mkdir ${CSV_DIR}

# ##########################################################

TPX_FILENAME=${RUM_NUM}".tpx3"
USR_PARA_FILENAME="user_defined_params.txt"
H5_FILENAME=${RUM_NUM}".h5"
CSV_FILENAME=${RUM_NUM}".txt"

# ### DIR preparation
RUN_DIR=${Pre_DIR}"RUN_${RUM_NUM}/"
TPX_DIR=${RUN_DIR}"tpx/"
# ###

#Run Spohiread#

${PathtoSphiread}Sophiread_HFIR -i ${TPX_DIR}${TPX_FILENAME} -u ${PathtoUser_Para}${USR_PARA_FILENAME} -E ${H5_DIR}${H5_FILENAME} -v

# Run H5toIMG.py #
# echo ${H5_DIR}${H5_FILENAME}

python H5toIMG.py ${RUM_NUM} ${H5_DIR} ${H5_FILENAME} ${DSCALE} ${ROTATION}


