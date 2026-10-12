with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Long_Long_Integer_Text_IO; use Ada.Long_Long_Integer_Text_IO;
with Ada.Unchecked_Deallocation;
with Ada.Command_Line;

procedure zad_2a is

  type Row_Array is array (Natural range <>) of Long_Long_Integer;
  type Row_Ptr is access Row_Array;

  procedure Free is new Ada.Unchecked_Deallocation(Row_Array, Row_Ptr);

  function Binomial_Coefficient(N_In : Natural; K_In : Natural) return Long_Long_Integer is
    N : Natural := N_In;
    K : Natural := K_In;
    C : Row_Ptr;
    Limit : Natural;
    Result : Long_Long_Integer;
  begin
    if K > N / 2 then
      K := N - K;
    end if;

    C := new Row_Array(0 .. K);
    C.all := (others => 0);

    C(0) := 1;

    for I in 1 .. N loop
      if I < K then
        Limit := I;
      else
        Limit := K;
      end if;

      for J in reverse 1 .. Limit loop
        C(J) := C(J) + C(J - 1);
      end loop;
    end loop;

    Result := C(K);

    Free(C);

    return Result;
  end Binomial_Coefficient;

  type String_Access is access constant String;

  function Read_Int_Custom(
    Num : out Integer; 
    Text : String := "Podaj liczbe: "; 
    Error_Message : String := "Nie udalo sie wczytac liczby" & ASCII.LF
  ) return Boolean is
  begin
    Put(Text);

    begin
      Get(Num);
      Skip_Line;
      return True;
    exception
      when Data_Error =>
        Skip_Line; 
        Put(Standard_Error, Error_Message);
        return False;
    end;
  end Read_Int_Custom;

  function Read_Unsigned_Custom(
    Num : out Natural; 
    Text : String := "Podaj liczbe: "; 
    Error_Message : String := "Nie udalo sie wczytac liczby" & ASCII.LF
  ) return Boolean is
    Input_Int : Integer;
  begin
    if not Read_Int_Custom(Input_Int, Text, Error_Message) then
      return False;
    end if;

    if Input_Int < 0 then
      Put(Standard_Error, "Błąd: liczba musi byc naturalna (czyli >=0)" & ASCII.LF);
      return False;
    end if;

    Num := Natural(Input_Int);
    return True;
  end Read_Unsigned_Custom;

  N, K : Natural;
  Result : Long_Long_Integer;
  
begin
  Put_Line("Program obliczajacy dwumian newtona dla n, k");

  if not Read_Unsigned_Custom(N, "Podaj n: ") then
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  if not Read_Unsigned_Custom(K, "Podaj k: ") then
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  if K > N then
    Put(Standard_Error, "Blad: k > n" & ASCII.LF);
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  Result := Binomial_Coefficient(N, K);

  Put("Wynik: ");
  Put(Result, Width => 0);
  New_Line;

  Ada.Command_Line.Set_Exit_Status(0);

end zad_2a;