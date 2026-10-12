with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;
with Ada.Command_Line;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Prime_Numbers is
  type Prime_Array is array (Natural range <>) of Natural;
  type Prime_Ptr is access Prime_Array;

  type Sieve_Array is array (Natural range <>) of Boolean;
  type Sieve_Ptr is access Sieve_Array;

  procedure Free is new Ada.Unchecked_Deallocation(Prime_Array, Prime_Ptr);
  procedure Free is new Ada.Unchecked_Deallocation(Sieve_Array, Sieve_Ptr);

  procedure ComputeSieve (S : in out Sieve_Ptr; N : Natural) is
      J : Natural;
      I : Natural;
   begin
      for K in S'Range loop
         S(K) := True;
      end loop;

      I := 2;
      while I * I <= N loop
         if S(I) then
            J := I * I;
            while J <= N loop
               S(J) := False;
               J := J + I;
            end loop;
         end if;
         I := I + 1;
      end loop;
   end ComputeSieve;

   function CountPrimes (S : Sieve_Ptr) return Natural is
      C : Natural := 0;
   begin
      for I in S'Range loop
         if S(I) then
            C := C + 1;
         end if;
      end loop;
      return C;
   end CountPrimes;

   N_Input : Integer;
   Is_Read : Boolean;
   N       : Natural;
   S       : Sieve_Ptr := null;
   Result  : Positive;

  function PrimeNumbers (n : Positive) return Positive is
  begin

  begin
    S := new Sieve_Array(2 .. N); 
  exception
    when Storage_Error =>
        Put(Standard_Error, "Błąd: Za mało pamięci n = ");
        Put(Standard_Error, N, Width => 0);
        New_Line(Standard_Error);
        Ada.Command_Line.Set_Exit_Status(2);
        return 1;
  end;
  ComputeSieve(S, N);
  Result := CountPrimes(S);
  return Result;
  end PrimeNumbers;

  function Prime(N : Positive) return Positive is
    Primes    : Prime_Ptr;
    Count     : Natural := 1;
    Candidate : Natural := 3;
    Is_Prime  : Boolean;
    Result    : Positive;
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
  end Prime;
  function IsPrime(n : Positive) return Boolean is
  begin
    if n = 2 then
      return True;
    end if;
    if n <= 1 or n mod 2 = 0 then
      return False;
    end if;

    declare 
      Curr : Integer := 3;
      Sqrt_Num: constant Integer := Integer(Float'Floor(Sqrt(Float(n))));
    begin
      while Curr <= Sqrt_Num loop
        if n mod Curr = 0 then
          return False;
        end if;
        Curr := Curr + 2;
      end loop;
    end;
      
    return True;
  end IsPrime;


  function PrimeNumbers_CheckArgs(n : Integer) return Boolean is
  Res : Boolean;
  begin
    Res := n >= 2;
    if (not res) then
      Put_Line("Błąd: n nie spełnia warunku n >= 2");
    end if;
    return res;
  end PrimeNumbers_CheckArgs;

  function Prime_CheckArgs(n : Integer) return Boolean is
    Res : Boolean;
  begin
    Res := n >= 1;
    if (not res) then
      Put_Line("Błąd: n nie spełnia warunku n >= 1");
    end if;
    return res;
  end Prime_CheckArgs;

  function IsPrime_CheckArgs(n : Integer) return Boolean is
    Res : Boolean;
  begin
    Res := n >= 1;
    if (not res) then
      Put_Line("Błąd: n nie spełnia warunku n >= 1");
    end if;
    return res;
  end IsPrime_CheckArgs;

end Prime_Numbers;