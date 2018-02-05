# loglabels
Convert the labels of a (logarithmic) axis to unit prefix notation: '1e-10' --> '100 ps'

All prefixes defined by the International Bureau of Weights and Measures
are supported, that is yocto (1e-24) until yotta (1e+24).

## Usage
```
loglabels(ax,unit,[whichaxis='x'])
```
* `ax`:        Handle of an axis
* `unit`:      String representation of the unit (e.g. 's' for seconds)
* `whichaxis`: String representation of the axis to be changed ('x', 'y'
             or 'z'). This parameter is optional. If omitted, 'x' is
             used.
## Example
```
loglabels(gca,'s','x');
```

Result: The x-axis label of the current axis is changed from '1e-9' to '1 ns'
