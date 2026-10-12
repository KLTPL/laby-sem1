package Prime_Numbers is
  function PrimeNumbers(n : Positive) return Positive;
  function Prime(n : Positive) return Positive;
  function IsPrime(n : Positive) return Boolean;

  function PrimeNumbers_CheckArgs(n : Integer) return Boolean;
  function Prime_CheckArgs(n : Integer) return Boolean;
  function IsPrime_CheckArgs(n : Integer) return Boolean;
end Prime_Numbers;