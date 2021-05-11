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
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-string v3, "rampatcher"

    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 20
    sput-object p0, Lcom/eszdman/rampatcher/PatcherSession;->patcherSession:Lcom/eszdman/rampatcher/PatcherSession;

    .line 21
    new-instance v3, Lcom/eszdman/rampatcher/PatcherAddreses;

    invoke-direct {v3}, Lcom/eszdman/rampatcher/PatcherAddreses;-><init>()V

    iput-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    .line 22
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-object v3, v3, Lcom/eszdman/rampatcher/PatcherAddreses;->libName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/eszdman/rampatcher/PatcherSession;->ReadyToPatch(Ljava/lang/String;)V

    .line 23
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-object v3, v3, Lcom/eszdman/rampatcher/PatcherAddreses;->exportName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/eszdman/rampatcher/PatcherSession;->getLibraryOffset(Ljava/lang/String;)J

    move-result-wide v0

    .line 24
    .local v0, "memoryPointer":J
    iget-object v3, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    invoke-virtual {v3, v0, v1}, Lcom/eszdman/rampatcher/PatcherAddreses;->InsertMemoryAddr(J)V

    .line 25
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

    .line 27
    new-instance v2, Lcom/eszdman/rampatcher/PatchParameters;

    invoke-direct {v2}, Lcom/eszdman/rampatcher/PatchParameters;-><init>()V

    .line 28
    .local v2, "patchParameters":Lcom/eszdman/rampatcher/PatchParameters;
    invoke-virtual {v2}, Lcom/eszdman/rampatcher/PatchParameters;->FillParameters()V

    .line 29
    invoke-virtual {p0, v2}, Lcom/eszdman/rampatcher/PatcherSession;->PatchAll(Lcom/eszdman/rampatcher/PatchParameters;)V

    .line 30
    invoke-direct {p0}, Lcom/eszdman/rampatcher/PatcherSession;->PatchDone()V

    .line 31
    return-void
.end method

.method private native PatchDone()V
.end method

.method private native ReadyToPatch(Ljava/lang/String;)V
.end method

.method private native getBytes(JJ)[B
.end method

.method private native getLibraryOffset(Ljava/lang/String;)J
.end method

.method private patchBytes(J[B)V
    .registers 9
    .param p1, "addr"    # J
    .param p3, "in"    # [B

    .prologue
    .line 40
    if-eqz p3, :cond_4e

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_4e

    .line 41
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

    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/eszdman/rampatcher/PatcherSession;->setBytes(J[B)V

    .line 43
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

    .line 47
    :goto_4d
    return-void

    .line 45
    :cond_4e
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

    goto :goto_4d
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
    .line 33
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->sharpeningValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 34
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->chromaHighNRAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->chromaHighNRValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 35
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->chromaLowNRAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->chromaLowNRValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 36
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->lumaNRAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->lumaNRValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 37
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v0, v0, Lcom/eszdman/rampatcher/PatcherAddreses;->saturationAddres:J

    iget-object v2, p1, Lcom/eszdman/rampatcher/PatchParameters;->saturationValue:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/eszdman/rampatcher/PatcherSession;->patchBytes(J[B)V

    .line 38
    return-void
.end method

.method public SaveCurrentLib()V
    .registers 11

    .prologue
    .line 49
    const-wide/32 v4, 0x262e984

    .line 50
    .local v4, "librarysize":J
    iget-object v7, p0, Lcom/eszdman/rampatcher/PatcherSession;->addreses:Lcom/eszdman/rampatcher/PatcherAddreses;

    iget-wide v8, v7, Lcom/eszdman/rampatcher/PatcherAddreses;->libStartAddres:J

    invoke-direct {p0, v8, v9, v4, v5}, Lcom/eszdman/rampatcher/PatcherSession;->getBytes(JJ)[B

    move-result-object v3

    .line 51
    .local v3, "library":[B
    new-instance v0, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/gcam"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 52
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_30

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 53
    :cond_30
    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/gcam/lib.so"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 54
    .local v6, "outp":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_55

    invoke-virtual {v6}, Ljava/io/File;->mkdir()Z

    .line 55
    :cond_55
    :try_start_55
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_5a} :catch_6b

    .local v2, "fos":Ljava/io/FileOutputStream;
    const/4 v8, 0x0

    .line 56
    :try_start_5b
    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_5e
    .catch Ljava/lang/Throwable; {:try_start_5b .. :try_end_5e} :catch_74
    .catchall {:try_start_5b .. :try_end_5e} :catchall_76

    .line 57
    if-eqz v2, :cond_65

    if-eqz v8, :cond_70

    :try_start_62
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_65
    .catch Ljava/lang/Throwable; {:try_start_62 .. :try_end_65} :catch_66
    .catch Ljava/io/IOException; {:try_start_62 .. :try_end_65} :catch_6b

    .line 60
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    :cond_65
    :goto_65
    return-void

    .line 57
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_66
    move-exception v7

    :try_start_67
    invoke-virtual {v8, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_67 .. :try_end_6a} :catch_6b

    goto :goto_65

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_6b
    move-exception v1

    .line 58
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_65

    .line 57
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :cond_70
    :try_start_70
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_73
    .catch Ljava/io/IOException; {:try_start_70 .. :try_end_73} :catch_6b

    goto :goto_65

    .line 55
    :catch_74
    move-exception v8

    :try_start_75
    throw v8
    :try_end_76
    .catchall {:try_start_75 .. :try_end_76} :catchall_76

    .line 57
    :catchall_76
    move-exception v7

    if-eqz v2, :cond_7e

    if-eqz v8, :cond_84

    :try_start_7b
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_7e
    .catch Ljava/lang/Throwable; {:try_start_7b .. :try_end_7e} :catch_7f
    .catch Ljava/io/IOException; {:try_start_7b .. :try_end_7e} :catch_6b

    :cond_7e
    :goto_7e
    :try_start_7e
    throw v7

    :catch_7f
    move-exception v9

    invoke-virtual {v8, v9}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7e

    :cond_84
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_87} :catch_6b

    goto :goto_7e
.end method
