with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics; use Ada.Numerics;

with Ada.Numerics.Generic_Elementary_Functions;


with bisection; use bisection;

procedure CalcBisection is
  package Real_IO is new Ada.Text_IO.Float_IO(Long_Float);

  package Long_Float_IO is new Ada.Text_IO.Float_IO(Long_Float);

  procedure Put(X : Long_Float) is
  begin
    Long_Float_IO.Put(X, Fore => 1, Aft => 13, Exp => 0);
  end Put;

  A : constant Long_Float := 2.0;
  B : constant Long_Float := 4.0;
  ExpectedResult : constant Long_Float := Pi;
  Eps : Long_Float;
  Result : Long_Float;
  Error : Long_Float;
begin
  Put_Line ("Expected result: " & ExpectedResult'Image);
  for K in 1 .. 8 loop
    Eps := 10.0 ** (-K);
    Result := FindZero(Test_Fun_Cos'Access, A, B, Eps);
    Error := abs(Result - ExpectedResult);
    
    Put("Eps: 10^(-" & K'Image & ") = ");
    Put(Eps);
    New_Line;
    Put("Res: ");
    Put(Result);
    New_Line;
    Put("Err: ");
    Put(Error);
    New_Line;

    --  Put_Line ("Res: " & Result'Image);
    --  Put_Line ("Err: " & Error'Image);
  end loop;
end CalcBisection;
