.class public Landroid/telephony/MSimSmsManager;
.super Ljava/lang/Object;
.source "MSimSmsManager.java"


# static fields
.field public static final RESULT_ERROR_FDN_CHECK_FAILURE:I = 0x6

.field public static final RESULT_ERROR_GENERIC_FAILURE:I = 0x1

.field public static final RESULT_ERROR_LIMIT_EXCEEDED:I = 0x5

.field public static final RESULT_ERROR_NO_SERVICE:I = 0x4

.field public static final RESULT_ERROR_NULL_PDU:I = 0x3

.field public static final RESULT_ERROR_RADIO_OFF:I = 0x2

.field public static final STATUS_ON_ICC_FREE:I = 0x0

.field public static final STATUS_ON_ICC_READ:I = 0x1

.field public static final STATUS_ON_ICC_SENT:I = 0x5

.field public static final STATUS_ON_ICC_UNREAD:I = 0x3

.field public static final STATUS_ON_ICC_UNSENT:I = 0x7

.field protected static isMultiSimEnabled:Z

.field private static final sInstance:Landroid/telephony/MSimSmsManager;


# instance fields
.field private final DEFAULT_SUB:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 49
    new-instance v0, Landroid/telephony/MSimSmsManager;

    invoke-direct {v0}, Landroid/telephony/MSimSmsManager;-><init>()V

    sput-object v0, Landroid/telephony/MSimSmsManager;->sInstance:Landroid/telephony/MSimSmsManager;

    .line 50
    const-string/jumbo v0, "persist.dsds.enabled"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Landroid/telephony/MSimSmsManager;->isMultiSimEnabled:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Landroid/telephony/MSimSmsManager;->DEFAULT_SUB:I

    return-void
.end method

