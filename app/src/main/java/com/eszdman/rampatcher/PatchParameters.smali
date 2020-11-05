.class public Lcom/eszdman/rampatcher/PatchParameters;
.super Ljava/lang/Object;
.source "PatchParameters.java"


# instance fields
.field sharpeningValue:[B


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static String2Byte(Ljava/lang/String;)[B
    .registers 7
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 11
    .local v0, "i":[C
    array-length v4, v0

    div-int/lit8 v4, v4, 0x2

    new-array v3, v4, [B

    .line 12
    .local v3, "output":[B
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_a
    array-length v4, v0

    if-ge v2, v4, :cond_43

    .line 13
    div-int/lit8 v4, v2, 0x2

    aget-byte v5, v3, v4

    add-int/lit8 v5, v5, -0x80

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    .line 14
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    aget-char v5, v0, v2

    invoke-static {v5}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v2, 0x1

    aget-char v5, v0, v5

    invoke-static {v5}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 15
    .local v1, "inp":Ljava/lang/String;
    div-int/lit8 v4, v2, 0x2

    const/16 v5, 0x10

    invoke-static {v1, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    .line 12
    add-int/lit8 v2, v2, 0x2

    goto :goto_a

    .line 17
    .end local v1    # "inp":Ljava/lang/String;
    :cond_43
    return-object v3
.end method


# virtual methods
.method public FillParameters()V
    .registers 2

    .prologue
    .line 7
    const-string v0, "0801E8D2"

    invoke-static {v0}, Lcom/eszdman/rampatcher/PatchParameters;->String2Byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/eszdman/rampatcher/PatchParameters;->sharpeningValue:[B

    .line 8
    return-void
.end method
