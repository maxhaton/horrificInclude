module recursivenightmare;

template recurseAndJoin(string input)
{
    import std.string;
    //Any includes left
    enum place = input.indexOf("#include");
    static if (place > 0)
    {
        enum posL = input[place..$].indexOf('<') + place + 1;
        enum posR = input[posL..$].indexOf('>') + posL;
        enum fileName = input[posL..posR];
        pragma(msg, fileName);
        enum replaced = input.replace(input[place..posR + 1], import(fileName));
        
        enum recurseAndJoin = recurseAndJoin!replaced;
    }
    else {
        enum recurseAndJoin = input;
    }
}
