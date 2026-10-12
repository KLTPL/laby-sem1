with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure gcd is
  a, b, c : Integer;
begin
  Put("Podaj pierwszą liczbę: ");
  Get(a);
  Put("Podaj drugą liczbę: ");
  Get(b);

  while b /= 0 loop
    if a < b then
      c := a;
      a := b;
      b := c;
    else
      a := a mod b;
    end if;
  end loop;
  Put("NWD = " & a'Image);
end gcd;