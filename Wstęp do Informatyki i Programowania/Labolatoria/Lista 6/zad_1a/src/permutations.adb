with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body permutations is

  function CreatePermutations(N : Integer) return Positive_Matrix.Vector is
    Curr : Positive_Vectors.Vector;
    Stack : Positive_Vectors.Vector;
    Res : Positive_Matrix.Vector;
  begin
    for I in 1 .. N loop
      Stack.Append (1);
    end loop;
    for I in 1 .. N loop
      Curr.Append (I);
    end loop;
    Res.Append (Curr);

    declare
      I : Positive := 1;
    begin
      while I <= N loop
        if Stack (I) < I then
          if I mod 2 = 1 then
            Positive_Vectors.Swap (Container => Curr, I => 1, J => I);
          else
            Positive_Vectors.Swap (Container => Curr, I => Stack (I), J => I);
          end if;

          Res.Append (Curr);

          Stack (I) := Stack (I) + 1;

          I := 1;
        else
          Stack (I) := 1;
          I := I + 1;
        end if;
      end loop;
    end;
              
    return Res;
  end;

  procedure PrintMatrix (M : Positive_Matrix.Vector) is
  begin
    for Row of M loop
      for El of Row loop
        Put (Item => El, Width => 3);
      end loop;
      New_Line;
    end loop;
  end;
end permutations;
