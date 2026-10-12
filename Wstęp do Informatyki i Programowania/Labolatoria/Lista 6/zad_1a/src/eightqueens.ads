with permutations;
with Ada.Containers.Hashed_Sets;

package eightqueens is
  function IsPermCorrectSolution(Perm : permutations.Positive_Vectors.Vector) return Boolean;
private
  function Hash_Integer(Key : Integer) return Ada.Containers.Hash_Type;
  package Integer_Sets is new Ada.Containers.Hashed_Sets
     (Element_Type        => Integer,
      Hash                => Hash_Integer, 
      Equivalent_Elements => "=");
end eightqueens;