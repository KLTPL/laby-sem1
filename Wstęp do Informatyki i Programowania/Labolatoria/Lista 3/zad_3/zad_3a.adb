with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;
with Ada.Command_Line;

procedure zad_3a is

  type Prime_Array is array (Natural range <>) of Natural;
  type Prime_Ptr is access Prime_Array;

  procedure Free is new Ada.Unchecked_Deallocation(Prime_Array, Prime_Ptr);

  function Find_Nth_Prime(N : Natural) return Natural is
    Primes    : Prime_Ptr;
    Count     : Natural := 1;
    Candidate : Natural := 3;
    Is_Prime  : Boolean;
    Result    : Natural;
    P         : Natural;
  begin
    if N = 1 then
      return 2;
    end if;

    Primes := new Prime_Array(0 .. N - 1);
    
    Primes(0) := 2;

    while Count < N loop
      Is_Prime := True;

      for I in 0 .. Count - 1 loop
        P := Primes(I);
        Is_Prime := Candidate mod P /= 0;

        if Long_Long_Integer(P) * Long_Long_Integer(P) > Long_Long_Integer(Candidate) or not Is_Prime then
          exit;
        end if;

      end loop;

      if Is_Prime then
        Primes(Count) := Candidate;
        Count := Count + 1;
      end if;

      Candidate := Candidate + 2;
    end loop;

    Result := Primes(N - 1);

    Free(Primes);

    return Result;
  end Find_Nth_Prime;


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

  N      : Natural;
  Result : Natural;

begin
  Put_Line("Program znajdujacy n-tą liczbę pierwszą");

  if not Read_Unsigned_Custom(N) then
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  if N = 0 then
    Put(Standard_Error, "Błąd: n musi być liczbą naturalną > 0" & ASCII.LF);
    Ada.Command_Line.Set_Exit_Status(1);
    return;
  end if;

  Result := Find_Nth_Prime(N);

  Put("Wynik: ");
  Put(Result, Width => 0);
  New_Line;

  Ada.Command_Line.Set_Exit_Status(0);

end zad_3a;