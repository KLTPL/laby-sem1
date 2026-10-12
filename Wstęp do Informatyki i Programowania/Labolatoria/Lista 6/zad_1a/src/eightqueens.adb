with Ada.Text_IO; use Ada.Text_IO;

package body eightqueens is
  function Hash_Integer(Key : Integer) return Ada.Containers.Hash_Type is
   begin
      return Ada.Containers.Hash_Type'Mod(Key);
   end Hash_Integer;

  function IsPermCorrectSolution(Perm : permutations.Positive_Vectors.Vector) return Boolean is
    C : Positive;
    DiagDiffs : Integer_Sets.Set;
    DiagSums : Integer_Sets.Set;
  begin
    for C in 1 .. Integer(Perm.Length) loop
      declare
        R : Positive := Perm.Element (C);
        Diff : constant Integer := Integer(R) - Integer(C);
        Sum : constant Integer := Integer(R) + Integer(C);
      begin
        if DiagDiffs.Contains(Diff) or DiagSums.Contains (Sum) then
          return False;
        end if;

        DiagSums.Include (Sum);
        DiagDiffs.Include (Diff);
      end;
    end loop;
    return True;
  end IsPermCorrectSolution;
    
end eightqueens;
