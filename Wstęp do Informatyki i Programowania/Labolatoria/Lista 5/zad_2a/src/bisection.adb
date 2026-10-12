with Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;

package body bisection is
  package Math is new Ada.Numerics.Generic_Elementary_Functions(Long_Float);

  function FindZero(f : FuncType; a, b, eps: Long_Float) return Long_Float is
    X : Long_Float := a;
    Y : Long_Float := b;
    Middle : Long_Float;
  begin
    while Y - X > eps * 2.0 loop
      Middle := (X + Y) / 2.0;

      if f(Middle) = 0.0 then
        return Middle;
      end if;

      if f(X) * f(Middle) < 0.0 then
        Y := Middle;
      else
        X := Middle;
      end if;
    end loop;

    return (X + Y) / 2.0;
  end FindZero;

  function Test_Fun_Cos (X : Long_Float) return Long_Float is
  begin
    return Math.Cos(X / 2.0);
  end Test_Fun_Cos;
end bisection;