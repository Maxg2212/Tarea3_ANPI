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
## @deftypefn {} {@var{retval} =} pesos (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: maxga <maxga@LAPTOP-85GS8ERK>
## Created: 2023-11-25

function w = pesos (xv,p)
  syms x
  n=length(xv);
  pd=diff(p);
  pd_n=matlabFunction(pd);
  w=2./((1-xv.^2).*(pd_n(xv)).^2);

endfunction