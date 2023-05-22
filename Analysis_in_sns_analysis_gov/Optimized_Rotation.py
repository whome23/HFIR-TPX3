#!/usr/bin/env python
# coding: utf-8

# %matplotlib ipympl
import h5py 
import numpy as np 
import matplotlib.pyplot as plt 
import sys
import os
import cv2
# import pandas as pd
from scipy.ndimage.interpolation import rotate
import tables
import nexusformat.nexus as nx
from matplotlib.colors import LogNorm
from matplotlib.transforms import Affine2D
import math

args = sys.argv

# In[15]:

Run_number = args[1]
H5DIR=args[2]
H5_FILENAME=args[3]
DSCALE=args[4]
x_min=args[5]
x_max=args[6]
y_min=args[7]
y_max=args[8]
rot_min=args[9]
rot_max=args[10]
rot_bin=args[11]
# DSCALE=args[4]
# Rot_ang=args[5]
# print(H5DIR+H5_FILENAME)

H5_Path=os.path.abspath('../Analyzed_DATA/H5/')
# print(H5_Path)

H5_FILR_w_Path=H5_Path+'/'+H5_FILENAME
# print(H5_FILR_w_Path)

with h5py.File(H5_FILR_w_Path) as h5f:
    Neutron_x = h5f["events/x"][:]
    Neutron_y = h5f["events/y"][:]

# In[21]:

# (x_min, ymin),(x_max, y_max) for the ROI to sum over pixel value
# x_min=24
# y_min=72
# x_max=236
# y_max=80
# rot_min=-6
# rot_max=6
# rot_bin=0.1
os.chdir('../Analyzed_DATA/IMG/')

DSCALE_i = int(DSCALE)
binsize = 256*DSCALE_i
rot_bin=float(rot_bin)
rot_max=float(rot_max)
rot_min=float(rot_min)
x_min=int(x_min)
x_max=int(x_max)
y_min=int(y_min)
y_max=int(y_max)

# print (binsize)
DPI=512
xedges = np.linspace(binsize, binsize*2, binsize+1)
yedges = np.linspace(0, binsize, binsize+1)


H, xedges, yedges = np.histogram2d(Neutron_x*DSCALE_i, Neutron_y*DSCALE_i, bins=(xedges, yedges))

# print(H[::-1]) 
Summed_intensity_array = []
Summed_intensity_err_array=[]
for r in np.arange(rot_min,rot_max,rot_bin):
    Summed_intensity=0
    R=rotate(H, angle=r,reshape=False)
    # print(R[128,128]) ######## I confirmed that coordinate is the same as png ################Using this, I can access the intensity after it is rotated. But when I open it with imagej, the valuse was equal to the values with x=119, y=101.... #############################
        
    ########## Summing over the intensity in ROI ###########

    for x in range(x_min, x_max):
        for y in range(y_min,y_max):
            
            Summed_intensity+=R[x,y]
            # print(R[x,y])
            # print(H[x,y]) # I confirmed that rotation makes counts in float number. See (https://github.com/scipy/scipy/blob/v0.14.0/scipy/ndimage/interpolation.py#L561)

    # print(Summed_intensity)
    Summed_intensity_array.append(Summed_intensity)
    Summed_intensity_err_array.append(Summed_intensity**(1/2))
        

# print(Summed_intensity_array)

    
rotation_array=np.arange(rot_min,rot_max,rot_bin)


os.chdir('../SCAN/IMG')

plt.errorbar(rotation_array, Summed_intensity_array,yerr=Summed_intensity_err_array, color='green', marker='o', linestyle='dashed',linewidth=2, markersize=5)
plt.title(f"ROI: {x_min}<x<{x_max}, {y_min}<y<{y_max}")
plt.xlabel("Rotation angle [deg]")
plt.ylabel("Summed count")
plt.savefig(f'RUN_{Run_number}_Rotation_{rot_min}_{rot_max}_{rot_bin}.png',format="png",dpi=DPI)

os.chdir('../DATA')
np.savetxt(f'RUN_{Run_number}_Rotation_{rot_min}_{rot_max}_1.txt', rotation_array)
np.savetxt(f'RUN_{Run_number}_Rotation_{rot_min}_{rot_max}_2.txt',  Summed_intensity_array)
np.savetxt(f'RUN_{Run_number}_Rotation_{rot_min}_{rot_max}_3.txt',  Summed_intensity_err_array)

# x,y,z equal sized 1D arrays
# plt.show()

# print(len(R))

# R=rotate(H, angle=2.3,reshape=False)
# fig, ax = plt.subplots(figsize=(10,10))
# labelsize_=20
# h=ax.imshow(
#     R, # same coordinate of experimental setup
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
# ax.set_title(f"Neutron image, Dscale: {DSCALE}")
# ax.set_xlabel("Pixel")
# plt.yticks(fontsize=labelsize_)
# plt.xticks(fontsize=labelsize_)
# ax.set_ylabel("Pixel")
# ax.xaxis.label.set_size(labelsize_)

# ax.yaxis.label.set_size(labelsize_)
# ax.title.set_size(labelsize_)


# fig.savefig(f'Neutron_dpi{DPI}_DSCALE{DSCALE}.tiff',format="tiff",dpi=DPI)
# fig.savefig(f'RUN_{Run_number}_DSCALE_{DSCALE}.png',format="png",dpi=DPI)


# # Save csv file in CSV folder
# os.chdir('../CSV/')
# np.savetxt(f'RUN_{Run_number}_DSCALE_{DSCALE}.txt', np.flipud(R), delimiter=',') # to match the orientation to be the same as imagej result

# # Visualize Gamma image

# In[22]:
# In[ ]:




