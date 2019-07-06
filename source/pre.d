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
string[string] defaultDefines() {

}
///Handle preprocessor directives, spits out lines of processed C
string[] directive(string[] input)
{
    //Doesn't do big boy macros
    string[string] defined;

    return input;
}
