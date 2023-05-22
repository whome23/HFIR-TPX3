# Discription
# This program is to obtain a summed intensity in specific ROI in consecutive run. 

# How to use it
# ./Intensity_scan.sh

## Output
# Analyzed_DATA/SCAN/IMG/Save can_${RUM_START}_${RUM_END}.png
# Analyzed_DATA/SCAN/DATA/Save can_${RUM_START}_${RUM_END}.txt

# 

RUM_START=000001
RUM_END=000004
DSCALE=1 # Number of pixels in one axis =256*DSCALE
ROTATION=0 # Rotation angle for the image
######## ROI ##########
X_MIN=24 #Pixel
Y_MIN=72 #Pixel
X_MAX=236 #Pixel
Y_MAX=74 #Pixel

####  Create initial configuration   #####
Pre_DIR="../raw/"
H5_DIR="../Analyzed_DATA/H5/"
SCAN_DIR="../Analyzed_DATA/SCAN/"
DSCALE="1" # Number of pixels in one axis =256*DSCALE
##########################################

#### RUN one time (Creat Analyzed data folder) ###########
mkdir ${SCAN_DIR}"IMG/"
mkdir ${SCAN_DIR}"DATA/"

# ##########################################################

# ### DIR preparation
# RUN_DIR=${Pre_DIR}"RUN_${RUM_NUM}/"
# TPX_DIR=${RUN_DIR}"tpx/"
# ###

#Run Spohiread#

# ${PathtoSphiread}Sophiread -i ${TPX_DIR}${TPX_FILENAME} -u ${PathtoSphiread}${USR_PARA_FILENAME} -E ${H5_DIR}${H5_FILENAME} -v

# Run H5toIMG.py #
# echo ${H5_DIR}${H5_FILENAME}

python Intensity_scan.py ${RUM_START} ${RUM_END} ${H5_DIR} ${DSCALE} ${X_MIN} ${X_MAX} ${Y_MIN} ${Y_MAX} ${ROTATION}


cd ${SCAN_DIR}"DATA/"
paste Scan_${RUM_START}_${RUM_END}_1.txt Scan_${RUM_START}_${RUM_END}_2.txt Scan_${RUM_START}_${RUM_END}_3.txt >>Scan_${RUM_START}_${RUM_END}.txt

rm Scan_${RUM_START}_${RUM_END}_1.txt Scan_${RUM_START}_${RUM_END}_2.txt Scan_${RUM_START}_${RUM_END}_3.txt

