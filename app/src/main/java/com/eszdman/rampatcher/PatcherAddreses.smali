.class public Lcom/eszdman/rampatcher/PatcherAddreses;
.super Ljava/lang/Object;
.source "PatcherAddreses.java"


# instance fields
.field exportAddres:J

.field exportName:Ljava/lang/String;

.field libName:Ljava/lang/String;

.field libStartAddres:J

.field properties:Ljava/util/Properties;

.field sharpeningAddres:J


# direct methods
.method constructor <init>(J)V
    .registers 8
    .param p1, "memoryPointer"    # J

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-wide p1, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libStartAddres:J

    .line 23
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    .line 24
    invoke-static {}, Lcom/eszdman/rampatcher/PatcherAddreses;->getApplicationUsingReflection()Landroid/app/Application;

    move-result-object v0

    .line 26
    .local v0, "context":Landroid/content/Context;
    :try_start_10
    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x7f0f0000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_1f} :catch_44

    .line 30
    :goto_1f
    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    const-string v3, "libName"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libName:Ljava/lang/String;

    .line 31
    iget-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->properties:Ljava/util/Properties;

    const-string v3, "exportName"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->exportName:Ljava/lang/String;

    .line 33
    const-string v2, "exportAddres"

    invoke-direct {p0, v2}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->exportAddres:J

    .line 34
    const-string v2, "sharpeningAddres"

    invoke-direct {p0, v2}, Lcom/eszdman/rampatcher/PatcherAddreses;->ReadAddr(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->sharpeningAddres:J

    .line 35
    return-void

    .line 27
    :catch_44
    move-exception v1

    .line 28
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1f
.end method

.method private ReadAddr(Ljava/lang/String;)J
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/eszdman/rampatcher/PatcherAddreses;->libStartAddres:J

    add-long/2addr v0, v2

    return-wide v0
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

    .line 42
    :try_start_1
    const-string v1, "android.app.AppGlobals"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v3, "getInitialApplication"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    .line 43
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

    .line 48
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    :goto_1a
    return-object v1

    .line 44
    .end local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :catch_1b
    move-exception v0

    .line 45
    .restart local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :goto_1c
    const-string v1, "PatcherAddreses"

    const-string v3, "Error at getting application context"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    invoke-virtual {v0}, Ljava/lang/ReflectiveOperationException;->printStackTrace()V

    move-object v1, v2

    .line 48
    goto :goto_1a

    .line 44
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
