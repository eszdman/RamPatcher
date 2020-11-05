.class public Lcom/eszdman/rampatcher/PatcherSession;
.super Ljava/lang/Object;
.source "PatcherSession.java"


# static fields
.field private static TAG:Ljava/lang/String;

.field private static sharpenAddr:J


# instance fields
.field private exportAddr:J

.field private exportname:Ljava/lang/String;

.field private libname:Ljava/lang/String;

.field private libraryPointer:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 6
    const-string v0, "PatcherSession"

    sput-object v0, Lcom/eszdman/rampatcher/PatcherSession;->TAG:Ljava/lang/String;

    .line 13
    const-wide/32 v0, 0x105696c

    sput-wide v0, Lcom/eszdman/rampatcher/PatcherSession;->sharpenAddr:J

    return-void
.end method

.method public constructor <init>()V
    .registers 10

    .prologue
    const/4 v8, 0x4

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const-string v2, "libgcastartup.so"

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->libname:Ljava/lang/String;

    .line 9
    const-string v2, "Java_com_google_android_apps_camera_jni_eisutil_FrameUtilNative_convertNV21ToNV12"

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->exportname:Ljava/lang/String;

    .line 12
    const-wide/32 v2, 0xd1da50

    iput-wide v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->exportAddr:J

    .line 15
    const-string v2, "rampatcher"

    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 16
    const-string v2, "gcastartup"

    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 17
    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->libname:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/eszdman/rampatcher/PatcherSession;->ReadyToPatch(Ljava/lang/String;)V

    .line 18
    invoke-virtual {p0}, Lcom/eszdman/rampatcher/PatcherSession;->getNewPointer()V

    .line 19
    sget-object v2, Lcom/eszdman/rampatcher/PatcherSession;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "methodPointer:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/eszdman/rampatcher/PatcherSession;->libraryPointer:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    sget-object v2, Lcom/eszdman/rampatcher/PatcherSession;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "gcamPointer:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/eszdman/rampatcher/PatcherSession;->libraryPointer:J

    iget-wide v6, p0, Lcom/eszdman/rampatcher/PatcherSession;->exportAddr:J

    sub-long/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    iget-wide v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->libraryPointer:J

    iget-wide v4, p0, Lcom/eszdman/rampatcher/PatcherSession;->exportAddr:J

    sub-long v0, v2, v4

    .line 22
    .local v0, "startLibAddr":J
    sget-object v2, Lcom/eszdman/rampatcher/PatcherSession;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "gcamRegion:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/eszdman/rampatcher/PatcherSession;->libraryPointer:J

    const/16 v6, 0xa

    invoke-direct {p0, v4, v5, v6}, Lcom/eszdman/rampatcher/PatcherSession;->readRegionRight(JI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    sget-object v2, Lcom/eszdman/rampatcher/PatcherSession;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sharpening "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Lcom/eszdman/rampatcher/PatcherSession;->sharpenAddr:J

    add-long/2addr v4, v0

    invoke-direct {p0, v4, v5, v8}, Lcom/eszdman/rampatcher/PatcherSession;->readRegionRight(JI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    sget-wide v2, Lcom/eszdman/rampatcher/PatcherSession;->sharpenAddr:J

    add-long/2addr v2, v0

    const-string v4, "0801E8D2"

    invoke-static {v4}, Lcom/eszdman/rampatcher/PatcherSession;->String2Byte(Ljava/lang/String;)[B

    move-result-object v4

    invoke-direct {p0, v2, v3, v4}, Lcom/eszdman/rampatcher/PatcherSession;->setBytes(J[B)V

    .line 25
    sget-object v2, Lcom/eszdman/rampatcher/PatcherSession;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "after patch sharpening "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Lcom/eszdman/rampatcher/PatcherSession;->sharpenAddr:J

    add-long/2addr v4, v0

    invoke-direct {p0, v4, v5, v8}, Lcom/eszdman/rampatcher/PatcherSession;->readRegionRight(JI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    invoke-direct {p0}, Lcom/eszdman/rampatcher/PatcherSession;->PatchDone()V

    .line 27
    return-void
.end method

.method private native PatchDone()V
.end method

.method private native ReadyToPatch(Ljava/lang/String;)V
.end method

.method private static String2Byte(Ljava/lang/String;)[B
    .registers 7
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 30
    .local v0, "i":[C
    array-length v4, v0

    div-int/lit8 v4, v4, 0x2

    new-array v3, v4, [B

    .line 31
    .local v3, "output":[B
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_a
    array-length v4, v0

    if-ge v2, v4, :cond_43

    .line 32
    div-int/lit8 v4, v2, 0x2

    aget-byte v5, v3, v4

    add-int/lit8 v5, v5, -0x80

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    .line 33
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

    .line 34
    .local v1, "inp":Ljava/lang/String;
    div-int/lit8 v4, v2, 0x2

    const/16 v5, 0x10

    invoke-static {v1, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    .line 31
    add-int/lit8 v2, v2, 0x2

    goto :goto_a

    .line 36
    .end local v1    # "inp":Ljava/lang/String;
    :cond_43
    return-object v3
.end method

.method private native getLibraryOffset(Ljava/lang/String;)J
.end method

.method private native readRegion(JI)Ljava/lang/String;
.end method

.method private native readRegionRight(JI)Ljava/lang/String;
.end method

.method private native setBytes(J[B)V
.end method

.method private native setDouble(JD)V
.end method

.method private native setFloat(JF)V
.end method

.method private native setInt(JI)V
.end method

.method private native test()V
.end method


# virtual methods
.method public getNewPointer()V
    .registers 3

    .prologue
    .line 39
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->exportname:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherSession;->getLibraryOffset(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->libraryPointer:J

    .line 41
    return-void
.end method
