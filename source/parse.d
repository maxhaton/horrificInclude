module parse;
///A definition from the C header
class Program {
    Type[] typeList;
    Declaration[] decList;
}
class Type {
    string dstringof;    
}
class SimpleType : Type {

}
class Pointer : SimpleType {

}

enum DeclType {
    isFunction,
    isStruct,
    isEnum,
    isGlobal,
    isUnion,    
}
struct Declaration {
    DeclType thisIs;
}
///Output symbols from source file
Program parseLines(string[] lines) {
    return new Program;
};