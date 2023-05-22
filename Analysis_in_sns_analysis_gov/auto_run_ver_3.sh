#!/bin/bash
### Analyze one file########
# Discription
# run this file in /Users/fumiaki/Desktop/Detector_test_sta/HFIR/NOWG/IPTS-31333/Analysis/
# how to use it
# ./auto_run_ver_2.sh
#  This program keep checking HFIR/NOWG/IPTS-31333/raw/ folder and prduce h5 and png file if it finds a new folder.

########

###### Bag ##########
## This program skips a files that is saved when sophiread is working...
#-> The Bag is fixed. This program keeps checking if all Run h5 files exit in H5 folder. If h5 files are missing, it produces them.
###


# RUM_NUM="000002"
Refreshtime=5  # The time that we wait for renew the data
DSCALE="1" # Number of pixels in one axis =256*DSCALE
####  Create initial configuration   #####
Pre_DIR="../raw/"
H5_DIR="../Analyzed_DATA/H5/"
IMG_DIR="../Analyzed_DATA/IMG/"
PathtoSphiread="/Users/fumiaki/Documents/ORNL/Research/PTX3_Analysis/mcpevent2hist/mcpevent2hist/sophiread/build/"

##########################################

#### RUN one time (Creat Analyzed data folder) ###########
mkdir "../Analyzed_DATA/"
mkdir ${H5_DIR}
mkdir ${IMG_DIR}

# ##########################################################

TPX_FILENAME=${RUM_NUM}".tpx3"
USR_PARA_FILENAME="user_defined_params_1.txt"
H5_FILENAME=${RUM_NUM}".h5"

# ### DIR preparation
RUN_DIR=${Pre_DIR}"RUN_${RUM_NUM}/"
TPX_DIR=${RUN_DIR}"tpx/"
# ###


######## 

##### When the program starts to complie all Run ##############

# DIR_array=($(ls ${Pre_DIR}))
# STR1="${DIR_array[*]}"

# for eachValue in ${DIR_array[@]}; do
# 	echo ${eachValue}| grep -o -E '[0-9]{6}'
# 	output=$(echo ${eachValue}| grep -o -E '[0-9]{6}')
# 	echo $output
# 	./run.sh $output
# done

# ###############################################################
# DIR_array=($(ls ${Pre_DIR}))
# STR1="${DIR_array[*]}"

# sleep $Refreshtime
# DIR_array_after=($(ls ${Pre_DIR}))
# STR2="${DIR_array_after[*]}"

