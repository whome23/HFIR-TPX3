#!/usr/bin/env python
# coding: utf-8

# %matplotlib ipympl
import h5py 
import numpy as np 
import matplotlib.pyplot as plt 
import sys
import os
# import pandas as pd
from scipy.ndimage.interpolation import rotate
import tables
import nexusformat.nexus as nx
from matplotlib.colors import LogNorm
from matplotlib.transforms import Affine2D
import math

args = sys.argv

# In[15]:

Run_start = args[1]
Run_end = args[2]
H5DIR=args[3]
DSCALE=args[4]
x_min=args[5]
x_max=args[6]
y_min=args[7]
y_max=args[8]
ROT=args[9]

DSCALE= int(DSCALE)
binsize = 256*DSCALE
x_min=int(x_min)
x_max=int(x_max)
y_min=int(y_min)
y_max=int(y_max)
ROT=float(ROT)
Run_start_int=int(Run_start)
Run_end_int=int(Run_end)

# print(H5DIR+H5_FILENAME)
H5_Path=os.path.abspath('../Analyzed_DATA/H5/')

# print(H5_Path)

os.chdir(H5_Path)

##########################以下をそれぞれのH5fileに適用するようにfor文書き換える#######################
print(Run_start_int)
Summed_intensity_array = []
Summed_intensity_err_array=[]
for run_num in range(Run_start_int, Run_end_int+1):

    H5_FILE_w_Path=H5_Path+'/'+str(run_num).zfill(6)+'.h5'
    print(H5_FILE_w_Path)
    with h5py.File(H5_FILE_w_Path) as h5f:
        Neutron_x = h5f["events/x"][:]
        Neutron_y = h5f["events/y"][:]

# # In[21]:

    xedges = np.linspace(binsize, binsize*2, binsize+1)
    yedges = np.linspace(0, binsize, binsize+1)

    H, xedges, yedges = np.histogram2d(Neutron_x*DSCALE, Neutron_y*DSCALE, bins=(xedges, yedges))

    R=rotate(H, angle=ROT,reshape=False)
    Summed_intensity=0

    for x in range(x_min, x_max):
	    for y in range(y_min,y_max):    

             Summed_intensity+=R[x,y]
    
    Summed_intensity_array.append(Summed_intensity)
    Summed_intensity_err_array.append(Summed_intensity**(1/2))
    
print(Summed_intensity_array)

Run_number=np.arange(Run_start_int,Run_end_int+1,1)


os.chdir('../SCAN/IMG')

plt.errorbar(Run_number, Summed_intensity_array,yerr=Summed_intensity_err_array, color='green', fmt="o")
plt.title(f"ROI: {x_min}<x<{x_max}, {y_min}<y<{y_max}")
plt.xlabel("Run number")
plt.ylabel("Summed count")
plt.savefig(f'Scan_{Run_start}_{Run_end}.png',format="png")


# Run_number= [str(math.floor(i) for i in Run_number).zfill(6)]
# Run_number_str=str(Run_number).zfill(6)
os.chdir('../DATA')
np.savetxt(f'Scan_{Run_start}_{Run_end}_1.txt', Run_number,fmt='%.0f')
np.savetxt(f'Scan_{Run_start}_{Run_end}_2.txt',  Summed_intensity_array)
np.savetxt(f'Scan_{Run_start}_{Run_end}_3.txt',  Summed_intensity_err_array)


    
#     # print(R[128,128]) ######## I confirmed that coordinate is the same as png ################Using this, I can access the intensity after it is rotated. But when I open it with imagej, the valuse was equal to the values with x=119, y=101.... #############################
        
#     ########## Summing over the intensity in ROI ###########

#     for x in range(x_min, x_max):
#         for y in range(y_min,y_max):
            
#             Summed_intensity+=R[x,y]
#             # print(R[x,y])
#             # print(H[x,y]) # I confirmed that rotation makes counts in float number. See (https://github.com/scipy/scipy/blob/v0.14.0/scipy/ndimage/interpolation.py#L561)

#     # print(Summed_intensity)
#     Summed_intensity_array.append(Summed_intensity)
#     Summed_intensity_err_array.append(Summed_intensity**(1/2))
        



# ##########################

# fig, ax = plt.subplots(figsize=(10,10))
# labelsize_=20
# h=ax.imshow(
#    R, # same coordinate of experimental setup
# #      -np.log(H+1),
#     interpolation='nearest',
#     origin='lower',
# #     extent=[xedges[0], xedges[-1], yedges[0], yedges[-1]],
#     cmap="viridis",  
#     #   vmin=0,
#     #   vmax=10
# )
# # plt.rcParams["figure.figsize"] = [7.50, 3.50]
# plt.rcParams["figure.autolayout"] = True
# cb=fig.colorbar(h)
# cb.ax.tick_params(labelsize=labelsize_)
# cb.ax.title.set_size(labelsize_)
# cb.set_label(label="Counts",size=labelsize_)
# # fig.set_label(label='my color bar label', weight='bold')
# # f.set_label('# of contacts', rotation=270)
# ax.set_title(f"Neutron image, Dscale: {DSCALE}, Rotation :{ROT} deg")
# ax.set_xlabel("Pixel")
# plt.yticks(fontsize=labelsize_)
# plt.xticks(fontsize=labelsize_)
# ax.set_ylabel("Pixel")
# ax.xaxis.label.set_size(labelsize_)

# ax.yaxis.label.set_size(labelsize_)
# ax.title.set_size(labelsize_)


# # fig.savefig(f'Neutron_dpi{DPI}_DSCALE{DSCALE}.tiff',format="tiff",dpi=DPI)
# fig.savefig(f'RUN_{Run_number}_DSCALE_{DSCALE}_ROTATION_{ROT}.png',format="png",dpi=DPI)


# # Save csv file in CSV folder
# os.chdir('../CSV/')

# np.savetxt(f'RUN_{Run_number}_DSCALE_{DSCALE}_ROT_{ROT}.txt', np.flipud(H), delimiter=',')

# # Visualize Gamma image

# In[22]:
# In[ ]:




