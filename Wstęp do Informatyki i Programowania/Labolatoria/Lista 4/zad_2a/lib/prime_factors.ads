with Ada.Containers.Vectors;

package Prime_Factors is
  package Integer_Vectors is new Ada.Containers.Vectors (Index_Type => Natural, Element_Type => Integer);
  use Integer_Vectors;
  function CountPrimeFactors(Num_In : Positive) return Vector;
end Prime_Factors;
