.class public Lcom/eszdman/rampatcher/PatcherSession;
.super Ljava/lang/Object;
.source "PatcherSession.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PatcherSession"

.field public static patcherSession:Lcom/eszdman/rampatcher/PatcherSession;


# instance fields
.field addreses:Lcom/eszdman/rampatcher/PatcherAddreses;


# direct methods
.method public constructor <init>()V
    .registers 7

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v3, "rampatcher"

    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 11
    sput-object p0, Lcom/eszdman/rampatcher/PatcherSession;->patcherSession:Lcom/eszdman/rampatcher/PatcherSession;

    .line 12
    new-instance v3, Lcom/eszdman/rampatcher/PatcherAddreses;

    invoke-direct {v3}, Lcom/eszdman/rampatcher/PatcherAddreses;-><init>()V

    iput-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    .line 13
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-object v3, v3, Lcom/eszdman/rampatcher/PatcherAddreses;->libName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/eszdman/rampatcher/PatcherSession;->ReadyToPatch(Ljava/lang/String;)V

    .line 14
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-object v3, v3, Lcom/eszdman/rampatcher/PatcherAddreses;->exportName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/eszdman/rampatcher/PatcherSession;->getLibraryOffset(Ljava/lang/String;)J

    move-result-wide v0

    .line 15
    .local v0, "memoryPointer":J
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    invoke-virtual {v3, v0, v1}, Lcom/eszdman/rampatcher/PatcherAddreses;->InsertMemoryAddr(J)V

    .line 16
    const-string v3, "PatcherSession"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "libname:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-object v5, v5, Lcom/eszdman/rampatcher/PatcherAddreses;->libName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    new-instance v2, Lcom/eszdman/rampatcher/PatchParameters;

    invoke-direct {v2}, Lcom/eszdman/rampatcher/PatchParameters;-><init>()V

    .line 19
    .local v2, "patchParameters":Lcom/eszdman/rampatcher/PatchParameters;
    invoke-virtual {v2}, Lcom/eszdman/rampatcher/PatchParameters;->FillParameters()V

    .line 20
    invoke-virtual {p0, v2}, Lcom/eszdman/rampatcher/PatcherSession;->PatchAll(Lcom/eszdman/rampatcher/PatchParameters;)V

    .line 21
    invoke-direct {p0}, Lcom/eszdman/rampatcher/PatcherSession;->PatchDone()V

    .line 22
    return-void
.end method

.method private native PatchDone()V
.end method

.method private native ReadyToPatch(Ljava/lang/String;)V
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


# virtual methods
.method public PatchAll(Lcom/eszdman/rampatcher/PatchParameters;)V
    .registers 7
    .param p1, "patchParameters"    # Lcom/eszdman/rampatcher/PatchParameters;

    .prologue
    const/4 v4, 0x4

    .line 24
    const-string v0, "PatcherSession"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sharpening "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v2, v2, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    invoke-direct {p0, v2, v3, v4}, Lcom/eszdman/rampatcher/PatcherSession;->readRegionRight(JI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->sharpeningValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->setBytes(J[B)V

    .line 26
    const-string v0, "PatcherSession"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "after patch sharpening "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v2, v2, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    invoke-direct {p0, v2, v3, v4}, Lcom/eszdman/rampatcher/PatcherSession;->readRegionRight(JI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    return-void
.end method
