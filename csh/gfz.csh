# ---------- My settings ---------------------------------------------------
# set shortcut to zs7, define variable and then source .tcsh, note that this is different with bash.
# delet and unset to clear the variable.
# echo $work to display 
#set work = "/misc/zs7/Zelong" 
set my_shell = "/home/zelong/Desktop/my_shell_scripts/original"
set SOFT = "/misc/radarsoft/Zelong"
set conda = "/misc/zs7/Zelong/Soft/conda/etc/profile.d/"

#---------------------- GAMMA version------------------------------------------------
setenv VERSION_GAMMA GAMMA_SOFTWARE-20200713_ubuntu2004
#setenv VERSION_GAMMA GAMMA_SOFTWARE-20211208_ubuntu2004

#--------- user GMT settings -------------------------------------------
setenv GMTHOME /home/zelong/this_gmt
#setenv GMTHOME /service/local64/GMT6.1.0/ 
setenv GMT_SHAREDIR $GMTHOME/share
setenv MANPATH {$MANPATH}:$GMTHOME/man
setenv PATH {$PATH}:$GMTHOME/bin

#-------- GAMMA PYTHON ---------------------
#setenv GAMMA_HOME :/misc/gamma/GAMMA_SOFTWARE-20200713_CentOS6
#setenv PYTHONPATH .:/misc/gamma/GAMMA_SOFTWARE-20200713_CentOS6: 
# it you already a PYTHONPATH, then use the following command:
# setenv PYTHONPATH .:$GAMMA_HOME:$PYTHONPATH
setenv PYTHONPATH .:${GAMMA_HOME}:
#setenv PYTHONPATH .:/misc/gamma/GAMMA_SOFTWARE-20200713_ubuntu2004:

#----- Stamps/TRAIN/PSO/Unicycle --------------
source /misc/radarsoft/Zelong/TRAIN-master/APS_CONFIG.tcsh
source /misc/radarsoft/Zelong/StaMPS-master/StaMPS_CONFIG.tcsh
source /misc/radarsoft/Zelong/psokinv4.5s/PSOK_CONFIG.tcsh
#source /misc/radarsoft/Zelong/StaMPS-4.1/StaMPS_CONFIG.tcsh

#------- S1_TS_proc -----------#
setenv S1_TS_PROC_HOME /home/zelong/Desktop/my_scripts/S1_TS_proc
setenv PATH {$PATH}:${S1_TS_PROC_HOME}

#------- S1_DInSAR -----------#
setenv S1_DINSAR_HOME /home/zelong/Desktop/my_scripts/S1_DInSAR
setenv PATH {$PATH}:${S1_DINSAR_HOME}

#------ Jupyter notebook ------#
setenv JUPYTER_HOME /home/zelong/.local/bin
setenv PATH {$PATH}:${JUPYTER_HOME}

#------ My vimrc ----------#
setenv MYVIMRC /home/zelong/.vim/vimrc

#--------- Gmsh ----------#
setenv GMSH_PATH /misc/radarsoft/Zelong/gmsh/build/
setenv PATH {$PATH}:${GMSH_PATH}

##--------- Paraview ----------#
setenv PARAVIEW_PATH /misc/zs7/Zelong/Soft/ParaView-5.9.1-MPI-Linux-Python3.8-64bit/bin/
setenv PATH {$PATH}:${PARAVIEW_PATH}

##--------- Coreform Cubit ----------#
setenv COREFORM_PATH /misc/zs7/Zelong/Soft/Cubit_Trelis/Coreform-Cubit-2021.11/bin/
setenv PATH {$PATH}:${COREFORM_PATH}

##--------- Greetings ------------#
#bash /home/zelong/Desktop/my_linux/greetings.sh
