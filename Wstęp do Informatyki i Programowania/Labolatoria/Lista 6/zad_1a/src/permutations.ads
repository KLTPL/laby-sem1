with Ada.Containers.Vectors;

package permutations is
  package Positive_Vectors is new Ada.Containers.Vectors
      (Index_Type   => Positive,
        Element_Type => Positive);
  package Positive_Matrix is new Ada.Containers.Vectors
      (Index_Type   => Positive,
        Element_Type => Positive_Vectors.Vector, 
        "=" => Positive_Vectors."=");

  function CreatePermutations(N : Integer) return Positive_Matrix.Vector;
  procedure PrintMatrix (M : Positive_Matrix.Vector);
end permutations;
