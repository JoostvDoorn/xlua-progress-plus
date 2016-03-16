# Progress extension for xlua
This extension to xlua.progress allows you to print extra information alongside the progressbar, without causing scrollback.

To use include:
```lua
require 'xlua'
require 'xlua-progress-plus'
```
### xlua.progress
```lua
xlua.progress(current, goal, info_lines)
```
Outputs progress bar with `info_lines` nr of additional lines. The additional lines can be filled using `xlua.info`. 
### xlua.info
```lua
xlua.info(output, [line_nr])
```
Info output. `line_nr` assigns line to output info on.
### xlua.info_clear
```lua
xlua.info_clear()
```
### Example
```lua
xlua.info(string.format("Training error %f", 0.5))
xlua.progress(1, 100, 1)
```
Outputs:
```
 [................... 1/100 ....................] ETA: 0ms | Step: 0ms
Training error 0.500000
```
