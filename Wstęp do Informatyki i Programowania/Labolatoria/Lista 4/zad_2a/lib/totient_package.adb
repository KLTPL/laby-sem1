with Prime_Factors; use Prime_Factors; use Prime_Factors.Integer_Vectors;

package body Totient_Package is

  function Totient(n : Positive) return Positive is
    Factors : Vector := CountPrimeFactors(n);
    Result  : Integer := n;
    Current_P : Integer;
    Last_P    : Integer := -1; 
  begin
    for E of Factors loop
        Current_P := E;
        
        if Current_P /= Last_P then
          Result := Result - (Result / Current_P);
          
          Last_P := Current_P;
        end if;
    end loop;
        
    return Result;
  end Totient;
end Totient_Package;
