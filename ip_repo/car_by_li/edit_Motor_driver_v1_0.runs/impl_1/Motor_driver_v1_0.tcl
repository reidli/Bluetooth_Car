proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir D:/system/system_ability_2018/system_ability_2018/ip_repo/car_by_li/edit_Motor_driver_v1_0.cache/wt [current_project]
  set_property parent.project_path D:/system/system_ability_2018/system_ability_2018/ip_repo/car_by_li/edit_Motor_driver_v1_0.xpr [current_project]
  set_property ip_repo_paths {
  d:/system/system_ability_2018/system_ability_2018/ip_repo/car_by_li/edit_Motor_driver_v1_0.cache/ip
  D:/system/system_ability_2018/system_ability_2018/ip_repo/car_by_li/motor_driver_1.0
  D:/system/system_ability_2018/system_ability_2018/ip_repo/Users/84397/Desktop/material/car20181216/system_ability_2018/ip_repo/Motor_driver/Motor_driver_1.0
  D:/system/system_ability_2018/system_ability_2018/ip_repo/Users/84397/Desktop/material/car20181216/system_ability_2018/ip_repo/PWM_car/PWM_car_1.0
  D:/system/system_ability_2018/system_ability_2018/ip_repo/Users/84397/Desktop/material/car20181216/system_ability_2018/ip_repo/PWM_w_Int_1.0
  D:/system/system_ability_2018/system_ability_2018/ip_repo/Users/84397/Desktop/material/car20181216/system_ability_2018/ip_repo/my_mips_packaged
} [current_project]
  set_property ip_output_repo d:/system/system_ability_2018/system_ability_2018/ip_repo/car_by_li/edit_Motor_driver_v1_0.cache/ip [current_project]
  add_files -quiet D:/system/system_ability_2018/system_ability_2018/ip_repo/car_by_li/edit_Motor_driver_v1_0.runs/synth_1/Motor_driver_v1_0.dcp
  link_design -top Motor_driver_v1_0 -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force Motor_driver_v1_0_opt.dcp
  catch {report_drc -file Motor_driver_v1_0_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file Motor_driver_v1_0.hwdef}
  place_design 
  write_checkpoint -force Motor_driver_v1_0_placed.dcp
  catch { report_io -file Motor_driver_v1_0_io_placed.rpt }
  catch { report_utilization -file Motor_driver_v1_0_utilization_placed.rpt -pb Motor_driver_v1_0_utilization_placed.pb }
  catch { report_control_sets -verbose -file Motor_driver_v1_0_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Motor_driver_v1_0_routed.dcp
  catch { report_drc -file Motor_driver_v1_0_drc_routed.rpt -pb Motor_driver_v1_0_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Motor_driver_v1_0_timing_summary_routed.rpt -rpx Motor_driver_v1_0_timing_summary_routed.rpx }
  catch { report_power -file Motor_driver_v1_0_power_routed.rpt -pb Motor_driver_v1_0_power_summary_routed.pb }
  catch { report_route_status -file Motor_driver_v1_0_route_status.rpt -pb Motor_driver_v1_0_route_status.pb }
  catch { report_clock_utilization -file Motor_driver_v1_0_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

