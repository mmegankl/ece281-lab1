# Lab 1: Thirty-One Day Month

VHDL template for ECE 281 [Lab 1](https://usafa-ece.github.io/ece281-book/lab/lab1.html)

Targeted toward Digilent Basys3. Make sure to install the [board files](https://github.com/Xilinx/XilinxBoardStore/tree/2018.2/boards/Digilent/basys3).

Tested on Windows 10.

## Usage

Clone and cd into the directory.

Build the project using the handy `.bat` file.

```powershell
./build.bat
```

You should see a new `.xpr` file. Open it with Vivado!

### Manually, without BAT

1. Clone the repo
2. Open Vivado 2018.2
3. From the weclome screen, select Window->Tcl Console
4. In the tcl console at the bottom of the screen `cd` to the this directory
5. In the consoled enter `source helloLed.tcl`
6. Proceed with normal simulation, synthesis, implementation, bitstream process.
7. On the board `SW0` should now control `LD0`!

Thanks to [fpgadeveloper post](https://www.fpgadeveloper.com/2014/08/version-control-for-vivado-projects.html/)!

## GitHub Actions Testbench

The workflow uses the [setup-ghdl-ci](https://github.com/ghdl/setup-ghdl-ci) GitHub action
to run a *nightly* build of [GHDL](https://ghdl.github.io/ghdl/).

First, the workflow uses GHDL to **analyze** all `.vhd` files in `src/hdl/`.

Then it **elaborates** the *any* entity with the name `*_tb`. In this case, that is `helloled_tb`.

Finally, the workflow **runs** the simulation. If successful then it will quietly exit with a `0` code.
If any of the `assert` statements fail **with** `severity failure` then GHDL will cease the simulation and exit with non-zero code; this will also cause the workflow to fail.
Assert statements of other severity levels will be reported, but not fail the workflow.

Documentation Statement: I receive help from C3C Komata on 2/12 for the logic portion with VHDL, especially with the MUX logic in the thirtyonedays.vhd file after my logic was not working.
She also helped with the tb .vhd file explaining to me what these test cases were for. Lt Col Trimble helped me on 2/12 with the syntax errors I had. He helped me to fix my select variables
and the MUX logic variables in the regular .vhd file.
