#========================================================
# Timing Simulation for BrentKungAdder - RISCVmulti
#========================================================

# Stop any running simulation
quit -sim

# Start transcript
transcript file "../Documentation/OutputFiles/TS_RISCVmulti_BrentKung_Transcript.txt"

# Compile source in order
vcom -work work -2008 -explicit -stats=none ../SourceCode/BLAN.vhd
vcom -work work -2008 -explicit -stats=none ../SourceCode/BrentKungAdder.vhd
vcom -work work -2008 -explicit -stats=none ../SourceCode/simulation/modelsim/RISCVmulti.vho
vcom -work work -2008 -explicit -stats=none ./TBBrentKung.vhd

# Launch simulation with SDF annotation
vsim -t 1ps -voptargs="+acc" -sdftyp /TBAdder/DUT=../SourceCode/simulation/modelsim/RISCVmulti_vhd.sdo work.TBAdder

#========================================================
# Waveform setup
#========================================================

# Divider for waveform organization
add wave -noupdate -divider -height 45 "BrentKungAdder - TIMING SIM"

# Measurement signals
add wave -noupdate -divider -height 30 "MEASUREMENT TRACKING"
add wave -noupdate -radix decimal /TBAdder/MeasurementIndex
add wave -noupdate -radix decimal /TBAdder/tpd_S_ps
add wave -noupdate -radix decimal /TBAdder/tpd_Cout_ps
add wave -noupdate -radix decimal /TBAdder/worst_tpd_S_ps
add wave -noupdate -radix decimal /TBAdder/worst_tpd_Cout_ps

# Inputs
add wave -noupdate -divider -height 30 "INPUTS"
add wave -noupdate -radix hex    /TBAdder/TBA
add wave -noupdate -radix hex    /TBAdder/TBB
add wave -noupdate               /TBAdder/TBCin

# Outputs
add wave -noupdate -divider -height 30 "OUTPUTS"
add wave -noupdate -color "Cyan" -radix hex /TBAdder/TBS
add wave -noupdate -color "Cyan"            /TBAdder/TBCout

#========================================================
# Combined signals for verification
#========================================================
add wave -noupdate -divider -height 30 "COMBINED MEASUREMENT SIGNALS"
add wave -noupdate -color "Yellow" -radix hex /TBAdder/DUTout_S

#========================================================
# Run simulation
#========================================================
run -all
wave zoom full
configure wave -timelineunits ns

# Stop transcript
transcript file ""
