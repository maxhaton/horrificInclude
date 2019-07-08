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
    lines = lines.cullComments;
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

string[] cullComments(string[] input)
{
    import std.array : split;
    bool inBlockComment = false;
    foreach(ref line; input) {
        if(line.length == 0) continue;
        line = line.split("//")[0];
    }
    return input;
}
///Handle preprocessor directives, spits out lines of processed C
string[] directive(string[] input)
{
    string[string] defaultDefines()
    {
        string[string] output;

        return output;
    }

    import std.conv;

    //Doesn't do big boy macros
    string[string] defined = defaultDefines;

    for (ulong lineNum = 0; lineNum < input.length;) {//Define __LINE__ macro
        defined["__LINE__"] = lineNum.to!string;
        //immutable line
    }
    return input;
}
///Replace string input 
string lookAndReplace(const string input, const string[string] defines) pure
{
    import std.array : replace;
    string output;
    foreach (key, value; defines)
    {
        output = input.replace(key, value);
    }
    return output;
}
