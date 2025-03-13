# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/Eric/CodeProjects/CPE133/HRSensToCan/HRSensToCan.runs/synth_1/.Xil/Vivado-23084-DESKTOP-P2N9ID2/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    rt::set_parameter datapathDensePacking false
    set rt::partid xc7a35ticpg236-1L
    source $::env(HRT_TCL_PATH)/rtSynthParallelPrep.tcl
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib
    rt::set_parameter defaultVhdlWorkLib xil_defaultlib

    rt::set_parameter loadVhdl2008Libs false
    rt::set_parameter loadVhdl2019Libs false
    rt::set_parameter deferParseUntilElab true
    rt::set_parameter sortHdlCommandLine true
    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv {
      C:/Users/Eric/CodeProjects/CPE133/CAN_ID/CAN_ID.srcs/sources_1/new/Can_ID.sv
      C:/Users/Eric/CodeProjects/CPE133/UniversalShiftRegister16b/UniversalShiftRegister16b.srcs/sources_1/new/DFlipFlop.sv
      C:/Users/Eric/CodeProjects/CPE133/7SegmentDriver/7SegmentDriver.srcs/sources_1/new/RingCounter.sv
      C:/Users/Eric/CodeProjects/CPE133/7SegmentDriver/7SegmentDriver.srcs/sources_1/new/SegInterpreter.sv
      C:/Users/Eric/CodeProjects/CPE133/7SegmentDriver/7SegmentDriver.srcs/sources_1/new/SegmentDriver.sv
      C:/Users/Eric/CodeProjects/CPE133/SensCounter/SensCounter.srcs/sources_1/new/SensCount.sv
      C:/Users/Eric/CodeProjects/CPE133/SensCounter/SensCounter.srcs/sources_1/new/TFlipFlop.sv
      C:/Users/Eric/CodeProjects/CPE133/UniversalShiftRegister16b/UniversalShiftRegister16b.srcs/sources_1/new/USR16b.sv
      C:/Users/Eric/CodeProjects/CPE133/checksumMachineCAN/checksumMachineCAN.srcs/sources_1/new/checksumMachine.sv
      C:/Users/Eric/CodeProjects/CPE133/clockDivider/clockDivider.srcs/sources_1/new/clockDivider.sv
      C:/Users/Eric/CodeProjects/CPE133/HRSensToCan/HRSensToCan.srcs/sources_1/new/top.sv
      C:/Users/Eric/CodeProjects/CPE133/HRSensToCan/HRSensToCan.srcs/sources_1/new/btnDebounce.sv
      C:/Users/Eric/CodeProjects/CPE133/HRSensToCan/HRSensToCan.srcs/sources_1/new/enabledClock.sv
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top top
    rt::set_parameter enableIncremental true
    rt::set_parameter markDebugPreservationLevel "enable"
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter dataflowBusHighlighting false
    rt::set_parameter generateDataflowBusNetlist false
    rt::set_parameter dataFlowViewInElab false
    rt::set_parameter busViewFixBrokenConnections false
    rt::set_parameter elaborateRtlOnlyFlow false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter synthDebugLog false
    rt::set_parameter printModuleName false
    rt::set_parameter enableSplitFlowPath "C:/Users/Eric/CodeProjects/CPE133/HRSensToCan/HRSensToCan.runs/synth_1/.Xil/Vivado-23084-DESKTOP-P2N9ID2/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
uplevel #0 { 
   $rt::db resetHdlParse
   set hsKey [rt::get_parameter helper_shm_key] 
   if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
      $rt::db killSynthHelper $hsKey
   } 
   source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
   return -code "error" $rt::result
 }
}
