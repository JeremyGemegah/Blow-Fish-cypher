
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name blowfish -dir "C:/Users/jerem/OneDrive/Desktop/projects/blowfish/planAhead_run_1" -part xc3s200ft256-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "rough_work.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {rough_work.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top rough_work $srcset
add_files [list {rough_work.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s200ft256-4
