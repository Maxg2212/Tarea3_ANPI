## Copyright (C) 2023 maxga
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} trapecio_compuesto (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: maxga <maxga@LAPTOP-85GS8ERK>
## Created: 2023-11-24

function I = trapecio_compuesto (f, a, b, N)
  h = (b-a)/(m-1);
  xSoporte = a:h:b;
  I = 0;
  for i = 1 : N
    I = I + trapecio(f,xSoporte(i),xSoporte(i+1));
  endfor

endfunction


function I = trapecio(f,a,b)
  fnum = str2func(['@(x)' f]);
  I = (b-a) * (fnum(b) + fnum(a))/2;

endfunction
