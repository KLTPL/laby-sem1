with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Prime_Numbers;

procedure Main is
  N : Natural;
  N_Input : Integer;
begin
  if Argument_Count < 2 then
    Put(Standard_Error, "Błędna ilośc argumentów" & ASCII.LF);
    Put(Standard_Error, "Sposób użycia: " & Command_Name &" <funkcja> <n>" & ASCII.LF);
    Put(Standard_Error, "Przykład: " & Command_Name &" pn 100" & ASCII.LF);
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  N_Input := Integer'Value(Argument(2)); -- exeption error if wrong format

  
  if Argument(1) = "pn" then
    Put_Line("Program obliczajacy ilosc liczb pierwszych w zakresie [2, n]");
    if not Prime_Numbers.PrimeNumbers_CheckArgs(N_Input) then
      Ada.Command_Line.Set_Exit_Status(1);
      return;
    end if;
    N := Positive(N_Input);
    Put("Wynik: ");
    Put_Line(Natural'Image(Prime_Numbers.PrimeNumbers(N)));
  elsif Argument(1) = "pr" then
    Put_Line("Program obliczający n-tą liczbę pierwszą");
    if not Prime_Numbers.Prime_CheckArgs(N_Input) then
      Ada.Command_Line.Set_Exit_Status(1);
      return;
    end if;
    N := Positive(N_Input);
    Put("Wynik: ");
    Put_Line(Natural'Image(Prime_Numbers.Prime(N)));

  elsif Argument(1) = "ip" then
    Put_Line("Program sprawdzający czy liczba n jest pierwsza");
    if not Prime_Numbers.IsPrime_CheckArgs(N_Input) then
      Ada.Command_Line.Set_Exit_Status(1);
      return;
    end if;
    N := Positive(N_Input);
    Put("Wynik: ");
    Put_Line(if Prime_Numbers.IsPrime(N) then "Jest Pierwsza" else "NIE jest pierwsza");
  else 
    Put(Standard_Error, "Błędna operacja: " & Argument(1) & ASCII.LF);
  end if;
end Main;