while true
do
# DIR_array=($(ls ${Pre_DIR}))
# STR3="${DIR_array[*]}"
# DIR_array_after_process=($(ls ${Pre_DIR}))
# STR2="${DIR_array_after_process[*]}"
# 	DIR_array=($(ls ${Pre_DIR}))
# STR1="${DIR_array[*]}"
	# echo ${DIR_array[*]}

	### After the initial analysis is done, wait 5 second
	# sleep $Refreshtime
	### Check the folder if we have a new folder
	
	# sleep $Refreshtime
	# DIR_array_after=($(ls ${Pre_DIR}))
	# STR2="${DIR_array_after[*]}"

	# echo $STR1
	# echo $STR2
	# echo ${DIR_array_after[2]}

	# test "$STR1" = "$STR2"; echo $?

	## When the raw directry is the same, echo $? returns 0, when it changes, it returns 1.
	
	# DIR_array=($(ls ${Pre_DIR}))
	# STR1="${DIR_array[*]}"
	# echo $STR1

	# sleep $Refreshtime
	
	DIR_array_after=($(ls ${Pre_DIR}))
	STR2="${DIR_array_after[*]}"
	# # echo $STR2
	# # sleep 
	
	# if [ "$STR1" = "$STR2" ]; then
	# 	echo "...... No new folder...... The last Run is: "

	# 	## Last folder name. keep do ing data analysis for this folder
	# 	echo ${DIR_array_after[${#DIR_array_after[@]}-1]}

		echo "Keep checking if all Run have h5 files"
		for ((k=0; k<${#DIR_array_after[@]}; k++))
		do
			missing_file=$(echo ${DIR_array_after[$k]}| grep -o -E '[0-9]{6}' )
			# echo $H5_DIR$missing_file".h5"
			if [ ! -f $H5_DIR$missing_file".h5" ]; then
			echo "########### New data are found.#########"
			# missing_Run_num=$(echo ${DIR_array_after[${DIR_array_after[k]}]}| grep -o -E '[0-9]{6}' )
			echo "######### Doing analysis ###############"
			# echo $missing_file
			./run.sh $missing_file
			fi
		done
		echo ">> All Run have h5 files."
		echo ">> Waiting for new data."
		sleep $Refreshtime
# fi
		

		# echo "Wait for ${Refreshtime} s"
		# output=$(echo ${DIR_array_after[${#DIR_array_after[@]}-1]}| grep -o -E '[0-9]{6}' )
		# # echo $output
		# # grep [0-9] ${DIR_array_after[${#DIR_array_after[@]}-1]}
		# # echo $Run_number
		# ./run.sh $output
	
	# else [ "$STR1" != "$STR2" ]; 
	# 	# DIR_array=($(ls ${Pre_DIR}))
	# 	# STR1="${DIR_array[*]}"
	# 	# until [ "$STR1" = "$STR2" ]; do
	# 		echo "############## New folder is found! ############## The number of new folders are: "
	# 		num_folder_after=${#DIR_array_after[@]}
	# 		num_folder_before=${#DIR_array[@]}

	# 		c=`expr $num_folder_after - $num_folder_before`
	# 		echo $c
	# 		for ((i = c;  i>0; i--))
	# 		do
	# 			output=$(echo ${DIR_array_after[${#DIR_array_after[@]}-$i]}| grep -o -E '[0-9]{6}' )
	# 			echo "Now, processing Run_${output}"
	# 			# continue 2
	# 			# echo $output
	# 			echo $i
	# 			./run.sh $output
	# 		done
	# 		DIR_array_after_process=($(ls ${Pre_DIR}))
	# 		STR2="${DIR_array_after_process[*]}"

	# # In case new folders are added, while processing data.
	# 	# done																
	# fi

			
	# if [ "$STR2" != "$STR3" ]; then
	# 	# echo "for loop done"
		
	# fi

	# echo "if done"

			# echo $output
	# ./run.sh $output
	# done

		# echo $(num_unprocessed_folders)

	# 	for p in ${DIR_array[@]}; do
	# 		for q in ${DIR_array_after[@]}; do
	# 			if [ "${p}" != "${q}" ]; then
	# 			array3+=(${q})
	# 			fi
	# 		done
	# 	done
	# echo ${array3[@]}

		# print_r(array_diff($STR1,$STR2))
		
		# ./run.sh $output
		# echo ${DIR_array_after[${#DIR_array_after[@]}-1]}
		# DIR_array_after_process=($(ls ${Pre_DIR}))

		# STR3="${DIR_array_after_process[*]}"
	
	

done
# echo $?

#Run Spohiread#

# ${PathtoSphiread}Sophiread -i ${TPX_DIR}${TPX_FILENAME} -u ${PathtoSphiread}${USR_PARA_FILENAME} -E ${H5_DIR}${H5_FILENAME} -v

# # Run H5toIMG.py #
# # echo ${H5_DIR}${H5_FILENAME}

# python H5toIMG.py ${RUM_NUM} ${H5_DIR} ${H5_FILENAME} ${DSCALE}


# pwd







# # /Users/fumiaki/Documents/ORNL/Research/PTX3_Analysis/Data/0p3thickness/With_mount/Gamma_neutron_imaging/PbwithAm/Photon_hits_half.h5 -v



# echo ${Working_DIR}
# cd ${Working_DIR}

# touch test.txt
# while true
# do 
#     WATCH_DIR=${Working_DIR}

#     FILES_BEFORE=$(ls $WATCH_DIR)

#     # echo $FILES_BEFORE > filename.txt
#     sleep 5
#     FILES_AFTER=$(ls $WATCH_DIR)
    
#     DIFF=$(diff $FILES_BEFORE $FILES_AFTER >differentfilename.txt) 

#     # if [ $DIFF -ne 0 ] 
#     # then
#         # echo "The directory was modified" 
# done