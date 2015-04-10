double precision function  mycos(x)
double precision x
mycos = cos(x)
end

subroutine cos_sub(cos_x, x)
double precision cos_x, x
!f2py intent(out) cos_x
cos_x = cos(x)
end

subroutine vectorized_cos_sub(cos_x, x, n)
double precision cos_x(n), x(n)
!f2py intent(out) cos_x
!f2py intent(in) x
integer i
do i=1, n
    cos_x(i) = cos(x(i))
end do
end
