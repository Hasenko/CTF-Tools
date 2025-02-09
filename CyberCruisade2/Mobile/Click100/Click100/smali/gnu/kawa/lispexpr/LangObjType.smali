.class public Lgnu/kawa/lispexpr/LangObjType;
.super Lgnu/bytecode/ObjectType;
.source "LangObjType.java"

# interfaces
.implements Lgnu/expr/TypeValue;


# static fields
.field private static final CLASSTYPE_TYPE_CODE:I = 0x6

.field private static final CLASS_TYPE_CODE:I = 0x4

.field private static final DFLONUM_TYPE_CODE:I = 0xf

.field private static final FILEPATH_TYPE_CODE:I = 0x2

.field private static final INTEGER_TYPE_CODE:I = 0x7

.field private static final LIST_TYPE_CODE:I = 0xb

.field private static final NUMERIC_TYPE_CODE:I = 0xa

.field private static final PATH_TYPE_CODE:I = 0x1

.field private static final RATIONAL_TYPE_CODE:I = 0x8

.field private static final REAL_TYPE_CODE:I = 0x9

.field private static final REGEX_TYPE_CODE:I = 0xe

.field private static final STRING_TYPE_CODE:I = 0xd

.field private static final TYPE_TYPE_CODE:I = 0x5

.field public static final URIType:Lgnu/kawa/lispexpr/LangObjType;

.field private static final URI_TYPE_CODE:I = 0x3

.field static final VARARGS_SUFFIX:Ljava/lang/String; = ""

.field private static final VECTOR_TYPE_CODE:I = 0xc

.field public static final dflonumType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final filepathType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final integerType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final listType:Lgnu/kawa/lispexpr/LangObjType;

.field static makeFilepathProc:Lgnu/expr/PrimProcedure;

.field static makePathProc:Lgnu/expr/PrimProcedure;

.field static makeURIProc:Lgnu/expr/PrimProcedure;

.field public static final numericType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final pathType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final rationalType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final realType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final regexType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final stringType:Lgnu/kawa/lispexpr/LangObjType;

.field static final typeArithmetic:Lgnu/bytecode/ClassType;

.field public static final typeClass:Lgnu/kawa/lispexpr/LangObjType;

.field public static final typeClassType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final typeLangObjType:Lgnu/bytecode/ClassType;

.field public static final typeType:Lgnu/kawa/lispexpr/LangObjType;

.field public static final vectorType:Lgnu/kawa/lispexpr/LangObjType;


# instance fields
.field implementationType:Lgnu/bytecode/ClassType;

