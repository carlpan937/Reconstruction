#### import the simple module from the paraview

import os
from paraview.simple import *
from ParaviewLoad import ShowData

Cmap_name = 'u'
Cmap_title = 'The stuff'

Cmap = [-100, 100]
Thr_Neg = [-100, -50]
Thr_Pos = [25, 40]
Bkg_Op = 0.1
#VTK_Filenames = 'E:\\Neonate2016\\Parallel\\Recon\\arm_new\\output\\p_seq9_1_22.vtk'
# VTK_Filenames = 'C:\\Users\\James\\Neonate2016\\Parallel\\Recon\\arm\\output\\plastic_seq4_1_53.vtk'

VTKnames=['E:/Neonate2016/Parallel/Recon/arm_new/output/p_seq9_1_22.vtk', 'E:/Neonate2016/Parallel/Recon/arm_new/output/p_seq9_1_23.vtk']
VTK_Filenames=VTKnames

for iName in range(len(VTKnames)):
    #print iName
    VTK_Filenames[iName]=os.path.abspath(VTKnames[iName])
print VTK_Filenames


Data = LegacyVTKReader(FileNames=VTK_Filenames)


ShowData.ShowThresholdData(Data, Cmap, Thr_Neg, Thr_Pos, Cmap_name, Cmap_title, Bkg_Op)



# ##  get active view
#renderView1 = GetActiveViewOrCreate('RenderView')
# DataDisplay = Show(Data, renderView1)
# # get animation scene
animationScene1 = GetAnimationScene()
#
# # update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()
#
#renderView1.ResetCamera()
#
#Render()