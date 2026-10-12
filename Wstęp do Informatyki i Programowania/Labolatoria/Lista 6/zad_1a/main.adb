with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with permutations;
with eightqueens;

procedure main is
  Perms : permutations.Positive_Matrix.Vector;
  N : Positive;
  Count : Natural := 0;
begin
  if Argument_Count /= 1 then
    Put_Line("Program przyjmuje jeden argument N - liczba całkowita, dodatnia oznaczająca wymiary szachownicy N x N");
    Set_Exit_Status(1);
    return;
  end if;
  declare
    Temp : Integer;
  begin
    Temp := Integer'Value(Argument(1));
    if Temp <= 0 then
      Put_Line("Plansza musi mieć dodatnie wymiary");
      Set_Exit_Status(1);
      return;
    end if;
    N := Natural(Temp);
  end;
  Perms := permutations.CreatePermutations (N);


  --  permutations.PrintMatrix(Perms);
  --  New_Line(2);
  for Perm of Perms loop
    if eightqueens.IsPermCorrectSolution (Perm) then
      for I of Perm loop
        Put (Item => I, Width => 3);
      end loop;
      Count := Count + 1;
      New_Line;
    end if;
  end loop;
  Put_Line("Liczba rozwiązań: " & Count'Image);


end main;
