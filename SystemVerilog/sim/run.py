
from pathlib import Path
from vunit.verilog import VUnit

SRC_PATH = Path(__file__).parent / "../"

VU = VUnit.from_argv()
VU.add_library("adder_lib").add_source_files(SRC_PATH / "design" / "*.v")
VU.add_library("tb_adder_lib").add_source_files(SRC_PATH / "testbench" / "*.sv")

VU.main()
