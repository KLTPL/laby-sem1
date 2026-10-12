with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure zad_3A is
   n, p, m, t : Integer;
begin
   Put("Podaj liczbe n: ");
   Get(n);

   Put("Podaj podstawe p: ");
   Get(p);

   if p <= 1 then
      Put_Line("p musi spełniać warunek: p >= 2");
      return;
   end if;

   m := 0;
   t := n;

   while t > 0 loop
      m := p * m + (t mod p);
      t := t / p;
   end loop;

   if n = m then
      Put_Line("Jest palindromem");
   else
      Put_Line("Nie jest palindromem");
   end if;
end zad_3A;