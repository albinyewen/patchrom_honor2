.class public Lcom/android/internal/telephony/UiccManager;
.super Landroid/os/Handler;
.source "UiccManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/UiccManager$1;,
        Lcom/android/internal/telephony/UiccManager$AppFamily;
    }
.end annotation


# static fields
.field private static final CHINA_PLMN_MCC:Ljava/lang/String; = "460"

.field private static final CHINA_TELECOM_PLMN:Ljava/lang/String; = "46003"

.field private static final CHINA_TELECOM_PLMN_FULL_READ:Ljava/lang/String; = "46099"

.field private static final CHINA_UNICOM_PLMN:Ljava/lang/String; = "46001"

.field private static final EVENT_GET_ICC_STATUS_DONE:I = 0x2

.field private static final EVENT_ICC_STATUS_CHANGED:I = 0x1

.field private static final EVENT_RADIO_UNAVAILABLE:I = 0x3

.field private static final EVENT_UICC_MGR_INIT_COMPLETE:I = 0x4

.field private static final LOG_TAG:Ljava/lang/String; = "RIL_UiccManager"

.field private static mInstance:Lcom/android/internal/telephony/UiccManager;


# instance fields
.field private mCatService:[Lcom/android/internal/telephony/cat/CatService;

.field private mCi:[Lcom/android/internal/telephony/CommandsInterface;

.field private mContext:Landroid/content/Context;

.field private mIccChangedRegistrants:Landroid/os/RegistrantList;

.field private mUiccCards:[Lcom/android/internal/telephony/UiccCard;


# direct methods
.method private constructor <init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 6
    .parameter "c"
    .parameter "ci"

    .prologue
    const/4 v5, 0x1

    .line 95
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 67
    const/4 v3, 0x2

    new-array v3, v3, [Lcom/android/internal/telephony/UiccCard;

    iput-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    .line 69
    new-instance v3, Landroid/os/RegistrantList;

    invoke-direct {v3}, Landroid/os/RegistrantList;-><init>()V

    iput-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    .line 96
    const-string v3, "RIL_UiccManager"

    const-string v4, "Creating UiccManager"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iput-object p1, p0, Lcom/android/internal/telephony/UiccManager;->mContext:Landroid/content/Context;

    .line 98
    iput-object p2, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    .line 99
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    array-length v3, v3

    new-array v3, v3, [Lcom/android/internal/telephony/cat/CatService;

    iput-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCatService:[Lcom/android/internal/telephony/cat/CatService;

    .line 100
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    array-length v3, v3

    if-ge v0, v3, :cond_0

    .line 101
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(I)V

    .line 102
    .local v1, index:Ljava/lang/Integer;
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v0

    invoke-interface {v3, p0, v5, v1}, Lcom/android/internal/telephony/CommandsInterface;->registerForIccStatusChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 103
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v0

    const/4 v4, 0x3

    invoke-interface {v3, p0, v4, v1}, Lcom/android/internal/telephony/CommandsInterface;->registerForNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 105
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v0

    invoke-interface {v3, p0, v5, v1}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 108
    .end local v1           #index:Ljava/lang/Integer;
    :cond_0
    const/4 v3, 0x4

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/UiccManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 109
    .local v2, msg:Landroid/os/Message;
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 110
    return-void
.end method

.method private declared-synchronized disposeCard(I)V
    .locals 5
    .parameter "index"

    .prologue
    .line 368
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    .line 369
    const-string v0, "RIL_UiccManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Disposing card "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/android/internal/telephony/UiccCard;->dispose()V

    .line 371
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    const/4 v1, 0x0

    aput-object v1, v0, p1

    .line 372
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v1, Landroid/os/AsyncResult;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 374
    :cond_0
    monitor-exit p0

    return-void

    .line 368
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getCiIndex(Landroid/os/Message;)Ljava/lang/Integer;
    .locals 3
    .parameter "msg"

    .prologue
    .line 153
    new-instance v1, Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    .line 160
    .local v1, index:Ljava/lang/Integer;
    if-eqz p1, :cond_0

    .line 161
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v2, :cond_1

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Integer;

    if-eqz v2, :cond_1

    .line 162
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local v1           #index:Ljava/lang/Integer;
    check-cast v1, Ljava/lang/Integer;

    .line 170
    .restart local v1       #index:Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-object v1

    .line 163
    :cond_1
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v2, :cond_0

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v2, v2, Landroid/os/AsyncResult;

    if-eqz v2, :cond_0

    .line 164
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 165
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v2, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    if-eqz v2, :cond_0

    iget-object v2, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Integer;

    if-eqz v2, :cond_0

    .line 166
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    .end local v1           #index:Ljava/lang/Integer;
    check-cast v1, Ljava/lang/Integer;

    .restart local v1       #index:Ljava/lang/Integer;
    goto :goto_0
.end method

.method public static getInstance()Lcom/android/internal/telephony/UiccManager;
    .locals 1

    .prologue
    .line 88
    sget-object v0, Lcom/android/internal/telephony/UiccManager;->mInstance:Lcom/android/internal/telephony/UiccManager;

    if-nez v0, :cond_0

    .line 89
    const/4 v0, 0x0

    .line 91
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/android/internal/telephony/UiccManager;->mInstance:Lcom/android/internal/telephony/UiccManager;

    goto :goto_0
.end method

.method public static getInstance(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/UiccManager;
    .locals 2
    .parameter "c"
    .parameter "ci"

    .prologue
    .line 82
    const/4 v1, 0x1

    new-array v0, v1, [Lcom/android/internal/telephony/CommandsInterface;

    .line 83
    .local v0, arrayCi:[Lcom/android/internal/telephony/CommandsInterface;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 84
    invoke-static {p0, v0}, Lcom/android/internal/telephony/UiccManager;->getInstance(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/UiccManager;

    move-result-object v1

    return-object v1
.end method

.method public static getInstance(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/UiccManager;
    .locals 1
    .parameter "c"
    .parameter "ci"

    .prologue
    .line 72
    sget-object v0, Lcom/android/internal/telephony/UiccManager;->mInstance:Lcom/android/internal/telephony/UiccManager;

    if-nez v0, :cond_0

    .line 73
    new-instance v0, Lcom/android/internal/telephony/UiccManager;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/telephony/UiccManager;-><init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V

    sput-object v0, Lcom/android/internal/telephony/UiccManager;->mInstance:Lcom/android/internal/telephony/UiccManager;

    .line 78
    :goto_0
    sget-object v0, Lcom/android/internal/telephony/UiccManager;->mInstance:Lcom/android/internal/telephony/UiccManager;

    return-object v0

    .line 75
    :cond_0
    sget-object v0, Lcom/android/internal/telephony/UiccManager;->mInstance:Lcom/android/internal/telephony/UiccManager;

    iput-object p0, v0, Lcom/android/internal/telephony/UiccManager;->mContext:Landroid/content/Context;

    .line 76
    sget-object v0, Lcom/android/internal/telephony/UiccManager;->mInstance:Lcom/android/internal/telephony/UiccManager;

    iput-object p1, v0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    goto :goto_0
.end method

.method private declared-synchronized onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;)V
    .locals 7
    .parameter "ar"
    .parameter "index"

    .prologue
    .line 174
    monitor-enter p0

    :try_start_0
    iget-object v1, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 175
    const-string v1, "RIL_UiccManager"

    const-string v2, "Error getting ICC status. RIL_REQUEST_GET_ICC_STATUS should never return an error"

    iget-object v3, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 193
    :goto_0
    monitor-exit p0

    return-void

    .line 181
    :cond_0
    :try_start_1
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/IccCardStatus;

    .line 183
    .local v0, status:Lcom/android/internal/telephony/IccCardStatus;
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    if-nez v1, :cond_1

    .line 184
    const-string v1, "RIL_UiccManager"

    const-string v2, "Creating a new card"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    new-instance v3, Lcom/android/internal/telephony/UiccCard;

    iget-object v4, p0, Lcom/android/internal/telephony/UiccManager;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-object v5, v5, v6

    invoke-direct {v3, v4, v5, v0}, Lcom/android/internal/telephony/UiccCard;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/IccCardStatus;)V

    aput-object v3, v1, v2

    .line 191
    :goto_1
    const-string v1, "RIL_UiccManager"

    const-string v2, "Notifying IccChangedRegistrants"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v2, Landroid/os/AsyncResult;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v2, v3, p2, v4}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 174
    .end local v0           #status:Lcom/android/internal/telephony/IccCardStatus;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 187
    .restart local v0       #status:Lcom/android/internal/telephony/IccCardStatus;
    :cond_1
    :try_start_2
    const-string v1, "RIL_UiccManager"

    const-string v2, "Update already existing card"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/android/internal/telephony/UiccManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    invoke-virtual {v1, v2, v3, v0}, Lcom/android/internal/telephony/UiccCard;->update(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/IccCardStatus;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method


# virtual methods
.method public getCardType(I)I
    .locals 16
    .parameter "slotId"

    .prologue
    .line 228
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/UiccManager;->getUiccCard(I)Lcom/android/internal/telephony/UiccCard;

    move-result-object v12

    .line 229
    .local v12, uicccard:Lcom/android/internal/telephony/UiccCard;
    const/4 v13, 0x2

    new-array v3, v13, [Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    const/4 v13, 0x0

    sget-object v14, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_UNKNOWN:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    aput-object v14, v3, v13

    const/4 v13, 0x1

    sget-object v14, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_UNKNOWN:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    aput-object v14, v3, v13

    .line 230
    .local v3, appType:[Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;
    const/4 v2, 0x0

    .line 231
    .local v2, appCount:I
    const/4 v4, -0x1

    .line 232
    .local v4, cardType:I
    const/4 v7, 0x0

    .line 233
    .local v7, gsmImsi:Ljava/lang/String;
    const/4 v5, 0x0

    .line 234
    .local v5, cdmaImsi:Ljava/lang/String;
    if-ltz p1, :cond_0

    const/4 v13, 0x2

    move/from16 v0, p1

    if-gt v0, v13, :cond_0

    if-nez v12, :cond_1

    .line 235
    :cond_0
    const/4 v13, -0x1

    .line 315
    :goto_0
    return v13

    .line 238
    :cond_1
    const/4 v8, 0x0

    .local v8, i:I
    :goto_1
    const/16 v13, 0x8

    if-ge v8, v13, :cond_5

    .line 239
    invoke-virtual {v12, v8}, Lcom/android/internal/telephony/UiccCard;->getApplication(I)Lcom/android/internal/telephony/UiccCardApplication;

    move-result-object v1

    .line 240
    .local v1, app:Lcom/android/internal/telephony/UiccCardApplication;
    if-eqz v1, :cond_4

    .line 241
    const/4 v13, 0x2

    if-ge v2, v13, :cond_3

    .line 242
    invoke-virtual {v1}, Lcom/android/internal/telephony/UiccCardApplication;->getType()Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    move-result-object v13

    aput-object v13, v3, v2

    .line 243
    sget-object v13, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_RUIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    aget-object v14, v3, v2

    if-eq v13, v14, :cond_2

    sget-object v13, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_CSIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    aget-object v14, v3, v2

    if-ne v13, v14, :cond_3

    .line 244
    :cond_2
    invoke-virtual {v1}, Lcom/android/internal/telephony/UiccCardApplication;->getIccRecords()Lcom/android/internal/telephony/IccRecords;

    move-result-object v11

    .line 245
    .local v11, records:Lcom/android/internal/telephony/IccRecords;
    if-eqz v11, :cond_3

    if-nez v7, :cond_3

    if-nez v5, :cond_3

    .line 246
    invoke-virtual {v11}, Lcom/android/internal/telephony/IccRecords;->getGsmIMSI()Ljava/lang/String;

    move-result-object v7

    .line 247
    invoke-virtual {v11}, Lcom/android/internal/telephony/IccRecords;->getIMSI()Ljava/lang/String;

    move-result-object v5

    .line 251
    .end local v11           #records:Lcom/android/internal/telephony/IccRecords;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 238
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 255
    .end local v1           #app:Lcom/android/internal/telephony/UiccCardApplication;
    :cond_5
    packed-switch v2, :pswitch_data_0

    .line 312
    const/4 v4, -0x1

    :cond_6
    :goto_2
    move v13, v4

    .line 315
    goto :goto_0

    .line 257
    :pswitch_0
    sget-object v13, Lcom/android/internal/telephony/UiccManager$1;->$SwitchMap$com$android$internal$telephony$IccCardApplicationStatus$AppType:[I

    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-virtual {v14}, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->ordinal()I

    move-result v14

    aget v13, v13, v14

    packed-switch v13, :pswitch_data_1

    .line 269
    const/4 v4, -0x1

    .line 270
    goto :goto_2

    .line 259
    :pswitch_1
    const/16 v4, 0xa

    .line 260
    goto :goto_2

    .line 262
    :pswitch_2
    const/16 v4, 0x14

    .line 263
    goto :goto_2

    .line 266
    :pswitch_3
    const/16 v4, 0x1e

    .line 267
    goto :goto_2

    .line 275
    :pswitch_4
    const/4 v8, 0x0

    :goto_3
    array-length v13, v3

    if-ge v8, v13, :cond_6

    .line 276
    aget-object v13, v3, v8

    sget-object v14, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_RUIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    if-ne v13, v14, :cond_8

    rsub-int/lit8 v13, v8, 0x1

    aget-object v13, v3, v13

    sget-object v14, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_SIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    if-ne v13, v14, :cond_8

    .line 277
    const/16 v4, 0x28

    .line 278
    if-eqz v7, :cond_c

    if-eqz v5, :cond_c

    .line 279
    const-string v13, "RIL_UiccManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "getCardType:cdmaImsi="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", gsmImsi="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    :try_start_0
    const-string v13, "46003"

    const/4 v14, 0x0

    const/4 v15, 0x5

    invoke-virtual {v5, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 282
    const/4 v13, 0x0

    const/4 v14, 0x5

    invoke-virtual {v7, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 283
    .local v10, plmn:Ljava/lang/String;
    const/4 v13, 0x0

    const/4 v14, 0x3

    invoke-virtual {v7, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 284
    .local v9, mcc:Ljava/lang/String;
    const-string v13, "46001"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 285
    const/16 v4, 0x2a

    .line 289
    :cond_7
    :goto_4
    const-string v13, "460"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v13

    if-nez v13, :cond_8

    .line 290
    const/16 v4, 0x29

    .line 304
    .end local v9           #mcc:Ljava/lang/String;
    .end local v10           #plmn:Ljava/lang/String;
    :cond_8
    :goto_5
    aget-object v13, v3, v8

    sget-object v14, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    if-ne v13, v14, :cond_9

    rsub-int/lit8 v13, v8, 0x1

    aget-object v13, v3, v13

    sget-object v14, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_SIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    if-ne v13, v14, :cond_9

    .line 305
    const/16 v4, 0x32

    .line 275
    :cond_9
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 286
    .restart local v9       #mcc:Ljava/lang/String;
    .restart local v10       #plmn:Ljava/lang/String;
    :cond_a
    :try_start_1
    const-string v13, "46003"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_b

    const-string v13, "46099"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v13

    if-eqz v13, :cond_7

    .line 287
    :cond_b
    const/16 v4, 0x1e

    goto :goto_4

    .line 293
    .end local v9           #mcc:Ljava/lang/String;
    .end local v10           #plmn:Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 294
    .local v6, e:Ljava/lang/Exception;
    const/4 v4, -0x1

    .line 295
    goto :goto_5

    .line 298
    .end local v6           #e:Ljava/lang/Exception;
    :cond_c
    if-eqz v7, :cond_d

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_8

    .line 299
    :cond_d
    const/16 v4, 0x1e

    goto :goto_5

    .line 255
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_4
    .end packed-switch

    .line 257
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public getCatService(I)Lcom/android/internal/telephony/cat/CatService;
    .locals 1
    .parameter "slotId"

    .prologue
    .line 394
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mCatService:[Lcom/android/internal/telephony/cat/CatService;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public declared-synchronized getIccCards()[Lcom/android/internal/telephony/UiccCard;
    .locals 1

    .prologue
    .line 322
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    invoke-virtual {v0}, [Lcom/android/internal/telephony/UiccCard;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/telephony/UiccCard;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getIccFileHandler(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/IccFileHandler;
    .locals 2
    .parameter "slotId"
    .parameter "family"

    .prologue
    .line 359
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/UiccManager;->getUiccCardApplication(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/UiccCardApplication;

    move-result-object v0

    .line 360
    .local v0, app:Lcom/android/internal/telephony/UiccCardApplication;
    if-eqz v0, :cond_0

    .line 361
    invoke-virtual {v0}, Lcom/android/internal/telephony/UiccCardApplication;->getIccFileHandler()Lcom/android/internal/telephony/IccFileHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 363
    :goto_0
    monitor-exit p0

    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 359
    .end local v0           #app:Lcom/android/internal/telephony/UiccCardApplication;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getIccFileHandler(Lcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/IccFileHandler;
    .locals 1
    .parameter "family"

    .prologue
    .line 355
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/UiccManager;->getIccFileHandler(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/IccFileHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getIccRecords(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/IccRecords;
    .locals 2
    .parameter "slotId"
    .parameter "family"

    .prologue
    .line 346
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/UiccManager;->getUiccCardApplication(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/UiccCardApplication;

    move-result-object v0

    .line 347
    .local v0, app:Lcom/android/internal/telephony/UiccCardApplication;
    if-eqz v0, :cond_0

    .line 348
    invoke-virtual {v0}, Lcom/android/internal/telephony/UiccCardApplication;->getIccRecords()Lcom/android/internal/telephony/IccRecords;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 350
    :goto_0
    monitor-exit p0

    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 346
    .end local v0           #app:Lcom/android/internal/telephony/UiccCardApplication;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getIccRecords(Lcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/IccRecords;
    .locals 1
    .parameter "family"

    .prologue
    .line 342
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/UiccManager;->getIccRecords(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/IccRecords;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUiccCard()Lcom/android/internal/telephony/UiccCard;
    .locals 1

    .prologue
    .line 196
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/UiccManager;->getUiccCard(I)Lcom/android/internal/telephony/UiccCard;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUiccCard(I)Lcom/android/internal/telephony/UiccCard;
    .locals 1
    .parameter "slotId"

    .prologue
    .line 200
    monitor-enter p0

    if-ltz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    aget-object v0, v0, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUiccCardApplication(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/UiccCardApplication;
    .locals 2
    .parameter "slotId"
    .parameter "family"

    .prologue
    .line 331
    monitor-enter p0

    if-ltz p1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    array-length v1, v1

    if-ge p1, v1, :cond_0

    .line 332
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mUiccCards:[Lcom/android/internal/telephony/UiccCard;

    aget-object v0, v1, p1

    .line 333
    .local v0, c:Lcom/android/internal/telephony/UiccCard;
    if-eqz v0, :cond_0

    .line 334
    invoke-virtual {v0, p2}, Lcom/android/internal/telephony/UiccCard;->getApplication(Lcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/UiccCardApplication;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 337
    .end local v0           #c:Lcom/android/internal/telephony/UiccCard;
    :goto_0
    monitor-exit p0

    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 331
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getUiccCardApplication(Lcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/UiccCardApplication;
    .locals 1
    .parameter "family"

    .prologue
    .line 327
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/UiccManager;->getUiccCardApplication(ILcom/android/internal/telephony/UiccManager$AppFamily;)Lcom/android/internal/telephony/UiccCardApplication;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .parameter "msg"

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/UiccManager;->getCiIndex(Landroid/os/Message;)Ljava/lang/Integer;

    move-result-object v2

    .line 116
    .local v2, index:Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ltz v3, :cond_0

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    array-length v4, v4

    if-lt v3, v4, :cond_2

    .line 117
    :cond_0
    const-string v3, "RIL_UiccManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid index - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " received with event "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    :cond_1
    :goto_0
    return-void

    .line 121
    :cond_2
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    .line 147
    const-string v3, "RIL_UiccManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " Unknown Event "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 123
    :pswitch_0
    const-string v3, "RIL_UiccManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received EVENT_ICC_STATUS_CHANGED, calling getIccCardStatus on index "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    const/4 v4, 0x2

    invoke-virtual {p0, v4, v2}, Lcom/android/internal/telephony/UiccManager;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    goto :goto_0

    .line 128
    :pswitch_1
    const-string v3, "RIL_UiccManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received EVENT_GET_ICC_STATUS_DONE on index "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 130
    .local v0, ar:Landroid/os/AsyncResult;
    invoke-direct {p0, v0, v2}, Lcom/android/internal/telephony/UiccManager;->onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;)V

    goto :goto_0

    .line 133
    .end local v0           #ar:Landroid/os/AsyncResult;
    :pswitch_2
    const-string v3, "RIL_UiccManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EVENT_RADIO_UNAVAILABLE on index "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/UiccManager;->disposeCard(I)V

    goto/16 :goto_0

    .line 137
    :pswitch_3
    const-string v3, "RIL_UiccManager"

    const-string v4, "INIT COMPLETED "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 139
    const-string v3, "RIL_UiccManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Creating CatService on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCatService:[Lcom/android/internal/telephony/cat/CatService;

    new-instance v4, Lcom/android/internal/telephony/cat/CatService;

    iget-object v5, p0, Lcom/android/internal/telephony/UiccManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v5, v5, v1

    iget-object v6, p0, Lcom/android/internal/telephony/UiccManager;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5, v6, v1}, Lcom/android/internal/telephony/cat/CatService;-><init>(Lcom/android/internal/telephony/CommandsInterface;Landroid/content/Context;I)V

    aput-object v4, v3, v1

    .line 141
    iget-object v3, p0, Lcom/android/internal/telephony/UiccManager;->mCatService:[Lcom/android/internal/telephony/cat/CatService;

    aget-object v3, v3, v1

    if-nez v3, :cond_3

    .line 142
    const-string v3, "RIL_UiccManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Couldn\'t create CatService on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 121
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public isCTNationRoamingEnable()Z
    .locals 2

    .prologue
    .line 222
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "not implemented in DualSim jellybean version"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isCTNationRoamingEnable(Lcom/android/internal/telephony/IHuaweiMsim;)Z
    .locals 5
    .parameter "msim"

    .prologue
    const/4 v1, 0x0

    .line 208
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->isMultiSimEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "cdma_gsm"

    const-string/jumbo v3, "ro.config.dsds_mode"

    const-string v4, ""

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 211
    invoke-interface {p1, v1}, Lcom/android/internal/telephony/IHuaweiMsim;->getCurrentSubscriptionOnSlot(I)Lcom/android/internal/telephony/IHuaweiMsim$SubInfo;

    move-result-object v0

    .line 212
    .local v0, sub:Lcom/android/internal/telephony/IHuaweiMsim$SubInfo;
    if-eqz v0, :cond_0

    iget v2, v0, Lcom/android/internal/telephony/IHuaweiMsim$SubInfo;->slotId:I

    iget v3, v0, Lcom/android/internal/telephony/IHuaweiMsim$SubInfo;->subId:I

    if-eq v2, v3, :cond_0

    const-string v2, "SIM"

    iget-object v3, v0, Lcom/android/internal/telephony/IHuaweiMsim$SubInfo;->appType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 213
    const/4 v1, 0x1

    .line 218
    .end local v0           #sub:Lcom/android/internal/telephony/IHuaweiMsim$SubInfo;
    :cond_0
    return v1
.end method

.method public registerForIccChanged(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 378
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 379
    .local v0, r:Landroid/os/Registrant;
    iget-object v2, p0, Lcom/android/internal/telephony/UiccManager;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    monitor-enter v2

    .line 380
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 381
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 384
    invoke-virtual {v0}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 385
    return-void

    .line 381
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public unregisterForIccChanged(Landroid/os/Handler;)V
    .locals 2
    .parameter "h"

    .prologue
    .line 387
    iget-object v1, p0, Lcom/android/internal/telephony/UiccManager;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    monitor-enter v1

    .line 388
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/UiccManager;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 389
    monitor-exit v1

    .line 390
    return-void

    .line 389
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
