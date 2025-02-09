.class public Lcom/google/appinventor/components/runtime/ReplForm;
.super Lcom/google/appinventor/components/runtime/Form;
.source "ReplForm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/appinventor/components/runtime/ReplForm$SchemeInterface;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static final SPLASH_ACTIVITY_CLASS:Ljava/lang/String;

.field public static topform:Lcom/google/appinventor/components/runtime/ReplForm;


# instance fields
.field private IsUSBRepl:Z

.field private assetsLoaded:Z

.field private currentTheme:Ljava/lang/String;

.field private httpdServer:Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

.field private isDirect:Z

.field private loadedExternalDexs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private replAssetDir:Ljava/lang/String;

.field private replCompDir:Ljava/lang/String;

.field private replResult:Ljava/lang/Object;

.field private replResultFormName:Ljava/lang/String;

.field schemeInterface:Lcom/google/appinventor/components/runtime/ReplForm$SchemeInterface;

.field private webRTCNativeMgr:Lcom/google/appinventor/components/runtime/util/WebRTCNativeMgr;


# direct methods
.method static bridge synthetic -$$Nest$mgenReportId(Lcom/google/appinventor/components/runtime/ReplForm;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->genReportId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mstartChromebook(Lcom/google/appinventor/components/runtime/ReplForm;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/appinventor/components/runtime/ReplForm;->startChromebook(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetLOG_TAG()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 72
    const-class v0, Lcom/google/appinventor/components/runtime/ReplForm;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    .line 91
    const-class v0, Lcom/google/appinventor/components/runtime/SplashActivity;

    .line 92
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->SPLASH_ACTIVITY_CLASS:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 95
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/Form;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->httpdServer:Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

    .line 77
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->IsUSBRepl:Z

    .line 78
    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->assetsLoaded:Z

    .line 79
    iput-boolean v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->isDirect:Z

    .line 80
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResult:Ljava/lang/Object;

    .line 81
    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResultFormName:Ljava/lang/String;

    .line 86
    const-string v0, "AppTheme.Light.DarkActionBar"

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->currentTheme:Ljava/lang/String;

    .line 89
    new-instance v0, Lcom/google/appinventor/components/runtime/ReplForm$SchemeInterface;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/ReplForm$SchemeInterface;-><init>(Lcom/google/appinventor/components/runtime/ReplForm;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->schemeInterface:Lcom/google/appinventor/components/runtime/ReplForm$SchemeInterface;

    .line 96
    sput-object p0, Lcom/google/appinventor/components/runtime/ReplForm;->topform:Lcom/google/appinventor/components/runtime/ReplForm;

    .line 97
    return-void
.end method

.method private checkAssetDir()V
    .locals 2

    .line 411
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replAssetDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 412
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 413
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 415
    :cond_0
    return-void
.end method

.method private checkComponentDir()Z
    .locals 2

    .line 418
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replCompDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 419
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 420
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    return v1

    .line 422
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method private genReportId()Ljava/lang/String;
    .locals 7

    .line 594
    const/16 v0, 0x800

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "A"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "ABE"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "ACE"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "ACT"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "AD"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "ADA"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "ADD"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "AGO"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "AID"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "AIM"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "AIR"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "ALL"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "ALP"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "AM"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "AMY"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "AN"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "ANA"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "AND"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "ANN"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "ANT"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "ANY"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "APE"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "APS"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "APT"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "ARC"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "ARE"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "ARK"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "ARM"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "ART"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "AS"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "ASH"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "ASK"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "AT"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "ATE"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "AUG"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "AUK"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "AVE"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string v2, "AWE"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string v2, "AWK"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string v2, "AWL"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string v2, "AWN"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "AX"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "AYE"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "BAD"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "BAG"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "BAH"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string v2, "BAM"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string v2, "BAN"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string v2, "BAR"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string v2, "BAT"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string v2, "BAY"

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string v2, "BE"

    aput-object v2, v0, v1

    const/16 v1, 0x34

    const-string v2, "BED"

    aput-object v2, v0, v1

    const/16 v1, 0x35

    const-string v2, "BEE"

    aput-object v2, v0, v1

    const/16 v1, 0x36

    const-string v2, "BEG"

    aput-object v2, v0, v1

    const/16 v1, 0x37

    const-string v2, "BEN"

    aput-object v2, v0, v1

    const/16 v1, 0x38

    const-string v2, "BET"

    aput-object v2, v0, v1

    const/16 v1, 0x39

    const-string v2, "BEY"

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    const-string v2, "BIB"

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    const-string v2, "BID"

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    const-string v2, "BIG"

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    const-string v2, "BIN"

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    const-string v2, "BIT"

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    const-string v2, "BOB"

    aput-object v2, v0, v1

    const/16 v1, 0x40

    const-string v2, "BOG"

    aput-object v2, v0, v1

    const/16 v1, 0x41

    const-string v2, "BON"

    aput-object v2, v0, v1

    const/16 v1, 0x42

    const-string v2, "BOO"

    aput-object v2, v0, v1

    const/16 v1, 0x43

    const-string v2, "BOP"

    aput-object v2, v0, v1

    const/16 v1, 0x44

    const-string v2, "BOW"

    aput-object v2, v0, v1

    const/16 v1, 0x45

    const-string v2, "BOY"

    aput-object v2, v0, v1

    const/16 v1, 0x46

    const-string v2, "BUB"

    aput-object v2, v0, v1

    const/16 v1, 0x47

    const-string v2, "BUD"

    aput-object v2, v0, v1

    const/16 v1, 0x48

    const-string v2, "BUG"

    aput-object v2, v0, v1

    const/16 v1, 0x49

    const-string v2, "BUM"

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    const-string v2, "BUN"

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    const-string v2, "BUS"

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    const-string v2, "BUT"

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    const-string v2, "BUY"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    const-string v2, "BY"

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    const-string v2, "BYE"

    aput-object v2, v0, v1

    const/16 v1, 0x50

    const-string v2, "CAB"

    aput-object v2, v0, v1

    const/16 v1, 0x51

    const-string v2, "CAL"

    aput-object v2, v0, v1

    const/16 v1, 0x52

    const-string v2, "CAM"

    aput-object v2, v0, v1

    const/16 v1, 0x53

    const-string v2, "CAN"

    aput-object v2, v0, v1

    const/16 v1, 0x54

    const-string v2, "CAP"

    aput-object v2, v0, v1

    const/16 v1, 0x55

    const-string v2, "CAR"

    aput-object v2, v0, v1

    const/16 v1, 0x56

    const-string v2, "CAT"

    aput-object v2, v0, v1

    const/16 v1, 0x57

    const-string v2, "CAW"

    aput-object v2, v0, v1

    const/16 v1, 0x58

    const-string v2, "COD"

    aput-object v2, v0, v1

    const/16 v1, 0x59

    const-string v2, "COG"

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    const-string v2, "COL"

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    const-string v2, "CON"

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    const-string v2, "COO"

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    const-string v2, "COP"

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    const-string v2, "COT"

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    const-string v2, "COW"

    aput-object v2, v0, v1

    const/16 v1, 0x60

    const-string v2, "COY"

    aput-object v2, v0, v1

    const/16 v1, 0x61

    const-string v2, "CRY"

    aput-object v2, v0, v1

    const/16 v1, 0x62

    const-string v2, "CUB"

    aput-object v2, v0, v1

    const/16 v1, 0x63

    const-string v2, "CUE"

    aput-object v2, v0, v1

    const/16 v1, 0x64

    const-string v2, "CUP"

    aput-object v2, v0, v1

    const/16 v1, 0x65

    const-string v2, "CUR"

    aput-object v2, v0, v1

    const/16 v1, 0x66

    const-string v2, "CUT"

    aput-object v2, v0, v1

    const/16 v1, 0x67

    const-string v2, "DAB"

    aput-object v2, v0, v1

    const/16 v1, 0x68

    const-string v2, "DAD"

    aput-object v2, v0, v1

    const/16 v1, 0x69

    const-string v2, "DAM"

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    const-string v2, "DAN"

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    const-string v2, "DAR"

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    const-string v2, "DAY"

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    const-string v2, "DEE"

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    const-string v2, "DEL"

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    const-string v2, "DEN"

    aput-object v2, v0, v1

    const/16 v1, 0x70

    const-string v2, "DES"

    aput-object v2, v0, v1

    const/16 v1, 0x71

    const-string v2, "DEW"

    aput-object v2, v0, v1

    const/16 v1, 0x72

    const-string v2, "DID"

    aput-object v2, v0, v1

    const/16 v1, 0x73

    const-string v2, "DIE"

    aput-object v2, v0, v1

    const/16 v1, 0x74

    const-string v2, "DIG"

    aput-object v2, v0, v1

    const/16 v1, 0x75

    const-string v2, "DIN"

    aput-object v2, v0, v1

    const/16 v1, 0x76

    const-string v2, "DIP"

    aput-object v2, v0, v1

    const/16 v1, 0x77

    const-string v2, "DO"

    aput-object v2, v0, v1

    const/16 v1, 0x78

    const-string v2, "DOE"

    aput-object v2, v0, v1

    const/16 v1, 0x79

    const-string v2, "DOG"

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    const-string v2, "DON"

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    const-string v2, "DOT"

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    const-string v2, "DOW"

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    const-string v2, "DRY"

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    const-string v2, "DUB"

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    const-string v2, "DUD"

    aput-object v2, v0, v1

    const/16 v1, 0x80

    const-string v2, "DUE"

    aput-object v2, v0, v1

    const/16 v1, 0x81

    const-string v2, "DUG"

    aput-object v2, v0, v1

    const/16 v1, 0x82

    const-string v2, "DUN"

    aput-object v2, v0, v1

    const/16 v1, 0x83

    const-string v2, "EAR"

    aput-object v2, v0, v1

    const/16 v1, 0x84

    const-string v2, "EAT"

    aput-object v2, v0, v1

    const/16 v1, 0x85

    const-string v2, "ED"

    aput-object v2, v0, v1

    const/16 v1, 0x86

    const-string v2, "EEL"

    aput-object v2, v0, v1

    const/16 v1, 0x87

    const-string v2, "EGG"

    aput-object v2, v0, v1

    const/16 v1, 0x88

    const-string v2, "EGO"

    aput-object v2, v0, v1

    const/16 v1, 0x89

    const-string v2, "ELI"

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    const-string v2, "ELK"

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    const-string v2, "ELM"

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    const-string v2, "ELY"

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    const-string v2, "EM"

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    const-string v2, "END"

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    const-string v2, "EST"

    aput-object v2, v0, v1

    const/16 v1, 0x90

    const-string v2, "ETC"

    aput-object v2, v0, v1

    const/16 v1, 0x91

    const-string v2, "EVA"

    aput-object v2, v0, v1

    const/16 v1, 0x92

    const-string v2, "EVE"

    aput-object v2, v0, v1

    const/16 v1, 0x93

    const-string v2, "EWE"

    aput-object v2, v0, v1

    const/16 v1, 0x94

    const-string v2, "EYE"

    aput-object v2, v0, v1

    const/16 v1, 0x95

    const-string v2, "FAD"

    aput-object v2, v0, v1

    const/16 v1, 0x96

    const-string v2, "FAN"

    aput-object v2, v0, v1

    const/16 v1, 0x97

    const-string v2, "FAR"

    aput-object v2, v0, v1

    const/16 v1, 0x98

    const-string v2, "FAT"

    aput-object v2, v0, v1

    const/16 v1, 0x99

    const-string v2, "FAY"

    aput-object v2, v0, v1

    const/16 v1, 0x9a

    const-string v2, "FED"

    aput-object v2, v0, v1

    const/16 v1, 0x9b

    const-string v2, "FEE"

    aput-object v2, v0, v1

    const/16 v1, 0x9c

    const-string v2, "FEW"

    aput-object v2, v0, v1

    const/16 v1, 0x9d

    const-string v2, "FIB"

    aput-object v2, v0, v1

    const/16 v1, 0x9e

    const-string v2, "FIG"

    aput-object v2, v0, v1

    const/16 v1, 0x9f

    const-string v2, "FIN"

    aput-object v2, v0, v1

    const/16 v1, 0xa0

    const-string v2, "FIR"

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    const-string v2, "FIT"

    aput-object v2, v0, v1

    const/16 v1, 0xa2

    const-string v2, "FLO"

    aput-object v2, v0, v1

    const/16 v1, 0xa3

    const-string v2, "FLY"

    aput-object v2, v0, v1

    const/16 v1, 0xa4

    const-string v2, "FOE"

    aput-object v2, v0, v1

    const/16 v1, 0xa5

    const-string v2, "FOG"

    aput-object v2, v0, v1

    const/16 v1, 0xa6

    const-string v2, "FOR"

    aput-object v2, v0, v1

    const/16 v1, 0xa7

    const-string v2, "FRY"

    aput-object v2, v0, v1

    const/16 v1, 0xa8

    const-string v2, "FUM"

    aput-object v2, v0, v1

    const/16 v1, 0xa9

    const-string v2, "FUN"

    aput-object v2, v0, v1

    const/16 v1, 0xaa

    const-string v2, "FUR"

    aput-object v2, v0, v1

    const/16 v1, 0xab

    const-string v2, "GAB"

    aput-object v2, v0, v1

    const/16 v1, 0xac

    const-string v2, "GAD"

    aput-object v2, v0, v1

    const/16 v1, 0xad

    const-string v2, "GAG"

    aput-object v2, v0, v1

    const/16 v1, 0xae

    const-string v2, "GAL"

    aput-object v2, v0, v1

    const/16 v1, 0xaf

    const-string v2, "GAM"

    aput-object v2, v0, v1

    const/16 v1, 0xb0

    const-string v2, "GAP"

    aput-object v2, v0, v1

    const/16 v1, 0xb1

    const-string v2, "GAS"

    aput-object v2, v0, v1

    const/16 v1, 0xb2

    const-string v2, "GAY"

    aput-object v2, v0, v1

    const/16 v1, 0xb3

    const-string v2, "GEE"

    aput-object v2, v0, v1

    const/16 v1, 0xb4

    const-string v2, "GEL"

    aput-object v2, v0, v1

    const/16 v1, 0xb5

    const-string v2, "GEM"

    aput-object v2, v0, v1

    const/16 v1, 0xb6

    const-string v2, "GET"

    aput-object v2, v0, v1

    const/16 v1, 0xb7

    const-string v2, "GIG"

    aput-object v2, v0, v1

    const/16 v1, 0xb8

    const-string v2, "GIL"

    aput-object v2, v0, v1

    const/16 v1, 0xb9

    const-string v2, "GIN"

    aput-object v2, v0, v1

    const/16 v1, 0xba

    const-string v2, "GO"

    aput-object v2, v0, v1

    const/16 v1, 0xbb

    const-string v2, "GOT"

    aput-object v2, v0, v1

    const/16 v1, 0xbc

    const-string v2, "GUM"

    aput-object v2, v0, v1

    const/16 v1, 0xbd

    const-string v2, "GUN"

    aput-object v2, v0, v1

    const/16 v1, 0xbe

    const-string v2, "GUS"

    aput-object v2, v0, v1

    const/16 v1, 0xbf

    const-string v2, "GUT"

    aput-object v2, v0, v1

    const/16 v1, 0xc0

    const-string v2, "GUY"

    aput-object v2, v0, v1

    const/16 v1, 0xc1

    const-string v2, "GYM"

    aput-object v2, v0, v1

    const/16 v1, 0xc2

    const-string v2, "GYP"

    aput-object v2, v0, v1

    const/16 v1, 0xc3

    const-string v2, "HA"

    aput-object v2, v0, v1

    const/16 v1, 0xc4

    const-string v2, "HAD"

    aput-object v2, v0, v1

    const/16 v1, 0xc5

    const-string v2, "HAL"

    aput-object v2, v0, v1

    const/16 v1, 0xc6

    const-string v2, "HAM"

    aput-object v2, v0, v1

    const/16 v1, 0xc7

    const-string v2, "HAN"

    aput-object v2, v0, v1

    const/16 v1, 0xc8

    const-string v2, "HAP"

    aput-object v2, v0, v1

    const/16 v1, 0xc9

    const-string v2, "HAS"

    aput-object v2, v0, v1

    const/16 v1, 0xca

    const-string v2, "HAT"

    aput-object v2, v0, v1

    const/16 v1, 0xcb

    const-string v2, "HAW"

    aput-object v2, v0, v1

    const/16 v1, 0xcc

    const-string v2, "HAY"

    aput-object v2, v0, v1

    const/16 v1, 0xcd

    const-string v2, "HE"

    aput-object v2, v0, v1

    const/16 v1, 0xce

    const-string v2, "HEM"

    aput-object v2, v0, v1

    const/16 v1, 0xcf

    const-string v2, "HEN"

    aput-object v2, v0, v1

    const/16 v1, 0xd0

    const-string v2, "HER"

    aput-object v2, v0, v1

    const/16 v1, 0xd1

    const-string v2, "HEW"

    aput-object v2, v0, v1

    const/16 v1, 0xd2

    const-string v2, "HEY"

    aput-object v2, v0, v1

    const/16 v1, 0xd3

    const-string v2, "HI"

    aput-object v2, v0, v1

    const/16 v1, 0xd4

    const-string v2, "HID"

    aput-object v2, v0, v1

    const/16 v1, 0xd5

    const-string v2, "HIM"

    aput-object v2, v0, v1

    const/16 v1, 0xd6

    const-string v2, "HIP"

    aput-object v2, v0, v1

    const/16 v1, 0xd7

    const-string v2, "HIS"

    aput-object v2, v0, v1

    const/16 v1, 0xd8

    const-string v2, "HIT"

    aput-object v2, v0, v1

    const/16 v1, 0xd9

    const-string v2, "HO"

    aput-object v2, v0, v1

    const/16 v1, 0xda

    const-string v2, "HOB"

    aput-object v2, v0, v1

    const/16 v1, 0xdb

    const-string v2, "HOC"

    aput-object v2, v0, v1

    const/16 v1, 0xdc

    const-string v2, "HOE"

    aput-object v2, v0, v1

    const/16 v1, 0xdd

    const-string v2, "HOG"

    aput-object v2, v0, v1

    const/16 v1, 0xde

    const-string v2, "HOP"

    aput-object v2, v0, v1

    const/16 v1, 0xdf

    const-string v2, "HOT"

    aput-object v2, v0, v1

    const/16 v1, 0xe0

    const-string v2, "HOW"

    aput-object v2, v0, v1

    const/16 v1, 0xe1

    const-string v2, "HUB"

    aput-object v2, v0, v1

    const/16 v1, 0xe2

    const-string v2, "HUE"

    aput-object v2, v0, v1

    const/16 v1, 0xe3

    const-string v2, "HUG"

    aput-object v2, v0, v1

    const/16 v1, 0xe4

    const-string v2, "HUH"

    aput-object v2, v0, v1

    const/16 v1, 0xe5

    const-string v2, "HUM"

    aput-object v2, v0, v1

    const/16 v1, 0xe6

    const-string v2, "HUT"

    aput-object v2, v0, v1

    const/16 v1, 0xe7

    const-string v2, "I"

    aput-object v2, v0, v1

    const/16 v1, 0xe8

    const-string v2, "ICY"

    aput-object v2, v0, v1

    const/16 v1, 0xe9

    const-string v2, "IDA"

    aput-object v2, v0, v1

    const/16 v1, 0xea

    const-string v2, "IF"

    aput-object v2, v0, v1

    const/16 v1, 0xeb

    const-string v2, "IKE"

    aput-object v2, v0, v1

    const/16 v1, 0xec

    const-string v2, "ILL"

    aput-object v2, v0, v1

    const/16 v1, 0xed

    const-string v2, "INK"

    aput-object v2, v0, v1

    const/16 v1, 0xee

    const-string v2, "INN"

    aput-object v2, v0, v1

    const/16 v1, 0xef

    const-string v2, "IO"

    aput-object v2, v0, v1

    const/16 v1, 0xf0

    const-string v2, "ION"

    aput-object v2, v0, v1

    const/16 v1, 0xf1

    const-string v2, "IQ"

    aput-object v2, v0, v1

    const/16 v1, 0xf2

    const-string v2, "IRA"

    aput-object v2, v0, v1

    const/16 v1, 0xf3

    const-string v2, "IRE"

    aput-object v2, v0, v1

    const/16 v1, 0xf4

    const-string v2, "IRK"

    aput-object v2, v0, v1

    const/16 v1, 0xf5

    const-string v2, "IS"

    aput-object v2, v0, v1

    const/16 v1, 0xf6

    const-string v2, "IT"

    aput-object v2, v0, v1

    const/16 v1, 0xf7

    const-string v2, "ITS"

    aput-object v2, v0, v1

    const/16 v1, 0xf8

    const-string v2, "IVY"

    aput-object v2, v0, v1

    const/16 v1, 0xf9

    const-string v2, "JAB"

    aput-object v2, v0, v1

    const/16 v1, 0xfa

    const-string v2, "JAG"

    aput-object v2, v0, v1

    const/16 v1, 0xfb

    const-string v2, "JAM"

    aput-object v2, v0, v1

    const/16 v1, 0xfc

    const-string v2, "JAN"

    aput-object v2, v0, v1

    const/16 v1, 0xfd

    const-string v2, "JAR"

    aput-object v2, v0, v1

    const/16 v1, 0xfe

    const-string v2, "JAW"

    aput-object v2, v0, v1

    const/16 v1, 0xff

    const-string v2, "JAY"

    aput-object v2, v0, v1

    const-string v1, "JET"

    const/16 v2, 0x100

    aput-object v1, v0, v2

    const/16 v1, 0x101

    const-string v3, "JIG"

    aput-object v3, v0, v1

    const/16 v1, 0x102

    const-string v3, "JIM"

    aput-object v3, v0, v1

    const/16 v1, 0x103

    const-string v3, "JO"

    aput-object v3, v0, v1

    const/16 v1, 0x104

    const-string v3, "JOB"

    aput-object v3, v0, v1

    const/16 v1, 0x105

    const-string v3, "JOE"

    aput-object v3, v0, v1

    const/16 v1, 0x106

    const-string v3, "JOG"

    aput-object v3, v0, v1

    const/16 v1, 0x107

    const-string v3, "JOT"

    aput-object v3, v0, v1

    const/16 v1, 0x108

    const-string v3, "JOY"

    aput-object v3, v0, v1

    const/16 v1, 0x109

    const-string v3, "JUG"

    aput-object v3, v0, v1

    const/16 v1, 0x10a

    const-string v3, "JUT"

    aput-object v3, v0, v1

    const/16 v1, 0x10b

    const-string v3, "KAY"

    aput-object v3, v0, v1

    const/16 v1, 0x10c

    const-string v3, "KEG"

    aput-object v3, v0, v1

    const/16 v1, 0x10d

    const-string v3, "KEN"

    aput-object v3, v0, v1

    const/16 v1, 0x10e

    const-string v3, "KEY"

    aput-object v3, v0, v1

    const/16 v1, 0x10f

    const-string v3, "KID"

    aput-object v3, v0, v1

    const/16 v1, 0x110

    const-string v3, "KIM"

    aput-object v3, v0, v1

    const/16 v1, 0x111

    const-string v3, "KIN"

    aput-object v3, v0, v1

    const/16 v1, 0x112

    const-string v3, "KIT"

    aput-object v3, v0, v1

    const/16 v1, 0x113

    const-string v3, "LA"

    aput-object v3, v0, v1

    const/16 v1, 0x114

    const-string v3, "LAB"

    aput-object v3, v0, v1

    const/16 v1, 0x115

    const-string v3, "LAC"

    aput-object v3, v0, v1

    const/16 v1, 0x116

    const-string v3, "LAD"

    aput-object v3, v0, v1

    const/16 v1, 0x117

    const-string v3, "LAG"

    aput-object v3, v0, v1

    const/16 v1, 0x118

    const-string v3, "LAM"

    aput-object v3, v0, v1

    const/16 v1, 0x119

    const-string v3, "LAP"

    aput-object v3, v0, v1

    const/16 v1, 0x11a

    const-string v3, "LAW"

    aput-object v3, v0, v1

    const/16 v1, 0x11b

    const-string v3, "LAY"

    aput-object v3, v0, v1

    const/16 v1, 0x11c

    const-string v3, "LEA"

    aput-object v3, v0, v1

    const/16 v1, 0x11d

    const-string v3, "LED"

    aput-object v3, v0, v1

    const/16 v1, 0x11e

    const-string v3, "LEE"

    aput-object v3, v0, v1

    const/16 v1, 0x11f

    const-string v3, "LEG"

    aput-object v3, v0, v1

    const/16 v1, 0x120

    const-string v3, "LEN"

    aput-object v3, v0, v1

    const/16 v1, 0x121

    const-string v3, "LEO"

    aput-object v3, v0, v1

    const/16 v1, 0x122

    const-string v3, "LET"

    aput-object v3, v0, v1

    const/16 v1, 0x123

    const-string v3, "LEW"

    aput-object v3, v0, v1

    const/16 v1, 0x124

    const-string v3, "LID"

    aput-object v3, v0, v1

    const/16 v1, 0x125

    const-string v3, "LIE"

    aput-object v3, v0, v1

    const/16 v1, 0x126

    const-string v3, "LIN"

    aput-object v3, v0, v1

    const/16 v1, 0x127

    const-string v3, "LIP"

    aput-object v3, v0, v1

    const/16 v1, 0x128

    const-string v3, "LIT"

    aput-object v3, v0, v1

    const/16 v1, 0x129

    const-string v3, "LO"

    aput-object v3, v0, v1

    const/16 v1, 0x12a

    const-string v3, "LOB"

    aput-object v3, v0, v1

    const/16 v1, 0x12b

    const-string v3, "LOG"

    aput-object v3, v0, v1

    const/16 v1, 0x12c

    const-string v3, "LOP"

    aput-object v3, v0, v1

    const/16 v1, 0x12d

    const-string v3, "LOS"

    aput-object v3, v0, v1

    const/16 v1, 0x12e

    const-string v3, "LOT"

    aput-object v3, v0, v1

    const/16 v1, 0x12f

    const-string v3, "LOU"

    aput-object v3, v0, v1

    const/16 v1, 0x130

    const-string v3, "LOW"

    aput-object v3, v0, v1

    const/16 v1, 0x131

    const-string v3, "LOY"

    aput-object v3, v0, v1

    const/16 v1, 0x132

    const-string v3, "LUG"

    aput-object v3, v0, v1

    const/16 v1, 0x133

    const-string v3, "LYE"

    aput-object v3, v0, v1

    const/16 v1, 0x134

    const-string v3, "MA"

    aput-object v3, v0, v1

    const/16 v1, 0x135

    const-string v3, "MAC"

    aput-object v3, v0, v1

    const/16 v1, 0x136

    const-string v3, "MAD"

    aput-object v3, v0, v1

    const/16 v1, 0x137

    const-string v3, "MAE"

    aput-object v3, v0, v1

    const/16 v1, 0x138

    const-string v3, "MAN"

    aput-object v3, v0, v1

    const/16 v1, 0x139

    const-string v3, "MAO"

    aput-object v3, v0, v1

    const/16 v1, 0x13a

    const-string v3, "MAP"

    aput-object v3, v0, v1

    const/16 v1, 0x13b

    const-string v3, "MAT"

    aput-object v3, v0, v1

    const/16 v1, 0x13c

    const-string v3, "MAW"

    aput-object v3, v0, v1

    const/16 v1, 0x13d

    const-string v3, "MAY"

    aput-object v3, v0, v1

    const/16 v1, 0x13e

    const-string v3, "ME"

    aput-object v3, v0, v1

    const/16 v1, 0x13f

    const-string v3, "MEG"

    aput-object v3, v0, v1

    const/16 v1, 0x140

    const-string v3, "MEL"

    aput-object v3, v0, v1

    const/16 v1, 0x141

    const-string v3, "MEN"

    aput-object v3, v0, v1

    const/16 v1, 0x142

    const-string v3, "MET"

    aput-object v3, v0, v1

    const/16 v1, 0x143

    const-string v3, "MEW"

    aput-object v3, v0, v1

    const/16 v1, 0x144

    const-string v3, "MID"

    aput-object v3, v0, v1

    const/16 v1, 0x145

    const-string v3, "MIN"

    aput-object v3, v0, v1

    const/16 v1, 0x146

    const-string v3, "MIT"

    aput-object v3, v0, v1

    const/16 v1, 0x147

    const-string v3, "MOB"

    aput-object v3, v0, v1

    const/16 v1, 0x148

    const-string v3, "MOD"

    aput-object v3, v0, v1

    const/16 v1, 0x149

    const-string v3, "MOE"

    aput-object v3, v0, v1

    const/16 v1, 0x14a

    const-string v3, "MOO"

    aput-object v3, v0, v1

    const/16 v1, 0x14b

    const-string v3, "MOP"

    aput-object v3, v0, v1

    const/16 v1, 0x14c

    const-string v3, "MOS"

    aput-object v3, v0, v1

    const/16 v1, 0x14d

    const-string v3, "MOT"

    aput-object v3, v0, v1

    const/16 v1, 0x14e

    const-string v3, "MOW"

    aput-object v3, v0, v1

    const/16 v1, 0x14f

    const-string v3, "MUD"

    aput-object v3, v0, v1

    const/16 v1, 0x150

    const-string v3, "MUG"

    aput-object v3, v0, v1

    const/16 v1, 0x151

    const-string v3, "MUM"

    aput-object v3, v0, v1

    const/16 v1, 0x152

    const-string v3, "MY"

    aput-object v3, v0, v1

    const/16 v1, 0x153

    const-string v3, "NAB"

    aput-object v3, v0, v1

    const/16 v1, 0x154

    const-string v3, "NAG"

    aput-object v3, v0, v1

    const/16 v1, 0x155

    const-string v3, "NAN"

    aput-object v3, v0, v1

    const/16 v1, 0x156

    const-string v3, "NAP"

    aput-object v3, v0, v1

    const/16 v1, 0x157

    const-string v3, "NAT"

    aput-object v3, v0, v1

    const/16 v1, 0x158

    const-string v3, "NAY"

    aput-object v3, v0, v1

    const/16 v1, 0x159

    const-string v3, "NE"

    aput-object v3, v0, v1

    const/16 v1, 0x15a

    const-string v3, "NED"

    aput-object v3, v0, v1

    const/16 v1, 0x15b

    const-string v3, "NEE"

    aput-object v3, v0, v1

    const/16 v1, 0x15c

    const-string v3, "NET"

    aput-object v3, v0, v1

    const/16 v1, 0x15d

    const-string v3, "NEW"

    aput-object v3, v0, v1

    const/16 v1, 0x15e

    const-string v3, "NIB"

    aput-object v3, v0, v1

    const/16 v1, 0x15f

    const-string v3, "NIL"

    aput-object v3, v0, v1

    const/16 v1, 0x160

    const-string v3, "NIP"

    aput-object v3, v0, v1

    const/16 v1, 0x161

    const-string v3, "NIT"

    aput-object v3, v0, v1

    const/16 v1, 0x162

    const-string v3, "NO"

    aput-object v3, v0, v1

    const/16 v1, 0x163

    const-string v3, "NOB"

    aput-object v3, v0, v1

    const/16 v1, 0x164

    const-string v3, "NOD"

    aput-object v3, v0, v1

    const/16 v1, 0x165

    const-string v3, "NON"

    aput-object v3, v0, v1

    const/16 v1, 0x166

    const-string v3, "NOR"

    aput-object v3, v0, v1

    const/16 v1, 0x167

    const-string v3, "NOT"

    aput-object v3, v0, v1

    const/16 v1, 0x168

    const-string v3, "NOV"

    aput-object v3, v0, v1

    const/16 v1, 0x169

    const-string v3, "NOW"

    aput-object v3, v0, v1

    const/16 v1, 0x16a

    const-string v3, "NU"

    aput-object v3, v0, v1

    const/16 v1, 0x16b

    const-string v3, "NUN"

    aput-object v3, v0, v1

    const/16 v1, 0x16c

    const-string v3, "NUT"

    aput-object v3, v0, v1

    const/16 v1, 0x16d

    const-string v3, "O"

    aput-object v3, v0, v1

    const/16 v1, 0x16e

    const-string v3, "OAF"

    aput-object v3, v0, v1

    const/16 v1, 0x16f

    const-string v3, "OAK"

    aput-object v3, v0, v1

    const/16 v1, 0x170

    const-string v3, "OAR"

    aput-object v3, v0, v1

    const/16 v1, 0x171

    const-string v3, "OAT"

    aput-object v3, v0, v1

    const/16 v1, 0x172

    const-string v3, "ODD"

    aput-object v3, v0, v1

    const/16 v1, 0x173

    const-string v3, "ODE"

    aput-object v3, v0, v1

    const/16 v1, 0x174

    const-string v3, "OF"

    aput-object v3, v0, v1

    const/16 v1, 0x175

    const-string v3, "OFF"

    aput-object v3, v0, v1

    const/16 v1, 0x176

    const-string v3, "OFT"

    aput-object v3, v0, v1

    const/16 v1, 0x177

    const-string v3, "OH"

    aput-object v3, v0, v1

    const/16 v1, 0x178

    const-string v3, "OIL"

    aput-object v3, v0, v1

    const/16 v1, 0x179

    const-string v3, "OK"

    aput-object v3, v0, v1

    const/16 v1, 0x17a

    const-string v3, "OLD"

    aput-object v3, v0, v1

    const/16 v1, 0x17b

    const-string v3, "ON"

    aput-object v3, v0, v1

    const/16 v1, 0x17c

    const-string v3, "ONE"

    aput-object v3, v0, v1

    const/16 v1, 0x17d

    const-string v3, "OR"

    aput-object v3, v0, v1

    const/16 v1, 0x17e

    const-string v3, "ORB"

    aput-object v3, v0, v1

    const/16 v1, 0x17f

    const-string v3, "ORE"

    aput-object v3, v0, v1

    const/16 v1, 0x180

    const-string v3, "ORR"

    aput-object v3, v0, v1

    const/16 v1, 0x181

    const-string v3, "OS"

    aput-object v3, v0, v1

    const/16 v1, 0x182

    const-string v3, "OTT"

    aput-object v3, v0, v1

    const/16 v1, 0x183

    const-string v3, "OUR"

    aput-object v3, v0, v1

    const/16 v1, 0x184

    const-string v3, "OUT"

    aput-object v3, v0, v1

    const/16 v1, 0x185

    const-string v3, "OVA"

    aput-object v3, v0, v1

    const/16 v1, 0x186

    const-string v3, "OW"

    aput-object v3, v0, v1

    const/16 v1, 0x187

    const-string v3, "OWE"

    aput-object v3, v0, v1

    const/16 v1, 0x188

    const-string v3, "OWL"

    aput-object v3, v0, v1

    const/16 v1, 0x189

    const-string v3, "OWN"

    aput-object v3, v0, v1

    const/16 v1, 0x18a

    const-string v3, "OX"

    aput-object v3, v0, v1

    const/16 v1, 0x18b

    const-string v3, "PA"

    aput-object v3, v0, v1

    const/16 v1, 0x18c

    const-string v3, "PAD"

    aput-object v3, v0, v1

    const/16 v1, 0x18d

    const-string v3, "PAL"

    aput-object v3, v0, v1

    const/16 v1, 0x18e

    const-string v3, "PAM"

    aput-object v3, v0, v1

    const/16 v1, 0x18f

    const-string v3, "PAN"

    aput-object v3, v0, v1

    const/16 v1, 0x190

    const-string v3, "PAP"

    aput-object v3, v0, v1

    const/16 v1, 0x191

    const-string v3, "PAR"

    aput-object v3, v0, v1

    const/16 v1, 0x192

    const-string v3, "PAT"

    aput-object v3, v0, v1

    const/16 v1, 0x193

    const-string v3, "PAW"

    aput-object v3, v0, v1

    const/16 v1, 0x194

    const-string v3, "PAY"

    aput-object v3, v0, v1

    const/16 v1, 0x195

    const-string v3, "PEA"

    aput-object v3, v0, v1

    const/16 v1, 0x196

    const-string v3, "PEG"

    aput-object v3, v0, v1

    const/16 v1, 0x197

    const-string v3, "PEN"

    aput-object v3, v0, v1

    const/16 v1, 0x198

    const-string v3, "PEP"

    aput-object v3, v0, v1

    const/16 v1, 0x199

    const-string v3, "PER"

    aput-object v3, v0, v1

    const/16 v1, 0x19a

    const-string v3, "PET"

    aput-object v3, v0, v1

    const/16 v1, 0x19b

    const-string v3, "PEW"

    aput-object v3, v0, v1

    const/16 v1, 0x19c

    const-string v3, "PHI"

    aput-object v3, v0, v1

    const/16 v1, 0x19d

    const-string v3, "PI"

    aput-object v3, v0, v1

    const/16 v1, 0x19e

    const-string v3, "PIE"

    aput-object v3, v0, v1

    const/16 v1, 0x19f

    const-string v3, "PIN"

    aput-object v3, v0, v1

    const/16 v1, 0x1a0

    const-string v3, "PIT"

    aput-object v3, v0, v1

    const/16 v1, 0x1a1

    const-string v3, "PLY"

    aput-object v3, v0, v1

    const/16 v1, 0x1a2

    const-string v3, "PO"

    aput-object v3, v0, v1

    const/16 v1, 0x1a3

    const-string v3, "POD"

    aput-object v3, v0, v1

    const/16 v1, 0x1a4

    const-string v3, "POE"

    aput-object v3, v0, v1

    const/16 v1, 0x1a5

    const-string v3, "POP"

    aput-object v3, v0, v1

    const/16 v1, 0x1a6

    const-string v3, "POT"

    aput-object v3, v0, v1

    const/16 v1, 0x1a7

    const-string v3, "POW"

    aput-object v3, v0, v1

    const/16 v1, 0x1a8

    const-string v3, "PRO"

    aput-object v3, v0, v1

    const/16 v1, 0x1a9

    const-string v3, "PRY"

    aput-object v3, v0, v1

    const/16 v1, 0x1aa

    const-string v3, "PUB"

    aput-object v3, v0, v1

    const/16 v1, 0x1ab

    const-string v3, "PUG"

    aput-object v3, v0, v1

    const/16 v1, 0x1ac

    const-string v3, "PUN"

    aput-object v3, v0, v1

    const/16 v1, 0x1ad

    const-string v3, "PUP"

    aput-object v3, v0, v1

    const/16 v1, 0x1ae

    const-string v3, "PUT"

    aput-object v3, v0, v1

    const/16 v1, 0x1af

    const-string v3, "QUO"

    aput-object v3, v0, v1

    const/16 v1, 0x1b0

    const-string v3, "RAG"

    aput-object v3, v0, v1

    const/16 v1, 0x1b1

    const-string v3, "RAM"

    aput-object v3, v0, v1

    const/16 v1, 0x1b2

    const-string v3, "RAN"

    aput-object v3, v0, v1

    const/16 v1, 0x1b3

    const-string v3, "RAP"

    aput-object v3, v0, v1

    const/16 v1, 0x1b4

    const-string v3, "RAT"

    aput-object v3, v0, v1

    const/16 v1, 0x1b5

    const-string v3, "RAW"

    aput-object v3, v0, v1

    const/16 v1, 0x1b6

    const-string v3, "RAY"

    aput-object v3, v0, v1

    const/16 v1, 0x1b7

    const-string v3, "REB"

    aput-object v3, v0, v1

    const/16 v1, 0x1b8

    const-string v3, "RED"

    aput-object v3, v0, v1

    const/16 v1, 0x1b9

    const-string v3, "REP"

    aput-object v3, v0, v1

    const/16 v1, 0x1ba

    const-string v3, "RET"

    aput-object v3, v0, v1

    const/16 v1, 0x1bb

    const-string v3, "RIB"

    aput-object v3, v0, v1

    const/16 v1, 0x1bc

    const-string v3, "RID"

    aput-object v3, v0, v1

    const/16 v1, 0x1bd

    const-string v3, "RIG"

    aput-object v3, v0, v1

    const/16 v1, 0x1be

    const-string v3, "RIM"

    aput-object v3, v0, v1

    const/16 v1, 0x1bf

    const-string v3, "RIO"

    aput-object v3, v0, v1

    const/16 v1, 0x1c0

    const-string v3, "RIP"

    aput-object v3, v0, v1

    const/16 v1, 0x1c1

    const-string v3, "ROB"

    aput-object v3, v0, v1

    const/16 v1, 0x1c2

    const-string v3, "ROD"

    aput-object v3, v0, v1

    const/16 v1, 0x1c3

    const-string v3, "ROE"

    aput-object v3, v0, v1

    const/16 v1, 0x1c4

    const-string v3, "RON"

    aput-object v3, v0, v1

    const/16 v1, 0x1c5

    const-string v3, "ROT"

    aput-object v3, v0, v1

    const/16 v1, 0x1c6

    const-string v3, "ROW"

    aput-object v3, v0, v1

    const/16 v1, 0x1c7

    const-string v3, "ROY"

    aput-object v3, v0, v1

    const/16 v1, 0x1c8

    const-string v3, "RUB"

    aput-object v3, v0, v1

    const/16 v1, 0x1c9

    const-string v3, "RUE"

    aput-object v3, v0, v1

    const/16 v1, 0x1ca

    const-string v3, "RUG"

    aput-object v3, v0, v1

    const/16 v1, 0x1cb

    const-string v3, "RUM"

    aput-object v3, v0, v1

    const/16 v1, 0x1cc

    const-string v3, "RUN"

    aput-object v3, v0, v1

    const/16 v1, 0x1cd

    const-string v3, "RYE"

    aput-object v3, v0, v1

    const/16 v1, 0x1ce

    const-string v3, "SAC"

    aput-object v3, v0, v1

    const/16 v1, 0x1cf

    const-string v3, "SAD"

    aput-object v3, v0, v1

    const/16 v1, 0x1d0

    const-string v3, "SAG"

    aput-object v3, v0, v1

    const/16 v1, 0x1d1

    const-string v3, "SAL"

    aput-object v3, v0, v1

    const/16 v1, 0x1d2

    const-string v3, "SAM"

    aput-object v3, v0, v1

    const/16 v1, 0x1d3

    const-string v3, "SAN"

    aput-object v3, v0, v1

    const/16 v1, 0x1d4

    const-string v3, "SAP"

    aput-object v3, v0, v1

    const/16 v1, 0x1d5

    const-string v3, "SAT"

    aput-object v3, v0, v1

    const/16 v1, 0x1d6

    const-string v3, "SAW"

    aput-object v3, v0, v1

    const/16 v1, 0x1d7

    const-string v3, "SAY"

    aput-object v3, v0, v1

    const/16 v1, 0x1d8

    const-string v3, "SEA"

    aput-object v3, v0, v1

    const/16 v1, 0x1d9

    const-string v3, "SEC"

    aput-object v3, v0, v1

    const/16 v1, 0x1da

    const-string v3, "SEE"

    aput-object v3, v0, v1

    const/16 v1, 0x1db

    const-string v3, "SEN"

    aput-object v3, v0, v1

    const/16 v1, 0x1dc

    const-string v3, "SET"

    aput-object v3, v0, v1

    const/16 v1, 0x1dd

    const-string v3, "SEW"

    aput-object v3, v0, v1

    const/16 v1, 0x1de

    const-string v3, "SHE"

    aput-object v3, v0, v1

    const/16 v1, 0x1df

    const-string v3, "SHY"

    aput-object v3, v0, v1

    const/16 v1, 0x1e0

    const-string v3, "SIN"

    aput-object v3, v0, v1

    const/16 v1, 0x1e1

    const-string v3, "SIP"

    aput-object v3, v0, v1

    const/16 v1, 0x1e2

    const-string v3, "SIR"

    aput-object v3, v0, v1

    const/16 v1, 0x1e3

    const-string v3, "SIS"

    aput-object v3, v0, v1

    const/16 v1, 0x1e4

    const-string v3, "SIT"

    aput-object v3, v0, v1

    const/16 v1, 0x1e5

    const-string v3, "SKI"

    aput-object v3, v0, v1

    const/16 v1, 0x1e6

    const-string v3, "SKY"

    aput-object v3, v0, v1

    const/16 v1, 0x1e7

    const-string v3, "SLY"

    aput-object v3, v0, v1

    const/16 v1, 0x1e8

    const-string v3, "SO"

    aput-object v3, v0, v1

    const/16 v1, 0x1e9

    const-string v3, "SOB"

    aput-object v3, v0, v1

    const/16 v1, 0x1ea

    const-string v3, "SOD"

    aput-object v3, v0, v1

    const/16 v1, 0x1eb

    const-string v3, "SON"

    aput-object v3, v0, v1

    const/16 v1, 0x1ec

    const-string v3, "SOP"

    aput-object v3, v0, v1

    const/16 v1, 0x1ed

    const-string v3, "SOW"

    aput-object v3, v0, v1

    const/16 v1, 0x1ee

    const-string v3, "SOY"

    aput-object v3, v0, v1

    const/16 v1, 0x1ef

    const-string v3, "SPA"

    aput-object v3, v0, v1

    const/16 v1, 0x1f0

    const-string v3, "SPY"

    aput-object v3, v0, v1

    const/16 v1, 0x1f1

    const-string v3, "SUB"

    aput-object v3, v0, v1

    const/16 v1, 0x1f2

    const-string v3, "SUD"

    aput-object v3, v0, v1

    const/16 v1, 0x1f3

    const-string v3, "SUE"

    aput-object v3, v0, v1

    const/16 v1, 0x1f4

    const-string v3, "SUM"

    aput-object v3, v0, v1

    const/16 v1, 0x1f5

    const-string v3, "SUN"

    aput-object v3, v0, v1

    const/16 v1, 0x1f6

    const-string v3, "SUP"

    aput-object v3, v0, v1

    const/16 v1, 0x1f7

    const-string v3, "TAB"

    aput-object v3, v0, v1

    const/16 v1, 0x1f8

    const-string v3, "TAD"

    aput-object v3, v0, v1

    const/16 v1, 0x1f9

    const-string v3, "TAG"

    aput-object v3, v0, v1

    const/16 v1, 0x1fa

    const-string v3, "TAN"

    aput-object v3, v0, v1

    const/16 v1, 0x1fb

    const-string v3, "TAP"

    aput-object v3, v0, v1

    const/16 v1, 0x1fc

    const-string v3, "TAR"

    aput-object v3, v0, v1

    const/16 v1, 0x1fd

    const-string v3, "TEA"

    aput-object v3, v0, v1

    const/16 v1, 0x1fe

    const-string v3, "TED"

    aput-object v3, v0, v1

    const/16 v1, 0x1ff

    const-string v3, "TEE"

    aput-object v3, v0, v1

    const/16 v1, 0x200

    const-string v3, "TEN"

    aput-object v3, v0, v1

    const/16 v1, 0x201

    const-string v3, "THE"

    aput-object v3, v0, v1

    const/16 v1, 0x202

    const-string v3, "THY"

    aput-object v3, v0, v1

    const/16 v1, 0x203

    const-string v3, "TIC"

    aput-object v3, v0, v1

    const/16 v1, 0x204

    const-string v3, "TIE"

    aput-object v3, v0, v1

    const/16 v1, 0x205

    const-string v3, "TIM"

    aput-object v3, v0, v1

    const/16 v1, 0x206

    const-string v3, "TIN"

    aput-object v3, v0, v1

    const/16 v1, 0x207

    const-string v3, "TIP"

    aput-object v3, v0, v1

    const/16 v1, 0x208

    const-string v3, "TO"

    aput-object v3, v0, v1

    const/16 v1, 0x209

    const-string v3, "TOE"

    aput-object v3, v0, v1

    const/16 v1, 0x20a

    const-string v3, "TOG"

    aput-object v3, v0, v1

    const/16 v1, 0x20b

    const-string v3, "TOM"

    aput-object v3, v0, v1

    const/16 v1, 0x20c

    const-string v3, "TON"

    aput-object v3, v0, v1

    const/16 v1, 0x20d

    const-string v3, "TOO"

    aput-object v3, v0, v1

    const/16 v1, 0x20e

    const-string v3, "TOP"

    aput-object v3, v0, v1

    const/16 v1, 0x20f

    const-string v3, "TOW"

    aput-object v3, v0, v1

    const/16 v1, 0x210

    const-string v3, "TOY"

    aput-object v3, v0, v1

    const/16 v1, 0x211

    const-string v3, "TRY"

    aput-object v3, v0, v1

    const/16 v1, 0x212

    const-string v3, "TUB"

    aput-object v3, v0, v1

    const/16 v1, 0x213

    const-string v3, "TUG"

    aput-object v3, v0, v1

    const/16 v1, 0x214

    const-string v3, "TUM"

    aput-object v3, v0, v1

    const/16 v1, 0x215

    const-string v3, "TUN"

    aput-object v3, v0, v1

    const/16 v1, 0x216

    const-string v3, "TWO"

    aput-object v3, v0, v1

    const/16 v1, 0x217

    const-string v3, "UN"

    aput-object v3, v0, v1

    const/16 v1, 0x218

    const-string v3, "UP"

    aput-object v3, v0, v1

    const/16 v1, 0x219

    const-string v3, "US"

    aput-object v3, v0, v1

    const/16 v1, 0x21a

    const-string v3, "USE"

    aput-object v3, v0, v1

    const/16 v1, 0x21b

    const-string v3, "VAN"

    aput-object v3, v0, v1

    const/16 v1, 0x21c

    const-string v3, "VAT"

    aput-object v3, v0, v1

    const/16 v1, 0x21d

    const-string v3, "VET"

    aput-object v3, v0, v1

    const/16 v1, 0x21e

    const-string v3, "VIE"

    aput-object v3, v0, v1

    const/16 v1, 0x21f

    const-string v3, "WAD"

    aput-object v3, v0, v1

    const/16 v1, 0x220

    const-string v3, "WAG"

    aput-object v3, v0, v1

    const/16 v1, 0x221

    const-string v3, "WAR"

    aput-object v3, v0, v1

    const/16 v1, 0x222

    const-string v3, "WAS"

    aput-object v3, v0, v1

    const/16 v1, 0x223

    const-string v3, "WAY"

    aput-object v3, v0, v1

    const/16 v1, 0x224

    const-string v3, "WE"

    aput-object v3, v0, v1

    const/16 v1, 0x225

    const-string v3, "WEB"

    aput-object v3, v0, v1

    const/16 v1, 0x226

    const-string v3, "WED"

    aput-object v3, v0, v1

    const/16 v1, 0x227

    const-string v3, "WEE"

    aput-object v3, v0, v1

    const/16 v1, 0x228

    const-string v3, "WET"

    aput-object v3, v0, v1

    const/16 v1, 0x229

    const-string v3, "WHO"

    aput-object v3, v0, v1

    const/16 v1, 0x22a

    const-string v3, "WHY"

    aput-object v3, v0, v1

    const/16 v1, 0x22b

    const-string v3, "WIN"

    aput-object v3, v0, v1

    const/16 v1, 0x22c

    const-string v3, "WIT"

    aput-object v3, v0, v1

    const/16 v1, 0x22d

    const-string v3, "WOK"

    aput-object v3, v0, v1

    const/16 v1, 0x22e

    const-string v3, "WON"

    aput-object v3, v0, v1

    const/16 v1, 0x22f

    const-string v3, "WOO"

    aput-object v3, v0, v1

    const/16 v1, 0x230

    const-string v3, "WOW"

    aput-object v3, v0, v1

    const/16 v1, 0x231

    const-string v3, "WRY"

    aput-object v3, v0, v1

    const/16 v1, 0x232

    const-string v3, "WU"

    aput-object v3, v0, v1

    const/16 v1, 0x233

    const-string v3, "YAM"

    aput-object v3, v0, v1

    const/16 v1, 0x234

    const-string v3, "YAP"

    aput-object v3, v0, v1

    const/16 v1, 0x235

    const-string v3, "YAW"

    aput-object v3, v0, v1

    const/16 v1, 0x236

    const-string v3, "YE"

    aput-object v3, v0, v1

    const/16 v1, 0x237

    const-string v3, "YEA"

    aput-object v3, v0, v1

    const/16 v1, 0x238

    const-string v3, "YES"

    aput-object v3, v0, v1

    const/16 v1, 0x239

    const-string v3, "YET"

    aput-object v3, v0, v1

    const/16 v1, 0x23a

    const-string v3, "YOU"

    aput-object v3, v0, v1

    const/16 v1, 0x23b

    const-string v3, "ABED"

    aput-object v3, v0, v1

    const/16 v1, 0x23c

    const-string v3, "ABEL"

    aput-object v3, v0, v1

    const/16 v1, 0x23d

    const-string v3, "ABET"

    aput-object v3, v0, v1

    const/16 v1, 0x23e

    const-string v3, "ABLE"

    aput-object v3, v0, v1

    const/16 v1, 0x23f

    const-string v3, "ABUT"

    aput-object v3, v0, v1

    const/16 v1, 0x240

    const-string v3, "ACHE"

    aput-object v3, v0, v1

    const/16 v1, 0x241

    const-string v3, "ACID"

    aput-object v3, v0, v1

    const/16 v1, 0x242

    const-string v3, "ACME"

    aput-object v3, v0, v1

    const/16 v1, 0x243

    const-string v3, "ACRE"

    aput-object v3, v0, v1

    const/16 v1, 0x244

    const-string v3, "ACTA"

    aput-object v3, v0, v1

    const/16 v1, 0x245

    const-string v3, "ACTS"

    aput-object v3, v0, v1

    const/16 v1, 0x246

    const-string v3, "ADAM"

    aput-object v3, v0, v1

    const/16 v1, 0x247

    const-string v3, "ADDS"

    aput-object v3, v0, v1

    const/16 v1, 0x248

    const-string v3, "ADEN"

    aput-object v3, v0, v1

    const/16 v1, 0x249

    const-string v3, "AFAR"

    aput-object v3, v0, v1

    const/16 v1, 0x24a

    const-string v3, "AFRO"

    aput-object v3, v0, v1

    const/16 v1, 0x24b

    const-string v3, "AGEE"

    aput-object v3, v0, v1

    const/16 v1, 0x24c

    const-string v3, "AHEM"

    aput-object v3, v0, v1

    const/16 v1, 0x24d

    const-string v3, "AHOY"

    aput-object v3, v0, v1

    const/16 v1, 0x24e

    const-string v3, "AIDA"

    aput-object v3, v0, v1

    const/16 v1, 0x24f

    const-string v3, "AIDE"

    aput-object v3, v0, v1

    const/16 v1, 0x250

    const-string v3, "AIDS"

    aput-object v3, v0, v1

    const/16 v1, 0x251

    const-string v3, "AIRY"

    aput-object v3, v0, v1

    const/16 v1, 0x252

    const-string v3, "AJAR"

    aput-object v3, v0, v1

    const/16 v1, 0x253

    const-string v3, "AKIN"

    aput-object v3, v0, v1

    const/16 v1, 0x254

    const-string v3, "ALAN"

    aput-object v3, v0, v1

    const/16 v1, 0x255

    const-string v3, "ALEC"

    aput-object v3, v0, v1

    const/16 v1, 0x256

    const-string v3, "ALGA"

    aput-object v3, v0, v1

    const/16 v1, 0x257

    const-string v3, "ALIA"

    aput-object v3, v0, v1

    const/16 v1, 0x258

    const-string v3, "ALLY"

    aput-object v3, v0, v1

    const/16 v1, 0x259

    const-string v3, "ALMA"

    aput-object v3, v0, v1

    const/16 v1, 0x25a

    const-string v3, "ALOE"

    aput-object v3, v0, v1

    const/16 v1, 0x25b

    const-string v3, "ALSO"

    aput-object v3, v0, v1

    const/16 v1, 0x25c

    const-string v3, "ALTO"

    aput-object v3, v0, v1

    const/16 v1, 0x25d

    const-string v3, "ALUM"

    aput-object v3, v0, v1

    const/16 v1, 0x25e

    const-string v3, "ALVA"

    aput-object v3, v0, v1

    const/16 v1, 0x25f

    const-string v3, "AMEN"

    aput-object v3, v0, v1

    const/16 v1, 0x260

    const-string v3, "AMES"

    aput-object v3, v0, v1

    const/16 v1, 0x261

    const-string v3, "AMID"

    aput-object v3, v0, v1

    const/16 v1, 0x262

    const-string v3, "AMMO"

    aput-object v3, v0, v1

    const/16 v1, 0x263

    const-string v3, "AMOK"

    aput-object v3, v0, v1

    const/16 v1, 0x264

    const-string v3, "AMOS"

    aput-object v3, v0, v1

    const/16 v1, 0x265

    const-string v3, "AMRA"

    aput-object v3, v0, v1

    const/16 v1, 0x266

    const-string v3, "ANDY"

    aput-object v3, v0, v1

    const/16 v1, 0x267

    const-string v3, "ANEW"

    aput-object v3, v0, v1

    const/16 v1, 0x268

    const-string v3, "ANNA"

    aput-object v3, v0, v1

    const/16 v1, 0x269

    const-string v3, "ANNE"

    aput-object v3, v0, v1

    const/16 v1, 0x26a

    const-string v3, "ANTE"

    aput-object v3, v0, v1

    const/16 v1, 0x26b

    const-string v3, "ANTI"

    aput-object v3, v0, v1

    const/16 v1, 0x26c

    const-string v3, "AQUA"

    aput-object v3, v0, v1

    const/16 v1, 0x26d

    const-string v3, "ARAB"

    aput-object v3, v0, v1

    const/16 v1, 0x26e

    const-string v3, "ARCH"

    aput-object v3, v0, v1

    const/16 v1, 0x26f

    const-string v3, "AREA"

    aput-object v3, v0, v1

    const/16 v1, 0x270

    const-string v3, "ARGO"

    aput-object v3, v0, v1

    const/16 v1, 0x271

    const-string v3, "ARID"

    aput-object v3, v0, v1

    const/16 v1, 0x272

    const-string v3, "ARMY"

    aput-object v3, v0, v1

    const/16 v1, 0x273

    const-string v3, "ARTS"

    aput-object v3, v0, v1

    const/16 v1, 0x274

    const-string v3, "ARTY"

    aput-object v3, v0, v1

    const/16 v1, 0x275

    const-string v3, "ASIA"

    aput-object v3, v0, v1

    const/16 v1, 0x276

    const-string v3, "ASKS"

    aput-object v3, v0, v1

    const/16 v1, 0x277

    const-string v3, "ATOM"

    aput-object v3, v0, v1

    const/16 v1, 0x278

    const-string v3, "AUNT"

    aput-object v3, v0, v1

    const/16 v1, 0x279

    const-string v3, "AURA"

    aput-object v3, v0, v1

    const/16 v1, 0x27a

    const-string v3, "AUTO"

    aput-object v3, v0, v1

    const/16 v1, 0x27b

    const-string v3, "AVER"

    aput-object v3, v0, v1

    const/16 v1, 0x27c

    const-string v3, "AVID"

    aput-object v3, v0, v1

    const/16 v1, 0x27d

    const-string v3, "AVIS"

    aput-object v3, v0, v1

    const/16 v1, 0x27e

    const-string v3, "AVON"

    aput-object v3, v0, v1

    const/16 v1, 0x27f

    const-string v3, "AVOW"

    aput-object v3, v0, v1

    const/16 v1, 0x280

    const-string v3, "AWAY"

    aput-object v3, v0, v1

    const/16 v1, 0x281

    const-string v3, "AWRY"

    aput-object v3, v0, v1

    const/16 v1, 0x282

    const-string v3, "BABE"

    aput-object v3, v0, v1

    const/16 v1, 0x283

    const-string v3, "BABY"

    aput-object v3, v0, v1

    const/16 v1, 0x284

    const-string v3, "BACH"

    aput-object v3, v0, v1

    const/16 v1, 0x285

    const-string v3, "BACK"

    aput-object v3, v0, v1

    const/16 v1, 0x286

    const-string v3, "BADE"

    aput-object v3, v0, v1

    const/16 v1, 0x287

    const-string v3, "BAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x288

    const-string v3, "BAIT"

    aput-object v3, v0, v1

    const/16 v1, 0x289

    const-string v3, "BAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x28a

    const-string v3, "BALD"

    aput-object v3, v0, v1

    const/16 v1, 0x28b

    const-string v3, "BALE"

    aput-object v3, v0, v1

    const/16 v1, 0x28c

    const-string v3, "BALI"

    aput-object v3, v0, v1

    const/16 v1, 0x28d

    const-string v3, "BALK"

    aput-object v3, v0, v1

    const/16 v1, 0x28e

    const-string v3, "BALL"

    aput-object v3, v0, v1

    const/16 v1, 0x28f

    const-string v3, "BALM"

    aput-object v3, v0, v1

    const/16 v1, 0x290

    const-string v3, "BAND"

    aput-object v3, v0, v1

    const/16 v1, 0x291

    const-string v3, "BANE"

    aput-object v3, v0, v1

    const/16 v1, 0x292

    const-string v3, "BANG"

    aput-object v3, v0, v1

    const/16 v1, 0x293

    const-string v3, "BANK"

    aput-object v3, v0, v1

    const/16 v1, 0x294

    const-string v3, "BARB"

    aput-object v3, v0, v1

    const/16 v1, 0x295

    const-string v3, "BARD"

    aput-object v3, v0, v1

    const/16 v1, 0x296

    const-string v3, "BARE"

    aput-object v3, v0, v1

    const/16 v1, 0x297

    const-string v3, "BARK"

    aput-object v3, v0, v1

    const/16 v1, 0x298

    const-string v3, "BARN"

    aput-object v3, v0, v1

    const/16 v1, 0x299

    const-string v3, "BARR"

    aput-object v3, v0, v1

    const/16 v1, 0x29a

    const-string v3, "BASE"

    aput-object v3, v0, v1

    const/16 v1, 0x29b

    const-string v3, "BASH"

    aput-object v3, v0, v1

    const/16 v1, 0x29c

    const-string v3, "BASK"

    aput-object v3, v0, v1

    const/16 v1, 0x29d

    const-string v3, "BASS"

    aput-object v3, v0, v1

    const/16 v1, 0x29e

    const-string v3, "BATE"

    aput-object v3, v0, v1

    const/16 v1, 0x29f

    const-string v3, "BATH"

    aput-object v3, v0, v1

    const/16 v1, 0x2a0

    const-string v3, "BAWD"

    aput-object v3, v0, v1

    const/16 v1, 0x2a1

    const-string v3, "BAWL"

    aput-object v3, v0, v1

    const/16 v1, 0x2a2

    const-string v3, "BEAD"

    aput-object v3, v0, v1

    const/16 v1, 0x2a3

    const-string v3, "BEAK"

    aput-object v3, v0, v1

    const/16 v1, 0x2a4

    const-string v3, "BEAM"

    aput-object v3, v0, v1

    const/16 v1, 0x2a5

    const-string v3, "BEAN"

    aput-object v3, v0, v1

    const/16 v1, 0x2a6

    const-string v3, "BEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x2a7

    const-string v3, "BEAT"

    aput-object v3, v0, v1

    const/16 v1, 0x2a8

    const-string v3, "BEAU"

    aput-object v3, v0, v1

    const/16 v1, 0x2a9

    const-string v3, "BECK"

    aput-object v3, v0, v1

    const/16 v1, 0x2aa

    const-string v3, "BEEF"

    aput-object v3, v0, v1

    const/16 v1, 0x2ab

    const-string v3, "BEEN"

    aput-object v3, v0, v1

    const/16 v1, 0x2ac

    const-string v3, "BEER"

    aput-object v3, v0, v1

    const/16 v1, 0x2ad

    const-string v3, "BEET"

    aput-object v3, v0, v1

    const/16 v1, 0x2ae

    const-string v3, "BELA"

    aput-object v3, v0, v1

    const/16 v1, 0x2af

    const-string v3, "BELL"

    aput-object v3, v0, v1

    const/16 v1, 0x2b0

    const-string v3, "BELT"

    aput-object v3, v0, v1

    const/16 v1, 0x2b1

    const-string v3, "BEND"

    aput-object v3, v0, v1

    const/16 v1, 0x2b2

    const-string v3, "BENT"

    aput-object v3, v0, v1

    const/16 v1, 0x2b3

    const-string v3, "BERG"

    aput-object v3, v0, v1

    const/16 v1, 0x2b4

    const-string v3, "BERN"

    aput-object v3, v0, v1

    const/16 v1, 0x2b5

    const-string v3, "BERT"

    aput-object v3, v0, v1

    const/16 v1, 0x2b6

    const-string v3, "BESS"

    aput-object v3, v0, v1

    const/16 v1, 0x2b7

    const-string v3, "BEST"

    aput-object v3, v0, v1

    const/16 v1, 0x2b8

    const-string v3, "BETA"

    aput-object v3, v0, v1

    const/16 v1, 0x2b9

    const-string v3, "BETH"

    aput-object v3, v0, v1

    const/16 v1, 0x2ba

    const-string v3, "BHOY"

    aput-object v3, v0, v1

    const/16 v1, 0x2bb

    const-string v3, "BIAS"

    aput-object v3, v0, v1

    const/16 v1, 0x2bc

    const-string v3, "BIDE"

    aput-object v3, v0, v1

    const/16 v1, 0x2bd

    const-string v3, "BIEN"

    aput-object v3, v0, v1

    const/16 v1, 0x2be

    const-string v3, "BILE"

    aput-object v3, v0, v1

    const/16 v1, 0x2bf

    const-string v3, "BILK"

    aput-object v3, v0, v1

    const/16 v1, 0x2c0

    const-string v3, "BILL"

    aput-object v3, v0, v1

    const/16 v1, 0x2c1

    const-string v3, "BIND"

    aput-object v3, v0, v1

    const/16 v1, 0x2c2

    const-string v3, "BING"

    aput-object v3, v0, v1

    const/16 v1, 0x2c3

    const-string v3, "BIRD"

    aput-object v3, v0, v1

    const/16 v1, 0x2c4

    const-string v3, "BITE"

    aput-object v3, v0, v1

    const/16 v1, 0x2c5

    const-string v3, "BITS"

    aput-object v3, v0, v1

    const/16 v1, 0x2c6

    const-string v3, "BLAB"

    aput-object v3, v0, v1

    const/16 v1, 0x2c7

    const-string v3, "BLAT"

    aput-object v3, v0, v1

    const/16 v1, 0x2c8

    const-string v3, "BLED"

    aput-object v3, v0, v1

    const/16 v1, 0x2c9

    const-string v3, "BLEW"

    aput-object v3, v0, v1

    const/16 v1, 0x2ca

    const-string v3, "BLOB"

    aput-object v3, v0, v1

    const/16 v1, 0x2cb

    const-string v3, "BLOC"

    aput-object v3, v0, v1

    const/16 v1, 0x2cc

    const-string v3, "BLOT"

    aput-object v3, v0, v1

    const/16 v1, 0x2cd

    const-string v3, "BLOW"

    aput-object v3, v0, v1

    const/16 v1, 0x2ce

    const-string v3, "BLUE"

    aput-object v3, v0, v1

    const/16 v1, 0x2cf

    const-string v3, "BLUM"

    aput-object v3, v0, v1

    const/16 v1, 0x2d0

    const-string v3, "BLUR"

    aput-object v3, v0, v1

    const/16 v1, 0x2d1

    const-string v3, "BOAR"

    aput-object v3, v0, v1

    const/16 v1, 0x2d2

    const-string v3, "BOAT"

    aput-object v3, v0, v1

    const/16 v1, 0x2d3

    const-string v3, "BOCA"

    aput-object v3, v0, v1

    const/16 v1, 0x2d4

    const-string v3, "BOCK"

    aput-object v3, v0, v1

    const/16 v1, 0x2d5

    const-string v3, "BODE"

    aput-object v3, v0, v1

    const/16 v1, 0x2d6

    const-string v3, "BODY"

    aput-object v3, v0, v1

    const/16 v1, 0x2d7

    const-string v3, "BOGY"

    aput-object v3, v0, v1

    const/16 v1, 0x2d8

    const-string v3, "BOHR"

    aput-object v3, v0, v1

    const/16 v1, 0x2d9

    const-string v3, "BOIL"

    aput-object v3, v0, v1

    const/16 v1, 0x2da

    const-string v3, "BOLD"

    aput-object v3, v0, v1

    const/16 v1, 0x2db

    const-string v3, "BOLO"

    aput-object v3, v0, v1

    const/16 v1, 0x2dc

    const-string v3, "BOLT"

    aput-object v3, v0, v1

    const/16 v1, 0x2dd

    const-string v3, "BOMB"

    aput-object v3, v0, v1

    const/16 v1, 0x2de

    const-string v3, "BONA"

    aput-object v3, v0, v1

    const/16 v1, 0x2df

    const-string v3, "BOND"

    aput-object v3, v0, v1

    const/16 v1, 0x2e0

    const-string v3, "BONE"

    aput-object v3, v0, v1

    const/16 v1, 0x2e1

    const-string v3, "BONG"

    aput-object v3, v0, v1

    const/16 v1, 0x2e2

    const-string v3, "BONN"

    aput-object v3, v0, v1

    const/16 v1, 0x2e3

    const-string v3, "BONY"

    aput-object v3, v0, v1

    const/16 v1, 0x2e4

    const-string v3, "BOOK"

    aput-object v3, v0, v1

    const/16 v1, 0x2e5

    const-string v3, "BOOM"

    aput-object v3, v0, v1

    const/16 v1, 0x2e6

    const-string v3, "BOON"

    aput-object v3, v0, v1

    const/16 v1, 0x2e7

    const-string v3, "BOOT"

    aput-object v3, v0, v1

    const/16 v1, 0x2e8

    const-string v3, "BORE"

    aput-object v3, v0, v1

    const/16 v1, 0x2e9

    const-string v3, "BORG"

    aput-object v3, v0, v1

    const/16 v1, 0x2ea

    const-string v3, "BORN"

    aput-object v3, v0, v1

    const/16 v1, 0x2eb

    const-string v3, "BOSE"

    aput-object v3, v0, v1

    const/16 v1, 0x2ec

    const-string v3, "BOSS"

    aput-object v3, v0, v1

    const/16 v1, 0x2ed

    const-string v3, "BOTH"

    aput-object v3, v0, v1

    const/16 v1, 0x2ee

    const-string v3, "BOUT"

    aput-object v3, v0, v1

    const/16 v1, 0x2ef

    const-string v3, "BOWL"

    aput-object v3, v0, v1

    const/16 v1, 0x2f0

    const-string v3, "BOYD"

    aput-object v3, v0, v1

    const/16 v1, 0x2f1

    const-string v3, "BRAD"

    aput-object v3, v0, v1

    const/16 v1, 0x2f2

    const-string v3, "BRAE"

    aput-object v3, v0, v1

    const/16 v1, 0x2f3

    const-string v3, "BRAG"

    aput-object v3, v0, v1

    const/16 v1, 0x2f4

    const-string v3, "BRAN"

    aput-object v3, v0, v1

    const/16 v1, 0x2f5

    const-string v3, "BRAY"

    aput-object v3, v0, v1

    const/16 v1, 0x2f6

    const-string v3, "BRED"

    aput-object v3, v0, v1

    const/16 v1, 0x2f7

    const-string v3, "BREW"

    aput-object v3, v0, v1

    const/16 v1, 0x2f8

    const-string v3, "BRIG"

    aput-object v3, v0, v1

    const/16 v1, 0x2f9

    const-string v3, "BRIM"

    aput-object v3, v0, v1

    const/16 v1, 0x2fa

    const-string v3, "BROW"

    aput-object v3, v0, v1

    const/16 v1, 0x2fb

    const-string v3, "BUCK"

    aput-object v3, v0, v1

    const/16 v1, 0x2fc

    const-string v3, "BUDD"

    aput-object v3, v0, v1

    const/16 v1, 0x2fd

    const-string v3, "BUFF"

    aput-object v3, v0, v1

    const/16 v1, 0x2fe

    const-string v3, "BULB"

    aput-object v3, v0, v1

    const/16 v1, 0x2ff

    const-string v3, "BULK"

    aput-object v3, v0, v1

    const/16 v1, 0x300

    const-string v3, "BULL"

    aput-object v3, v0, v1

    const/16 v1, 0x301

    const-string v3, "BUNK"

    aput-object v3, v0, v1

    const/16 v1, 0x302

    const-string v3, "BUNT"

    aput-object v3, v0, v1

    const/16 v1, 0x303

    const-string v3, "BUOY"

    aput-object v3, v0, v1

    const/16 v1, 0x304

    const-string v3, "BURG"

    aput-object v3, v0, v1

    const/16 v1, 0x305

    const-string v3, "BURL"

    aput-object v3, v0, v1

    const/16 v1, 0x306

    const-string v3, "BURN"

    aput-object v3, v0, v1

    const/16 v1, 0x307

    const-string v3, "BURR"

    aput-object v3, v0, v1

    const/16 v1, 0x308

    const-string v3, "BURT"

    aput-object v3, v0, v1

    const/16 v1, 0x309

    const-string v3, "BURY"

    aput-object v3, v0, v1

    const/16 v1, 0x30a

    const-string v3, "BUSH"

    aput-object v3, v0, v1

    const/16 v1, 0x30b

    const-string v3, "BUSS"

    aput-object v3, v0, v1

    const/16 v1, 0x30c

    const-string v3, "BUST"

    aput-object v3, v0, v1

    const/16 v1, 0x30d

    const-string v3, "BUSY"

    aput-object v3, v0, v1

    const/16 v1, 0x30e

    const-string v3, "BYTE"

    aput-object v3, v0, v1

    const/16 v1, 0x30f

    const-string v3, "CADY"

    aput-object v3, v0, v1

    const/16 v1, 0x310

    const-string v3, "CAFE"

    aput-object v3, v0, v1

    const/16 v1, 0x311

    const-string v3, "CAGE"

    aput-object v3, v0, v1

    const/16 v1, 0x312

    const-string v3, "CAIN"

    aput-object v3, v0, v1

    const/16 v1, 0x313

    const-string v3, "CAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x314

    const-string v3, "CALF"

    aput-object v3, v0, v1

    const/16 v1, 0x315

    const-string v3, "CALL"

    aput-object v3, v0, v1

    const/16 v1, 0x316

    const-string v3, "CALM"

    aput-object v3, v0, v1

    const/16 v1, 0x317

    const-string v3, "CAME"

    aput-object v3, v0, v1

    const/16 v1, 0x318

    const-string v3, "CANE"

    aput-object v3, v0, v1

    const/16 v1, 0x319

    const-string v3, "CANT"

    aput-object v3, v0, v1

    const/16 v1, 0x31a

    const-string v3, "CARD"

    aput-object v3, v0, v1

    const/16 v1, 0x31b

    const-string v3, "CARE"

    aput-object v3, v0, v1

    const/16 v1, 0x31c

    const-string v3, "CARL"

    aput-object v3, v0, v1

    const/16 v1, 0x31d

    const-string v3, "CARR"

    aput-object v3, v0, v1

    const/16 v1, 0x31e

    const-string v3, "CART"

    aput-object v3, v0, v1

    const/16 v1, 0x31f

    const-string v3, "CASE"

    aput-object v3, v0, v1

    const/16 v1, 0x320

    const-string v3, "CASH"

    aput-object v3, v0, v1

    const/16 v1, 0x321

    const-string v3, "CASK"

    aput-object v3, v0, v1

    const/16 v1, 0x322

    const-string v3, "CAST"

    aput-object v3, v0, v1

    const/16 v1, 0x323

    const-string v3, "CAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x324

    const-string v3, "CEIL"

    aput-object v3, v0, v1

    const/16 v1, 0x325

    const-string v3, "CELL"

    aput-object v3, v0, v1

    const/16 v1, 0x326

    const-string v3, "CENT"

    aput-object v3, v0, v1

    const/16 v1, 0x327

    const-string v3, "CERN"

    aput-object v3, v0, v1

    const/16 v1, 0x328

    const-string v3, "CHAD"

    aput-object v3, v0, v1

    const/16 v1, 0x329

    const-string v3, "CHAR"

    aput-object v3, v0, v1

    const/16 v1, 0x32a

    const-string v3, "CHAT"

    aput-object v3, v0, v1

    const/16 v1, 0x32b

    const-string v3, "CHAW"

    aput-object v3, v0, v1

    const/16 v1, 0x32c

    const-string v3, "CHEF"

    aput-object v3, v0, v1

    const/16 v1, 0x32d

    const-string v3, "CHEN"

    aput-object v3, v0, v1

    const/16 v1, 0x32e

    const-string v3, "CHEW"

    aput-object v3, v0, v1

    const/16 v1, 0x32f

    const-string v3, "CHIC"

    aput-object v3, v0, v1

    const/16 v1, 0x330

    const-string v3, "CHIN"

    aput-object v3, v0, v1

    const/16 v1, 0x331

    const-string v3, "CHOU"

    aput-object v3, v0, v1

    const/16 v1, 0x332

    const-string v3, "CHOW"

    aput-object v3, v0, v1

    const/16 v1, 0x333

    const-string v3, "CHUB"

    aput-object v3, v0, v1

    const/16 v1, 0x334

    const-string v3, "CHUG"

    aput-object v3, v0, v1

    const/16 v1, 0x335

    const-string v3, "CHUM"

    aput-object v3, v0, v1

    const/16 v1, 0x336

    const-string v3, "CITE"

    aput-object v3, v0, v1

    const/16 v1, 0x337

    const-string v3, "CITY"

    aput-object v3, v0, v1

    const/16 v1, 0x338

    const-string v3, "CLAD"

    aput-object v3, v0, v1

    const/16 v1, 0x339

    const-string v3, "CLAM"

    aput-object v3, v0, v1

    const/16 v1, 0x33a

    const-string v3, "CLAN"

    aput-object v3, v0, v1

    const/16 v1, 0x33b

    const-string v3, "CLAW"

    aput-object v3, v0, v1

    const/16 v1, 0x33c

    const-string v3, "CLAY"

    aput-object v3, v0, v1

    const/16 v1, 0x33d

    const-string v3, "CLOD"

    aput-object v3, v0, v1

    const/16 v1, 0x33e

    const-string v3, "CLOG"

    aput-object v3, v0, v1

    const/16 v1, 0x33f

    const-string v3, "CLOT"

    aput-object v3, v0, v1

    const/16 v1, 0x340

    const-string v3, "CLUB"

    aput-object v3, v0, v1

    const/16 v1, 0x341

    const-string v3, "CLUE"

    aput-object v3, v0, v1

    const/16 v1, 0x342

    const-string v3, "COAL"

    aput-object v3, v0, v1

    const/16 v1, 0x343

    const-string v3, "COAT"

    aput-object v3, v0, v1

    const/16 v1, 0x344

    const-string v3, "COCA"

    aput-object v3, v0, v1

    const/16 v1, 0x345

    const-string v3, "COCK"

    aput-object v3, v0, v1

    const/16 v1, 0x346

    const-string v3, "COCO"

    aput-object v3, v0, v1

    const/16 v1, 0x347

    const-string v3, "CODA"

    aput-object v3, v0, v1

    const/16 v1, 0x348

    const-string v3, "CODE"

    aput-object v3, v0, v1

    const/16 v1, 0x349

    const-string v3, "CODY"

    aput-object v3, v0, v1

    const/16 v1, 0x34a

    const-string v3, "COED"

    aput-object v3, v0, v1

    const/16 v1, 0x34b

    const-string v3, "COIL"

    aput-object v3, v0, v1

    const/16 v1, 0x34c

    const-string v3, "COIN"

    aput-object v3, v0, v1

    const/16 v1, 0x34d

    const-string v3, "COKE"

    aput-object v3, v0, v1

    const/16 v1, 0x34e

    const-string v3, "COLA"

    aput-object v3, v0, v1

    const/16 v1, 0x34f

    const-string v3, "COLD"

    aput-object v3, v0, v1

    const/16 v1, 0x350

    const-string v3, "COLT"

    aput-object v3, v0, v1

    const/16 v1, 0x351

    const-string v3, "COMA"

    aput-object v3, v0, v1

    const/16 v1, 0x352

    const-string v3, "COMB"

    aput-object v3, v0, v1

    const/16 v1, 0x353

    const-string v3, "COME"

    aput-object v3, v0, v1

    const/16 v1, 0x354

    const-string v3, "COOK"

    aput-object v3, v0, v1

    const/16 v1, 0x355

    const-string v3, "COOL"

    aput-object v3, v0, v1

    const/16 v1, 0x356

    const-string v3, "COON"

    aput-object v3, v0, v1

    const/16 v1, 0x357

    const-string v3, "COOT"

    aput-object v3, v0, v1

    const/16 v1, 0x358

    const-string v3, "CORD"

    aput-object v3, v0, v1

    const/16 v1, 0x359

    const-string v3, "CORE"

    aput-object v3, v0, v1

    const/16 v1, 0x35a

    const-string v3, "CORK"

    aput-object v3, v0, v1

    const/16 v1, 0x35b

    const-string v3, "CORN"

    aput-object v3, v0, v1

    const/16 v1, 0x35c

    const-string v3, "COST"

    aput-object v3, v0, v1

    const/16 v1, 0x35d

    const-string v3, "COVE"

    aput-object v3, v0, v1

    const/16 v1, 0x35e

    const-string v3, "COWL"

    aput-object v3, v0, v1

    const/16 v1, 0x35f

    const-string v3, "CRAB"

    aput-object v3, v0, v1

    const/16 v1, 0x360

    const-string v3, "CRAG"

    aput-object v3, v0, v1

    const/16 v1, 0x361

    const-string v3, "CRAM"

    aput-object v3, v0, v1

    const/16 v1, 0x362

    const-string v3, "CRAY"

    aput-object v3, v0, v1

    const/16 v1, 0x363

    const-string v3, "CREW"

    aput-object v3, v0, v1

    const/16 v1, 0x364

    const-string v3, "CRIB"

    aput-object v3, v0, v1

    const/16 v1, 0x365

    const-string v3, "CROW"

    aput-object v3, v0, v1

    const/16 v1, 0x366

    const-string v3, "CRUD"

    aput-object v3, v0, v1

    const/16 v1, 0x367

    const-string v3, "CUBA"

    aput-object v3, v0, v1

    const/16 v1, 0x368

    const-string v3, "CUBE"

    aput-object v3, v0, v1

    const/16 v1, 0x369

    const-string v3, "CUFF"

    aput-object v3, v0, v1

    const/16 v1, 0x36a

    const-string v3, "CULL"

    aput-object v3, v0, v1

    const/16 v1, 0x36b

    const-string v3, "CULT"

    aput-object v3, v0, v1

    const/16 v1, 0x36c

    const-string v3, "CUNY"

    aput-object v3, v0, v1

    const/16 v1, 0x36d

    const-string v3, "CURB"

    aput-object v3, v0, v1

    const/16 v1, 0x36e

    const-string v3, "CURD"

    aput-object v3, v0, v1

    const/16 v1, 0x36f

    const-string v3, "CURE"

    aput-object v3, v0, v1

    const/16 v1, 0x370

    const-string v3, "CURL"

    aput-object v3, v0, v1

    const/16 v1, 0x371

    const-string v3, "CURT"

    aput-object v3, v0, v1

    const/16 v1, 0x372

    const-string v3, "CUTS"

    aput-object v3, v0, v1

    const/16 v1, 0x373

    const-string v3, "DADE"

    aput-object v3, v0, v1

    const/16 v1, 0x374

    const-string v3, "DALE"

    aput-object v3, v0, v1

    const/16 v1, 0x375

    const-string v3, "DAME"

    aput-object v3, v0, v1

    const/16 v1, 0x376

    const-string v3, "DANA"

    aput-object v3, v0, v1

    const/16 v1, 0x377

    const-string v3, "DANE"

    aput-object v3, v0, v1

    const/16 v1, 0x378

    const-string v3, "DANG"

    aput-object v3, v0, v1

    const/16 v1, 0x379

    const-string v3, "DANK"

    aput-object v3, v0, v1

    const/16 v1, 0x37a

    const-string v3, "DARE"

    aput-object v3, v0, v1

    const/16 v1, 0x37b

    const-string v3, "DARK"

    aput-object v3, v0, v1

    const/16 v1, 0x37c

    const-string v3, "DARN"

    aput-object v3, v0, v1

    const/16 v1, 0x37d

    const-string v3, "DART"

    aput-object v3, v0, v1

    const/16 v1, 0x37e

    const-string v3, "DASH"

    aput-object v3, v0, v1

    const/16 v1, 0x37f

    const-string v3, "DATA"

    aput-object v3, v0, v1

    const/16 v1, 0x380

    const-string v3, "DATE"

    aput-object v3, v0, v1

    const/16 v1, 0x381

    const-string v3, "DAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x382

    const-string v3, "DAVY"

    aput-object v3, v0, v1

    const/16 v1, 0x383

    const-string v3, "DAWN"

    aput-object v3, v0, v1

    const/16 v1, 0x384

    const-string v3, "DAYS"

    aput-object v3, v0, v1

    const/16 v1, 0x385

    const-string v3, "DEAD"

    aput-object v3, v0, v1

    const/16 v1, 0x386

    const-string v3, "DEAF"

    aput-object v3, v0, v1

    const/16 v1, 0x387

    const-string v3, "DEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x388

    const-string v3, "DEAN"

    aput-object v3, v0, v1

    const/16 v1, 0x389

    const-string v3, "DEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x38a

    const-string v3, "DEBT"

    aput-object v3, v0, v1

    const/16 v1, 0x38b

    const-string v3, "DECK"

    aput-object v3, v0, v1

    const/16 v1, 0x38c

    const-string v3, "DEED"

    aput-object v3, v0, v1

    const/16 v1, 0x38d

    const-string v3, "DEEM"

    aput-object v3, v0, v1

    const/16 v1, 0x38e

    const-string v3, "DEER"

    aput-object v3, v0, v1

    const/16 v1, 0x38f

    const-string v3, "DEFT"

    aput-object v3, v0, v1

    const/16 v1, 0x390

    const-string v3, "DEFY"

    aput-object v3, v0, v1

    const/16 v1, 0x391

    const-string v3, "DELL"

    aput-object v3, v0, v1

    const/16 v1, 0x392

    const-string v3, "DENT"

    aput-object v3, v0, v1

    const/16 v1, 0x393

    const-string v3, "DENY"

    aput-object v3, v0, v1

    const/16 v1, 0x394

    const-string v3, "DESK"

    aput-object v3, v0, v1

    const/16 v1, 0x395

    const-string v3, "DIAL"

    aput-object v3, v0, v1

    const/16 v1, 0x396

    const-string v3, "DICE"

    aput-object v3, v0, v1

    const/16 v1, 0x397

    const-string v3, "DIED"

    aput-object v3, v0, v1

    const/16 v1, 0x398

    const-string v3, "DIET"

    aput-object v3, v0, v1

    const/16 v1, 0x399

    const-string v3, "DIME"

    aput-object v3, v0, v1

    const/16 v1, 0x39a

    const-string v3, "DINE"

    aput-object v3, v0, v1

    const/16 v1, 0x39b

    const-string v3, "DING"

    aput-object v3, v0, v1

    const/16 v1, 0x39c

    const-string v3, "DINT"

    aput-object v3, v0, v1

    const/16 v1, 0x39d

    const-string v3, "DIRE"

    aput-object v3, v0, v1

    const/16 v1, 0x39e

    const-string v3, "DIRT"

    aput-object v3, v0, v1

    const/16 v1, 0x39f

    const-string v3, "DISC"

    aput-object v3, v0, v1

    const/16 v1, 0x3a0

    const-string v3, "DISH"

    aput-object v3, v0, v1

    const/16 v1, 0x3a1

    const-string v3, "DISK"

    aput-object v3, v0, v1

    const/16 v1, 0x3a2

    const-string v3, "DIVE"

    aput-object v3, v0, v1

    const/16 v1, 0x3a3

    const-string v3, "DOCK"

    aput-object v3, v0, v1

    const/16 v1, 0x3a4

    const-string v3, "DOES"

    aput-object v3, v0, v1

    const/16 v1, 0x3a5

    const-string v3, "DOLE"

    aput-object v3, v0, v1

    const/16 v1, 0x3a6

    const-string v3, "DOLL"

    aput-object v3, v0, v1

    const/16 v1, 0x3a7

    const-string v3, "DOLT"

    aput-object v3, v0, v1

    const/16 v1, 0x3a8

    const-string v3, "DOME"

    aput-object v3, v0, v1

    const/16 v1, 0x3a9

    const-string v3, "DONE"

    aput-object v3, v0, v1

    const/16 v1, 0x3aa

    const-string v3, "DOOM"

    aput-object v3, v0, v1

    const/16 v1, 0x3ab

    const-string v3, "DOOR"

    aput-object v3, v0, v1

    const/16 v1, 0x3ac

    const-string v3, "DORA"

    aput-object v3, v0, v1

    const/16 v1, 0x3ad

    const-string v3, "DOSE"

    aput-object v3, v0, v1

    const/16 v1, 0x3ae

    const-string v3, "DOTE"

    aput-object v3, v0, v1

    const/16 v1, 0x3af

    const-string v3, "DOUG"

    aput-object v3, v0, v1

    const/16 v1, 0x3b0

    const-string v3, "DOUR"

    aput-object v3, v0, v1

    const/16 v1, 0x3b1

    const-string v3, "DOVE"

    aput-object v3, v0, v1

    const/16 v1, 0x3b2

    const-string v3, "DOWN"

    aput-object v3, v0, v1

    const/16 v1, 0x3b3

    const-string v3, "DRAB"

    aput-object v3, v0, v1

    const/16 v1, 0x3b4

    const-string v3, "DRAG"

    aput-object v3, v0, v1

    const/16 v1, 0x3b5

    const-string v3, "DRAM"

    aput-object v3, v0, v1

    const/16 v1, 0x3b6

    const-string v3, "DRAW"

    aput-object v3, v0, v1

    const/16 v1, 0x3b7

    const-string v3, "DREW"

    aput-object v3, v0, v1

    const/16 v1, 0x3b8

    const-string v3, "DRUB"

    aput-object v3, v0, v1

    const/16 v1, 0x3b9

    const-string v3, "DRUG"

    aput-object v3, v0, v1

    const/16 v1, 0x3ba

    const-string v3, "DRUM"

    aput-object v3, v0, v1

    const/16 v1, 0x3bb

    const-string v3, "DUAL"

    aput-object v3, v0, v1

    const/16 v1, 0x3bc

    const-string v3, "DUCK"

    aput-object v3, v0, v1

    const/16 v1, 0x3bd

    const-string v3, "DUCT"

    aput-object v3, v0, v1

    const/16 v1, 0x3be

    const-string v3, "DUEL"

    aput-object v3, v0, v1

    const/16 v1, 0x3bf

    const-string v3, "DUET"

    aput-object v3, v0, v1

    const/16 v1, 0x3c0

    const-string v3, "DUKE"

    aput-object v3, v0, v1

    const/16 v1, 0x3c1

    const-string v3, "DULL"

    aput-object v3, v0, v1

    const/16 v1, 0x3c2

    const-string v3, "DUMB"

    aput-object v3, v0, v1

    const/16 v1, 0x3c3

    const-string v3, "DUNE"

    aput-object v3, v0, v1

    const/16 v1, 0x3c4

    const-string v3, "DUNK"

    aput-object v3, v0, v1

    const/16 v1, 0x3c5

    const-string v3, "DUSK"

    aput-object v3, v0, v1

    const/16 v1, 0x3c6

    const-string v3, "DUST"

    aput-object v3, v0, v1

    const/16 v1, 0x3c7

    const-string v3, "DUTY"

    aput-object v3, v0, v1

    const/16 v1, 0x3c8

    const-string v3, "EACH"

    aput-object v3, v0, v1

    const/16 v1, 0x3c9

    const-string v3, "EARL"

    aput-object v3, v0, v1

    const/16 v1, 0x3ca

    const-string v3, "EARN"

    aput-object v3, v0, v1

    const/16 v1, 0x3cb

    const-string v3, "EASE"

    aput-object v3, v0, v1

    const/16 v1, 0x3cc

    const-string v3, "EAST"

    aput-object v3, v0, v1

    const/16 v1, 0x3cd

    const-string v3, "EASY"

    aput-object v3, v0, v1

    const/16 v1, 0x3ce

    const-string v3, "EBEN"

    aput-object v3, v0, v1

    const/16 v1, 0x3cf

    const-string v3, "ECHO"

    aput-object v3, v0, v1

    const/16 v1, 0x3d0

    const-string v3, "EDDY"

    aput-object v3, v0, v1

    const/16 v1, 0x3d1

    const-string v3, "EDEN"

    aput-object v3, v0, v1

    const/16 v1, 0x3d2

    const-string v3, "EDGE"

    aput-object v3, v0, v1

    const/16 v1, 0x3d3

    const-string v3, "EDGY"

    aput-object v3, v0, v1

    const/16 v1, 0x3d4

    const-string v3, "EDIT"

    aput-object v3, v0, v1

    const/16 v1, 0x3d5

    const-string v3, "EDNA"

    aput-object v3, v0, v1

    const/16 v1, 0x3d6

    const-string v3, "EGAN"

    aput-object v3, v0, v1

    const/16 v1, 0x3d7

    const-string v3, "ELAN"

    aput-object v3, v0, v1

    const/16 v1, 0x3d8

    const-string v3, "ELBA"

    aput-object v3, v0, v1

    const/16 v1, 0x3d9

    const-string v3, "ELLA"

    aput-object v3, v0, v1

    const/16 v1, 0x3da

    const-string v3, "ELSE"

    aput-object v3, v0, v1

    const/16 v1, 0x3db

    const-string v3, "EMIL"

    aput-object v3, v0, v1

    const/16 v1, 0x3dc

    const-string v3, "EMIT"

    aput-object v3, v0, v1

    const/16 v1, 0x3dd

    const-string v3, "EMMA"

    aput-object v3, v0, v1

    const/16 v1, 0x3de

    const-string v3, "ENDS"

    aput-object v3, v0, v1

    const/16 v1, 0x3df

    const-string v3, "ERIC"

    aput-object v3, v0, v1

    const/16 v1, 0x3e0

    const-string v3, "EROS"

    aput-object v3, v0, v1

    const/16 v1, 0x3e1

    const-string v3, "EVEN"

    aput-object v3, v0, v1

    const/16 v1, 0x3e2

    const-string v3, "EVER"

    aput-object v3, v0, v1

    const/16 v1, 0x3e3

    const-string v3, "EVIL"

    aput-object v3, v0, v1

    const/16 v1, 0x3e4

    const-string v3, "EYED"

    aput-object v3, v0, v1

    const/16 v1, 0x3e5

    const-string v3, "FACE"

    aput-object v3, v0, v1

    const/16 v1, 0x3e6

    const-string v3, "FACT"

    aput-object v3, v0, v1

    const/16 v1, 0x3e7

    const-string v3, "FADE"

    aput-object v3, v0, v1

    const/16 v1, 0x3e8

    const-string v3, "FAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x3e9

    const-string v3, "FAIN"

    aput-object v3, v0, v1

    const/16 v1, 0x3ea

    const-string v3, "FAIR"

    aput-object v3, v0, v1

    const/16 v1, 0x3eb

    const-string v3, "FAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x3ec

    const-string v3, "FALL"

    aput-object v3, v0, v1

    const/16 v1, 0x3ed

    const-string v3, "FAME"

    aput-object v3, v0, v1

    const/16 v1, 0x3ee

    const-string v3, "FANG"

    aput-object v3, v0, v1

    const/16 v1, 0x3ef

    const-string v3, "FARM"

    aput-object v3, v0, v1

    const/16 v1, 0x3f0

    const-string v3, "FAST"

    aput-object v3, v0, v1

    const/16 v1, 0x3f1

    const-string v3, "FATE"

    aput-object v3, v0, v1

    const/16 v1, 0x3f2

    const-string v3, "FAWN"

    aput-object v3, v0, v1

    const/16 v1, 0x3f3

    const-string v3, "FEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x3f4

    const-string v3, "FEAT"

    aput-object v3, v0, v1

    const/16 v1, 0x3f5

    const-string v3, "FEED"

    aput-object v3, v0, v1

    const/16 v1, 0x3f6

    const-string v3, "FEEL"

    aput-object v3, v0, v1

    const/16 v1, 0x3f7

    const-string v3, "FEET"

    aput-object v3, v0, v1

    const/16 v1, 0x3f8

    const-string v3, "FELL"

    aput-object v3, v0, v1

    const/16 v1, 0x3f9

    const-string v3, "FELT"

    aput-object v3, v0, v1

    const/16 v1, 0x3fa

    const-string v3, "FEND"

    aput-object v3, v0, v1

    const/16 v1, 0x3fb

    const-string v3, "FERN"

    aput-object v3, v0, v1

    const/16 v1, 0x3fc

    const-string v3, "FEST"

    aput-object v3, v0, v1

    const/16 v1, 0x3fd

    const-string v3, "FEUD"

    aput-object v3, v0, v1

    const/16 v1, 0x3fe

    const-string v3, "FIEF"

    aput-object v3, v0, v1

    const/16 v1, 0x3ff

    const-string v3, "FIGS"

    aput-object v3, v0, v1

    const/16 v1, 0x400

    const-string v3, "FILE"

    aput-object v3, v0, v1

    const/16 v1, 0x401

    const-string v3, "FILL"

    aput-object v3, v0, v1

    const/16 v1, 0x402

    const-string v3, "FILM"

    aput-object v3, v0, v1

    const/16 v1, 0x403

    const-string v3, "FIND"

    aput-object v3, v0, v1

    const/16 v1, 0x404

    const-string v3, "FINE"

    aput-object v3, v0, v1

    const/16 v1, 0x405

    const-string v3, "FINK"

    aput-object v3, v0, v1

    const/16 v1, 0x406

    const-string v3, "FIRE"

    aput-object v3, v0, v1

    const/16 v1, 0x407

    const-string v3, "FIRM"

    aput-object v3, v0, v1

    const/16 v1, 0x408

    const-string v3, "FISH"

    aput-object v3, v0, v1

    const/16 v1, 0x409

    const-string v3, "FISK"

    aput-object v3, v0, v1

    const/16 v1, 0x40a

    const-string v3, "FIST"

    aput-object v3, v0, v1

    const/16 v1, 0x40b

    const-string v3, "FITS"

    aput-object v3, v0, v1

    const/16 v1, 0x40c

    const-string v3, "FIVE"

    aput-object v3, v0, v1

    const/16 v1, 0x40d

    const-string v3, "FLAG"

    aput-object v3, v0, v1

    const/16 v1, 0x40e

    const-string v3, "FLAK"

    aput-object v3, v0, v1

    const/16 v1, 0x40f

    const-string v3, "FLAM"

    aput-object v3, v0, v1

    const/16 v1, 0x410

    const-string v3, "FLAT"

    aput-object v3, v0, v1

    const/16 v1, 0x411

    const-string v3, "FLAW"

    aput-object v3, v0, v1

    const/16 v1, 0x412

    const-string v3, "FLEA"

    aput-object v3, v0, v1

    const/16 v1, 0x413

    const-string v3, "FLED"

    aput-object v3, v0, v1

    const/16 v1, 0x414

    const-string v3, "FLEW"

    aput-object v3, v0, v1

    const/16 v1, 0x415

    const-string v3, "FLIT"

    aput-object v3, v0, v1

    const/16 v1, 0x416

    const-string v3, "FLOC"

    aput-object v3, v0, v1

    const/16 v1, 0x417

    const-string v3, "FLOG"

    aput-object v3, v0, v1

    const/16 v1, 0x418

    const-string v3, "FLOW"

    aput-object v3, v0, v1

    const/16 v1, 0x419

    const-string v3, "FLUB"

    aput-object v3, v0, v1

    const/16 v1, 0x41a

    const-string v3, "FLUE"

    aput-object v3, v0, v1

    const/16 v1, 0x41b

    const-string v3, "FOAL"

    aput-object v3, v0, v1

    const/16 v1, 0x41c

    const-string v3, "FOAM"

    aput-object v3, v0, v1

    const/16 v1, 0x41d

    const-string v3, "FOGY"

    aput-object v3, v0, v1

    const/16 v1, 0x41e

    const-string v3, "FOIL"

    aput-object v3, v0, v1

    const/16 v1, 0x41f

    const-string v3, "FOLD"

    aput-object v3, v0, v1

    const/16 v1, 0x420

    const-string v3, "FOLK"

    aput-object v3, v0, v1

    const/16 v1, 0x421

    const-string v3, "FOND"

    aput-object v3, v0, v1

    const/16 v1, 0x422

    const-string v3, "FONT"

    aput-object v3, v0, v1

    const/16 v1, 0x423

    const-string v3, "FOOD"

    aput-object v3, v0, v1

    const/16 v1, 0x424

    const-string v3, "FOOL"

    aput-object v3, v0, v1

    const/16 v1, 0x425

    const-string v3, "FOOT"

    aput-object v3, v0, v1

    const/16 v1, 0x426

    const-string v3, "FORD"

    aput-object v3, v0, v1

    const/16 v1, 0x427

    const-string v3, "FORE"

    aput-object v3, v0, v1

    const/16 v1, 0x428

    const-string v3, "FORK"

    aput-object v3, v0, v1

    const/16 v1, 0x429

    const-string v3, "FORM"

    aput-object v3, v0, v1

    const/16 v1, 0x42a

    const-string v3, "FORT"

    aput-object v3, v0, v1

    const/16 v1, 0x42b

    const-string v3, "FOSS"

    aput-object v3, v0, v1

    const/16 v1, 0x42c

    const-string v3, "FOUL"

    aput-object v3, v0, v1

    const/16 v1, 0x42d

    const-string v3, "FOUR"

    aput-object v3, v0, v1

    const/16 v1, 0x42e

    const-string v3, "FOWL"

    aput-object v3, v0, v1

    const/16 v1, 0x42f

    const-string v3, "FRAU"

    aput-object v3, v0, v1

    const/16 v1, 0x430

    const-string v3, "FRAY"

    aput-object v3, v0, v1

    const/16 v1, 0x431

    const-string v3, "FRED"

    aput-object v3, v0, v1

    const/16 v1, 0x432

    const-string v3, "FREE"

    aput-object v3, v0, v1

    const/16 v1, 0x433

    const-string v3, "FRET"

    aput-object v3, v0, v1

    const/16 v1, 0x434

    const-string v3, "FREY"

    aput-object v3, v0, v1

    const/16 v1, 0x435

    const-string v3, "FROG"

    aput-object v3, v0, v1

    const/16 v1, 0x436

    const-string v3, "FROM"

    aput-object v3, v0, v1

    const/16 v1, 0x437

    const-string v3, "FUEL"

    aput-object v3, v0, v1

    const/16 v1, 0x438

    const-string v3, "FULL"

    aput-object v3, v0, v1

    const/16 v1, 0x439

    const-string v3, "FUME"

    aput-object v3, v0, v1

    const/16 v1, 0x43a

    const-string v3, "FUND"

    aput-object v3, v0, v1

    const/16 v1, 0x43b

    const-string v3, "FUNK"

    aput-object v3, v0, v1

    const/16 v1, 0x43c

    const-string v3, "FURY"

    aput-object v3, v0, v1

    const/16 v1, 0x43d

    const-string v3, "FUSE"

    aput-object v3, v0, v1

    const/16 v1, 0x43e

    const-string v3, "FUSS"

    aput-object v3, v0, v1

    const/16 v1, 0x43f

    const-string v3, "GAFF"

    aput-object v3, v0, v1

    const/16 v1, 0x440

    const-string v3, "GAGE"

    aput-object v3, v0, v1

    const/16 v1, 0x441

    const-string v3, "GAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x442

    const-string v3, "GAIN"

    aput-object v3, v0, v1

    const/16 v1, 0x443

    const-string v3, "GAIT"

    aput-object v3, v0, v1

    const/16 v1, 0x444

    const-string v3, "GALA"

    aput-object v3, v0, v1

    const/16 v1, 0x445

    const-string v3, "GALE"

    aput-object v3, v0, v1

    const/16 v1, 0x446

    const-string v3, "GALL"

    aput-object v3, v0, v1

    const/16 v1, 0x447

    const-string v3, "GALT"

    aput-object v3, v0, v1

    const/16 v1, 0x448

    const-string v3, "GAME"

    aput-object v3, v0, v1

    const/16 v1, 0x449

    const-string v3, "GANG"

    aput-object v3, v0, v1

    const/16 v1, 0x44a

    const-string v3, "GARB"

    aput-object v3, v0, v1

    const/16 v1, 0x44b

    const-string v3, "GARY"

    aput-object v3, v0, v1

    const/16 v1, 0x44c

    const-string v3, "GASH"

    aput-object v3, v0, v1

    const/16 v1, 0x44d

    const-string v3, "GATE"

    aput-object v3, v0, v1

    const/16 v1, 0x44e

    const-string v3, "GAUL"

    aput-object v3, v0, v1

    const/16 v1, 0x44f

    const-string v3, "GAUR"

    aput-object v3, v0, v1

    const/16 v1, 0x450

    const-string v3, "GAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x451

    const-string v3, "GAWK"

    aput-object v3, v0, v1

    const/16 v1, 0x452

    const-string v3, "GEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x453

    const-string v3, "GELD"

    aput-object v3, v0, v1

    const/16 v1, 0x454

    const-string v3, "GENE"

    aput-object v3, v0, v1

    const/16 v1, 0x455

    const-string v3, "GENT"

    aput-object v3, v0, v1

    const/16 v1, 0x456

    const-string v3, "GERM"

    aput-object v3, v0, v1

    const/16 v1, 0x457

    const-string v3, "GETS"

    aput-object v3, v0, v1

    const/16 v1, 0x458

    const-string v3, "GIBE"

    aput-object v3, v0, v1

    const/16 v1, 0x459

    const-string v3, "GIFT"

    aput-object v3, v0, v1

    const/16 v1, 0x45a

    const-string v3, "GILD"

    aput-object v3, v0, v1

    const/16 v1, 0x45b

    const-string v3, "GILL"

    aput-object v3, v0, v1

    const/16 v1, 0x45c

    const-string v3, "GILT"

    aput-object v3, v0, v1

    const/16 v1, 0x45d

    const-string v3, "GINA"

    aput-object v3, v0, v1

    const/16 v1, 0x45e

    const-string v3, "GIRD"

    aput-object v3, v0, v1

    const/16 v1, 0x45f

    const-string v3, "GIRL"

    aput-object v3, v0, v1

    const/16 v1, 0x460

    const-string v3, "GIST"

    aput-object v3, v0, v1

    const/16 v1, 0x461

    const-string v3, "GIVE"

    aput-object v3, v0, v1

    const/16 v1, 0x462

    const-string v3, "GLAD"

    aput-object v3, v0, v1

    const/16 v1, 0x463

    const-string v3, "GLEE"

    aput-object v3, v0, v1

    const/16 v1, 0x464

    const-string v3, "GLEN"

    aput-object v3, v0, v1

    const/16 v1, 0x465

    const-string v3, "GLIB"

    aput-object v3, v0, v1

    const/16 v1, 0x466

    const-string v3, "GLOB"

    aput-object v3, v0, v1

    const/16 v1, 0x467

    const-string v3, "GLOM"

    aput-object v3, v0, v1

    const/16 v1, 0x468

    const-string v3, "GLOW"

    aput-object v3, v0, v1

    const/16 v1, 0x469

    const-string v3, "GLUE"

    aput-object v3, v0, v1

    const/16 v1, 0x46a

    const-string v3, "GLUM"

    aput-object v3, v0, v1

    const/16 v1, 0x46b

    const-string v3, "GLUT"

    aput-object v3, v0, v1

    const/16 v1, 0x46c

    const-string v3, "GOAD"

    aput-object v3, v0, v1

    const/16 v1, 0x46d

    const-string v3, "GOAL"

    aput-object v3, v0, v1

    const/16 v1, 0x46e

    const-string v3, "GOAT"

    aput-object v3, v0, v1

    const/16 v1, 0x46f

    const-string v3, "GOER"

    aput-object v3, v0, v1

    const/16 v1, 0x470

    const-string v3, "GOES"

    aput-object v3, v0, v1

    const/16 v1, 0x471

    const-string v3, "GOLD"

    aput-object v3, v0, v1

    const/16 v1, 0x472

    const-string v3, "GOLF"

    aput-object v3, v0, v1

    const/16 v1, 0x473

    const-string v3, "GONE"

    aput-object v3, v0, v1

    const/16 v1, 0x474

    const-string v3, "GONG"

    aput-object v3, v0, v1

    const/16 v1, 0x475

    const-string v3, "GOOD"

    aput-object v3, v0, v1

    const/16 v1, 0x476

    const-string v3, "GOOF"

    aput-object v3, v0, v1

    const/16 v1, 0x477

    const-string v3, "GORE"

    aput-object v3, v0, v1

    const/16 v1, 0x478

    const-string v3, "GORY"

    aput-object v3, v0, v1

    const/16 v1, 0x479

    const-string v3, "GOSH"

    aput-object v3, v0, v1

    const/16 v1, 0x47a

    const-string v3, "GOUT"

    aput-object v3, v0, v1

    const/16 v1, 0x47b

    const-string v3, "GOWN"

    aput-object v3, v0, v1

    const/16 v1, 0x47c

    const-string v3, "GRAB"

    aput-object v3, v0, v1

    const/16 v1, 0x47d

    const-string v3, "GRAD"

    aput-object v3, v0, v1

    const/16 v1, 0x47e

    const-string v3, "GRAY"

    aput-object v3, v0, v1

    const/16 v1, 0x47f

    const-string v3, "GREG"

    aput-object v3, v0, v1

    const/16 v1, 0x480

    const-string v3, "GREW"

    aput-object v3, v0, v1

    const/16 v1, 0x481

    const-string v3, "GREY"

    aput-object v3, v0, v1

    const/16 v1, 0x482

    const-string v3, "GRID"

    aput-object v3, v0, v1

    const/16 v1, 0x483

    const-string v3, "GRIM"

    aput-object v3, v0, v1

    const/16 v1, 0x484

    const-string v3, "GRIN"

    aput-object v3, v0, v1

    const/16 v1, 0x485

    const-string v3, "GRIT"

    aput-object v3, v0, v1

    const/16 v1, 0x486

    const-string v3, "GROW"

    aput-object v3, v0, v1

    const/16 v1, 0x487

    const-string v3, "GRUB"

    aput-object v3, v0, v1

    const/16 v1, 0x488

    const-string v3, "GULF"

    aput-object v3, v0, v1

    const/16 v1, 0x489

    const-string v3, "GULL"

    aput-object v3, v0, v1

    const/16 v1, 0x48a

    const-string v3, "GUNK"

    aput-object v3, v0, v1

    const/16 v1, 0x48b

    const-string v3, "GURU"

    aput-object v3, v0, v1

    const/16 v1, 0x48c

    const-string v3, "GUSH"

    aput-object v3, v0, v1

    const/16 v1, 0x48d

    const-string v3, "GUST"

    aput-object v3, v0, v1

    const/16 v1, 0x48e

    const-string v3, "GWEN"

    aput-object v3, v0, v1

    const/16 v1, 0x48f

    const-string v3, "GWYN"

    aput-object v3, v0, v1

    const/16 v1, 0x490

    const-string v3, "HAAG"

    aput-object v3, v0, v1

    const/16 v1, 0x491

    const-string v3, "HAAS"

    aput-object v3, v0, v1

    const/16 v1, 0x492

    const-string v3, "HACK"

    aput-object v3, v0, v1

    const/16 v1, 0x493

    const-string v3, "HAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x494

    const-string v3, "HAIR"

    aput-object v3, v0, v1

    const/16 v1, 0x495

    const-string v3, "HALE"

    aput-object v3, v0, v1

    const/16 v1, 0x496

    const-string v3, "HALF"

    aput-object v3, v0, v1

    const/16 v1, 0x497

    const-string v3, "HALL"

    aput-object v3, v0, v1

    const/16 v1, 0x498

    const-string v3, "HALO"

    aput-object v3, v0, v1

    const/16 v1, 0x499

    const-string v3, "HALT"

    aput-object v3, v0, v1

    const/16 v1, 0x49a

    const-string v3, "HAND"

    aput-object v3, v0, v1

    const/16 v1, 0x49b

    const-string v3, "HANG"

    aput-object v3, v0, v1

    const/16 v1, 0x49c

    const-string v3, "HANK"

    aput-object v3, v0, v1

    const/16 v1, 0x49d

    const-string v3, "HANS"

    aput-object v3, v0, v1

    const/16 v1, 0x49e

    const-string v3, "HARD"

    aput-object v3, v0, v1

    const/16 v1, 0x49f

    const-string v3, "HARK"

    aput-object v3, v0, v1

    const/16 v1, 0x4a0

    const-string v3, "HARM"

    aput-object v3, v0, v1

    const/16 v1, 0x4a1

    const-string v3, "HART"

    aput-object v3, v0, v1

    const/16 v1, 0x4a2

    const-string v3, "HASH"

    aput-object v3, v0, v1

    const/16 v1, 0x4a3

    const-string v3, "HAST"

    aput-object v3, v0, v1

    const/16 v1, 0x4a4

    const-string v3, "HATE"

    aput-object v3, v0, v1

    const/16 v1, 0x4a5

    const-string v3, "HATH"

    aput-object v3, v0, v1

    const/16 v1, 0x4a6

    const-string v3, "HAUL"

    aput-object v3, v0, v1

    const/16 v1, 0x4a7

    const-string v3, "HAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x4a8

    const-string v3, "HAWK"

    aput-object v3, v0, v1

    const/16 v1, 0x4a9

    const-string v3, "HAYS"

    aput-object v3, v0, v1

    const/16 v1, 0x4aa

    const-string v3, "HEAD"

    aput-object v3, v0, v1

    const/16 v1, 0x4ab

    const-string v3, "HEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x4ac

    const-string v3, "HEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x4ad

    const-string v3, "HEAT"

    aput-object v3, v0, v1

    const/16 v1, 0x4ae

    const-string v3, "HEBE"

    aput-object v3, v0, v1

    const/16 v1, 0x4af

    const-string v3, "HECK"

    aput-object v3, v0, v1

    const/16 v1, 0x4b0

    const-string v3, "HEED"

    aput-object v3, v0, v1

    const/16 v1, 0x4b1

    const-string v3, "HEEL"

    aput-object v3, v0, v1

    const/16 v1, 0x4b2

    const-string v3, "HEFT"

    aput-object v3, v0, v1

    const/16 v1, 0x4b3

    const-string v3, "HELD"

    aput-object v3, v0, v1

    const/16 v1, 0x4b4

    const-string v3, "HELL"

    aput-object v3, v0, v1

    const/16 v1, 0x4b5

    const-string v3, "HELM"

    aput-object v3, v0, v1

    const/16 v1, 0x4b6

    const-string v3, "HERB"

    aput-object v3, v0, v1

    const/16 v1, 0x4b7

    const-string v3, "HERD"

    aput-object v3, v0, v1

    const/16 v1, 0x4b8

    const-string v3, "HERE"

    aput-object v3, v0, v1

    const/16 v1, 0x4b9

    const-string v3, "HERO"

    aput-object v3, v0, v1

    const/16 v1, 0x4ba

    const-string v3, "HERS"

    aput-object v3, v0, v1

    const/16 v1, 0x4bb

    const-string v3, "HESS"

    aput-object v3, v0, v1

    const/16 v1, 0x4bc

    const-string v3, "HEWN"

    aput-object v3, v0, v1

    const/16 v1, 0x4bd

    const-string v3, "HICK"

    aput-object v3, v0, v1

    const/16 v1, 0x4be

    const-string v3, "HIDE"

    aput-object v3, v0, v1

    const/16 v1, 0x4bf

    const-string v3, "HIGH"

    aput-object v3, v0, v1

    const/16 v1, 0x4c0

    const-string v3, "HIKE"

    aput-object v3, v0, v1

    const/16 v1, 0x4c1

    const-string v3, "HILL"

    aput-object v3, v0, v1

    const/16 v1, 0x4c2

    const-string v3, "HILT"

    aput-object v3, v0, v1

    const/16 v1, 0x4c3

    const-string v3, "HIND"

    aput-object v3, v0, v1

    const/16 v1, 0x4c4

    const-string v3, "HINT"

    aput-object v3, v0, v1

    const/16 v1, 0x4c5

    const-string v3, "HIRE"

    aput-object v3, v0, v1

    const/16 v1, 0x4c6

    const-string v3, "HISS"

    aput-object v3, v0, v1

    const/16 v1, 0x4c7

    const-string v3, "HIVE"

    aput-object v3, v0, v1

    const/16 v1, 0x4c8

    const-string v3, "HOBO"

    aput-object v3, v0, v1

    const/16 v1, 0x4c9

    const-string v3, "HOCK"

    aput-object v3, v0, v1

    const/16 v1, 0x4ca

    const-string v3, "HOFF"

    aput-object v3, v0, v1

    const/16 v1, 0x4cb

    const-string v3, "HOLD"

    aput-object v3, v0, v1

    const/16 v1, 0x4cc

    const-string v3, "HOLE"

    aput-object v3, v0, v1

    const/16 v1, 0x4cd

    const-string v3, "HOLM"

    aput-object v3, v0, v1

    const/16 v1, 0x4ce

    const-string v3, "HOLT"

    aput-object v3, v0, v1

    const/16 v1, 0x4cf

    const-string v3, "HOME"

    aput-object v3, v0, v1

    const/16 v1, 0x4d0

    const-string v3, "HONE"

    aput-object v3, v0, v1

    const/16 v1, 0x4d1

    const-string v3, "HONK"

    aput-object v3, v0, v1

    const/16 v1, 0x4d2

    const-string v3, "HOOD"

    aput-object v3, v0, v1

    const/16 v1, 0x4d3

    const-string v3, "HOOF"

    aput-object v3, v0, v1

    const/16 v1, 0x4d4

    const-string v3, "HOOK"

    aput-object v3, v0, v1

    const/16 v1, 0x4d5

    const-string v3, "HOOT"

    aput-object v3, v0, v1

    const/16 v1, 0x4d6

    const-string v3, "HORN"

    aput-object v3, v0, v1

    const/16 v1, 0x4d7

    const-string v3, "HOSE"

    aput-object v3, v0, v1

    const/16 v1, 0x4d8

    const-string v3, "HOST"

    aput-object v3, v0, v1

    const/16 v1, 0x4d9

    const-string v3, "HOUR"

    aput-object v3, v0, v1

    const/16 v1, 0x4da

    const-string v3, "HOVE"

    aput-object v3, v0, v1

    const/16 v1, 0x4db

    const-string v3, "HOWE"

    aput-object v3, v0, v1

    const/16 v1, 0x4dc

    const-string v3, "HOWL"

    aput-object v3, v0, v1

    const/16 v1, 0x4dd

    const-string v3, "HOYT"

    aput-object v3, v0, v1

    const/16 v1, 0x4de

    const-string v3, "HUCK"

    aput-object v3, v0, v1

    const/16 v1, 0x4df

    const-string v3, "HUED"

    aput-object v3, v0, v1

    const/16 v1, 0x4e0

    const-string v3, "HUFF"

    aput-object v3, v0, v1

    const/16 v1, 0x4e1

    const-string v3, "HUGE"

    aput-object v3, v0, v1

    const/16 v1, 0x4e2

    const-string v3, "HUGH"

    aput-object v3, v0, v1

    const/16 v1, 0x4e3

    const-string v3, "HUGO"

    aput-object v3, v0, v1

    const/16 v1, 0x4e4

    const-string v3, "HULK"

    aput-object v3, v0, v1

    const/16 v1, 0x4e5

    const-string v3, "HULL"

    aput-object v3, v0, v1

    const/16 v1, 0x4e6

    const-string v3, "HUNK"

    aput-object v3, v0, v1

    const/16 v1, 0x4e7

    const-string v3, "HUNT"

    aput-object v3, v0, v1

    const/16 v1, 0x4e8

    const-string v3, "HURD"

    aput-object v3, v0, v1

    const/16 v1, 0x4e9

    const-string v3, "HURL"

    aput-object v3, v0, v1

    const/16 v1, 0x4ea

    const-string v3, "HURT"

    aput-object v3, v0, v1

    const/16 v1, 0x4eb

    const-string v3, "HUSH"

    aput-object v3, v0, v1

    const/16 v1, 0x4ec

    const-string v3, "HYDE"

    aput-object v3, v0, v1

    const/16 v1, 0x4ed

    const-string v3, "HYMN"

    aput-object v3, v0, v1

    const/16 v1, 0x4ee

    const-string v3, "IBIS"

    aput-object v3, v0, v1

    const/16 v1, 0x4ef

    const-string v3, "ICON"

    aput-object v3, v0, v1

    const/16 v1, 0x4f0

    const-string v3, "IDEA"

    aput-object v3, v0, v1

    const/16 v1, 0x4f1

    const-string v3, "IDLE"

    aput-object v3, v0, v1

    const/16 v1, 0x4f2

    const-string v3, "IFFY"

    aput-object v3, v0, v1

    const/16 v1, 0x4f3

    const-string v3, "INCA"

    aput-object v3, v0, v1

    const/16 v1, 0x4f4

    const-string v3, "INCH"

    aput-object v3, v0, v1

    const/16 v1, 0x4f5

    const-string v3, "INTO"

    aput-object v3, v0, v1

    const/16 v1, 0x4f6

    const-string v3, "IONS"

    aput-object v3, v0, v1

    const/16 v1, 0x4f7

    const-string v3, "IOTA"

    aput-object v3, v0, v1

    const/16 v1, 0x4f8

    const-string v3, "IOWA"

    aput-object v3, v0, v1

    const/16 v1, 0x4f9

    const-string v3, "IRIS"

    aput-object v3, v0, v1

    const/16 v1, 0x4fa

    const-string v3, "IRMA"

    aput-object v3, v0, v1

    const/16 v1, 0x4fb

    const-string v3, "IRON"

    aput-object v3, v0, v1

    const/16 v1, 0x4fc

    const-string v3, "ISLE"

    aput-object v3, v0, v1

    const/16 v1, 0x4fd

    const-string v3, "ITCH"

    aput-object v3, v0, v1

    const/16 v1, 0x4fe

    const-string v3, "ITEM"

    aput-object v3, v0, v1

    const/16 v1, 0x4ff

    const-string v3, "IVAN"

    aput-object v3, v0, v1

    const/16 v1, 0x500

    const-string v3, "JACK"

    aput-object v3, v0, v1

    const/16 v1, 0x501

    const-string v3, "JADE"

    aput-object v3, v0, v1

    const/16 v1, 0x502

    const-string v3, "JAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x503

    const-string v3, "JAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x504

    const-string v3, "JANE"

    aput-object v3, v0, v1

    const/16 v1, 0x505

    const-string v3, "JAVA"

    aput-object v3, v0, v1

    const/16 v1, 0x506

    const-string v3, "JEAN"

    aput-object v3, v0, v1

    const/16 v1, 0x507

    const-string v3, "JEFF"

    aput-object v3, v0, v1

    const/16 v1, 0x508

    const-string v3, "JERK"

    aput-object v3, v0, v1

    const/16 v1, 0x509

    const-string v3, "JESS"

    aput-object v3, v0, v1

    const/16 v1, 0x50a

    const-string v3, "JEST"

    aput-object v3, v0, v1

    const/16 v1, 0x50b

    const-string v3, "JIBE"

    aput-object v3, v0, v1

    const/16 v1, 0x50c

    const-string v3, "JILL"

    aput-object v3, v0, v1

    const/16 v1, 0x50d

    const-string v3, "JILT"

    aput-object v3, v0, v1

    const/16 v1, 0x50e

    const-string v3, "JIVE"

    aput-object v3, v0, v1

    const/16 v1, 0x50f

    const-string v3, "JOAN"

    aput-object v3, v0, v1

    const/16 v1, 0x510

    const-string v3, "JOBS"

    aput-object v3, v0, v1

    const/16 v1, 0x511

    const-string v3, "JOCK"

    aput-object v3, v0, v1

    const/16 v1, 0x512

    const-string v3, "JOEL"

    aput-object v3, v0, v1

    const/16 v1, 0x513

    const-string v3, "JOEY"

    aput-object v3, v0, v1

    const/16 v1, 0x514

    const-string v3, "JOHN"

    aput-object v3, v0, v1

    const/16 v1, 0x515

    const-string v3, "JOIN"

    aput-object v3, v0, v1

    const/16 v1, 0x516

    const-string v3, "JOKE"

    aput-object v3, v0, v1

    const/16 v1, 0x517

    const-string v3, "JOLT"

    aput-object v3, v0, v1

    const/16 v1, 0x518

    const-string v3, "JOVE"

    aput-object v3, v0, v1

    const/16 v1, 0x519

    const-string v3, "JUDD"

    aput-object v3, v0, v1

    const/16 v1, 0x51a

    const-string v3, "JUDE"

    aput-object v3, v0, v1

    const/16 v1, 0x51b

    const-string v3, "JUDO"

    aput-object v3, v0, v1

    const/16 v1, 0x51c

    const-string v3, "JUDY"

    aput-object v3, v0, v1

    const/16 v1, 0x51d

    const-string v3, "JUJU"

    aput-object v3, v0, v1

    const/16 v1, 0x51e

    const-string v3, "JUKE"

    aput-object v3, v0, v1

    const/16 v1, 0x51f

    const-string v3, "JULY"

    aput-object v3, v0, v1

    const/16 v1, 0x520

    const-string v3, "JUNE"

    aput-object v3, v0, v1

    const/16 v1, 0x521

    const-string v3, "JUNK"

    aput-object v3, v0, v1

    const/16 v1, 0x522

    const-string v3, "JUNO"

    aput-object v3, v0, v1

    const/16 v1, 0x523

    const-string v3, "JURY"

    aput-object v3, v0, v1

    const/16 v1, 0x524

    const-string v3, "JUST"

    aput-object v3, v0, v1

    const/16 v1, 0x525

    const-string v3, "JUTE"

    aput-object v3, v0, v1

    const/16 v1, 0x526

    const-string v3, "KAHN"

    aput-object v3, v0, v1

    const/16 v1, 0x527

    const-string v3, "KALE"

    aput-object v3, v0, v1

    const/16 v1, 0x528

    const-string v3, "KANE"

    aput-object v3, v0, v1

    const/16 v1, 0x529

    const-string v3, "KANT"

    aput-object v3, v0, v1

    const/16 v1, 0x52a

    const-string v3, "KARL"

    aput-object v3, v0, v1

    const/16 v1, 0x52b

    const-string v3, "KATE"

    aput-object v3, v0, v1

    const/16 v1, 0x52c

    const-string v3, "KEEL"

    aput-object v3, v0, v1

    const/16 v1, 0x52d

    const-string v3, "KEEN"

    aput-object v3, v0, v1

    const/16 v1, 0x52e

    const-string v3, "KENO"

    aput-object v3, v0, v1

    const/16 v1, 0x52f

    const-string v3, "KENT"

    aput-object v3, v0, v1

    const/16 v1, 0x530

    const-string v3, "KERN"

    aput-object v3, v0, v1

    const/16 v1, 0x531

    const-string v3, "KERR"

    aput-object v3, v0, v1

    const/16 v1, 0x532

    const-string v3, "KEYS"

    aput-object v3, v0, v1

    const/16 v1, 0x533

    const-string v3, "KICK"

    aput-object v3, v0, v1

    const/16 v1, 0x534

    const-string v3, "KILL"

    aput-object v3, v0, v1

    const/16 v1, 0x535

    const-string v3, "KIND"

    aput-object v3, v0, v1

    const/16 v1, 0x536

    const-string v3, "KING"

    aput-object v3, v0, v1

    const/16 v1, 0x537

    const-string v3, "KIRK"

    aput-object v3, v0, v1

    const/16 v1, 0x538

    const-string v3, "KISS"

    aput-object v3, v0, v1

    const/16 v1, 0x539

    const-string v3, "KITE"

    aput-object v3, v0, v1

    const/16 v1, 0x53a

    const-string v3, "KLAN"

    aput-object v3, v0, v1

    const/16 v1, 0x53b

    const-string v3, "KNEE"

    aput-object v3, v0, v1

    const/16 v1, 0x53c

    const-string v3, "KNEW"

    aput-object v3, v0, v1

    const/16 v1, 0x53d

    const-string v3, "KNIT"

    aput-object v3, v0, v1

    const/16 v1, 0x53e

    const-string v3, "KNOB"

    aput-object v3, v0, v1

    const/16 v1, 0x53f

    const-string v3, "KNOT"

    aput-object v3, v0, v1

    const/16 v1, 0x540

    const-string v3, "KNOW"

    aput-object v3, v0, v1

    const/16 v1, 0x541

    const-string v3, "KOCH"

    aput-object v3, v0, v1

    const/16 v1, 0x542

    const-string v3, "KONG"

    aput-object v3, v0, v1

    const/16 v1, 0x543

    const-string v3, "KUDO"

    aput-object v3, v0, v1

    const/16 v1, 0x544

    const-string v3, "KURD"

    aput-object v3, v0, v1

    const/16 v1, 0x545

    const-string v3, "KURT"

    aput-object v3, v0, v1

    const/16 v1, 0x546

    const-string v3, "KYLE"

    aput-object v3, v0, v1

    const/16 v1, 0x547

    const-string v3, "LACE"

    aput-object v3, v0, v1

    const/16 v1, 0x548

    const-string v3, "LACK"

    aput-object v3, v0, v1

    const/16 v1, 0x549

    const-string v3, "LACY"

    aput-object v3, v0, v1

    const/16 v1, 0x54a

    const-string v3, "LADY"

    aput-object v3, v0, v1

    const/16 v1, 0x54b

    const-string v3, "LAID"

    aput-object v3, v0, v1

    const/16 v1, 0x54c

    const-string v3, "LAIN"

    aput-object v3, v0, v1

    const/16 v1, 0x54d

    const-string v3, "LAIR"

    aput-object v3, v0, v1

    const/16 v1, 0x54e

    const-string v3, "LAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x54f

    const-string v3, "LAMB"

    aput-object v3, v0, v1

    const/16 v1, 0x550

    const-string v3, "LAME"

    aput-object v3, v0, v1

    const/16 v1, 0x551

    const-string v3, "LAND"

    aput-object v3, v0, v1

    const/16 v1, 0x552

    const-string v3, "LANE"

    aput-object v3, v0, v1

    const/16 v1, 0x553

    const-string v3, "LANG"

    aput-object v3, v0, v1

    const/16 v1, 0x554

    const-string v3, "LARD"

    aput-object v3, v0, v1

    const/16 v1, 0x555

    const-string v3, "LARK"

    aput-object v3, v0, v1

    const/16 v1, 0x556

    const-string v3, "LASS"

    aput-object v3, v0, v1

    const/16 v1, 0x557

    const-string v3, "LAST"

    aput-object v3, v0, v1

    const/16 v1, 0x558

    const-string v3, "LATE"

    aput-object v3, v0, v1

    const/16 v1, 0x559

    const-string v3, "LAUD"

    aput-object v3, v0, v1

    const/16 v1, 0x55a

    const-string v3, "LAVA"

    aput-object v3, v0, v1

    const/16 v1, 0x55b

    const-string v3, "LAWN"

    aput-object v3, v0, v1

    const/16 v1, 0x55c

    const-string v3, "LAWS"

    aput-object v3, v0, v1

    const/16 v1, 0x55d

    const-string v3, "LAYS"

    aput-object v3, v0, v1

    const/16 v1, 0x55e

    const-string v3, "LEAD"

    aput-object v3, v0, v1

    const/16 v1, 0x55f

    const-string v3, "LEAF"

    aput-object v3, v0, v1

    const/16 v1, 0x560

    const-string v3, "LEAK"

    aput-object v3, v0, v1

    const/16 v1, 0x561

    const-string v3, "LEAN"

    aput-object v3, v0, v1

    const/16 v1, 0x562

    const-string v3, "LEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x563

    const-string v3, "LEEK"

    aput-object v3, v0, v1

    const/16 v1, 0x564

    const-string v3, "LEER"

    aput-object v3, v0, v1

    const/16 v1, 0x565

    const-string v3, "LEFT"

    aput-object v3, v0, v1

    const/16 v1, 0x566

    const-string v3, "LEND"

    aput-object v3, v0, v1

    const/16 v1, 0x567

    const-string v3, "LENS"

    aput-object v3, v0, v1

    const/16 v1, 0x568

    const-string v3, "LENT"

    aput-object v3, v0, v1

    const/16 v1, 0x569

    const-string v3, "LEON"

    aput-object v3, v0, v1

    const/16 v1, 0x56a

    const-string v3, "LESK"

    aput-object v3, v0, v1

    const/16 v1, 0x56b

    const-string v3, "LESS"

    aput-object v3, v0, v1

    const/16 v1, 0x56c

    const-string v3, "LEST"

    aput-object v3, v0, v1

    const/16 v1, 0x56d

    const-string v3, "LETS"

    aput-object v3, v0, v1

    const/16 v1, 0x56e

    const-string v3, "LIAR"

    aput-object v3, v0, v1

    const/16 v1, 0x56f

    const-string v3, "LICE"

    aput-object v3, v0, v1

    const/16 v1, 0x570

    const-string v3, "LICK"

    aput-object v3, v0, v1

    const/16 v1, 0x571

    const-string v3, "LIED"

    aput-object v3, v0, v1

    const/16 v1, 0x572

    const-string v3, "LIEN"

    aput-object v3, v0, v1

    const/16 v1, 0x573

    const-string v3, "LIES"

    aput-object v3, v0, v1

    const/16 v1, 0x574

    const-string v3, "LIEU"

    aput-object v3, v0, v1

    const/16 v1, 0x575

    const-string v3, "LIFE"

    aput-object v3, v0, v1

    const/16 v1, 0x576

    const-string v3, "LIFT"

    aput-object v3, v0, v1

    const/16 v1, 0x577

    const-string v3, "LIKE"

    aput-object v3, v0, v1

    const/16 v1, 0x578

    const-string v3, "LILA"

    aput-object v3, v0, v1

    const/16 v1, 0x579

    const-string v3, "LILT"

    aput-object v3, v0, v1

    const/16 v1, 0x57a

    const-string v3, "LILY"

    aput-object v3, v0, v1

    const/16 v1, 0x57b

    const-string v3, "LIMA"

    aput-object v3, v0, v1

    const/16 v1, 0x57c

    const-string v3, "LIMB"

    aput-object v3, v0, v1

    const/16 v1, 0x57d

    const-string v3, "LIME"

    aput-object v3, v0, v1

    const/16 v1, 0x57e

    const-string v3, "LIND"

    aput-object v3, v0, v1

    const/16 v1, 0x57f

    const-string v3, "LINE"

    aput-object v3, v0, v1

    const/16 v1, 0x580

    const-string v3, "LINK"

    aput-object v3, v0, v1

    const/16 v1, 0x581

    const-string v3, "LINT"

    aput-object v3, v0, v1

    const/16 v1, 0x582

    const-string v3, "LION"

    aput-object v3, v0, v1

    const/16 v1, 0x583

    const-string v3, "LISA"

    aput-object v3, v0, v1

    const/16 v1, 0x584

    const-string v3, "LIST"

    aput-object v3, v0, v1

    const/16 v1, 0x585

    const-string v3, "LIVE"

    aput-object v3, v0, v1

    const/16 v1, 0x586

    const-string v3, "LOAD"

    aput-object v3, v0, v1

    const/16 v1, 0x587

    const-string v3, "LOAF"

    aput-object v3, v0, v1

    const/16 v1, 0x588

    const-string v3, "LOAM"

    aput-object v3, v0, v1

    const/16 v1, 0x589

    const-string v3, "LOAN"

    aput-object v3, v0, v1

    const/16 v1, 0x58a

    const-string v3, "LOCK"

    aput-object v3, v0, v1

    const/16 v1, 0x58b

    const-string v3, "LOFT"

    aput-object v3, v0, v1

    const/16 v1, 0x58c

    const-string v3, "LOGE"

    aput-object v3, v0, v1

    const/16 v1, 0x58d

    const-string v3, "LOIS"

    aput-object v3, v0, v1

    const/16 v1, 0x58e

    const-string v3, "LOLA"

    aput-object v3, v0, v1

    const/16 v1, 0x58f

    const-string v3, "LONE"

    aput-object v3, v0, v1

    const/16 v1, 0x590

    const-string v3, "LONG"

    aput-object v3, v0, v1

    const/16 v1, 0x591

    const-string v3, "LOOK"

    aput-object v3, v0, v1

    const/16 v1, 0x592

    const-string v3, "LOON"

    aput-object v3, v0, v1

    const/16 v1, 0x593    # 2.0E-42f

    const-string v3, "LOOT"

    aput-object v3, v0, v1

    const/16 v1, 0x594

    const-string v3, "LORD"

    aput-object v3, v0, v1

    const/16 v1, 0x595

    const-string v3, "LORE"

    aput-object v3, v0, v1

    const/16 v1, 0x596

    const-string v3, "LOSE"

    aput-object v3, v0, v1

    const/16 v1, 0x597

    const-string v3, "LOSS"

    aput-object v3, v0, v1

    const/16 v1, 0x598

    const-string v3, "LOST"

    aput-object v3, v0, v1

    const/16 v1, 0x599

    const-string v3, "LOUD"

    aput-object v3, v0, v1

    const/16 v1, 0x59a

    const-string v3, "LOVE"

    aput-object v3, v0, v1

    const/16 v1, 0x59b

    const-string v3, "LOWE"

    aput-object v3, v0, v1

    const/16 v1, 0x59c

    const-string v3, "LUCK"

    aput-object v3, v0, v1

    const/16 v1, 0x59d

    const-string v3, "LUCY"

    aput-object v3, v0, v1

    const/16 v1, 0x59e

    const-string v3, "LUGE"

    aput-object v3, v0, v1

    const/16 v1, 0x59f

    const-string v3, "LUKE"

    aput-object v3, v0, v1

    const/16 v1, 0x5a0

    const-string v3, "LULU"

    aput-object v3, v0, v1

    const/16 v1, 0x5a1

    const-string v3, "LUND"

    aput-object v3, v0, v1

    const/16 v1, 0x5a2

    const-string v3, "LUNG"

    aput-object v3, v0, v1

    const/16 v1, 0x5a3

    const-string v3, "LURA"

    aput-object v3, v0, v1

    const/16 v1, 0x5a4

    const-string v3, "LURE"

    aput-object v3, v0, v1

    const/16 v1, 0x5a5

    const-string v3, "LURK"

    aput-object v3, v0, v1

    const/16 v1, 0x5a6

    const-string v3, "LUSH"

    aput-object v3, v0, v1

    const/16 v1, 0x5a7

    const-string v3, "LUST"

    aput-object v3, v0, v1

    const/16 v1, 0x5a8

    const-string v3, "LYLE"

    aput-object v3, v0, v1

    const/16 v1, 0x5a9

    const-string v3, "LYNN"

    aput-object v3, v0, v1

    const/16 v1, 0x5aa

    const-string v3, "LYON"

    aput-object v3, v0, v1

    const/16 v1, 0x5ab

    const-string v3, "LYRA"

    aput-object v3, v0, v1

    const/16 v1, 0x5ac

    const-string v3, "MACE"

    aput-object v3, v0, v1

    const/16 v1, 0x5ad

    const-string v3, "MADE"

    aput-object v3, v0, v1

    const/16 v1, 0x5ae

    const-string v3, "MAGI"

    aput-object v3, v0, v1

    const/16 v1, 0x5af

    const-string v3, "MAID"

    aput-object v3, v0, v1

    const/16 v1, 0x5b0

    const-string v3, "MAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x5b1

    const-string v3, "MAIN"

    aput-object v3, v0, v1

    const/16 v1, 0x5b2

    const-string v3, "MAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x5b3

    const-string v3, "MALE"

    aput-object v3, v0, v1

    const/16 v1, 0x5b4

    const-string v3, "MALI"

    aput-object v3, v0, v1

    const/16 v1, 0x5b5

    const-string v3, "MALL"

    aput-object v3, v0, v1

    const/16 v1, 0x5b6

    const-string v3, "MALT"

    aput-object v3, v0, v1

    const/16 v1, 0x5b7

    const-string v3, "MANA"

    aput-object v3, v0, v1

    const/16 v1, 0x5b8

    const-string v3, "MANN"

    aput-object v3, v0, v1

    const/16 v1, 0x5b9

    const-string v3, "MANY"

    aput-object v3, v0, v1

    const/16 v1, 0x5ba

    const-string v3, "MARC"

    aput-object v3, v0, v1

    const/16 v1, 0x5bb

    const-string v3, "MARE"

    aput-object v3, v0, v1

    const/16 v1, 0x5bc

    const-string v3, "MARK"

    aput-object v3, v0, v1

    const/16 v1, 0x5bd

    const-string v3, "MARS"

    aput-object v3, v0, v1

    const/16 v1, 0x5be

    const-string v3, "MART"

    aput-object v3, v0, v1

    const/16 v1, 0x5bf

    const-string v3, "MARY"

    aput-object v3, v0, v1

    const/16 v1, 0x5c0

    const-string v3, "MASH"

    aput-object v3, v0, v1

    const/16 v1, 0x5c1

    const-string v3, "MASK"

    aput-object v3, v0, v1

    const/16 v1, 0x5c2

    const-string v3, "MASS"

    aput-object v3, v0, v1

    const/16 v1, 0x5c3

    const-string v3, "MAST"

    aput-object v3, v0, v1

    const/16 v1, 0x5c4

    const-string v3, "MATE"

    aput-object v3, v0, v1

    const/16 v1, 0x5c5

    const-string v3, "MATH"

    aput-object v3, v0, v1

    const/16 v1, 0x5c6

    const-string v3, "MAUL"

    aput-object v3, v0, v1

    const/16 v1, 0x5c7

    const-string v3, "MAYO"

    aput-object v3, v0, v1

    const/16 v1, 0x5c8

    const-string v3, "MEAD"

    aput-object v3, v0, v1

    const/16 v1, 0x5c9

    const-string v3, "MEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x5ca

    const-string v3, "MEAN"

    aput-object v3, v0, v1

    const/16 v1, 0x5cb

    const-string v3, "MEAT"

    aput-object v3, v0, v1

    const/16 v1, 0x5cc

    const-string v3, "MEEK"

    aput-object v3, v0, v1

    const/16 v1, 0x5cd

    const-string v3, "MEET"

    aput-object v3, v0, v1

    const/16 v1, 0x5ce

    const-string v3, "MELD"

    aput-object v3, v0, v1

    const/16 v1, 0x5cf

    const-string v3, "MELT"

    aput-object v3, v0, v1

    const/16 v1, 0x5d0

    const-string v3, "MEMO"

    aput-object v3, v0, v1

    const/16 v1, 0x5d1

    const-string v3, "MEND"

    aput-object v3, v0, v1

    const/16 v1, 0x5d2

    const-string v3, "MENU"

    aput-object v3, v0, v1

    const/16 v1, 0x5d3

    const-string v3, "MERT"

    aput-object v3, v0, v1

    const/16 v1, 0x5d4

    const-string v3, "MESH"

    aput-object v3, v0, v1

    const/16 v1, 0x5d5

    const-string v3, "MESS"

    aput-object v3, v0, v1

    const/16 v1, 0x5d6

    const-string v3, "MICE"

    aput-object v3, v0, v1

    const/16 v1, 0x5d7

    const-string v3, "MIKE"

    aput-object v3, v0, v1

    const/16 v1, 0x5d8

    const-string v3, "MILD"

    aput-object v3, v0, v1

    const/16 v1, 0x5d9

    const-string v3, "MILE"

    aput-object v3, v0, v1

    const/16 v1, 0x5da

    const-string v3, "MILK"

    aput-object v3, v0, v1

    const/16 v1, 0x5db

    const-string v3, "MILL"

    aput-object v3, v0, v1

    const/16 v1, 0x5dc

    const-string v3, "MILT"

    aput-object v3, v0, v1

    const/16 v1, 0x5dd

    const-string v3, "MIMI"

    aput-object v3, v0, v1

    const/16 v1, 0x5de

    const-string v3, "MIND"

    aput-object v3, v0, v1

    const/16 v1, 0x5df

    const-string v3, "MINE"

    aput-object v3, v0, v1

    const/16 v1, 0x5e0

    const-string v3, "MINI"

    aput-object v3, v0, v1

    const/16 v1, 0x5e1

    const-string v3, "MINK"

    aput-object v3, v0, v1

    const/16 v1, 0x5e2

    const-string v3, "MINT"

    aput-object v3, v0, v1

    const/16 v1, 0x5e3

    const-string v3, "MIRE"

    aput-object v3, v0, v1

    const/16 v1, 0x5e4

    const-string v3, "MISS"

    aput-object v3, v0, v1

    const/16 v1, 0x5e5

    const-string v3, "MIST"

    aput-object v3, v0, v1

    const/16 v1, 0x5e6

    const-string v3, "MITE"

    aput-object v3, v0, v1

    const/16 v1, 0x5e7

    const-string v3, "MITT"

    aput-object v3, v0, v1

    const/16 v1, 0x5e8

    const-string v3, "MOAN"

    aput-object v3, v0, v1

    const/16 v1, 0x5e9

    const-string v3, "MOAT"

    aput-object v3, v0, v1

    const/16 v1, 0x5ea

    const-string v3, "MOCK"

    aput-object v3, v0, v1

    const/16 v1, 0x5eb

    const-string v3, "MODE"

    aput-object v3, v0, v1

    const/16 v1, 0x5ec

    const-string v3, "MOLD"

    aput-object v3, v0, v1

    const/16 v1, 0x5ed

    const-string v3, "MOLE"

    aput-object v3, v0, v1

    const/16 v1, 0x5ee

    const-string v3, "MOLL"

    aput-object v3, v0, v1

    const/16 v1, 0x5ef

    const-string v3, "MOLT"

    aput-object v3, v0, v1

    const/16 v1, 0x5f0

    const-string v3, "MONA"

    aput-object v3, v0, v1

    const/16 v1, 0x5f1

    const-string v3, "MONK"

    aput-object v3, v0, v1

    const/16 v1, 0x5f2

    const-string v3, "MONT"

    aput-object v3, v0, v1

    const/16 v1, 0x5f3

    const-string v3, "MOOD"

    aput-object v3, v0, v1

    const/16 v1, 0x5f4

    const-string v3, "MOON"

    aput-object v3, v0, v1

    const/16 v1, 0x5f5

    const-string v3, "MOOR"

    aput-object v3, v0, v1

    const/16 v1, 0x5f6

    const-string v3, "MOOT"

    aput-object v3, v0, v1

    const/16 v1, 0x5f7

    const-string v3, "MORE"

    aput-object v3, v0, v1

    const/16 v1, 0x5f8

    const-string v3, "MORN"

    aput-object v3, v0, v1

    const/16 v1, 0x5f9

    const-string v3, "MORT"

    aput-object v3, v0, v1

    const/16 v1, 0x5fa

    const-string v3, "MOSS"

    aput-object v3, v0, v1

    const/16 v1, 0x5fb

    const-string v3, "MOST"

    aput-object v3, v0, v1

    const/16 v1, 0x5fc

    const-string v3, "MOTH"

    aput-object v3, v0, v1

    const/16 v1, 0x5fd

    const-string v3, "MOVE"

    aput-object v3, v0, v1

    const/16 v1, 0x5fe

    const-string v3, "MUCH"

    aput-object v3, v0, v1

    const/16 v1, 0x5ff

    const-string v3, "MUCK"

    aput-object v3, v0, v1

    const/16 v1, 0x600

    const-string v3, "MUDD"

    aput-object v3, v0, v1

    const/16 v1, 0x601

    const-string v3, "MUFF"

    aput-object v3, v0, v1

    const/16 v1, 0x602

    const-string v3, "MULE"

    aput-object v3, v0, v1

    const/16 v1, 0x603

    const-string v3, "MULL"

    aput-object v3, v0, v1

    const/16 v1, 0x604

    const-string v3, "MURK"

    aput-object v3, v0, v1

    const/16 v1, 0x605

    const-string v3, "MUSH"

    aput-object v3, v0, v1

    const/16 v1, 0x606

    const-string v3, "MUST"

    aput-object v3, v0, v1

    const/16 v1, 0x607

    const-string v3, "MUTE"

    aput-object v3, v0, v1

    const/16 v1, 0x608

    const-string v3, "MUTT"

    aput-object v3, v0, v1

    const/16 v1, 0x609

    const-string v3, "MYRA"

    aput-object v3, v0, v1

    const/16 v1, 0x60a

    const-string v3, "MYTH"

    aput-object v3, v0, v1

    const/16 v1, 0x60b

    const-string v3, "NAGY"

    aput-object v3, v0, v1

    const/16 v1, 0x60c

    const-string v3, "NAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x60d

    const-string v3, "NAIR"

    aput-object v3, v0, v1

    const/16 v1, 0x60e

    const-string v3, "NAME"

    aput-object v3, v0, v1

    const/16 v1, 0x60f

    const-string v3, "NARY"

    aput-object v3, v0, v1

    const/16 v1, 0x610

    const-string v3, "NASH"

    aput-object v3, v0, v1

    const/16 v1, 0x611

    const-string v3, "NAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x612

    const-string v3, "NAVY"

    aput-object v3, v0, v1

    const/16 v1, 0x613

    const-string v3, "NEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x614

    const-string v3, "NEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x615

    const-string v3, "NEAT"

    aput-object v3, v0, v1

    const/16 v1, 0x616

    const-string v3, "NECK"

    aput-object v3, v0, v1

    const/16 v1, 0x617

    const-string v3, "NEED"

    aput-object v3, v0, v1

    const/16 v1, 0x618

    const-string v3, "NEIL"

    aput-object v3, v0, v1

    const/16 v1, 0x619

    const-string v3, "NELL"

    aput-object v3, v0, v1

    const/16 v1, 0x61a

    const-string v3, "NEON"

    aput-object v3, v0, v1

    const/16 v1, 0x61b

    const-string v3, "NERO"

    aput-object v3, v0, v1

    const/16 v1, 0x61c

    const-string v3, "NESS"

    aput-object v3, v0, v1

    const/16 v1, 0x61d

    const-string v3, "NEST"

    aput-object v3, v0, v1

    const/16 v1, 0x61e

    const-string v3, "NEWS"

    aput-object v3, v0, v1

    const/16 v1, 0x61f

    const-string v3, "NEWT"

    aput-object v3, v0, v1

    const/16 v1, 0x620

    const-string v3, "NIBS"

    aput-object v3, v0, v1

    const/16 v1, 0x621

    const-string v3, "NICE"

    aput-object v3, v0, v1

    const/16 v1, 0x622

    const-string v3, "NICK"

    aput-object v3, v0, v1

    const/16 v1, 0x623

    const-string v3, "NILE"

    aput-object v3, v0, v1

    const/16 v1, 0x624

    const-string v3, "NINA"

    aput-object v3, v0, v1

    const/16 v1, 0x625

    const-string v3, "NINE"

    aput-object v3, v0, v1

    const/16 v1, 0x626

    const-string v3, "NOAH"

    aput-object v3, v0, v1

    const/16 v1, 0x627

    const-string v3, "NODE"

    aput-object v3, v0, v1

    const/16 v1, 0x628

    const-string v3, "NOEL"

    aput-object v3, v0, v1

    const/16 v1, 0x629

    const-string v3, "NOLL"

    aput-object v3, v0, v1

    const/16 v1, 0x62a

    const-string v3, "NONE"

    aput-object v3, v0, v1

    const/16 v1, 0x62b

    const-string v3, "NOOK"

    aput-object v3, v0, v1

    const/16 v1, 0x62c

    const-string v3, "NOON"

    aput-object v3, v0, v1

    const/16 v1, 0x62d

    const-string v3, "NORM"

    aput-object v3, v0, v1

    const/16 v1, 0x62e

    const-string v3, "NOSE"

    aput-object v3, v0, v1

    const/16 v1, 0x62f

    const-string v3, "NOTE"

    aput-object v3, v0, v1

    const/16 v1, 0x630

    const-string v3, "NOUN"

    aput-object v3, v0, v1

    const/16 v1, 0x631

    const-string v3, "NOVA"

    aput-object v3, v0, v1

    const/16 v1, 0x632

    const-string v3, "NUDE"

    aput-object v3, v0, v1

    const/16 v1, 0x633

    const-string v3, "NULL"

    aput-object v3, v0, v1

    const/16 v1, 0x634

    const-string v3, "NUMB"

    aput-object v3, v0, v1

    const/16 v1, 0x635

    const-string v3, "OATH"

    aput-object v3, v0, v1

    const/16 v1, 0x636

    const-string v3, "OBEY"

    aput-object v3, v0, v1

    const/16 v1, 0x637

    const-string v3, "OBOE"

    aput-object v3, v0, v1

    const/16 v1, 0x638

    const-string v3, "ODIN"

    aput-object v3, v0, v1

    const/16 v1, 0x639

    const-string v3, "OHIO"

    aput-object v3, v0, v1

    const/16 v1, 0x63a

    const-string v3, "OILY"

    aput-object v3, v0, v1

    const/16 v1, 0x63b

    const-string v3, "OINT"

    aput-object v3, v0, v1

    const/16 v1, 0x63c

    const-string v3, "OKAY"

    aput-object v3, v0, v1

    const/16 v1, 0x63d

    const-string v3, "OLAF"

    aput-object v3, v0, v1

    const/16 v1, 0x63e

    const-string v3, "OLDY"

    aput-object v3, v0, v1

    const/16 v1, 0x63f

    const-string v3, "OLGA"

    aput-object v3, v0, v1

    const/16 v1, 0x640

    const-string v3, "OLIN"

    aput-object v3, v0, v1

    const/16 v1, 0x641

    const-string v3, "OMAN"

    aput-object v3, v0, v1

    const/16 v1, 0x642

    const-string v3, "OMEN"

    aput-object v3, v0, v1

    const/16 v1, 0x643

    const-string v3, "OMIT"

    aput-object v3, v0, v1

    const/16 v1, 0x644

    const-string v3, "ONCE"

    aput-object v3, v0, v1

    const/16 v1, 0x645

    const-string v3, "ONES"

    aput-object v3, v0, v1

    const/16 v1, 0x646

    const-string v3, "ONLY"

    aput-object v3, v0, v1

    const/16 v1, 0x647

    const-string v3, "ONTO"

    aput-object v3, v0, v1

    const/16 v1, 0x648

    const-string v3, "ONUS"

    aput-object v3, v0, v1

    const/16 v1, 0x649

    const-string v3, "ORAL"

    aput-object v3, v0, v1

    const/16 v1, 0x64a

    const-string v3, "ORGY"

    aput-object v3, v0, v1

    const/16 v1, 0x64b

    const-string v3, "OSLO"

    aput-object v3, v0, v1

    const/16 v1, 0x64c

    const-string v3, "OTIS"

    aput-object v3, v0, v1

    const/16 v1, 0x64d

    const-string v3, "OTTO"

    aput-object v3, v0, v1

    const/16 v1, 0x64e

    const-string v3, "OUCH"

    aput-object v3, v0, v1

    const/16 v1, 0x64f

    const-string v3, "OUST"

    aput-object v3, v0, v1

    const/16 v1, 0x650

    const-string v3, "OUTS"

    aput-object v3, v0, v1

    const/16 v1, 0x651

    const-string v3, "OVAL"

    aput-object v3, v0, v1

    const/16 v1, 0x652

    const-string v3, "OVEN"

    aput-object v3, v0, v1

    const/16 v1, 0x653

    const-string v3, "OVER"

    aput-object v3, v0, v1

    const/16 v1, 0x654

    const-string v3, "OWLY"

    aput-object v3, v0, v1

    const/16 v1, 0x655

    const-string v3, "OWNS"

    aput-object v3, v0, v1

    const/16 v1, 0x656

    const-string v3, "QUAD"

    aput-object v3, v0, v1

    const/16 v1, 0x657

    const-string v3, "QUIT"

    aput-object v3, v0, v1

    const/16 v1, 0x658

    const-string v3, "QUOD"

    aput-object v3, v0, v1

    const/16 v1, 0x659

    const-string v3, "RACE"

    aput-object v3, v0, v1

    const/16 v1, 0x65a

    const-string v3, "RACK"

    aput-object v3, v0, v1

    const/16 v1, 0x65b

    const-string v3, "RACY"

    aput-object v3, v0, v1

    const/16 v1, 0x65c

    const-string v3, "RAFT"

    aput-object v3, v0, v1

    const/16 v1, 0x65d

    const-string v3, "RAGE"

    aput-object v3, v0, v1

    const/16 v1, 0x65e

    const-string v3, "RAID"

    aput-object v3, v0, v1

    const/16 v1, 0x65f

    const-string v3, "RAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x660

    const-string v3, "RAIN"

    aput-object v3, v0, v1

    const/16 v1, 0x661

    const-string v3, "RAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x662

    const-string v3, "RANK"

    aput-object v3, v0, v1

    const/16 v1, 0x663

    const-string v3, "RANT"

    aput-object v3, v0, v1

    const/16 v1, 0x664

    const-string v3, "RARE"

    aput-object v3, v0, v1

    const/16 v1, 0x665

    const-string v3, "RASH"

    aput-object v3, v0, v1

    const/16 v1, 0x666

    const-string v3, "RATE"

    aput-object v3, v0, v1

    const/16 v1, 0x667

    const-string v3, "RAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x668

    const-string v3, "RAYS"

    aput-object v3, v0, v1

    const/16 v1, 0x669

    const-string v3, "READ"

    aput-object v3, v0, v1

    const/16 v1, 0x66a

    const-string v3, "REAL"

    aput-object v3, v0, v1

    const/16 v1, 0x66b

    const-string v3, "REAM"

    aput-object v3, v0, v1

    const/16 v1, 0x66c

    const-string v3, "REAR"

    aput-object v3, v0, v1

    const/16 v1, 0x66d

    const-string v3, "RECK"

    aput-object v3, v0, v1

    const/16 v1, 0x66e

    const-string v3, "REED"

    aput-object v3, v0, v1

    const/16 v1, 0x66f

    const-string v3, "REEF"

    aput-object v3, v0, v1

    const/16 v1, 0x670

    const-string v3, "REEK"

    aput-object v3, v0, v1

    const/16 v1, 0x671

    const-string v3, "REEL"

    aput-object v3, v0, v1

    const/16 v1, 0x672

    const-string v3, "REID"

    aput-object v3, v0, v1

    const/16 v1, 0x673

    const-string v3, "REIN"

    aput-object v3, v0, v1

    const/16 v1, 0x674

    const-string v3, "RENA"

    aput-object v3, v0, v1

    const/16 v1, 0x675

    const-string v3, "REND"

    aput-object v3, v0, v1

    const/16 v1, 0x676

    const-string v3, "RENT"

    aput-object v3, v0, v1

    const/16 v1, 0x677

    const-string v3, "REST"

    aput-object v3, v0, v1

    const/16 v1, 0x678

    const-string v3, "RICE"

    aput-object v3, v0, v1

    const/16 v1, 0x679

    const-string v3, "RICH"

    aput-object v3, v0, v1

    const/16 v1, 0x67a

    const-string v3, "RICK"

    aput-object v3, v0, v1

    const/16 v1, 0x67b

    const-string v3, "RIDE"

    aput-object v3, v0, v1

    const/16 v1, 0x67c

    const-string v3, "RIFT"

    aput-object v3, v0, v1

    const/16 v1, 0x67d

    const-string v3, "RILL"

    aput-object v3, v0, v1

    const/16 v1, 0x67e

    const-string v3, "RIME"

    aput-object v3, v0, v1

    const/16 v1, 0x67f

    const-string v3, "RING"

    aput-object v3, v0, v1

    const/16 v1, 0x680

    const-string v3, "RINK"

    aput-object v3, v0, v1

    const/16 v1, 0x681

    const-string v3, "RISE"

    aput-object v3, v0, v1

    const/16 v1, 0x682

    const-string v3, "RISK"

    aput-object v3, v0, v1

    const/16 v1, 0x683

    const-string v3, "RITE"

    aput-object v3, v0, v1

    const/16 v1, 0x684

    const-string v3, "ROAD"

    aput-object v3, v0, v1

    const/16 v1, 0x685

    const-string v3, "ROAM"

    aput-object v3, v0, v1

    const/16 v1, 0x686

    const-string v3, "ROAR"

    aput-object v3, v0, v1

    const/16 v1, 0x687

    const-string v3, "ROBE"

    aput-object v3, v0, v1

    const/16 v1, 0x688

    const-string v3, "ROCK"

    aput-object v3, v0, v1

    const/16 v1, 0x689

    const-string v3, "RODE"

    aput-object v3, v0, v1

    const/16 v1, 0x68a

    const-string v3, "ROIL"

    aput-object v3, v0, v1

    const/16 v1, 0x68b

    const-string v3, "ROLL"

    aput-object v3, v0, v1

    const/16 v1, 0x68c

    const-string v3, "ROME"

    aput-object v3, v0, v1

    const/16 v1, 0x68d

    const-string v3, "ROOD"

    aput-object v3, v0, v1

    const/16 v1, 0x68e

    const-string v3, "ROOF"

    aput-object v3, v0, v1

    const/16 v1, 0x68f

    const-string v3, "ROOK"

    aput-object v3, v0, v1

    const/16 v1, 0x690

    const-string v3, "ROOM"

    aput-object v3, v0, v1

    const/16 v1, 0x691

    const-string v3, "ROOT"

    aput-object v3, v0, v1

    const/16 v1, 0x692

    const-string v3, "ROSA"

    aput-object v3, v0, v1

    const/16 v1, 0x693

    const-string v3, "ROSE"

    aput-object v3, v0, v1

    const/16 v1, 0x694

    const-string v3, "ROSS"

    aput-object v3, v0, v1

    const/16 v1, 0x695

    const-string v3, "ROSY"

    aput-object v3, v0, v1

    const/16 v1, 0x696

    const-string v3, "ROTH"

    aput-object v3, v0, v1

    const/16 v1, 0x697

    const-string v3, "ROUT"

    aput-object v3, v0, v1

    const/16 v1, 0x698

    const-string v3, "ROVE"

    aput-object v3, v0, v1

    const/16 v1, 0x699

    const-string v3, "ROWE"

    aput-object v3, v0, v1

    const/16 v1, 0x69a

    const-string v3, "ROWS"

    aput-object v3, v0, v1

    const/16 v1, 0x69b

    const-string v3, "RUBE"

    aput-object v3, v0, v1

    const/16 v1, 0x69c

    const-string v3, "RUBY"

    aput-object v3, v0, v1

    const/16 v1, 0x69d

    const-string v3, "RUDE"

    aput-object v3, v0, v1

    const/16 v1, 0x69e

    const-string v3, "RUDY"

    aput-object v3, v0, v1

    const/16 v1, 0x69f

    const-string v3, "RUIN"

    aput-object v3, v0, v1

    const/16 v1, 0x6a0

    const-string v3, "RULE"

    aput-object v3, v0, v1

    const/16 v1, 0x6a1

    const-string v3, "RUNG"

    aput-object v3, v0, v1

    const/16 v1, 0x6a2

    const-string v3, "RUNS"

    aput-object v3, v0, v1

    const/16 v1, 0x6a3

    const-string v3, "RUNT"

    aput-object v3, v0, v1

    const/16 v1, 0x6a4

    const-string v3, "RUSE"

    aput-object v3, v0, v1

    const/16 v1, 0x6a5

    const-string v3, "RUSH"

    aput-object v3, v0, v1

    const/16 v1, 0x6a6

    const-string v3, "RUSK"

    aput-object v3, v0, v1

    const/16 v1, 0x6a7

    const-string v3, "RUSS"

    aput-object v3, v0, v1

    const/16 v1, 0x6a8

    const-string v3, "RUST"

    aput-object v3, v0, v1

    const/16 v1, 0x6a9

    const-string v3, "RUTH"

    aput-object v3, v0, v1

    const/16 v1, 0x6aa

    const-string v3, "SACK"

    aput-object v3, v0, v1

    const/16 v1, 0x6ab

    const-string v3, "SAFE"

    aput-object v3, v0, v1

    const/16 v1, 0x6ac

    const-string v3, "SAGE"

    aput-object v3, v0, v1

    const/16 v1, 0x6ad

    const-string v3, "SAID"

    aput-object v3, v0, v1

    const/16 v1, 0x6ae

    const-string v3, "SAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x6af

    const-string v3, "SALE"

    aput-object v3, v0, v1

    const/16 v1, 0x6b0

    const-string v3, "SALK"

    aput-object v3, v0, v1

    const/16 v1, 0x6b1

    const-string v3, "SALT"

    aput-object v3, v0, v1

    const/16 v1, 0x6b2

    const-string v3, "SAME"

    aput-object v3, v0, v1

    const/16 v1, 0x6b3

    const-string v3, "SAND"

    aput-object v3, v0, v1

    const/16 v1, 0x6b4

    const-string v3, "SANE"

    aput-object v3, v0, v1

    const/16 v1, 0x6b5

    const-string v3, "SANG"

    aput-object v3, v0, v1

    const/16 v1, 0x6b6

    const-string v3, "SANK"

    aput-object v3, v0, v1

    const/16 v1, 0x6b7

    const-string v3, "SARA"

    aput-object v3, v0, v1

    const/16 v1, 0x6b8

    const-string v3, "SAUL"

    aput-object v3, v0, v1

    const/16 v1, 0x6b9

    const-string v3, "SAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x6ba

    const-string v3, "SAYS"

    aput-object v3, v0, v1

    const/16 v1, 0x6bb

    const-string v3, "SCAN"

    aput-object v3, v0, v1

    const/16 v1, 0x6bc

    const-string v3, "SCAR"

    aput-object v3, v0, v1

    const/16 v1, 0x6bd

    const-string v3, "SCAT"

    aput-object v3, v0, v1

    const/16 v1, 0x6be

    const-string v3, "SCOT"

    aput-object v3, v0, v1

    const/16 v1, 0x6bf

    const-string v3, "SEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x6c0

    const-string v3, "SEAM"

    aput-object v3, v0, v1

    const/16 v1, 0x6c1

    const-string v3, "SEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x6c2

    const-string v3, "SEAT"

    aput-object v3, v0, v1

    const/16 v1, 0x6c3

    const-string v3, "SEED"

    aput-object v3, v0, v1

    const/16 v1, 0x6c4

    const-string v3, "SEEK"

    aput-object v3, v0, v1

    const/16 v1, 0x6c5

    const-string v3, "SEEM"

    aput-object v3, v0, v1

    const/16 v1, 0x6c6

    const-string v3, "SEEN"

    aput-object v3, v0, v1

    const/16 v1, 0x6c7

    const-string v3, "SEES"

    aput-object v3, v0, v1

    const/16 v1, 0x6c8

    const-string v3, "SELF"

    aput-object v3, v0, v1

    const/16 v1, 0x6c9

    const-string v3, "SELL"

    aput-object v3, v0, v1

    const/16 v1, 0x6ca

    const-string v3, "SEND"

    aput-object v3, v0, v1

    const/16 v1, 0x6cb

    const-string v3, "SENT"

    aput-object v3, v0, v1

    const/16 v1, 0x6cc

    const-string v3, "SETS"

    aput-object v3, v0, v1

    const/16 v1, 0x6cd

    const-string v3, "SEWN"

    aput-object v3, v0, v1

    const/16 v1, 0x6ce

    const-string v3, "SHAG"

    aput-object v3, v0, v1

    const/16 v1, 0x6cf

    const-string v3, "SHAM"

    aput-object v3, v0, v1

    const/16 v1, 0x6d0

    const-string v3, "SHAW"

    aput-object v3, v0, v1

    const/16 v1, 0x6d1

    const-string v3, "SHAY"

    aput-object v3, v0, v1

    const/16 v1, 0x6d2

    const-string v3, "SHED"

    aput-object v3, v0, v1

    const/16 v1, 0x6d3

    const-string v3, "SHIM"

    aput-object v3, v0, v1

    const/16 v1, 0x6d4

    const-string v3, "SHIN"

    aput-object v3, v0, v1

    const/16 v1, 0x6d5

    const-string v3, "SHOD"

    aput-object v3, v0, v1

    const/16 v1, 0x6d6

    const-string v3, "SHOE"

    aput-object v3, v0, v1

    const/16 v1, 0x6d7

    const-string v3, "SHOT"

    aput-object v3, v0, v1

    const/16 v1, 0x6d8

    const-string v3, "SHOW"

    aput-object v3, v0, v1

    const/16 v1, 0x6d9

    const-string v3, "SHUN"

    aput-object v3, v0, v1

    const/16 v1, 0x6da

    const-string v3, "SHUT"

    aput-object v3, v0, v1

    const/16 v1, 0x6db

    const-string v3, "SICK"

    aput-object v3, v0, v1

    const/16 v1, 0x6dc

    const-string v3, "SIDE"

    aput-object v3, v0, v1

    const/16 v1, 0x6dd

    const-string v3, "SIFT"

    aput-object v3, v0, v1

    const/16 v1, 0x6de

    const-string v3, "SIGH"

    aput-object v3, v0, v1

    const/16 v1, 0x6df

    const-string v3, "SIGN"

    aput-object v3, v0, v1

    const/16 v1, 0x6e0

    const-string v3, "SILK"

    aput-object v3, v0, v1

    const/16 v1, 0x6e1

    const-string v3, "SILL"

    aput-object v3, v0, v1

    const/16 v1, 0x6e2

    const-string v3, "SILO"

    aput-object v3, v0, v1

    const/16 v1, 0x6e3

    const-string v3, "SILT"

    aput-object v3, v0, v1

    const/16 v1, 0x6e4

    const-string v3, "SINE"

    aput-object v3, v0, v1

    const/16 v1, 0x6e5

    const-string v3, "SING"

    aput-object v3, v0, v1

    const/16 v1, 0x6e6

    const-string v3, "SINK"

    aput-object v3, v0, v1

    const/16 v1, 0x6e7

    const-string v3, "SIRE"

    aput-object v3, v0, v1

    const/16 v1, 0x6e8

    const-string v3, "SITE"

    aput-object v3, v0, v1

    const/16 v1, 0x6e9

    const-string v3, "SITS"

    aput-object v3, v0, v1

    const/16 v1, 0x6ea

    const-string v3, "SITU"

    aput-object v3, v0, v1

    const/16 v1, 0x6eb

    const-string v3, "SKAT"

    aput-object v3, v0, v1

    const/16 v1, 0x6ec

    const-string v3, "SKEW"

    aput-object v3, v0, v1

    const/16 v1, 0x6ed

    const-string v3, "SKID"

    aput-object v3, v0, v1

    const/16 v1, 0x6ee

    const-string v3, "SKIM"

    aput-object v3, v0, v1

    const/16 v1, 0x6ef

    const-string v3, "SKIN"

    aput-object v3, v0, v1

    const/16 v1, 0x6f0

    const-string v3, "SKIT"

    aput-object v3, v0, v1

    const/16 v1, 0x6f1

    const-string v3, "SLAB"

    aput-object v3, v0, v1

    const/16 v1, 0x6f2

    const-string v3, "SLAM"

    aput-object v3, v0, v1

    const/16 v1, 0x6f3

    const-string v3, "SLAT"

    aput-object v3, v0, v1

    const/16 v1, 0x6f4

    const-string v3, "SLAY"

    aput-object v3, v0, v1

    const/16 v1, 0x6f5

    const-string v3, "SLED"

    aput-object v3, v0, v1

    const/16 v1, 0x6f6

    const-string v3, "SLEW"

    aput-object v3, v0, v1

    const/16 v1, 0x6f7

    const-string v3, "SLID"

    aput-object v3, v0, v1

    const/16 v1, 0x6f8

    const-string v3, "SLIM"

    aput-object v3, v0, v1

    const/16 v1, 0x6f9

    const-string v3, "SLIT"

    aput-object v3, v0, v1

    const/16 v1, 0x6fa

    const-string v3, "SLOB"

    aput-object v3, v0, v1

    const/16 v1, 0x6fb

    const-string v3, "SLOG"

    aput-object v3, v0, v1

    const/16 v1, 0x6fc

    const-string v3, "SLOT"

    aput-object v3, v0, v1

    const/16 v1, 0x6fd

    const-string v3, "SLOW"

    aput-object v3, v0, v1

    const/16 v1, 0x6fe

    const-string v3, "SLUG"

    aput-object v3, v0, v1

    const/16 v1, 0x6ff

    const-string v3, "SLUM"

    aput-object v3, v0, v1

    const/16 v1, 0x700

    const-string v3, "SLUR"

    aput-object v3, v0, v1

    const/16 v1, 0x701

    const-string v3, "SMOG"

    aput-object v3, v0, v1

    const/16 v1, 0x702

    const-string v3, "SMUG"

    aput-object v3, v0, v1

    const/16 v1, 0x703

    const-string v3, "SNAG"

    aput-object v3, v0, v1

    const/16 v1, 0x704

    const-string v3, "SNOB"

    aput-object v3, v0, v1

    const/16 v1, 0x705

    const-string v3, "SNOW"

    aput-object v3, v0, v1

    const/16 v1, 0x706

    const-string v3, "SNUB"

    aput-object v3, v0, v1

    const/16 v1, 0x707

    const-string v3, "SNUG"

    aput-object v3, v0, v1

    const/16 v1, 0x708

    const-string v3, "SOAK"

    aput-object v3, v0, v1

    const/16 v1, 0x709

    const-string v3, "SOAR"

    aput-object v3, v0, v1

    const/16 v1, 0x70a

    const-string v3, "SOCK"

    aput-object v3, v0, v1

    const/16 v1, 0x70b

    const-string v3, "SODA"

    aput-object v3, v0, v1

    const/16 v1, 0x70c

    const-string v3, "SOFA"

    aput-object v3, v0, v1

    const/16 v1, 0x70d

    const-string v3, "SOFT"

    aput-object v3, v0, v1

    const/16 v1, 0x70e

    const-string v3, "SOIL"

    aput-object v3, v0, v1

    const/16 v1, 0x70f

    const-string v3, "SOLD"

    aput-object v3, v0, v1

    const/16 v1, 0x710

    const-string v3, "SOME"

    aput-object v3, v0, v1

    const/16 v1, 0x711

    const-string v3, "SONG"

    aput-object v3, v0, v1

    const/16 v1, 0x712

    const-string v3, "SOON"

    aput-object v3, v0, v1

    const/16 v1, 0x713

    const-string v3, "SOOT"

    aput-object v3, v0, v1

    const/16 v1, 0x714

    const-string v3, "SORE"

    aput-object v3, v0, v1

    const/16 v1, 0x715

    const-string v3, "SORT"

    aput-object v3, v0, v1

    const/16 v1, 0x716

    const-string v3, "SOUL"

    aput-object v3, v0, v1

    const/16 v1, 0x717

    const-string v3, "SOUR"

    aput-object v3, v0, v1

    const/16 v1, 0x718

    const-string v3, "SOWN"

    aput-object v3, v0, v1

    const/16 v1, 0x719

    const-string v3, "STAB"

    aput-object v3, v0, v1

    const/16 v1, 0x71a

    const-string v3, "STAG"

    aput-object v3, v0, v1

    const/16 v1, 0x71b

    const-string v3, "STAN"

    aput-object v3, v0, v1

    const/16 v1, 0x71c

    const-string v3, "STAR"

    aput-object v3, v0, v1

    const/16 v1, 0x71d

    const-string v3, "STAY"

    aput-object v3, v0, v1

    const/16 v1, 0x71e

    const-string v3, "STEM"

    aput-object v3, v0, v1

    const/16 v1, 0x71f

    const-string v3, "STEW"

    aput-object v3, v0, v1

    const/16 v1, 0x720

    const-string v3, "STIR"

    aput-object v3, v0, v1

    const/16 v1, 0x721

    const-string v3, "STOW"

    aput-object v3, v0, v1

    const/16 v1, 0x722

    const-string v3, "STUB"

    aput-object v3, v0, v1

    const/16 v1, 0x723

    const-string v3, "STUN"

    aput-object v3, v0, v1

    const/16 v1, 0x724

    const-string v3, "SUCH"

    aput-object v3, v0, v1

    const/16 v1, 0x725

    const-string v3, "SUDS"

    aput-object v3, v0, v1

    const/16 v1, 0x726

    const-string v3, "SUIT"

    aput-object v3, v0, v1

    const/16 v1, 0x727

    const-string v3, "SULK"

    aput-object v3, v0, v1

    const/16 v1, 0x728

    const-string v3, "SUMS"

    aput-object v3, v0, v1

    const/16 v1, 0x729

    const-string v3, "SUNG"

    aput-object v3, v0, v1

    const/16 v1, 0x72a

    const-string v3, "SUNK"

    aput-object v3, v0, v1

    const/16 v1, 0x72b

    const-string v3, "SURE"

    aput-object v3, v0, v1

    const/16 v1, 0x72c

    const-string v3, "SURF"

    aput-object v3, v0, v1

    const/16 v1, 0x72d

    const-string v3, "SWAB"

    aput-object v3, v0, v1

    const/16 v1, 0x72e

    const-string v3, "SWAG"

    aput-object v3, v0, v1

    const/16 v1, 0x72f

    const-string v3, "SWAM"

    aput-object v3, v0, v1

    const/16 v1, 0x730

    const-string v3, "SWAN"

    aput-object v3, v0, v1

    const/16 v1, 0x731

    const-string v3, "SWAT"

    aput-object v3, v0, v1

    const/16 v1, 0x732

    const-string v3, "SWAY"

    aput-object v3, v0, v1

    const/16 v1, 0x733

    const-string v3, "SWIM"

    aput-object v3, v0, v1

    const/16 v1, 0x734

    const-string v3, "SWUM"

    aput-object v3, v0, v1

    const/16 v1, 0x735

    const-string v3, "TACK"

    aput-object v3, v0, v1

    const/16 v1, 0x736

    const-string v3, "TACT"

    aput-object v3, v0, v1

    const/16 v1, 0x737

    const-string v3, "TAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x738

    const-string v3, "TAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x739

    const-string v3, "TALE"

    aput-object v3, v0, v1

    const/16 v1, 0x73a

    const-string v3, "TALK"

    aput-object v3, v0, v1

    const/16 v1, 0x73b

    const-string v3, "TALL"

    aput-object v3, v0, v1

    const/16 v1, 0x73c

    const-string v3, "TANK"

    aput-object v3, v0, v1

    const/16 v1, 0x73d

    const-string v3, "TASK"

    aput-object v3, v0, v1

    const/16 v1, 0x73e

    const-string v3, "TATE"

    aput-object v3, v0, v1

    const/16 v1, 0x73f

    const-string v3, "TAUT"

    aput-object v3, v0, v1

    const/16 v1, 0x740

    const-string v3, "TEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x741

    const-string v3, "TEAM"

    aput-object v3, v0, v1

    const/16 v1, 0x742

    const-string v3, "TEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x743

    const-string v3, "TECH"

    aput-object v3, v0, v1

    const/16 v1, 0x744

    const-string v3, "TEEM"

    aput-object v3, v0, v1

    const/16 v1, 0x745

    const-string v3, "TEEN"

    aput-object v3, v0, v1

    const/16 v1, 0x746

    const-string v3, "TEET"

    aput-object v3, v0, v1

    const/16 v1, 0x747

    const-string v3, "TELL"

    aput-object v3, v0, v1

    const/16 v1, 0x748

    const-string v3, "TEND"

    aput-object v3, v0, v1

    const/16 v1, 0x749

    const-string v3, "TENT"

    aput-object v3, v0, v1

    const/16 v1, 0x74a

    const-string v3, "TERM"

    aput-object v3, v0, v1

    const/16 v1, 0x74b

    const-string v3, "TERN"

    aput-object v3, v0, v1

    const/16 v1, 0x74c

    const-string v3, "TESS"

    aput-object v3, v0, v1

    const/16 v1, 0x74d

    const-string v3, "TEST"

    aput-object v3, v0, v1

    const/16 v1, 0x74e

    const-string v3, "THAN"

    aput-object v3, v0, v1

    const/16 v1, 0x74f

    const-string v3, "THAT"

    aput-object v3, v0, v1

    const/16 v1, 0x750

    const-string v3, "THEE"

    aput-object v3, v0, v1

    const/16 v1, 0x751

    const-string v3, "THEM"

    aput-object v3, v0, v1

    const/16 v1, 0x752

    const-string v3, "THEN"

    aput-object v3, v0, v1

    const/16 v1, 0x753

    const-string v3, "THEY"

    aput-object v3, v0, v1

    const/16 v1, 0x754

    const-string v3, "THIN"

    aput-object v3, v0, v1

    const/16 v1, 0x755

    const-string v3, "THIS"

    aput-object v3, v0, v1

    const/16 v1, 0x756

    const-string v3, "THUD"

    aput-object v3, v0, v1

    const/16 v1, 0x757

    const-string v3, "THUG"

    aput-object v3, v0, v1

    const/16 v1, 0x758

    const-string v3, "TICK"

    aput-object v3, v0, v1

    const/16 v1, 0x759

    const-string v3, "TIDE"

    aput-object v3, v0, v1

    const/16 v1, 0x75a

    const-string v3, "TIDY"

    aput-object v3, v0, v1

    const/16 v1, 0x75b

    const-string v3, "TIED"

    aput-object v3, v0, v1

    const/16 v1, 0x75c

    const-string v3, "TIER"

    aput-object v3, v0, v1

    const/16 v1, 0x75d

    const-string v3, "TILE"

    aput-object v3, v0, v1

    const/16 v1, 0x75e

    const-string v3, "TILL"

    aput-object v3, v0, v1

    const/16 v1, 0x75f

    const-string v3, "TILT"

    aput-object v3, v0, v1

    const/16 v1, 0x760

    const-string v3, "TIME"

    aput-object v3, v0, v1

    const/16 v1, 0x761

    const-string v3, "TINA"

    aput-object v3, v0, v1

    const/16 v1, 0x762

    const-string v3, "TINE"

    aput-object v3, v0, v1

    const/16 v1, 0x763

    const-string v3, "TINT"

    aput-object v3, v0, v1

    const/16 v1, 0x764

    const-string v3, "TINY"

    aput-object v3, v0, v1

    const/16 v1, 0x765

    const-string v3, "TIRE"

    aput-object v3, v0, v1

    const/16 v1, 0x766

    const-string v3, "TOAD"

    aput-object v3, v0, v1

    const/16 v1, 0x767

    const-string v3, "TOGO"

    aput-object v3, v0, v1

    const/16 v1, 0x768

    const-string v3, "TOIL"

    aput-object v3, v0, v1

    const/16 v1, 0x769

    const-string v3, "TOLD"

    aput-object v3, v0, v1

    const/16 v1, 0x76a

    const-string v3, "TOLL"

    aput-object v3, v0, v1

    const/16 v1, 0x76b

    const-string v3, "TONE"

    aput-object v3, v0, v1

    const/16 v1, 0x76c

    const-string v3, "TONG"

    aput-object v3, v0, v1

    const/16 v1, 0x76d

    const-string v3, "TONY"

    aput-object v3, v0, v1

    const/16 v1, 0x76e

    const-string v3, "TOOK"

    aput-object v3, v0, v1

    const/16 v1, 0x76f

    const-string v3, "TOOL"

    aput-object v3, v0, v1

    const/16 v1, 0x770

    const-string v3, "TOOT"

    aput-object v3, v0, v1

    const/16 v1, 0x771

    const-string v3, "TORE"

    aput-object v3, v0, v1

    const/16 v1, 0x772

    const-string v3, "TORN"

    aput-object v3, v0, v1

    const/16 v1, 0x773

    const-string v3, "TOTE"

    aput-object v3, v0, v1

    const/16 v1, 0x774

    const-string v3, "TOUR"

    aput-object v3, v0, v1

    const/16 v1, 0x775

    const-string v3, "TOUT"

    aput-object v3, v0, v1

    const/16 v1, 0x776

    const-string v3, "TOWN"

    aput-object v3, v0, v1

    const/16 v1, 0x777

    const-string v3, "TRAG"

    aput-object v3, v0, v1

    const/16 v1, 0x778

    const-string v3, "TRAM"

    aput-object v3, v0, v1

    const/16 v1, 0x779

    const-string v3, "TRAY"

    aput-object v3, v0, v1

    const/16 v1, 0x77a

    const-string v3, "TREE"

    aput-object v3, v0, v1

    const/16 v1, 0x77b

    const-string v3, "TREK"

    aput-object v3, v0, v1

    const/16 v1, 0x77c

    const-string v3, "TRIG"

    aput-object v3, v0, v1

    const/16 v1, 0x77d

    const-string v3, "TRIM"

    aput-object v3, v0, v1

    const/16 v1, 0x77e

    const-string v3, "TRIO"

    aput-object v3, v0, v1

    const/16 v1, 0x77f

    const-string v3, "TROD"

    aput-object v3, v0, v1

    const/16 v1, 0x780

    const-string v3, "TROT"

    aput-object v3, v0, v1

    const/16 v1, 0x781

    const-string v3, "TROY"

    aput-object v3, v0, v1

    const/16 v1, 0x782

    const-string v3, "TRUE"

    aput-object v3, v0, v1

    const/16 v1, 0x783

    const-string v3, "TUBA"

    aput-object v3, v0, v1

    const/16 v1, 0x784

    const-string v3, "TUBE"

    aput-object v3, v0, v1

    const/16 v1, 0x785

    const-string v3, "TUCK"

    aput-object v3, v0, v1

    const/16 v1, 0x786

    const-string v3, "TUFT"

    aput-object v3, v0, v1

    const/16 v1, 0x787

    const-string v3, "TUNA"

    aput-object v3, v0, v1

    const/16 v1, 0x788

    const-string v3, "TUNE"

    aput-object v3, v0, v1

    const/16 v1, 0x789

    const-string v3, "TUNG"

    aput-object v3, v0, v1

    const/16 v1, 0x78a

    const-string v3, "TURF"

    aput-object v3, v0, v1

    const/16 v1, 0x78b

    const-string v3, "TURN"

    aput-object v3, v0, v1

    const/16 v1, 0x78c

    const-string v3, "TUSK"

    aput-object v3, v0, v1

    const/16 v1, 0x78d

    const-string v3, "TWIG"

    aput-object v3, v0, v1

    const/16 v1, 0x78e

    const-string v3, "TWIN"

    aput-object v3, v0, v1

    const/16 v1, 0x78f

    const-string v3, "TWIT"

    aput-object v3, v0, v1

    const/16 v1, 0x790

    const-string v3, "ULAN"

    aput-object v3, v0, v1

    const/16 v1, 0x791

    const-string v3, "UNIT"

    aput-object v3, v0, v1

    const/16 v1, 0x792

    const-string v3, "URGE"

    aput-object v3, v0, v1

    const/16 v1, 0x793

    const-string v3, "USED"

    aput-object v3, v0, v1

    const/16 v1, 0x794

    const-string v3, "USER"

    aput-object v3, v0, v1

    const/16 v1, 0x795

    const-string v3, "USES"

    aput-object v3, v0, v1

    const/16 v1, 0x796

    const-string v3, "UTAH"

    aput-object v3, v0, v1

    const/16 v1, 0x797

    const-string v3, "VAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x798

    const-string v3, "VAIN"

    aput-object v3, v0, v1

    const/16 v1, 0x799

    const-string v3, "VALE"

    aput-object v3, v0, v1

    const/16 v1, 0x79a

    const-string v3, "VARY"

    aput-object v3, v0, v1

    const/16 v1, 0x79b

    const-string v3, "VASE"

    aput-object v3, v0, v1

    const/16 v1, 0x79c

    const-string v3, "VAST"

    aput-object v3, v0, v1

    const/16 v1, 0x79d

    const-string v3, "VEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x79e

    const-string v3, "VEDA"

    aput-object v3, v0, v1

    const/16 v1, 0x79f

    const-string v3, "VEIL"

    aput-object v3, v0, v1

    const/16 v1, 0x7a0

    const-string v3, "VEIN"

    aput-object v3, v0, v1

    const/16 v1, 0x7a1

    const-string v3, "VEND"

    aput-object v3, v0, v1

    const/16 v1, 0x7a2

    const-string v3, "VENT"

    aput-object v3, v0, v1

    const/16 v1, 0x7a3

    const-string v3, "VERB"

    aput-object v3, v0, v1

    const/16 v1, 0x7a4

    const-string v3, "VERY"

    aput-object v3, v0, v1

    const/16 v1, 0x7a5

    const-string v3, "VETO"

    aput-object v3, v0, v1

    const/16 v1, 0x7a6

    const-string v3, "VICE"

    aput-object v3, v0, v1

    const/16 v1, 0x7a7

    const-string v3, "VIEW"

    aput-object v3, v0, v1

    const/16 v1, 0x7a8

    const-string v3, "VINE"

    aput-object v3, v0, v1

    const/16 v1, 0x7a9

    const-string v3, "VISE"

    aput-object v3, v0, v1

    const/16 v1, 0x7aa

    const-string v3, "VOID"

    aput-object v3, v0, v1

    const/16 v1, 0x7ab

    const-string v3, "VOLT"

    aput-object v3, v0, v1

    const/16 v1, 0x7ac

    const-string v3, "VOTE"

    aput-object v3, v0, v1

    const/16 v1, 0x7ad

    const-string v3, "WACK"

    aput-object v3, v0, v1

    const/16 v1, 0x7ae

    const-string v3, "WADE"

    aput-object v3, v0, v1

    const/16 v1, 0x7af

    const-string v3, "WAGE"

    aput-object v3, v0, v1

    const/16 v1, 0x7b0

    const-string v3, "WAIL"

    aput-object v3, v0, v1

    const/16 v1, 0x7b1

    const-string v3, "WAIT"

    aput-object v3, v0, v1

    const/16 v1, 0x7b2

    const-string v3, "WAKE"

    aput-object v3, v0, v1

    const/16 v1, 0x7b3

    const-string v3, "WALE"

    aput-object v3, v0, v1

    const/16 v1, 0x7b4

    const-string v3, "WALK"

    aput-object v3, v0, v1

    const/16 v1, 0x7b5

    const-string v3, "WALL"

    aput-object v3, v0, v1

    const/16 v1, 0x7b6

    const-string v3, "WALT"

    aput-object v3, v0, v1

    const/16 v1, 0x7b7

    const-string v3, "WAND"

    aput-object v3, v0, v1

    const/16 v1, 0x7b8

    const-string v3, "WANE"

    aput-object v3, v0, v1

    const/16 v1, 0x7b9

    const-string v3, "WANG"

    aput-object v3, v0, v1

    const/16 v1, 0x7ba

    const-string v3, "WANT"

    aput-object v3, v0, v1

    const/16 v1, 0x7bb

    const-string v3, "WARD"

    aput-object v3, v0, v1

    const/16 v1, 0x7bc

    const-string v3, "WARM"

    aput-object v3, v0, v1

    const/16 v1, 0x7bd

    const-string v3, "WARN"

    aput-object v3, v0, v1

    const/16 v1, 0x7be

    const-string v3, "WART"

    aput-object v3, v0, v1

    const/16 v1, 0x7bf

    const-string v3, "WASH"

    aput-object v3, v0, v1

    const/16 v1, 0x7c0

    const-string v3, "WAST"

    aput-object v3, v0, v1

    const/16 v1, 0x7c1

    const-string v3, "WATS"

    aput-object v3, v0, v1

    const/16 v1, 0x7c2

    const-string v3, "WATT"

    aput-object v3, v0, v1

    const/16 v1, 0x7c3

    const-string v3, "WAVE"

    aput-object v3, v0, v1

    const/16 v1, 0x7c4

    const-string v3, "WAVY"

    aput-object v3, v0, v1

    const/16 v1, 0x7c5

    const-string v3, "WAYS"

    aput-object v3, v0, v1

    const/16 v1, 0x7c6

    const-string v3, "WEAK"

    aput-object v3, v0, v1

    const/16 v1, 0x7c7

    const-string v3, "WEAL"

    aput-object v3, v0, v1

    const/16 v1, 0x7c8

    const-string v3, "WEAN"

    aput-object v3, v0, v1

    const/16 v1, 0x7c9

    const-string v3, "WEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x7ca

    const-string v3, "WEED"

    aput-object v3, v0, v1

    const/16 v1, 0x7cb

    const-string v3, "WEEK"

    aput-object v3, v0, v1

    const/16 v1, 0x7cc

    const-string v3, "WEIR"

    aput-object v3, v0, v1

    const/16 v1, 0x7cd

    const-string v3, "WELD"

    aput-object v3, v0, v1

    const/16 v1, 0x7ce

    const-string v3, "WELL"

    aput-object v3, v0, v1

    const/16 v1, 0x7cf

    const-string v3, "WELT"

    aput-object v3, v0, v1

    const/16 v1, 0x7d0

    const-string v3, "WENT"

    aput-object v3, v0, v1

    const/16 v1, 0x7d1

    const-string v3, "WERE"

    aput-object v3, v0, v1

    const/16 v1, 0x7d2

    const-string v3, "WERT"

    aput-object v3, v0, v1

    const/16 v1, 0x7d3

    const-string v3, "WEST"

    aput-object v3, v0, v1

    const/16 v1, 0x7d4

    const-string v3, "WHAM"

    aput-object v3, v0, v1

    const/16 v1, 0x7d5

    const-string v3, "WHAT"

    aput-object v3, v0, v1

    const/16 v1, 0x7d6

    const-string v3, "WHEE"

    aput-object v3, v0, v1

    const/16 v1, 0x7d7

    const-string v3, "WHEN"

    aput-object v3, v0, v1

    const/16 v1, 0x7d8

    const-string v3, "WHET"

    aput-object v3, v0, v1

    const/16 v1, 0x7d9

    const-string v3, "WHOA"

    aput-object v3, v0, v1

    const/16 v1, 0x7da

    const-string v3, "WHOM"

    aput-object v3, v0, v1

    const/16 v1, 0x7db

    const-string v3, "WICK"

    aput-object v3, v0, v1

    const/16 v1, 0x7dc

    const-string v3, "WIFE"

    aput-object v3, v0, v1

    const/16 v1, 0x7dd

    const-string v3, "WILD"

    aput-object v3, v0, v1

    const/16 v1, 0x7de

    const-string v3, "WILL"

    aput-object v3, v0, v1

    const/16 v1, 0x7df

    const-string v3, "WIND"

    aput-object v3, v0, v1

    const/16 v1, 0x7e0

    const-string v3, "WINE"

    aput-object v3, v0, v1

    const/16 v1, 0x7e1

    const-string v3, "WING"

    aput-object v3, v0, v1

    const/16 v1, 0x7e2

    const-string v3, "WINK"

    aput-object v3, v0, v1

    const/16 v1, 0x7e3

    const-string v3, "WINO"

    aput-object v3, v0, v1

    const/16 v1, 0x7e4

    const-string v3, "WIRE"

    aput-object v3, v0, v1

    const/16 v1, 0x7e5

    const-string v3, "WISE"

    aput-object v3, v0, v1

    const/16 v1, 0x7e6

    const-string v3, "WISH"

    aput-object v3, v0, v1

    const/16 v1, 0x7e7

    const-string v3, "WITH"

    aput-object v3, v0, v1

    const/16 v1, 0x7e8

    const-string v3, "WOLF"

    aput-object v3, v0, v1

    const/16 v1, 0x7e9

    const-string v3, "WONT"

    aput-object v3, v0, v1

    const/16 v1, 0x7ea

    const-string v3, "WOOD"

    aput-object v3, v0, v1

    const/16 v1, 0x7eb

    const-string v3, "WOOL"

    aput-object v3, v0, v1

    const/16 v1, 0x7ec

    const-string v3, "WORD"

    aput-object v3, v0, v1

    const/16 v1, 0x7ed

    const-string v3, "WORE"

    aput-object v3, v0, v1

    const/16 v1, 0x7ee

    const-string v3, "WORK"

    aput-object v3, v0, v1

    const/16 v1, 0x7ef

    const-string v3, "WORM"

    aput-object v3, v0, v1

    const/16 v1, 0x7f0

    const-string v3, "WORN"

    aput-object v3, v0, v1

    const/16 v1, 0x7f1

    const-string v3, "WOVE"

    aput-object v3, v0, v1

    const/16 v1, 0x7f2

    const-string v3, "WRIT"

    aput-object v3, v0, v1

    const/16 v1, 0x7f3

    const-string v3, "WYNN"

    aput-object v3, v0, v1

    const/16 v1, 0x7f4

    const-string v3, "YALE"

    aput-object v3, v0, v1

    const/16 v1, 0x7f5

    const-string v3, "YANG"

    aput-object v3, v0, v1

    const/16 v1, 0x7f6

    const-string v3, "YANK"

    aput-object v3, v0, v1

    const/16 v1, 0x7f7

    const-string v3, "YARD"

    aput-object v3, v0, v1

    const/16 v1, 0x7f8

    const-string v3, "YARN"

    aput-object v3, v0, v1

    const/16 v1, 0x7f9

    const-string v3, "YAWL"

    aput-object v3, v0, v1

    const/16 v1, 0x7fa

    const-string v3, "YAWN"

    aput-object v3, v0, v1

    const/16 v1, 0x7fb

    const-string v3, "YEAH"

    aput-object v3, v0, v1

    const/16 v1, 0x7fc

    const-string v3, "YEAR"

    aput-object v3, v0, v1

    const/16 v1, 0x7fd

    const-string v3, "YELL"

    aput-object v3, v0, v1

    const/16 v1, 0x7fe

    const-string v3, "YOGA"

    aput-object v3, v0, v1

    const/16 v1, 0x7ff

    const-string v3, "YOKE"

    aput-object v3, v0, v1

    .line 851
    .local v0, "words":[Ljava/lang/String;
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 852
    .local v1, "random":Ljava/util/Random;
    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    .line 853
    .local v3, "r":I
    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    .line 854
    .local v2, "v":I
    aget-object v4, v0, v3

    aget-object v5, v0, v2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private processExtrasAndData(Landroid/content/Intent;Z)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "restart"    # Z

    .line 325
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 326
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 327
    sget-object v1, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "extras: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 329
    .local v1, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 330
    sget-object v2, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Extra Key: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 333
    .end local v1    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    .line 334
    .local v1, "data":Ljava/lang/String;
    const/4 v2, 0x1

    if-eqz v1, :cond_1

    const-string v3, "aicompanion"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 335
    iput-boolean v2, p0, Lcom/google/appinventor/components/runtime/ReplForm;->isDirect:Z

    .line 336
    iput-boolean v2, p0, Lcom/google/appinventor/components/runtime/ReplForm;->assetsLoaded:Z

    .line 338
    :cond_1
    if-eqz v0, :cond_3

    const-string v3, "rundirect"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 339
    sget-object v3, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "processExtrasAndData rundirect is true and restart is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    iput-boolean v2, p0, Lcom/google/appinventor/components/runtime/ReplForm;->isDirect:Z

    .line 341
    iput-boolean v2, p0, Lcom/google/appinventor/components/runtime/ReplForm;->assetsLoaded:Z

    .line 342
    if-eqz p2, :cond_3

    .line 343
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->clear()V

    .line 344
    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ReplForm;->httpdServer:Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

    if-eqz v3, :cond_2

    .line 345
    invoke-virtual {v3}, Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;->resetSeq()V

    goto :goto_1

    .line 347
    :cond_2
    invoke-virtual {p0, v2}, Lcom/google/appinventor/components/runtime/ReplForm;->startHTTPD(Z)V

    .line 348
    const-string v2, "emulator"

    invoke-static {v2}, Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;->setHmacKey(Ljava/lang/String;)V

    .line 352
    :cond_3
    :goto_1
    return-void
.end method

.method public static returnRetvals(Ljava/lang/String;)V
    .locals 4
    .param p0, "retvals"    # Ljava/lang/String;

    .line 507
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->activeForm:Lcom/google/appinventor/components/runtime/Form;

    check-cast v0, Lcom/google/appinventor/components/runtime/ReplForm;

    .line 508
    .local v0, "form":Lcom/google/appinventor/components/runtime/ReplForm;
    sget-object v1, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "returnRetvals: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    invoke-virtual {v0, p0}, Lcom/google/appinventor/components/runtime/ReplForm;->sendToCompanion(Ljava/lang/String;)V

    .line 510
    return-void
.end method

.method private startChromebook(Ljava/lang/String;)V
    .locals 11
    .param p1, "data"    # Ljava/lang/String;

    .line 370
    const-string v0, "//comp/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x7

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 371
    .local v0, "code":Ljava/lang/String;
    new-instance v1, Lcom/google/appinventor/components/runtime/PhoneStatus;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/PhoneStatus;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V

    .line 372
    .local v1, "status":Lcom/google/appinventor/components/runtime/PhoneStatus;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/google/appinventor/components/runtime/PhoneStatus;->WebRTC(Z)V

    .line 373
    const-string v2, "rendezvous.appinventor.mit.edu"

    invoke-virtual {v1, v0, v2}, Lcom/google/appinventor/components/runtime/PhoneStatus;->setHmacSeedReturnCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 374
    invoke-static {}, Lcom/google/appinventor/components/runtime/PhoneStatus;->GetWifiIpAddress()Ljava/lang/String;

    move-result-object v3

    .line 375
    .local v3, "ipAddress":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/PhoneStatus;->SdkLevel()I

    move-result v4

    .line 376
    .local v4, "api":I
    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/PhoneStatus;->GetVersionName()Ljava/lang/String;

    move-result-object v5

    .line 377
    .local v5, "version":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/PhoneStatus;->InstallationId()Ljava/lang/String;

    move-result-object v6

    .line 378
    .local v6, "aid":Ljava/lang/String;
    sget-object v7, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "InstallationId = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    new-instance v7, Lcom/google/appinventor/components/runtime/Web;

    invoke-direct {v7, p0}, Lcom/google/appinventor/components/runtime/Web;-><init>(Lcom/google/appinventor/components/runtime/ComponentContainer;)V

    .line 380
    .local v7, "web":Lcom/google/appinventor/components/runtime/Web;
    const-string v8, "http://rendezvous.appinventor.mit.edu/rendezvous/"

    invoke-virtual {v7, v8}, Lcom/google/appinventor/components/runtime/Web;->Url(Ljava/lang/String;)V

    .line 381
    nop

    .line 383
    invoke-virtual {v1}, Lcom/google/appinventor/components/runtime/PhoneStatus;->GetInstaller()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ipaddr="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "&port=9987&webrtc=true&version="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "&api="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "&aid="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "&installer="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "&r2=true&key="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 381
    invoke-virtual {v7, v8}, Lcom/google/appinventor/components/runtime/Web;->PostText(Ljava/lang/String;)V

    .line 384
    const-string v8, "OK"

    invoke-virtual {v1, v2, v8}, Lcom/google/appinventor/components/runtime/PhoneStatus;->startWebRTC(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    return-void
.end method


# virtual methods
.method HandleReturnValues()V
    .locals 4

    .line 316
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResult:Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HandleReturnValues() Called, replResult = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResult:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 318
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResultFormName:Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/google/appinventor/components/runtime/ReplForm;->OtherScreenClosed(Ljava/lang/String;Ljava/lang/Object;)V

    .line 319
    const-string v1, "Called OtherScreenClosed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResult:Ljava/lang/Object;

    .line 322
    :cond_0
    return-void
.end method

.method public Theme(Ljava/lang/String;)V
    .locals 0
    .param p1, "theme"    # Ljava/lang/String;
    .annotation runtime Lcom/google/appinventor/components/annotations/SimpleProperty;
        userVisible = false
    .end annotation

    .line 501
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->currentTheme:Ljava/lang/String;

    .line 502
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/Form;->Theme(Ljava/lang/String;)V

    .line 503
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->updateTitle()V

    .line 504
    return-void
.end method

.method public addLogcatButton(Landroid/view/Menu;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .line 287
    invoke-static {}, Lcom/google/appinventor/components/runtime/ReplApplication;->isAcraActive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 288
    return-void

    .line 290
    :cond_0
    const/4 v0, 0x4

    const-string v1, "Send Error Report"

    const/4 v2, 0x0

    invoke-interface {p1, v2, v2, v0, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/ReplForm$5;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/ReplForm$5;-><init>(Lcom/google/appinventor/components/runtime/ReplForm;)V

    .line 291
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    move-result-object v0

    .line 301
    .local v0, "showSettingsItem":Landroid/view/MenuItem;
    const v1, 0x108008a

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 302
    return-void
.end method

.method public addSettingsButton(Landroid/view/Menu;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .line 275
    const/4 v0, 0x3

    const-string v1, "Settings"

    const/4 v2, 0x0

    invoke-interface {p1, v2, v2, v0, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v1, Lcom/google/appinventor/components/runtime/ReplForm$4;

    invoke-direct {v1, p0}, Lcom/google/appinventor/components/runtime/ReplForm$4;-><init>(Lcom/google/appinventor/components/runtime/ReplForm;)V

    .line 276
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    move-result-object v0

    .line 283
    .local v0, "showSettingsItem":Landroid/view/MenuItem;
    const v1, 0x1080093

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 284
    return-void
.end method

.method protected closeApplicationFromBlocks()V
    .locals 1

    .line 253
    new-instance v0, Lcom/google/appinventor/components/runtime/ReplForm$3;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/ReplForm$3;-><init>(Lcom/google/appinventor/components/runtime/ReplForm;)V

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ReplForm;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 259
    return-void
.end method

.method protected closeForm(Landroid/content/Intent;)V
    .locals 1
    .param p1, "resultIntent"    # Landroid/content/Intent;

    .line 241
    const-string v0, "Not Yet"

    invoke-static {v0}, Lcom/google/appinventor/components/runtime/util/RetValManager;->popScreen(Ljava/lang/String;)V

    .line 242
    return-void
.end method

.method protected defaultPropertyValues()V
    .locals 1

    .line 197
    invoke-super {p0}, Lcom/google/appinventor/components/runtime/Form;->defaultPropertyValues()V

    .line 202
    const-string v0, "AppTheme.Light.DarkActionBar"

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ReplForm;->Theme(Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method public evalScheme(Ljava/lang/String;)V
    .locals 1
    .param p1, "sexp"    # Ljava/lang/String;

    .line 525
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->schemeInterface:Lcom/google/appinventor/components/runtime/ReplForm$SchemeInterface;

    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/ReplForm$SchemeInterface;->eval(Ljava/lang/String;)V

    .line 526
    return-void
.end method

.method public getAssetPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "asset"    # Ljava/lang/String;

    .line 530
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replAssetDir:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAssetPathForExtension(Lcom/google/appinventor/components/runtime/Component;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "component"    # Lcom/google/appinventor/components/runtime/Component;
    .param p2, "asset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 554
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/google/appinventor/components/annotations/SimpleObject;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/google/appinventor/components/annotations/SimpleObject;

    .line 555
    .local v0, "annotation":Lcom/google/appinventor/components/annotations/SimpleObject;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/google/appinventor/components/annotations/SimpleObject;->external()Z

    move-result v1

    if-nez v1, :cond_0

    .line 556
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:///android_asset/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 559
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 560
    .local v1, "extensionId":Ljava/lang/String;
    const/4 v2, 0x0

    .line 562
    .local v2, "pkgPath":Ljava/lang/String;
    :goto_0
    const-string v3, "."

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 563
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replCompDir:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/assets"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 564
    .local v3, "dir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 566
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 567
    goto :goto_1

    .line 571
    :cond_1
    const/16 v4, 0x2e

    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 572
    .end local v3    # "dir":Ljava/io/File;
    goto :goto_0

    .line 573
    :cond_2
    :goto_1
    if-eqz v2, :cond_3

    .line 574
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    .local v3, "result":Ljava/io/File;
    sget-object v4, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "result = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 577
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 580
    .end local v3    # "result":Ljava/io/File;
    :cond_3
    new-instance v3, Ljava/io/FileNotFoundException;

    invoke-direct {v3}, Ljava/io/FileNotFoundException;-><init>()V

    goto :goto_3

    :goto_2
    throw v3

    :goto_3
    goto :goto_2
.end method

.method public getCachePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "cache"    # Ljava/lang/String;

    .line 535
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    const-string v2, "file://"

    if-ge v0, v1, :cond_0

    .line 536
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/AppInventor/cache/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 539
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrivatePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "fileName"    # Ljava/lang/String;

    .line 545
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lcom/google/appinventor/components/runtime/util/QUtil;->getReplDataPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAssetsLoaded()Z
    .locals 1

    .line 431
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->assetsLoaded:Z

    return v0
.end method

.method public isDirect()Z
    .locals 1

    .line 388
    iget-boolean v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->isDirect:Z

    return v0
.end method

.method public isRepl()Z
    .locals 1

    .line 585
    const/4 v0, 0x1

    return v0
.end method

.method public loadComponents(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 444
    .local p1, "extensionNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 445
    return-void

    .line 448
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 449
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, ""

    .line 450
    .local v1, "separator":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v4, "Permission Error"

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 452
    .local v3, "extension":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replCompDir:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 453
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x22

    if-lt v7, v8, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    :cond_1
    const-string v7, "classes.jar"

    :goto_1
    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    .local v5, "loadComponent":Ljava/io/File;
    sget-object v6, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Loading component dex "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 462
    iget-object v7, p0, Lcom/google/appinventor/components/runtime/ReplForm;->loadedExternalDexs:Ljava/util/List;

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 463
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Skipping already loaded "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    goto/16 :goto_0

    .line 472
    :cond_2
    invoke-virtual {v5}, Ljava/io/File;->canWrite()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {v5}, Ljava/io/File;->setReadOnly()Z

    move-result v7

    if-eqz v7, :cond_3

    goto :goto_2

    .line 473
    :cond_3
    new-instance v2, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to set "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " to read only"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6, v4}, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v2

    .line 477
    :cond_4
    :goto_2
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Queueing component dex "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    iget-object v4, p0, Lcom/google/appinventor/components/runtime/ReplForm;->loadedExternalDexs:Ljava/util/List;

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 479
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    sget-object v1, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    .line 482
    .end local v3    # "extension":Ljava/lang/String;
    .end local v5    # "loadComponent":Ljava/io/File;
    goto/16 :goto_0

    .line 456
    .restart local v3    # "extension":Ljava/lang/String;
    .restart local v5    # "loadComponent":Ljava/io/File;
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Extension "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " does not exist"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    new-instance v2, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v6, "Extension Error"

    invoke-direct {v2, v4, v6}, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v2

    .line 485
    .end local v3    # "extension":Ljava/lang/String;
    .end local v5    # "loadComponent":Ljava/io/File;
    :cond_6
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/google/appinventor/components/runtime/ReplForm;->activeForm:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v3}, Lcom/google/appinventor/components/runtime/Form;->$context()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v3

    const-string v5, "componentDexs"

    invoke-direct {v2, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 486
    .local v2, "dexOutput":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_8

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_3

    .line 487
    :cond_7
    new-instance v3, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;

    const-string v5, "Unable to create componentDexs directory"

    invoke-direct {v3, v5, v4}, Lcom/google/appinventor/components/runtime/errors/YailRuntimeError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v3

    .line 490
    :cond_8
    :goto_3
    new-instance v3, Ldalvik/system/DexClassLoader;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    .line 491
    const-class v6, Lcom/google/appinventor/components/runtime/ReplForm;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v3, v4, v5, v7, v6}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 492
    .local v3, "dexCloader":Ldalvik/system/DexClassLoader;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 493
    sget-object v4, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 496
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .line 134
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/appinventor/components/runtime/util/QUtil;->getReplAssetPath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replAssetDir:Ljava/lang/String;

    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "external_comps/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replCompDir:Ljava/lang/String;

    .line 137
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-lt v0, v1, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/external_comps/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replCompDir:Ljava/lang/String;

    .line 143
    :cond_0
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/Form;->onCreate(Landroid/os/Bundle;)V

    .line 144
    new-instance v0, Lcom/google/appinventor/components/runtime/ReplForm$1;

    invoke-direct {v0, p0}, Lcom/google/appinventor/components/runtime/ReplForm$1;-><init>(Lcom/google/appinventor/components/runtime/ReplForm;)V

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 156
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->loadedExternalDexs:Ljava/util/List;

    .line 157
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 158
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/appinventor/components/runtime/ReplForm;->processExtrasAndData(Landroid/content/Intent;Z)V

    .line 159
    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ReplForm;->themeHelper:Lcom/google/appinventor/components/runtime/util/theme/ThemeHelper;

    invoke-interface {v2, v1}, Lcom/google/appinventor/components/runtime/util/theme/ThemeHelper;->setActionBarAnimation(Z)V

    .line 160
    return-void
.end method

.method onCreateFinish()V
    .locals 5

    .line 164
    invoke-super {p0}, Lcom/google/appinventor/components/runtime/Form;->onCreateFinish()V

    .line 165
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onCreateFinish() Called in Repl"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->checkAssetDir()V

    .line 168
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->checkComponentDir()Z

    .line 170
    invoke-static {}, Lcom/google/appinventor/components/runtime/ReplForm;->isEmulator()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/google/appinventor/common/version/AppInventorFeatures;->doCompanionSplashScreen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 172
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 173
    .local v1, "webviewIntent":Landroid/content/Intent;
    sget-object v2, Lcom/google/appinventor/components/runtime/ReplForm;->activeForm:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v2}, Lcom/google/appinventor/components/runtime/Form;->$context()Landroid/app/Activity;

    move-result-object v2

    sget-object v3, Lcom/google/appinventor/components/runtime/ReplForm;->SPLASH_ACTIVITY_CLASS:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    sget-object v2, Lcom/google/appinventor/components/runtime/ReplForm;->activeForm:Lcom/google/appinventor/components/runtime/Form;

    invoke-virtual {v2}, Lcom/google/appinventor/components/runtime/Form;->$context()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 176
    .end local v1    # "webviewIntent":Landroid/content/Intent;
    :cond_0
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 177
    .local v1, "intent":Landroid/content/Intent;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Intent = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    invoke-virtual {v1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    .line 179
    .local v2, "data":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 180
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Got data = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 182
    :cond_1
    const-string v3, "Did not receive any data"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    :goto_0
    if-eqz v2, :cond_2

    const-string v0, "aicompanion"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 186
    new-instance v0, Lcom/google/appinventor/components/runtime/ReplForm$2;

    invoke-direct {v0, p0, v2}, Lcom/google/appinventor/components/runtime/ReplForm$2;-><init>(Lcom/google/appinventor/components/runtime/ReplForm;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/google/appinventor/components/runtime/ReplForm;->registerForOnInitialize(Lcom/google/appinventor/components/runtime/util/OnInitializeListener;)V

    .line 193
    :cond_2
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .line 268
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/Form;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 269
    invoke-virtual {p0, p1}, Lcom/google/appinventor/components/runtime/ReplForm;->addSettingsButton(Landroid/view/Menu;)V

    .line 270
    invoke-virtual {p0, p1}, Lcom/google/appinventor/components/runtime/ReplForm;->addLogcatButton(Landroid/view/Menu;)V

    .line 271
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .line 217
    invoke-super {p0}, Lcom/google/appinventor/components/runtime/Form;->onDestroy()V

    .line 218
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->httpdServer:Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {v0}, Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;->stop()V

    .line 220
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->httpdServer:Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

    .line 222
    :cond_0
    invoke-virtual {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->finish()V

    .line 223
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 224
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .line 306
    invoke-super {p0, p1}, Lcom/google/appinventor/components/runtime/Form;->onNewIntent(Landroid/content/Intent;)V

    .line 307
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onNewIntent Called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/google/appinventor/components/runtime/ReplForm;->processExtrasAndData(Landroid/content/Intent;Z)V

    .line 309
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "data":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, "aicompanion"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 311
    invoke-direct {p0, v0}, Lcom/google/appinventor/components/runtime/ReplForm;->startChromebook(Ljava/lang/String;)V

    .line 313
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 207
    invoke-super {p0}, Lcom/google/appinventor/components/runtime/Form;->onResume()V

    .line 208
    return-void
.end method

.method protected onStop()V
    .locals 0

    .line 212
    invoke-super {p0}, Lcom/google/appinventor/components/runtime/Form;->onStop()V

    .line 213
    return-void
.end method

.method public sendToCompanion(Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .line 513
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->webRTCNativeMgr:Lcom/google/appinventor/components/runtime/util/WebRTCNativeMgr;

    if-nez v0, :cond_0

    .line 514
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    const-string v1, "No WebRTCNativeMgr!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    return-void

    .line 517
    :cond_0
    invoke-virtual {v0, p1}, Lcom/google/appinventor/components/runtime/util/WebRTCNativeMgr;->send(Ljava/lang/String;)V

    .line 518
    return-void
.end method

.method public setAssetsLoaded()V
    .locals 1

    .line 435
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->assetsLoaded:Z

    .line 436
    return-void
.end method

.method public setFormName(Ljava/lang/String;)V
    .locals 3
    .param p1, "formName"    # Ljava/lang/String;

    .line 235
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->formName:Ljava/lang/String;

    .line 236
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "formName is now "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    return-void
.end method

.method public setIsUSBrepl()V
    .locals 1

    .line 392
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->IsUSBRepl:Z

    .line 393
    return-void
.end method

.method protected setResult(Ljava/lang/Object;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Object;

    .line 245
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setResult: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResult:Ljava/lang/Object;

    .line 247
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->formName:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replResultFormName:Ljava/lang/String;

    .line 248
    return-void
.end method

.method public setWebRTCMgr(Lcom/google/appinventor/components/runtime/util/WebRTCNativeMgr;)V
    .locals 0
    .param p1, "mgr"    # Lcom/google/appinventor/components/runtime/util/WebRTCNativeMgr;

    .line 521
    iput-object p1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->webRTCNativeMgr:Lcom/google/appinventor/components/runtime/util/WebRTCNativeMgr;

    .line 522
    return-void
.end method

.method public startHTTPD(Z)V
    .locals 5
    .param p1, "secure"    # Z

    .line 398
    :try_start_0
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->httpdServer:Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

    if-nez v0, :cond_0

    .line 399
    invoke-direct {p0}, Lcom/google/appinventor/components/runtime/ReplForm;->checkAssetDir()V

    .line 401
    new-instance v0, Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/google/appinventor/components/runtime/ReplForm;->replAssetDir:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x1f41

    invoke-direct {v0, v2, v1, p1, p0}, Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;-><init>(ILjava/io/File;ZLcom/google/appinventor/components/runtime/ReplForm;)V

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->httpdServer:Lcom/google/appinventor/components/runtime/util/AppInvHTTPD;

    .line 402
    sget-object v0, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    const-string v1, "started AppInvHTTPD"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 406
    :cond_0
    goto :goto_0

    .line 404
    :catch_0
    move-exception v0

    .line 405
    .local v0, "ex":Ljava/io/IOException;
    sget-object v1, Lcom/google/appinventor/components/runtime/ReplForm;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Setting up NanoHTTPD: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    .end local v0    # "ex":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method protected startNewForm(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "nextFormName"    # Ljava/lang/String;
    .param p2, "startupValue"    # Ljava/lang/Object;

    .line 228
    if-eqz p2, :cond_0

    .line 229
    const-string v0, "open another screen with start value"

    invoke-static {p2, v0}, Lcom/google/appinventor/components/runtime/ReplForm;->jsonEncodeForForm(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->startupValue:Ljava/lang/String;

    .line 231
    :cond_0
    invoke-static {p1, p2}, Lcom/google/appinventor/components/runtime/util/RetValManager;->pushScreen(Ljava/lang/String;Ljava/lang/Object;)V

    .line 232
    return-void
.end method

.method protected updateTitle()V
    .locals 4

    .line 590
    iget-object v0, p0, Lcom/google/appinventor/components/runtime/ReplForm;->themeHelper:Lcom/google/appinventor/components/runtime/util/theme/ThemeHelper;

    iget-object v1, p0, Lcom/google/appinventor/components/runtime/ReplForm;->title:Ljava/lang/String;

    const-string v2, "AppTheme.Light"

    iget-object v3, p0, Lcom/google/appinventor/components/runtime/ReplForm;->currentTheme:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/google/appinventor/components/runtime/util/theme/ThemeHelper;->setTitle(Ljava/lang/String;Z)V

    .line 591
    return-void
.end method
