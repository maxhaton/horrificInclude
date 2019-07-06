module horrific;

///Start here
struct Horrific(string importPath, string libName = "")
{
    import pre, parse, becometh, recursivenightmare;

    static if (libName != "")
    {
        pragma(lib, libName);
    }
    public
    {
        enum string bigFile = recurseAndJoin!(import(importPath));
        enum preProcessed = preProcess(bigFile);
        
        //enum tags = parseLines(preProcessed);
        //enum mixinThis = structMixin(tags);
    }
    //mixin(mixinThis);
}
