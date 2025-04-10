type
    PNode = ^TNode;
    TNode = record
        value: integer;
        next: PNode;
        prev: PNode;
    end;

    TDeque = record
        front: PNode;
        rear: PNode;
    end;

var
    deque: TDeque;
    inputFile, outputFile: TextFile;
    number: integer;

procedure InitDeque(var d: TDeque);
begin
    d.front := nil;
    d.rear := nil;
end;

procedure PushFront(var d: TDeque; value: integer);
var
    newNode: PNode;
begin
    New(newNode);
    newNode^.value := value;
    newNode^.next := d.front;
    newNode^.prev := nil;

    if d.front <> nil then
        d.front^.prev := newNode
    else
        d.rear := newNode; // Если дек был пуст, новый элемент становится и задом

    d.front := newNode;
end;

procedure PopFront(var d: TDeque; var value: integer);
var
    temp: PNode;
begin
    if d.front <> nil then
    begin
        value := d.front^.value;
        temp := d.front;
        d.front := d.front^.next;

        if d.front <> nil then
            d.front^.prev := nil
        else
            d.rear := nil; // Если дек стал пустым

        Dispose(temp);
    end;
end;

procedure WriteDequeToFile(var d: TDeque; var f: TextFile);
begin
    while d.front <> nil do
    begin
        PopFront(d, number);
        WriteLn(f, number);
    end;
end;

begin
    // Инициализация дека
    InitDeque(deque);

    // Открытие входного файла для чтения
    AssignFile(inputFile, 'input.txt');
    Reset(inputFile);

    // Чтение чисел из файла и добавление их в дек
    while not Eof(inputFile) do
    begin
        ReadLn(inputFile, number);
        PushFront(deque, number);
    end;

    CloseFile(inputFile);

    // Открытие выходного файла для записи
    AssignFile(outputFile, 'output.txt');
    Rewrite(outputFile);

    // Запись чисел из дека в выходной файл
    WriteDequeToFile(deque, outputFile);

    CloseFile(outputFile);
end.