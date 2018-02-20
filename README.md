# loglabels
Convert the labels of a (logarithmic) axis to unit prefix notation: '1e-10' --> '100 ps'

All prefixes defined by the International Bureau of Weights and Measures
are supported, except for deca, hecto, centi and deci.

<table>
  <tr>
    <td>Factor</td>
    <td>Name</td>
    <td>Symbol</td>
    <td>Factor</td>
    <td>Name</td>
    <td>Symbol</td>
  </tr>
  <tr>
    <td>10<sup>3</sup></td>
    <td>kilo</td>
    <td>k</td>
    <td>10<sup>-3</sup></td>
    <td>milli</td>
    <td>m</td>
  </tr> 
  <tr>
    <td>10<sup>6</sup></td>
    <td>mega</td>
    <td>M</td>
    <td>10<sup>-6</sup></td>
    <td>micro</td>
    <td>&micro;</td>
  </tr> 
  <tr>
    <td>10<sup>9</sup></td>
    <td>giga</td>
    <td>G</td>
    <td>10<sup>-9</sup></td>
    <td>nano</td>
    <td>n</td>
  </tr> 
  <tr>
    <td>10<sup>12</sup></td>
    <td>tera</td>
    <td>T</td>
    <td>10<sup>-12</sup></td>
    <td>pico</td>
    <td>p</td>
  </tr> 
  <tr>
    <td>10<sup>15</sup></td>
    <td>peta</td>
    <td>P</td>
    <td>10<sup>-15</sup></td>
    <td>femto</td>
    <td>f</td>
  </tr>
  <tr>
    <td>10<sup>18</sup></td>
    <td>exa</td>
    <td>E</td>
    <td>10<sup>-18</sup></td>
    <td>atto</td>
    <td>a</td>
  </tr>
  <tr>
    <td>10<sup>21</sup></td>
    <td>zetta</td>
    <td>Z</td>
    <td>10<sup>-21</sup></td>
    <td>zepto</td>
    <td>z</td>
  </tr>
  <tr>
    <td>10<sup>24</sup></td>
    <td>yotta</td>
    <td>Y</td>
    <td>10<sup>-24</sup></td>
    <td>yocto</td>
    <td>y</td>
  </tr>
</table>

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