.field final typeCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 34
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "path"

    const-string v2, "gnu.text.Path"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->pathType:Lgnu/kawa/lispexpr/LangObjType;

    .line 37
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const/4 v1, 0x2

    const-string v4, "filepath"

    const-string v5, "gnu.text.FilePath"

    invoke-direct {v0, v4, v5, v1}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->filepathType:Lgnu/kawa/lispexpr/LangObjType;

    .line 40
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const/4 v1, 0x3

    const-string v4, "URI"

    const-string v6, "gnu.text.URIPath"

    invoke-direct {v0, v4, v6, v1}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->URIType:Lgnu/kawa/lispexpr/LangObjType;

    .line 44
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "java.lang.Class"

    const/4 v4, 0x4

    const-string v7, "class"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeClass:Lgnu/kawa/lispexpr/LangObjType;

    .line 47
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.bytecode.Type"

    const/4 v4, 0x5

    const-string v7, "type"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeType:Lgnu/kawa/lispexpr/LangObjType;

    .line 50
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.bytecode.ClassType"

    const/4 v4, 0x6

    const-string v7, "class-type"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeClassType:Lgnu/kawa/lispexpr/LangObjType;

    .line 54
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.math.Numeric"

    const/16 v4, 0xa

    const-string v7, "number"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->numericType:Lgnu/kawa/lispexpr/LangObjType;

    .line 58
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.math.RealNum"

    const/16 v4, 0x9

    const-string v7, "real"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->realType:Lgnu/kawa/lispexpr/LangObjType;

    .line 62
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.math.RatNum"

    const/16 v4, 0x8

    const-string v7, "rational"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->rationalType:Lgnu/kawa/lispexpr/LangObjType;

    .line 66
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.math.IntNum"

    const/4 v4, 0x7

    const-string v7, "integer"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->integerType:Lgnu/kawa/lispexpr/LangObjType;

    .line 70
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.math.DFloNum"

    const/16 v4, 0xf

    const-string v7, "DFloNum"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->dflonumType:Lgnu/kawa/lispexpr/LangObjType;

    .line 74
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.lists.FVector"

    const/16 v4, 0xc

    const-string v7, "vector"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->vectorType:Lgnu/kawa/lispexpr/LangObjType;

    .line 78
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "java.util.regex.Pattern"

    const/16 v4, 0xe

    const-string v7, "regex"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->regexType:Lgnu/kawa/lispexpr/LangObjType;

    .line 82
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "java.lang.CharSequence"

    const/16 v4, 0xd

    const-string v7, "string"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->stringType:Lgnu/kawa/lispexpr/LangObjType;

    .line 92
    new-instance v0, Lgnu/kawa/lispexpr/LangObjType;

    const-string v1, "gnu.lists.LList"

    const/16 v4, 0xb

    const-string v7, "list"

    invoke-direct {v0, v7, v1, v4}, Lgnu/kawa/lispexpr/LangObjType;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->listType:Lgnu/kawa/lispexpr/LangObjType;

    .line 96
    const-string v0, "gnu.kawa.functions.Arithmetic"

    invoke-static {v0}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v0

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeArithmetic:Lgnu/bytecode/ClassType;

    .line 196
    new-instance v0, Lgnu/expr/PrimProcedure;

    const-string v1, "valueOf"

    invoke-direct {v0, v2, v1, v3}, Lgnu/expr/PrimProcedure;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->makePathProc:Lgnu/expr/PrimProcedure;

    .line 198
    new-instance v0, Lgnu/expr/PrimProcedure;

    const-string v1, "makeFilePath"

    invoke-direct {v0, v5, v1, v3}, Lgnu/expr/PrimProcedure;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->makeFilepathProc:Lgnu/expr/PrimProcedure;

    .line 200
    new-instance v0, Lgnu/expr/PrimProcedure;

    const-string v1, "makeURI"

    invoke-direct {v0, v6, v1, v3}, Lgnu/expr/PrimProcedure;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->makeURIProc:Lgnu/expr/PrimProcedure;

    .line 597
    const-string v0, "gnu.kawa.lispexpr.LangObjType"

    invoke-static {v0}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v0

    sput-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "implClass"    # Ljava/lang/String;
    .param p3, "typeCode"    # I

    .line 101
    invoke-direct {p0, p1}, Lgnu/bytecode/ObjectType;-><init>(Ljava/lang/String;)V

    .line 102
    invoke-static {p2}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v0

    iput-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    .line 103
    iput p3, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    .line 104
    invoke-virtual {v0}, Lgnu/bytecode/ClassType;->getSignature()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lgnu/kawa/lispexpr/LangObjType;->setSignature(Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public static coerceDFloNum(Ljava/lang/Object;)Lgnu/math/DFloNum;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 239
    invoke-static {p0}, Lgnu/math/DFloNum;->asDFloNumOrNull(Ljava/lang/Object;)Lgnu/math/DFloNum;

    move-result-object v0

    .line 240
    .local v0, "rval":Lgnu/math/DFloNum;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 241
    :cond_0
    new-instance v1, Lgnu/mapping/WrongType;

    const/4 v2, -0x4

    sget-object v3, Lgnu/kawa/lispexpr/LangObjType;->dflonumType:Lgnu/kawa/lispexpr/LangObjType;

    invoke-direct {v1, v2, p0, v3}, Lgnu/mapping/WrongType;-><init>(ILjava/lang/Object;Lgnu/bytecode/Type;)V

    throw v1

    .line 242
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceIntNum(Ljava/lang/Object;)Lgnu/math/IntNum;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 255
    invoke-static {p0}, Lgnu/math/IntNum;->asIntNumOrNull(Ljava/lang/Object;)Lgnu/math/IntNum;

    move-result-object v0

    .line 256
    .local v0, "ival":Lgnu/math/IntNum;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 257
    :cond_0
    new-instance v1, Lgnu/mapping/WrongType;

    const/4 v2, -0x4

    sget-object v3, Lgnu/kawa/lispexpr/LangObjType;->integerType:Lgnu/kawa/lispexpr/LangObjType;

    invoke-direct {v1, v2, p0, v3}, Lgnu/mapping/WrongType;-><init>(ILjava/lang/Object;Lgnu/bytecode/Type;)V

    throw v1

    .line 258
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceNumeric(Ljava/lang/Object;)Lgnu/math/Numeric;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 223
    invoke-static {p0}, Lgnu/math/Numeric;->asNumericOrNull(Ljava/lang/Object;)Lgnu/math/Numeric;

    move-result-object v0

    .line 224
    .local v0, "rval":Lgnu/math/Numeric;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 225
    :cond_0
    new-instance v1, Lgnu/mapping/WrongType;

    const/4 v2, -0x4

    sget-object v3, Lgnu/kawa/lispexpr/LangObjType;->numericType:Lgnu/kawa/lispexpr/LangObjType;

    invoke-direct {v1, v2, p0, v3}, Lgnu/mapping/WrongType;-><init>(ILjava/lang/Object;Lgnu/bytecode/Type;)V

    throw v1

    .line 226
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceRatNum(Ljava/lang/Object;)Lgnu/math/RatNum;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 247
    invoke-static {p0}, Lgnu/math/RatNum;->asRatNumOrNull(Ljava/lang/Object;)Lgnu/math/RatNum;

    move-result-object v0

    .line 248
    .local v0, "rval":Lgnu/math/RatNum;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 249
    :cond_0
    new-instance v1, Lgnu/mapping/WrongType;

    const/4 v2, -0x4

    sget-object v3, Lgnu/kawa/lispexpr/LangObjType;->rationalType:Lgnu/kawa/lispexpr/LangObjType;

    invoke-direct {v1, v2, p0, v3}, Lgnu/mapping/WrongType;-><init>(ILjava/lang/Object;Lgnu/bytecode/Type;)V

    throw v1

    .line 250
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceRealNum(Ljava/lang/Object;)Lgnu/math/RealNum;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 231
    invoke-static {p0}, Lgnu/math/RealNum;->asRealNumOrNull(Ljava/lang/Object;)Lgnu/math/RealNum;

    move-result-object v0

    .line 232
    .local v0, "rval":Lgnu/math/RealNum;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 233
    :cond_0
    new-instance v1, Lgnu/mapping/WrongType;

    const/4 v2, -0x4

    sget-object v3, Lgnu/kawa/lispexpr/LangObjType;->realType:Lgnu/kawa/lispexpr/LangObjType;

    invoke-direct {v1, v2, p0, v3}, Lgnu/mapping/WrongType;-><init>(ILjava/lang/Object;Lgnu/bytecode/Type;)V

    throw v1

    .line 234
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceToClass(Ljava/lang/Object;)Ljava/lang/Class;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;

    .line 277
    invoke-static {p0}, Lgnu/kawa/lispexpr/LangObjType;->coerceToClassOrNull(Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 278
    .local v0, "coerced":Ljava/lang/Class;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 279
    :cond_0
    new-instance v1, Ljava/lang/ClassCastException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot cast "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 280
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceToClassOrNull(Ljava/lang/Object;)Ljava/lang/Class;
    .locals 1
    .param p0, "type"    # Ljava/lang/Object;

    .line 263
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 264
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    return-object v0

    .line 265
    :cond_0
    instance-of v0, p0, Lgnu/bytecode/Type;

    if-eqz v0, :cond_1

    .line 267
    instance-of v0, p0, Lgnu/bytecode/ClassType;

    if-eqz v0, :cond_1

    instance-of v0, p0, Lgnu/expr/PairClassType;

    if-nez v0, :cond_1

    .line 269
    move-object v0, p0

    check-cast v0, Lgnu/bytecode/ClassType;

    invoke-virtual {v0}, Lgnu/bytecode/ClassType;->getReflectClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0

    .line 272
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static coerceToClassType(Ljava/lang/Object;)Lgnu/bytecode/ClassType;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;

    .line 299
    invoke-static {p0}, Lgnu/kawa/lispexpr/LangObjType;->coerceToClassTypeOrNull(Ljava/lang/Object;)Lgnu/bytecode/ClassType;

    move-result-object v0

    .line 300
    .local v0, "coerced":Lgnu/bytecode/ClassType;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 301
    :cond_0
    new-instance v1, Ljava/lang/ClassCastException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot cast "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to class-type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 302
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceToClassTypeOrNull(Ljava/lang/Object;)Lgnu/bytecode/ClassType;
    .locals 3
    .param p0, "type"    # Ljava/lang/Object;

    .line 285
    instance-of v0, p0, Lgnu/bytecode/ClassType;

    if-eqz v0, :cond_0

    .line 286
    move-object v0, p0

    check-cast v0, Lgnu/bytecode/ClassType;

    return-object v0

    .line 287
    :cond_0
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_1

    .line 289
    invoke-static {}, Lgnu/expr/Language;->getDefaultLanguage()Lgnu/expr/Language;

    move-result-object v0

    .line 290
    .local v0, "language":Lgnu/expr/Language;
    move-object v1, p0

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lgnu/expr/Language;->getTypeFor(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object v1

    .line 291
    .local v1, "t":Lgnu/bytecode/Type;
    instance-of v2, v1, Lgnu/bytecode/ClassType;

    if-eqz v2, :cond_1

    .line 292
    move-object v2, v1

    check-cast v2, Lgnu/bytecode/ClassType;

    return-object v2

    .line 294
    .end local v0    # "language":Lgnu/expr/Language;
    .end local v1    # "t":Lgnu/bytecode/Type;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static coerceToType(Ljava/lang/Object;)Lgnu/bytecode/Type;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;

    .line 319
    invoke-static {p0}, Lgnu/kawa/lispexpr/LangObjType;->coerceToTypeOrNull(Ljava/lang/Object;)Lgnu/bytecode/Type;

    move-result-object v0

    .line 320
    .local v0, "coerced":Lgnu/bytecode/Type;
    if-nez v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 321
    :cond_0
    new-instance v1, Ljava/lang/ClassCastException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot cast "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 322
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static coerceToTypeOrNull(Ljava/lang/Object;)Lgnu/bytecode/Type;
    .locals 2
    .param p0, "type"    # Ljava/lang/Object;

    .line 307
    instance-of v0, p0, Lgnu/bytecode/Type;

    if-eqz v0, :cond_0

    .line 308
    move-object v0, p0

    check-cast v0, Lgnu/bytecode/Type;

    return-object v0

    .line 309
    :cond_0
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_1

    .line 311
    invoke-static {}, Lgnu/expr/Language;->getDefaultLanguage()Lgnu/expr/Language;

    move-result-object v0

    .line 312
    .local v0, "language":Lgnu/expr/Language;
    move-object v1, p0

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lgnu/expr/Language;->getTypeFor(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object v1

    return-object v1

    .line 314
    .end local v0    # "language":Lgnu/expr/Language;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public coerceFromObject(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 432
    iget v0, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    packed-switch v0, :pswitch_data_0

    .line 461
    :pswitch_0
    invoke-super {p0, p1}, Lgnu/bytecode/ObjectType;->coerceFromObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 455
    :pswitch_1
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceDFloNum(Ljava/lang/Object;)Lgnu/math/DFloNum;

    move-result-object v0

    return-object v0

    .line 447
    :pswitch_2
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceNumeric(Ljava/lang/Object;)Lgnu/math/Numeric;

    move-result-object v0

    return-object v0

    .line 449
    :pswitch_3
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceRealNum(Ljava/lang/Object;)Lgnu/math/RealNum;

    move-result-object v0

    return-object v0

    .line 451
    :pswitch_4
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceRatNum(Ljava/lang/Object;)Lgnu/math/RatNum;

    move-result-object v0

    return-object v0

    .line 453
    :pswitch_5
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceIntNum(Ljava/lang/Object;)Lgnu/math/IntNum;

    move-result-object v0

    return-object v0

    .line 443
    :pswitch_6
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceToClassType(Ljava/lang/Object;)Lgnu/bytecode/ClassType;

    move-result-object v0

    return-object v0

    .line 445
    :pswitch_7
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceToType(Ljava/lang/Object;)Lgnu/bytecode/Type;

    move-result-object v0

    return-object v0

    .line 441
    :pswitch_8
    invoke-static {p1}, Lgnu/kawa/lispexpr/LangObjType;->coerceToClass(Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    return-object v0

    .line 439
    :pswitch_9
    invoke-static {p1}, Lgnu/text/URIPath;->makeURI(Ljava/lang/Object;)Lgnu/text/URIPath;

    move-result-object v0

    return-object v0

    .line 437
    :pswitch_a
    invoke-static {p1}, Lgnu/text/FilePath;->makeFilePath(Ljava/lang/Object;)Lgnu/text/FilePath;

    move-result-object v0

    return-object v0

    .line 435
    :pswitch_b
    invoke-static {p1}, Lgnu/text/Path;->valueOf(Ljava/lang/Object;)Lgnu/text/Path;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method coercionMethod()Lgnu/bytecode/Method;
    .locals 3

    .line 327
    iget v0, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    .line 351
    invoke-virtual {p0}, Lgnu/kawa/lispexpr/LangObjType;->getConstructor()Lgnu/mapping/Procedure;

    move-result-object v0

    check-cast v0, Lgnu/expr/PrimProcedure;

    invoke-virtual {v0}, Lgnu/expr/PrimProcedure;->getMethod()Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 344
    :pswitch_0
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceDFloNum"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 349
    :pswitch_1
    const/4 v0, 0x0

    return-object v0

    .line 336
    :pswitch_2
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceNumeric"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 338
    :pswitch_3
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceRealNum"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 340
    :pswitch_4
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceRatNum"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 342
    :pswitch_5
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceIntNum"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 332
    :pswitch_6
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceToClassType"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 334
    :pswitch_7
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceToType"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    .line 330
    :pswitch_8
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    const-string v2, "coerceToClass"

    invoke-virtual {v0, v2, v1}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method coercionOrNullMethod()Lgnu/bytecode/Method;
    .locals 3

    .line 357
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    .line 359
    .local v0, "methodDeclaringClass":Lgnu/bytecode/ClassType;
    iget v1, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    const/4 v2, 0x0

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    move-object v1, v2

    .line 403
    .local v1, "mname":Ljava/lang/String;
    const/4 v2, 0x0

    return-object v2

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_1
    move-object v1, v2

    .line 387
    .restart local v1    # "mname":Ljava/lang/String;
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    .line 388
    const-string v1, "asDFloNumOrNull"

    .line 389
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_2
    move-object v1, v2

    .line 383
    .restart local v1    # "mname":Ljava/lang/String;
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    .line 384
    const-string v1, "asNumericOrNull"

    .line 385
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_3
    move-object v1, v2

    .line 391
    .restart local v1    # "mname":Ljava/lang/String;
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    .line 392
    const-string v1, "asRealNumOrNull"

    .line 393
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_4
    move-object v1, v2

    .line 395
    .restart local v1    # "mname":Ljava/lang/String;
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    .line 396
    const-string v1, "asRatNumOrNull"

    .line 397
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_5
    move-object v1, v2

    .line 399
    .restart local v1    # "mname":Ljava/lang/String;
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    .line 400
    const-string v1, "asIntNumOrNull"

    .line 401
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_6
    move-object v1, v2

    .line 375
    .restart local v1    # "mname":Ljava/lang/String;
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    .line 376
    const-string v1, "coerceToClassTypeOrNull"

    .line 377
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_7
    move-object v1, v2

    .line 379
    .restart local v1    # "mname":Ljava/lang/String;
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    .line 380
    const-string v1, "coerceToTypeOrNull"

    .line 381
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_8
    move-object v1, v2

    .line 371
    .restart local v1    # "mname":Ljava/lang/String;
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeLangObjType:Lgnu/bytecode/ClassType;

    .line 372
    const-string v1, "coerceToClassOrNull"

    .line 373
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_9
    move-object v1, v2

    .line 368
    .restart local v1    # "mname":Ljava/lang/String;
    const-string v1, "coerceToURIPathOrNull"

    .line 369
    goto :goto_0

    .line 359
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_a
    move-object v1, v2

    .line 365
    .restart local v1    # "mname":Ljava/lang/String;
    const-string v1, "coerceToFilePathOrNull"

    .line 366
    goto :goto_0

    .line 362
    .end local v1    # "mname":Ljava/lang/String;
    :pswitch_b
    const-string v1, "coerceToPathOrNull"

    .line 363
    .restart local v1    # "mname":Ljava/lang/String;
    nop

    .line 405
    :goto_0
    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v2

    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public compare(Lgnu/bytecode/Type;)I
    .locals 4
    .param p1, "other"    # Lgnu/bytecode/Type;

    .line 111
    iget v0, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_3

    .line 131
    :sswitch_0
    instance-of v0, p1, Lgnu/bytecode/PrimType;

    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {p1}, Lgnu/bytecode/Type;->getSignature()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 134
    .local v0, "sig1":C
    sparse-switch v0, :sswitch_data_1

    goto :goto_0

    .line 137
    :sswitch_1
    return v3

    .line 142
    .end local v0    # "sig1":C
    :cond_0
    :goto_0
    :sswitch_2
    instance-of v0, p1, Lgnu/bytecode/PrimType;

    if-eqz v0, :cond_7

    .line 144
    invoke-virtual {p1}, Lgnu/bytecode/Type;->getSignature()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 145
    .restart local v0    # "sig1":C
    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_3

    .line 148
    :pswitch_1
    return v3

    .line 120
    .end local v0    # "sig1":C
    :sswitch_3
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeClass:Lgnu/kawa/lispexpr/LangObjType;

    if-eq p1, v0, :cond_5

    sget-object v2, Lgnu/kawa/lispexpr/LangObjType;->typeClassType:Lgnu/kawa/lispexpr/LangObjType;

    if-eq p1, v2, :cond_5

    iget-object v0, v0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    if-eq p1, v0, :cond_5

    iget-object v0, v2, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    if-ne p1, v0, :cond_1

    goto :goto_2

    .line 125
    :cond_1
    :sswitch_4
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeClass:Lgnu/kawa/lispexpr/LangObjType;

    if-eq p1, v0, :cond_4

    iget-object v0, v0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    if-ne p1, v0, :cond_2

    goto :goto_1

    .line 127
    :cond_2
    sget-object v2, Lgnu/kawa/lispexpr/LangObjType;->typeType:Lgnu/kawa/lispexpr/LangObjType;

    if-eq p1, v2, :cond_3

    if-ne p1, v0, :cond_7

    .line 128
    :cond_3
    return v1

    .line 126
    :cond_4
    :goto_1
    return v3

    .line 123
    :cond_5
    :goto_2
    return v3

    .line 114
    :sswitch_5
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->typeType:Lgnu/kawa/lispexpr/LangObjType;

    if-eq p1, v0, :cond_6

    sget-object v2, Lgnu/kawa/lispexpr/LangObjType;->typeClassType:Lgnu/kawa/lispexpr/LangObjType;

    if-eq p1, v2, :cond_6

    iget-object v0, v0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    if-eq p1, v0, :cond_6

    iget-object v0, v2, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    if-ne p1, v0, :cond_7

    .line 117
    :cond_6
    return v1

    .line 152
    :cond_7
    :goto_3
    invoke-virtual {p0}, Lgnu/kawa/lispexpr/LangObjType;->getImplementationType()Lgnu/bytecode/Type;

    move-result-object v0

    invoke-virtual {p1}, Lgnu/bytecode/Type;->getImplementationType()Lgnu/bytecode/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgnu/bytecode/Type;->compare(Lgnu/bytecode/Type;)I

    move-result v0

    return v0

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_5
        0x5 -> :sswitch_3
        0x6 -> :sswitch_4
        0x7 -> :sswitch_0
        0x9 -> :sswitch_2
        0xf -> :sswitch_2
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x42 -> :sswitch_1
        0x49 -> :sswitch_1
        0x4a -> :sswitch_1
        0x53 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x44
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public convertValue(Lgnu/expr/Expression;)Lgnu/expr/Expression;
    .locals 4
    .param p1, "value"    # Lgnu/expr/Expression;

    .line 539
    iget v0, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    const/4 v1, 0x7

    const/4 v2, 0x0

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa

    if-eq v0, v1, :cond_2

    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    const/16 v1, 0x8

    if-eq v0, v1, :cond_2

    const/16 v1, 0xf

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 545
    :cond_0
    invoke-virtual {p0}, Lgnu/kawa/lispexpr/LangObjType;->coercionMethod()Lgnu/bytecode/Method;

    move-result-object v0

    .line 546
    .local v0, "method":Lgnu/bytecode/Method;
    if-nez v0, :cond_1

    .line 547
    return-object v2

    .line 548
    :cond_1
    new-instance v1, Lgnu/expr/ApplyExp;

    const/4 v2, 0x1

    new-array v2, v2, [Lgnu/expr/Expression;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-direct {v1, v0, v2}, Lgnu/expr/ApplyExp;-><init>(Lgnu/bytecode/Method;[Lgnu/expr/Expression;)V

    .line 549
    .local v1, "aexp":Lgnu/expr/ApplyExp;
    invoke-virtual {v1, p0}, Lgnu/expr/ApplyExp;->setType(Lgnu/bytecode/Type;)V

    .line 550
    return-object v1

    .line 544
    .end local v0    # "method":Lgnu/bytecode/Method;
    .end local v1    # "aexp":Lgnu/expr/ApplyExp;
    :cond_2
    :goto_0
    return-object v2
.end method

.method public emitCoerceFromObject(Lgnu/bytecode/CodeAttr;)V
    .locals 1
    .param p1, "code"    # Lgnu/bytecode/CodeAttr;

    .line 555
    iget v0, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    packed-switch v0, :pswitch_data_0

    .line 564
    invoke-virtual {p0}, Lgnu/kawa/lispexpr/LangObjType;->coercionMethod()Lgnu/bytecode/Method;

    move-result-object v0

    invoke-virtual {p1, v0}, Lgnu/bytecode/CodeAttr;->emitInvoke(Lgnu/bytecode/Method;)V

    goto :goto_0

    .line 561
    :pswitch_0
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {p1, v0}, Lgnu/bytecode/CodeAttr;->emitCheckcast(Lgnu/bytecode/Type;)V

    .line 562
    nop

    .line 566
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public emitConvertFromPrimitive(Lgnu/bytecode/Type;Lgnu/bytecode/CodeAttr;)V
    .locals 5
    .param p1, "stackType"    # Lgnu/bytecode/Type;
    .param p2, "code"    # Lgnu/bytecode/CodeAttr;

    .line 467
    const/4 v0, 0x0

    .line 468
    .local v0, "argType":Lgnu/bytecode/Type;
    const/4 v1, 0x0

    .line 469
    .local v1, "cname":Ljava/lang/String;
    iget v2, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_1

    .line 472
    :pswitch_1
    instance-of v2, p1, Lgnu/bytecode/PrimType;

    if-eqz v2, :cond_7

    .line 474
    sget-object v2, Lgnu/bytecode/Type;->intType:Lgnu/bytecode/PrimType;

    if-eq p1, v2, :cond_0

    sget-object v2, Lgnu/bytecode/Type;->byteType:Lgnu/bytecode/PrimType;

    if-eq p1, v2, :cond_0

    sget-object v2, Lgnu/bytecode/Type;->shortType:Lgnu/bytecode/PrimType;

    if-eq p1, v2, :cond_0

    sget-object v2, Lgnu/bytecode/Type;->longType:Lgnu/bytecode/PrimType;

    if-eq p1, v2, :cond_0

    sget-object v2, Lgnu/bytecode/Type;->floatType:Lgnu/bytecode/PrimType;

    if-ne p1, v2, :cond_1

    .line 480
    :cond_0
    sget-object v2, Lgnu/bytecode/Type;->doubleType:Lgnu/bytecode/PrimType;

    invoke-virtual {p2, p1, v2}, Lgnu/bytecode/CodeAttr;->emitConvert(Lgnu/bytecode/Type;Lgnu/bytecode/Type;)V

    .line 481
    sget-object p1, Lgnu/bytecode/Type;->doubleType:Lgnu/bytecode/PrimType;

    .line 483
    :cond_1
    sget-object v2, Lgnu/bytecode/Type;->doubleType:Lgnu/bytecode/PrimType;

    if-ne p1, v2, :cond_7

    .line 485
    const-string v1, "gnu.math.DFloNum"

    .line 486
    move-object v0, p1

    goto :goto_1

    .line 494
    :pswitch_2
    instance-of v2, p1, Lgnu/bytecode/PrimType;

    if-eqz v2, :cond_7

    .line 496
    sget-object v2, Lgnu/bytecode/Type;->intType:Lgnu/bytecode/PrimType;

    if-eq p1, v2, :cond_6

    sget-object v2, Lgnu/bytecode/Type;->byteType:Lgnu/bytecode/PrimType;

    if-eq p1, v2, :cond_6

    sget-object v2, Lgnu/bytecode/Type;->shortType:Lgnu/bytecode/PrimType;

    if-ne p1, v2, :cond_2

    goto :goto_0

    .line 503
    :cond_2
    sget-object v2, Lgnu/bytecode/Type;->longType:Lgnu/bytecode/PrimType;

    if-ne p1, v2, :cond_3

    .line 505
    const-string v1, "gnu.math.IntNum"

    .line 506
    sget-object v0, Lgnu/bytecode/Type;->long_type:Lgnu/bytecode/PrimType;

    goto :goto_1

    .line 508
    :cond_3
    iget v2, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    const/16 v3, 0x9

    if-eq v2, v3, :cond_4

    const/16 v3, 0xa

    if-ne v2, v3, :cond_7

    .line 511
    :cond_4
    sget-object v2, Lgnu/bytecode/Type;->floatType:Lgnu/bytecode/PrimType;

    if-ne p1, v2, :cond_5

    .line 513
    sget-object v2, Lgnu/bytecode/Type;->float_type:Lgnu/bytecode/PrimType;

    sget-object v3, Lgnu/bytecode/Type;->double_type:Lgnu/bytecode/PrimType;

    invoke-virtual {p2, v2, v3}, Lgnu/bytecode/CodeAttr;->emitConvert(Lgnu/bytecode/Type;Lgnu/bytecode/Type;)V

    .line 514
    sget-object p1, Lgnu/bytecode/Type;->doubleType:Lgnu/bytecode/PrimType;

    .line 516
    :cond_5
    sget-object v2, Lgnu/bytecode/Type;->doubleType:Lgnu/bytecode/PrimType;

    if-ne p1, v2, :cond_7

    .line 518
    const-string v1, "gnu.math.DFloNum"

    .line 519
    sget-object v0, Lgnu/bytecode/Type;->doubleType:Lgnu/bytecode/PrimType;

    goto :goto_1

    .line 500
    :cond_6
    :goto_0
    const-string v1, "gnu.math.IntNum"

    .line 501
    sget-object v0, Lgnu/bytecode/Type;->int_type:Lgnu/bytecode/PrimType;

    .line 525
    :cond_7
    :goto_1
    if-eqz v1, :cond_8

    .line 527
    invoke-static {v1}, Lgnu/bytecode/ClassType;->make(Ljava/lang/String;)Lgnu/bytecode/ClassType;

    move-result-object v2

    .line 528
    .local v2, "clas":Lgnu/bytecode/ClassType;
    const/4 v3, 0x1

    new-array v3, v3, [Lgnu/bytecode/Type;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    .line 529
    .local v3, "args":[Lgnu/bytecode/Type;
    const-string v4, "make"

    invoke-virtual {v2, v4, v3}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;[Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    move-result-object v4

    invoke-virtual {p2, v4}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    .line 530
    .end local v2    # "clas":Lgnu/bytecode/ClassType;
    .end local v3    # "args":[Lgnu/bytecode/Type;
    goto :goto_2

    .line 532
    :cond_8
    invoke-super {p0, p1, p2}, Lgnu/bytecode/ObjectType;->emitConvertFromPrimitive(Lgnu/bytecode/Type;Lgnu/bytecode/CodeAttr;)V

    .line 533
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public emitIsInstance(Lgnu/bytecode/Variable;Lgnu/expr/Compilation;Lgnu/expr/Target;)V
    .locals 2
    .param p1, "incoming"    # Lgnu/bytecode/Variable;
    .param p2, "comp"    # Lgnu/expr/Compilation;
    .param p3, "target"    # Lgnu/expr/Target;

    .line 206
    iget v0, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    packed-switch v0, :pswitch_data_0

    .line 217
    invoke-static {p0, p1, p2, p3}, Lgnu/kawa/reflect/InstanceOf;->emitIsInstance(Lgnu/expr/TypeValue;Lgnu/bytecode/Variable;Lgnu/expr/Compilation;Lgnu/expr/Target;)V

    goto :goto_0

    .line 212
    :pswitch_0
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {p2}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgnu/bytecode/ClassType;->emitIsInstance(Lgnu/bytecode/CodeAttr;)V

    .line 213
    invoke-virtual {p2}, Lgnu/expr/Compilation;->getLanguage()Lgnu/expr/Language;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lgnu/expr/Language;->getTypeFor(Ljava/lang/Class;)Lgnu/bytecode/Type;

    move-result-object v0

    invoke-virtual {p3, p2, v0}, Lgnu/expr/Target;->compileFromStack(Lgnu/expr/Compilation;Lgnu/bytecode/Type;)V

    .line 215
    nop

    .line 219
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public emitTestIf(Lgnu/bytecode/Variable;Lgnu/expr/Declaration;Lgnu/expr/Compilation;)V
    .locals 3
    .param p1, "incoming"    # Lgnu/bytecode/Variable;
    .param p2, "decl"    # Lgnu/expr/Declaration;
    .param p3, "comp"    # Lgnu/expr/Compilation;

    .line 410
    invoke-virtual {p3}, Lgnu/expr/Compilation;->getCode()Lgnu/bytecode/CodeAttr;

    move-result-object v0

    .line 411
    .local v0, "code":Lgnu/bytecode/CodeAttr;
    if-eqz p1, :cond_0

    .line 412
    invoke-virtual {v0, p1}, Lgnu/bytecode/CodeAttr;->emitLoad(Lgnu/bytecode/Variable;)V

    .line 413
    :cond_0
    invoke-virtual {p0}, Lgnu/kawa/lispexpr/LangObjType;->coercionOrNullMethod()Lgnu/bytecode/Method;

    move-result-object v1

    .line 414
    .local v1, "method":Lgnu/bytecode/Method;
    if-eqz v1, :cond_1

    .line 415
    invoke-virtual {v0, v1}, Lgnu/bytecode/CodeAttr;->emitInvokeStatic(Lgnu/bytecode/Method;)V

    .line 416
    :cond_1
    if-eqz p2, :cond_2

    .line 418
    invoke-virtual {v0}, Lgnu/bytecode/CodeAttr;->emitDup()V

    .line 419
    invoke-virtual {p2, p3}, Lgnu/expr/Declaration;->compileStore(Lgnu/expr/Compilation;)V

    .line 421
    :cond_2
    if-eqz v1, :cond_3

    .line 422
    invoke-virtual {v0}, Lgnu/bytecode/CodeAttr;->emitIfNotNull()V

    goto :goto_0

    .line 425
    :cond_3
    iget-object v2, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {v2, v0}, Lgnu/bytecode/ClassType;->emitIsInstance(Lgnu/bytecode/CodeAttr;)V

    .line 426
    invoke-virtual {v0}, Lgnu/bytecode/CodeAttr;->emitIfIntNotZero()V

    .line 428
    :goto_0
    return-void
.end method

.method public getConstructor()Lgnu/mapping/Procedure;
    .locals 4

    .line 576
    iget v0, p0, Lgnu/kawa/lispexpr/LangObjType;->typeCode:I

    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_0

    .line 593
    const/4 v0, 0x0

    return-object v0

    .line 591
    :sswitch_0
    new-instance v0, Lgnu/expr/PrimProcedure;

    const-string v2, "java.util.regex.Pattern"

    const-string v3, "compile"

    invoke-direct {v0, v2, v3, v1}, Lgnu/expr/PrimProcedure;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    .line 589
    :sswitch_1
    new-instance v0, Lgnu/expr/PrimProcedure;

    const-string v2, "kawa.lib.strings"

    const-string v3, "$make$string$"

    invoke-direct {v0, v2, v3, v1}, Lgnu/expr/PrimProcedure;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    .line 585
    :sswitch_2
    new-instance v0, Lgnu/expr/PrimProcedure;

    const-string v2, "gnu.lists.FVector"

    const-string v3, "make"

    invoke-direct {v0, v2, v3, v1}, Lgnu/expr/PrimProcedure;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    .line 587
    :sswitch_3
    sget-object v0, Lgnu/kawa/functions/MakeList;->list:Lgnu/kawa/functions/MakeList;

    return-object v0

    .line 583
    :sswitch_4
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->makeURIProc:Lgnu/expr/PrimProcedure;

    return-object v0

    .line 581
    :sswitch_5
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->makeFilepathProc:Lgnu/expr/PrimProcedure;

    return-object v0

    .line 579
    :sswitch_6
    sget-object v0, Lgnu/kawa/lispexpr/LangObjType;->makePathProc:Lgnu/expr/PrimProcedure;

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_6
        0x2 -> :sswitch_5
        0x3 -> :sswitch_4
        0xb -> :sswitch_3
        0xc -> :sswitch_2
        0xd -> :sswitch_1
        0xe -> :sswitch_0
    .end sparse-switch
.end method

.method public getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "argCount"    # I

    .line 167
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, p1, p2}, Lgnu/bytecode/ClassType;->getDeclaredMethod(Ljava/lang/String;I)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0
.end method

.method public getField(Ljava/lang/String;I)Lgnu/bytecode/Field;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "mask"    # I

    .line 157
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, p1, p2}, Lgnu/bytecode/ClassType;->getField(Ljava/lang/String;I)Lgnu/bytecode/Field;

    move-result-object v0

    return-object v0
.end method

.method public getImplementationType()Lgnu/bytecode/Type;
    .locals 1

    .line 193
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    return-object v0
.end method

.method public getMethod(Ljava/lang/String;[Lgnu/bytecode/Type;)Lgnu/bytecode/Method;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg_types"    # [Lgnu/bytecode/Type;

    .line 162
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, p1, p2}, Lgnu/bytecode/ClassType;->getMethod(Ljava/lang/String;[Lgnu/bytecode/Type;)Lgnu/bytecode/Method;

    move-result-object v0

    return-object v0
.end method

.method public getMethods(Lgnu/bytecode/Filter;ILjava/util/List;)I
    .locals 1
    .param p1, "filter"    # Lgnu/bytecode/Filter;
    .param p2, "searchSupers"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgnu/bytecode/Filter;",
            "I",
            "Ljava/util/List<",
            "Lgnu/bytecode/Method;",
            ">;)I"
        }
    .end annotation

    .line 178
    .local p3, "result":Ljava/util/List;, "Ljava/util/List<Lgnu/bytecode/Method;>;"
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0, p1, p2, p3}, Lgnu/bytecode/ClassType;->getMethods(Lgnu/bytecode/Filter;ILjava/util/List;)I

    move-result v0

    return v0
.end method

.method public getRealType()Lgnu/bytecode/Type;
    .locals 1

    .line 188
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    return-object v0
.end method

.method public getReflectClass()Ljava/lang/Class;
    .locals 1

    .line 183
    iget-object v0, p0, Lgnu/kawa/lispexpr/LangObjType;->implementationType:Lgnu/bytecode/ClassType;

    invoke-virtual {v0}, Lgnu/bytecode/ClassType;->getReflectClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method
