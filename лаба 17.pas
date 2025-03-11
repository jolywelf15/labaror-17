program ReverseNumbersInFile;


var
  InputFile, OutputFile: Text;
  Numbers: array of Integer; // Динамический массив для хранения чисел
  i, Count: Integer;
  Number: Integer;

begin
  // Открываем исходный файл для чтения
  Assign(InputFile, 'input.txt');
  Reset(InputFile);

  // Инициализация счетчика чисел
  Count := 0;

  // Считываем числа из файла и сохраняем их в массив
  while not Eof(InputFile) do
  begin
    ReadLn(InputFile, Number);
    SetLength(Numbers, Count + 1); // Увеличиваем размер массива
    Numbers[Count] := Number;
    Count := Count + 1;
  end;

  // Закрываем исходный файл
  Close(InputFile);

  // Открываем целевой файл для записи
  Assign(OutputFile, 'output.txt');
  Rewrite(OutputFile);

  // Записываем числа в обратном порядке
  for i := Count - 1 downto 0 do
  begin
    WriteLn(OutputFile, Numbers[i]);
  end;

  // Закрываем целевой файл
  Close(OutputFile);

  WriteLn('Числа успешно записаны в обратном порядке в файл output.txt');
end.