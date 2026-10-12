with Ada.Containers.Vectors;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Prime_Factors is 
  function CountPrimeFactors(Num_In : Positive) return Vector is
    Factors : Vector;
    Num : Integer := Num_In;
    Num_Sqrt : constant Integer := Integer(Float'Floor(Sqrt(Float(Num_In))));
    Exp : Integer := 0; -- Expoment
    Curr : Integer := 3;
  begin

    while Num mod 2 = 0 loop
      Factors.Append(2);
      Num := Num / 2;
    end loop;

    while Curr <= Num_Sqrt loop
      Exp := 0;
      while Num mod Curr = 0 loop
        Num := Num / Curr;
        Factors.Append(Curr);
      end loop;
      Curr := Curr + 2;
    end loop;

    if Num > 1 then
      Factors.Append(Num);
    end if;

    return Factors;
  end CountPrimeFactors;
end Prime_Factors;
