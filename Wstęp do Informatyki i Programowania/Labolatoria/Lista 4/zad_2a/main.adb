with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Totient_Package;

procedure Main is
  N : Positive;
  N_Input : Integer;
begin
  if Argument_Count < 1 then
    Put(Standard_Error, "Błędna ilośc argumentów" & ASCII.LF);
    Put(Standard_Error, "Sposób użycia: " & Command_Name & " n1, n2, n3, ..." & ASCII.LF);
    Put(Standard_Error, "Przykład: " & Command_Name & " 1 11 100 5000 12345678" & ASCII.LF);
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  for I in 1 .. Argument_Count loop
    N_Input := Integer'Value(Argument(I));
    if N_Input <= 0 then
      Put(Standard_Error, "Liczba " & Argument(I) & " nie spełnia warunku n > 0" & ASCII.LF);
    else
      N := Positive(N_Input);
      Put("totient(");
      Put(N, Width => 0);
      Put(") = ");
      Put(Totient_Package.Totient(N), Width => 0);
      New_Line;
    end if;
  end loop;



end Main;