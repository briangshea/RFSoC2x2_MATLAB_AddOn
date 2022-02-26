set BDFILEPATH [get_files -quiet base.bd]
make_wrapper -files $BDFILEPATH -top
# Try adding both the Verilog and VHLD files
regsub -all "base.bd" [get_files -quiet base.bd] "hdl/base_wrapper.v" TOPFILEPATH
catch {
        add_files -norecurse $TOPFILEPATH
        update_compile_order -fileset sources_1
        }
regsub -all "base.bd" [get_files -quiet base.bd] "hdl/base_wrapper.vhd" TOPFILEPATH
catch {
        add_files -norecurse $TOPFILEPATH
        update_compile_order -fileset sources_1
        }
