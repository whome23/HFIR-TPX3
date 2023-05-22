### Analyze one file########

## Output


# 

RUM_NUM=$1
H5_DIR="../Analyzed_DATA/H5/"
H5_FILENAME=${RUM_NUM}".h5"
SCAN_DIR="../Analyzed_DATA/SCAN/"
DSCALE="1" # Number of pixels in one axis =256*DSCALE
#

######## ROI ##########
X_MIN=24 #Pixel
Y_MIN=72 #Pixel
X_MAX=236 #Pixel
Y_MAX=74 #Pixel
ROT_MIN=-6.0 #deg
ROT_MAX=6.0  #deg
ROT_BIN=0.1 #deg

##########################################

#### RUN one time (Creat Analyzed data folder) ###########
mkdir ${SCAN_DIR}"IMG/"
mkdir ${SCAN_DIR}"DATA/"

# Run H5toIMG.py #
# echo ${H5_DIR}${H5_FILENAME}

python Optimized_Rotation.py ${RUM_NUM} ${H5_DIR} ${H5_FILENAME} ${DSCALE} ${X_MIN} ${X_MAX} ${Y_MIN} ${Y_MAX} ${ROT_MIN} ${ROT_MAX} ${ROT_BIN} 

cd ${SCAN_DIR}"DATA/"
paste RUN_${RUM_NUM}_Rotation_${ROT_MIN}_${ROT_MAX}_1.txt RUN_${RUM_NUM}_Rotation_${ROT_MIN}_${ROT_MAX}_2.txt RUN_${RUM_NUM}_Rotation_${ROT_MIN}_${ROT_MAX}_3.txt >>RUN_${RUM_NUM}_Rotation_${ROT_MIN}_${ROT_MAX}_${ROT_BIN}.txt

rm RUN_${RUM_NUM}_Rotation_${ROT_MIN}_${ROT_MAX}_1.txt RUN_${RUM_NUM}_Rotation_${ROT_MIN}_${ROT_MAX}_2.txt RUN_${RUM_NUM}_Rotation_${ROT_MIN}_${ROT_MAX}_3.txt