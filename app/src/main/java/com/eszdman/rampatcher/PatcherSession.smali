.class public Lcom/eszdman/rampatcher/PatcherSession;
.super Ljava/lang/Object;
.source "PatcherSession.java"


# static fields
.field public static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "PatcherSession"

.field public static patcherSession:Lcom/eszdman/rampatcher/PatcherSession;


# instance fields
.field addreses:Lcom/eszdman/rampatcher/PatcherAddreses;


# direct methods
.method public constructor <init>()V
    .registers 7

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const-string v3, "rampatcher"

    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    sput-object p0, Lcom/eszdman/rampatcher/PatcherSession;->patcherSession:Lcom/eszdman/rampatcher/PatcherSession;

    .line 13
    new-instance v3, Lcom/eszdman/rampatcher/PatcherAddreses;

    invoke-direct {v3}, Lcom/eszdman/rampatcher/PatcherAddreses;-><init>()V

    iput-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    .line 14
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-object v3, v3, Lcom/eszdman/rampatcher/PatcherAddreses;->libName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/eszdman/rampatcher/PatcherSession;->ReadyToPatch(Ljava/lang/String;)V

    .line 15
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-object v3, v3, Lcom/eszdman/rampatcher/PatcherAddreses;->exportName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/eszdman/rampatcher/PatcherSession;->getLibraryOffset(Ljava/lang/String;)J

    move-result-wide v0

    .line 16
    .local v0, "memoryPointer":J
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    invoke-virtual {v3, v0, v1}, Lcom/eszdman/rampatcher/PatcherAddreses;->InsertMemoryAddr(J)V

    .line 17
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

    .line 19
    new-instance v2, Lcom/eszdman/rampatcher/PatchParameters;

    invoke-direct {v2}, Lcom/eszdman/rampatcher/PatchParameters;-><init>()V

    .line 20
    .local v2, "patchParameters":Lcom/eszdman/rampatcher/PatchParameters;
    invoke-virtual {v2}, Lcom/eszdman/rampatcher/PatchParameters;->FillParameters()V

    .line 21
    invoke-virtual {p0, v2}, Lcom/eszdman/rampatcher/PatcherSession;->PatchAll(Lcom/eszdman/rampatcher/PatchParameters;)V

    .line 22
    invoke-direct {p0}, Lcom/eszdman/rampatcher/PatcherSession;->PatchDone()V

    .line 23
    return-void
.end method

.method private native PatchDone()V
.end method

.method private native ReadyToPatch(Ljava/lang/String;)V
.end method

.method private native getLibraryOffset(Ljava/lang/String;)J
.end method

.method private patchBytes(J[B)V
    .registers 9
    .param p1, "addr"    # J
    .param p3, "in"    # [B

    .prologue
    .line 32
    if-eqz p3, :cond_48

    .line 33
    const-string v0, "PatcherSession"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Patch before: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v2, v2, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    array-length v4, p3

    invoke-direct {p0, v2, v3, v4}, Lcom/eszdman/rampatcher/PatcherSession;->readRegionRight(JI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/eszdman/rampatcher/PatcherSession;->setBytes(J[B)V

    .line 35
    const-string v0, "PatcherSession"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Patch after: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v2, v2, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    array-length v4, p3

    invoke-direct {p0, v2, v3, v4}, Lcom/eszdman/rampatcher/PatcherSession;->readRegionRight(JI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    :goto_47
    return-void

    .line 37
    :cond_48
    const-string v0, "PatcherSession"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "NullPtr at:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_47
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
    .registers 5
    .param p1, "patchParameters"    # Lcom/eszdman/rampatcher/PatchParameters;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->sharpeningValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 26
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->chromaHighNRAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->chromaHighNRValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 27
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->chromaLowNRAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->chromaLowNRValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 28
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->lumaNRAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->lumaNRValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 29
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->saturationAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->saturationValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 30
    return-void
.end method
