.class public Lcom/eszdman/rampatcher/PatcherAddreses;
.super Ljava/lang/Object;
.source "PatcherAddreses.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PatcherAddreses"


# instance fields
.field chromaHighNRAddres:J

.field chromaLowNRAddres:J

.field contrast1Addres:J

.field contrast2Addres:J

.field exportAddres:J

.field exportName:Ljava/lang/String;

.field gammaAddres:J

.field isoAddres:J

.field libName:Ljava/lang/String;

.field libStartAddres:J

.field lumaNRAddres:J

.field properties:Ljava/util/Properties;

.field saturationAddres:J

.field sharpeningAddres:J


# direct methods
.method constructor <init>()V
    .registers 6

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    .line 34
    invoke-static {}, Lcom/eszdman/rampatcher/PatcherAddreses;->getApplicationUsingReflection()Landroid/app/Application;

    move-result-object v0

    .line 36
    .local v0, "context":Landroid/content/Context;
    :try_start_e
    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x7f0f0000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_1d} :catch_4c

    .line 41
    :goto_1d
    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    const-string v3, "libName"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libName:Ljava/lang/String;

    .line 42
    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    const-string v3, "exportName"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->exportName:Ljava/lang/String;

    .line 43
    const-string v2, "PatcherAddreses"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "exportName:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->exportName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void

    .line 37
    :catch_4c
    move-exception v1

    .line 38
    .local v1, "e":Ljava/io/IOException;
    const-string v2, "PatcherAddreses"

    const-string v3, "Error at loading properties"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1d
.end method

.method private ReadAddr(Ljava/lang/String;)J
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadLong(Ljava/lang/String;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libStartAddres:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method private ReadLong(Ljava/lang/String;)J
    .registers 4
    .param p1, "in"    # Ljava/lang/String;

    .prologue
    .line 65
    const-string v0, "0x"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 66
    const-string v0, "0x"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 67
    const/16 v0, 0x10

    invoke-static {p1, v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    .line 69
    :goto_16
    return-wide v0

    :cond_17
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_16
.end method

.method public static getApplicationUsingReflection()Landroid/app/Application;
    .registers 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 77
    :try_start_1
    const-string v1, "android.app.AppGlobals"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v3, "getInitialApplication"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    .line 78
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Application;
    :try_end_1a
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1a} :catch_28
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1a} :catch_2c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1a} :catch_2a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1a} :catch_1b

    .line 83
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    :goto_1a
    return-object v1

    .line 79
    .end local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :catch_1b
    move-exception v0

    .line 80
    .restart local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :goto_1c
    const-string v1, "PatcherAddreses"

    const-string v3, "Error at getting application context"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    invoke-virtual {v0}, Ljava/lang/ReflectiveOperationException;->printStackTrace()V

    move-object v1, v2

    .line 83
    goto :goto_1a

    .line 79
    .end local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :catch_28
    move-exception v0

    goto :goto_1c

    :catch_2a
    move-exception v0

    goto :goto_1c

    :catch_2c
    move-exception v0

    goto :goto_1c
.end method


# virtual methods
.method public InsertMemoryAddr(J)V
    .registers 8
    .param p1, "memoryPointer"    # J

    .prologue
    .line 49
    iput-wide p1, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libStartAddres:J

    .line 50
    iget-object v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    const-string v1, "exportAddres"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->exportAddres:J

    .line 51
    const-string v0, "PatcherAddreses"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exportAddres:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->exportAddres:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libStartAddres:J

    iget-wide v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->exportAddres:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libStartAddres:J

    .line 53
    const-string v0, "isoAddres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->isoAddres:J

    .line 54
    const-string v0, "sharpeningAddres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    .line 55
    const-string v0, "lumaNRAddres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->lumaNRAddres:J

    .line 56
    const-string v0, "chromaLowNRAddres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->chromaLowNRAddres:J

    .line 57
    const-string v0, "chromaHighNRAddres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->chromaHighNRAddres:J

    .line 58
    const-string v0, "saturationAddres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->saturationAddres:J

    .line 59
    const-string v0, "gammaAddres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->gammaAddres:J

    .line 60
    const-string v0, "contrast1Addres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->contrast1Addres:J

    .line 61
    const-string v0, "contrast2Addres"

    invoke-direct {p0, v0}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->contrast2Addres:J

    .line 63
    return-void
.end method
