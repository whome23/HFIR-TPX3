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

args = sys.argv

# In[15]:

Run_number = args[1]
H5DIR=args[2]
H5_FILENAME=args[3]
DSCALE=args[4]
ROT=args[5]
# print(H5DIR+H5_FILENAME)
ROT=float(ROT)
H5_Path=os.path.abspath('../Analyzed_DATA/H5/')
# print(H5_Path)

H5_FILR_w_Path=H5_Path+'/'+H5_FILENAME
print(H5_FILR_w_Path)

with h5py.File(H5_FILR_w_Path) as h5f:
    Neutron_x = h5f["events/x"][:]
    Neutron_y = h5f["events/y"][:]

# In[21]:

os.chdir('../Analyzed_DATA/IMG/')

DSCALE_i = int(DSCALE)
binsize = 256*DSCALE_i
DPI=512
xedges = np.linspace(binsize, binsize*2, binsize+1)
yedges = np.linspace(0, binsize, binsize+1)



H, xedges, yedges = np.histogram2d(Neutron_x*DSCALE_i, Neutron_y*DSCALE_i, bins=(xedges, yedges))

R=rotate(H, angle=ROT,reshape=False)


fig, ax = plt.subplots(figsize=(10,10))
labelsize_=20
h=ax.imshow(
   R, # same coordinate of experimental setup
#      -np.log(H+1),
    interpolation='nearest',
    origin='lower',
#     extent=[xedges[0], xedges[-1], yedges[0], yedges[-1]],
    cmap="viridis",  
    #   vmin=0,
    #   vmax=10
)
# plt.rcParams["figure.figsize"] = [7.50, 3.50]
plt.rcParams["figure.autolayout"] = True
cb=fig.colorbar(h)
cb.ax.tick_params(labelsize=labelsize_)
cb.ax.title.set_size(labelsize_)
cb.set_label(label="Counts",size=labelsize_)
# fig.set_label(label='my color bar label', weight='bold')
# f.set_label('# of contacts', rotation=270)
ax.set_title(f"Neutron image, Dscale: {DSCALE}, Rotation :{ROT} deg")
ax.set_xlabel("Pixel")
plt.yticks(fontsize=labelsize_)
plt.xticks(fontsize=labelsize_)
ax.set_ylabel("Pixel")
ax.xaxis.label.set_size(labelsize_)

ax.yaxis.label.set_size(labelsize_)
ax.title.set_size(labelsize_)


# fig.savefig(f'Neutron_dpi{DPI}_DSCALE{DSCALE}.tiff',format="tiff",dpi=DPI)
fig.savefig(f'RUN_{Run_number}_DSCALE_{DSCALE}_ROTATION_{ROT}.png',format="png",dpi=DPI)


# Save csv file in CSV folder
os.chdir('../CSV/')

np.savetxt(f'RUN_{Run_number}_DSCALE_{DSCALE}_ROT_{ROT}.txt', np.flipud(H), delimiter=',')

# # Visualize Gamma image

# In[22]:
# In[ ]:




