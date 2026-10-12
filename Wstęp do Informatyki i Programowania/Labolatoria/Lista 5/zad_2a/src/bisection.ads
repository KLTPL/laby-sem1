with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package bisection is
  type FuncType is access function (X : Long_Float) return Long_Float;

  function FindZero(f : FuncType; a, b, eps: Long_Float) return Long_Float;
  function Test_Fun_Cos (X : Long_Float) return Long_Float;
end bisection;