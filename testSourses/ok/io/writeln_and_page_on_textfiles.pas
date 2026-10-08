{ ISO 7185, 6.9.4 The procedure writeln and 6.9.5 The procedure page.
  writeln writes its parameters and then an end-of-line; it may be written
  with no parameters, with a textfile alone, or with a textfile followed by
  write-parameters.  page causes the following text to appear at the top of
  a new page and likewise may name a textfile or default to output. }
program WritelnAndPageOnTextfiles(output, listing);
var
   listing : text;
   i : integer;
begin
   i := 1;
   writeln;
   writeln(output);
   writeln(i);
   writeln(output, i);
   writeln(i, i + 1, i + 2);
   writeln(output, i : 4, i / 3 : 9 : 3);
   writeln('a line of literal text');
   writeln(output, 'another line');
   page;
   page(output);
   rewrite(listing);
   writeln(listing);
   writeln(listing, 'first line of the listing');
   writeln(listing, i : 6, ' items');
   page(listing);
   writeln(listing, 'first line of the second page')
end.
