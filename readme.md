# Text segment size calculation script

> Find the median and average size of text segments in given directory. <br />
> The text segment size of a program = its executable size.
> <br /><br />
> Based on those values, the optimal page size is then calculated.

optimal page size ![optimal_eqn](https://raw.githubusercontent.com/ladzaretti/text_segment_size_script/master/CodeCogsEqn.png)

_Where_
- s - program's text seg size
- e - page table entry size <br/> (e is assumed to be of size 4)