.method private createMessageListFromRawRecords(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/SmsRawData;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v3, messages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/telephony/SmsMessage;>;"
    if-eqz p1, :cond_1

    .line 113
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 114
    .local v0, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 115
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SmsRawData;

    .line 117
    .local v1, data:Lcom/android/internal/telephony/SmsRawData;
    if-eqz v1, :cond_0

    .line 118
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v1}, Lcom/android/internal/telephony/SmsRawData;->getBytes()[B

    move-result-object v6

    invoke-static {v5, v6}, Landroid/telephony/SmsMessage;->createFromEfRecord(I[B)Landroid/telephony/SmsMessage;

    move-result-object v4

    .line 119
    .local v4, sms:Landroid/telephony/SmsMessage;
    if-eqz v4, :cond_0

    .line 120
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .end local v4           #sms:Landroid/telephony/SmsMessage;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 126
    .end local v0           #count:I
    .end local v1           #data:Lcom/android/internal/telephony/SmsRawData;
    .end local v2           #i:I
    :cond_1
    return-object v3
.end method

.method private createMessageListFromRawRecords(Ljava/util/List;I)Ljava/util/ArrayList;
    .locals 7
    .parameter
    .parameter "subid"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/SmsRawData;",
            ">;I)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 131
    .local p1, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .local v3, messages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/telephony/SmsMessage;>;"
    if-eqz p1, :cond_1

    .line 134
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 135
    .local v0, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 136
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SmsRawData;

    .line 138
    .local v1, data:Lcom/android/internal/telephony/SmsRawData;
    if-eqz v1, :cond_0

    .line 139
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v1}, Lcom/android/internal/telephony/SmsRawData;->getBytes()[B

    move-result-object v6

    invoke-static {v5, v6, p2}, Landroid/telephony/SmsMessage;->createFromEfRecord(I[BI)Landroid/telephony/SmsMessage;

    move-result-object v4

    .line 140
    .local v4, sms:Landroid/telephony/SmsMessage;
    if-eqz v4, :cond_0

    .line 141
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    .end local v4           #sms:Landroid/telephony/SmsMessage;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 147
    .end local v0           #count:I
    .end local v1           #data:Lcom/android/internal/telephony/SmsRawData;
    .end local v2           #i:I
    :cond_1
    return-object v3
.end method

.method public static getDefault()Landroid/telephony/MSimSmsManager;
    .locals 1

    .prologue
    .line 98
    sget-object v0, Landroid/telephony/MSimSmsManager;->sInstance:Landroid/telephony/MSimSmsManager;

    return-object v0
.end method


# virtual methods
.method public copyMessageToIcc([B[BII)Z
    .locals 3
    .parameter "smsc"
    .parameter "pdu"
    .parameter "status"
    .parameter "subscription"

    .prologue
    .line 288
    const/4 v1, 0x0

    .line 291
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 292
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 293
    invoke-interface {v0, p3, p2, p1, p4}, Lcom/android/internal/telephony/msim/ISmsMSim;->copyMessageToIccEf(I[B[BI)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 300
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 296
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public deleteMessageFromIcc(II)Z
    .locals 4
    .parameter "messageIndex"
    .parameter "subscription"

    .prologue
    .line 315
    const/4 v2, 0x0

    .line 316
    .local v2, success:Z
    const/16 v3, 0xaf

    new-array v1, v3, [B

    .line 317
    .local v1, pdu:[B
    const/4 v3, -0x1

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 320
    :try_start_0
    const-string v3, "isms_msim"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 321
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 322
    const/4 v3, 0x0

    invoke-interface {v0, p1, v3, v1, p2}, Lcom/android/internal/telephony/msim/ISmsMSim;->updateMessageOnIccEf(II[BI)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 329
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v2

    .line 325
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public disableCdmaBroadcast(II)Z
    .locals 3
    .parameter "messageIdentifier"
    .parameter "subscription"

    .prologue
    .line 537
    const/4 v1, 0x0

    .line 540
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 541
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 542
    invoke-interface {v0, p1, p2}, Lcom/android/internal/telephony/msim/ISmsMSim;->disableCdmaBroadcast(II)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 549
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 545
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public disableCellBroadcast(II)Z
    .locals 3
    .parameter "messageIdentifier"
    .parameter "subscription"

    .prologue
    .line 439
    const/4 v1, 0x0

    .line 442
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 443
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 444
    invoke-interface {v0, p1, p2}, Lcom/android/internal/telephony/msim/ISmsMSim;->disableCellBroadcast(II)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 451
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 447
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public disableCellBroadcastRange(III)Z
    .locals 3
    .parameter "startMessageId"
    .parameter "endMessageId"
    .parameter "subscription"

    .prologue
    .line 594
    const/4 v1, 0x0

    .line 597
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 598
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 599
    invoke-interface {v0, p1, p2, p3}, Lcom/android/internal/telephony/msim/ISmsMSim;->disableCellBroadcastRange(III)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 606
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 602
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public divideMessage(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .parameter "text"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    invoke-static {p1}, Landroid/telephony/SmsMessage;->fragmentText(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public divideMessage(Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 1
    .parameter "text"
    .parameter "subscription"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    invoke-static {p1, p2}, Landroid/telephony/SmsMessage;->fragmentText(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public enableCdmaBroadcast(II)Z
    .locals 3
    .parameter "messageIdentifier"
    .parameter "subscription"

    .prologue
    .line 471
    const/4 v1, 0x0

    .line 474
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 475
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 476
    invoke-interface {v0, p1, p2}, Lcom/android/internal/telephony/msim/ISmsMSim;->enableCdmaBroadcast(II)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 483
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 479
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public enableCellBroadcast(II)Z
    .locals 3
    .parameter "messageIdentifier"
    .parameter "subscription"

    .prologue
    .line 407
    const/4 v1, 0x0

    .line 410
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 411
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 412
    invoke-interface {v0, p1, p2}, Lcom/android/internal/telephony/msim/ISmsMSim;->enableCellBroadcast(II)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 419
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 415
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public enableCellBroadcastRange(III)Z
    .locals 3
    .parameter "startMessageId"
    .parameter "endMessageId"
    .parameter "subscription"

    .prologue
    .line 505
    const/4 v1, 0x0

    .line 508
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 509
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 510
    invoke-interface {v0, p1, p2, p3}, Lcom/android/internal/telephony/msim/ISmsMSim;->enableCellBroadcastRange(III)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 517
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 513
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public getAllMessagesFromIcc(I)Ljava/util/ArrayList;
    .locals 3
    .parameter "subscription"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 373
    const/4 v1, 0x0

    .line 376
    .local v1, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 377
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 378
    invoke-interface {v0, p1}, Lcom/android/internal/telephony/msim/ISmsMSim;->getAllMessagesFromIccEf(I)Ljava/util/List;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 386
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    invoke-direct {p0, v1, p1}, Landroid/telephony/MSimSmsManager;->createMessageListFromRawRecords(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v2

    return-object v2

    .line 380
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public getPreferredSmsSubscription()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 61
    const/4 v1, 0x0

    .line 63
    .local v1, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :try_start_0
    const-string v3, "isms_msim"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v1

    .line 64
    invoke-interface {v1}, Lcom/android/internal/telephony/msim/ISmsMSim;->getPreferredSmsSubscription()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    .line 68
    :goto_0
    return v2

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0

    .line 67
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 68
    .local v0, ex:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public getSmscAddrOnSubscription(I)Ljava/lang/String;
    .locals 3
    .parameter "subscription"

    .prologue
    .line 555
    const/4 v1, 0x0

    .line 558
    .local v1, smscAddr:Ljava/lang/String;
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 560
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 562
    invoke-interface {v0, p1}, Lcom/android/internal/telephony/msim/ISmsMSim;->getSmscAddrOnSubscription(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 570
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return-object v1

    .line 565
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)V
    .locals 8
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .parameter "subscription"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 241
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 242
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 244
    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v1, v3, :cond_2

    .line 245
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 248
    :cond_2
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v3, :cond_4

    .line 250
    :try_start_0
    const-string v1, "isms_msim"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 252
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_3

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    .line 253
    invoke-interface/range {v0 .. v6}, Lcom/android/internal/telephony/msim/ISmsMSim;->sendMultipartText(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_3
    :goto_0
    return-void

    .line 260
    :cond_4
    const/4 v5, 0x0

    .line 261
    .local v5, sentIntent:Landroid/app/PendingIntent;
    const/4 v6, 0x0

    .line 262
    .local v6, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_5

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_5

    .line 263
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5           #sentIntent:Landroid/app/PendingIntent;
    check-cast v5, Landroid/app/PendingIntent;

    .line 265
    .restart local v5       #sentIntent:Landroid/app/PendingIntent;
    :cond_5
    if-eqz p5, :cond_6

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_6

    .line 266
    invoke-virtual {p5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v6, Landroid/app/PendingIntent;

    .line 268
    .restart local v6       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_6
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v7, p6

    invoke-virtual/range {v1 .. v7}, Landroid/telephony/MSimSmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V

    goto :goto_0

    .line 256
    .end local v5           #sentIntent:Landroid/app/PendingIntent;
    .end local v6           #deliveryIntent:Landroid/app/PendingIntent;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .locals 7
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "subscription"

    .prologue
    .line 186
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 190
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 191
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 195
    :cond_1
    :try_start_0
    const-string v1, "isms_msim"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 196
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_2

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    .line 197
    invoke-interface/range {v0 .. v6}, Lcom/android/internal/telephony/msim/ISmsMSim;->sendText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_2
    :goto_0
    return-void

    .line 200
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public updateMessageOnIcc(II[BI)Z
    .locals 3
    .parameter "messageIndex"
    .parameter "newStatus"
    .parameter "pdu"
    .parameter "subscription"

    .prologue
    .line 348
    const/4 v1, 0x0

    .line 351
    .local v1, success:Z
    :try_start_0
    const-string v2, "isms_msim"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/ISmsMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ISmsMSim;

    move-result-object v0

    .line 352
    .local v0, iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    if-eqz v0, :cond_0

    .line 353
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/internal/telephony/msim/ISmsMSim;->updateMessageOnIccEf(II[BI)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 360
    .end local v0           #iccISms:Lcom/android/internal/telephony/msim/ISmsMSim;
    :cond_0
    :goto_0
    return v1

    .line 356
    :catch_0
    move-exception v2

    goto :goto_0
.end method
