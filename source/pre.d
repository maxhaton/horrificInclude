///Hacky preprocess
module pre;
///Preprocess some lines
string[] preProcess(string input)
{
    import std.string;

    /*
        Even if there are no # directives present we have to 
        join \ lines.
    */
    auto lines = input.splitLines;
    lines = lines.joinBackLines;
    return lines;
}
///Join lines containng \ together
string[] joinBackLines(string[] lines)
{
    foreach_reverse (i, ref line; lines)
    {
        //Not a continued line present.
        //if(line.length == 0) break;
        if (line.length)
        {

            if (line[$ - 1] == '\\')
            {
                line = line[0 .. $ - 1];
                line ~= lines[i + 1];
                lines[i + 1] = "";
            }
        }
    }
    return lines;
}
///Get the contents of a file
template importer(string filePath)
    if(__traits(compiles, import(filePath)))
{
    string importer = import(filePath);
}
///Handle preprocessor directives.
string[] directive(string[] input)
{
    string[] defined;
    return input;
}
