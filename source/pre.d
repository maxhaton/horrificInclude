///Hacky preprocess
module pre;
///Preprocess some lines
string[] preProcess(string input) {
    import std.string;
    //Do nothing if no preprocessor tokens found
    if(input.indexOf('#') < 0)
        return input.splitLines;
    return input.splitLines;
}