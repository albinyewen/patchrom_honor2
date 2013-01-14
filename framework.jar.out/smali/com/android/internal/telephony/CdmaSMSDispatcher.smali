.class final Lcom/android/internal/telephony/CdmaSMSDispatcher;
.super Lcom/android/internal/telephony/SMSDispatcher;
.source "CdmaSMSDispatcher.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CDMA"


# instance fields
.field private final mCheckForDuplicatePortsInOmadmWapPush:Z

.field private mImsSMSDispatcher:Lcom/android/internal/telephony/ImsSMSDispatcher;

.field private mLastAcknowledgedSmsFingerprint:[B

.field private mLastDispatchedSmsFingerprint:[B


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/SmsUsageMonitor;Lcom/android/internal/telephony/ImsSMSDispatcher;)V
    .locals 3
    .parameter "phone"
    .parameter "storageMonitor"
    .parameter "usageMonitor"
    .parameter "imsSMSDispatcher"

    .prologue
    .line 79
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/SMSDispatcher;-><init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/SmsUsageMonitor;)V

    .line 74
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1110033

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mCheckForDuplicatePortsInOmadmWapPush:Z

    .line 80
    iput-object p4, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mImsSMSDispatcher:Lcom/android/internal/telephony/ImsSMSDispatcher;

    .line 81
    iget-object v0, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->setOnNewCdmaSms(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 82
    const-string v0, "CDMA"

    const-string v1, "CdmaSMSDispatcher created"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    return-void
.end method

.method private static checkDuplicatePortOmadmWappush([BI)Z
    .locals 6
    .parameter "origPdu"
    .parameter "index"

    .prologue
    const/4 v4, 0x0

    .line 585
    add-int/lit8 p1, p1, 0x4

    .line 586
    array-length v5, p0

    sub-int/2addr v5, p1

    new-array v1, v5, [B

    .line 587
    .local v1, omaPdu:[B
    array-length v5, v1

    invoke-static {p0, p1, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 589
    new-instance v2, Lcom/android/internal/telephony/WspTypeDecoder;

    invoke-direct {v2, v1}, Lcom/android/internal/telephony/WspTypeDecoder;-><init>([B)V

    .line 590
    .local v2, pduDecoder:Lcom/android/internal/telephony/WspTypeDecoder;
    const/4 v3, 0x2

    .line 593
    .local v3, wspIndex:I
    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeUintvarInteger(I)Z

    move-result v5

    if-nez v5, :cond_1

    .line 608
    :cond_0
    :goto_0
    return v4

    .line 597
    :cond_1
    invoke-virtual {v2}, Lcom/android/internal/telephony/WspTypeDecoder;->getDecodedDataLength()I

    move-result v5

    add-int/2addr v3, v5

    .line 600
    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeContentType(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 604
    invoke-virtual {v2}, Lcom/android/internal/telephony/WspTypeDecoder;->getValueString()Ljava/lang/String;

    move-result-object v0

    .line 605
    .local v0, mimeType:Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v5, "application/vnd.syncml.notification"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 606
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private handleCdmaStatusReport(Lcom/android/internal/telephony/cdma/SmsMessage;)V
    .locals 7
    .parameter "sms"

    .prologue
    .line 116
    const/4 v2, 0x0

    .local v2, i:I
    iget-object v5, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, count:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 117
    iget-object v5, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    .line 118
    .local v4, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    iget v5, v4, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    iget v6, p1, Lcom/android/internal/telephony/cdma/SmsMessage;->messageRef:I

    if-ne v5, v6, :cond_1

    .line 120
    iget-object v5, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 121
    iget-object v3, v4, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mDeliveryIntent:Landroid/app/PendingIntent;

    .line 122
    .local v3, intent:Landroid/app/PendingIntent;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 123
    .local v1, fillIn:Landroid/content/Intent;
    const-string/jumbo v5, "pdu"

    invoke-virtual {p1}, Lcom/android/internal/telephony/cdma/SmsMessage;->getPdu()[B

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 124
    const-string v5, "format"

    const-string v6, "3gpp2"

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 126
    :try_start_0
    iget-object v5, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mContext:Landroid/content/Context;

    const/4 v6, -0x1

    invoke-virtual {v3, v5, v6, v1}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .end local v1           #fillIn:Landroid/content/Intent;
    .end local v3           #intent:Landroid/app/PendingIntent;
    .end local v4           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_0
    :goto_1
    return-void

    .line 116
    .restart local v4       #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 127
    .restart local v1       #fillIn:Landroid/content/Intent;
    .restart local v3       #intent:Landroid/app/PendingIntent;
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method private handleServiceCategoryProgramData(Lcom/android/internal/telephony/cdma/SmsMessage;)V
    .locals 4
    .parameter "sms"

    .prologue
    .line 140
    invoke-virtual {p1}, Lcom/android/internal/telephony/cdma/SmsMessage;->getSmsCbProgramData()Ljava/util/List;

    move-result-object v1

    .line 141
    .local v1, programDataList:Ljava/util/List;,"Ljava/util/List<Landroid/telephony/cdma/CdmaSmsCbProgramData;>;"
    if-nez v1, :cond_0

    .line 142
    const-string v2, "CDMA"

    const-string v3, "handleServiceCategoryProgramData: program data list is null!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    :goto_0
    return-void

    .line 146
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.provider.Telephony.SMS_SERVICE_CATEGORY_PROGRAM_DATA_RECEIVED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 147
    .local v0, intent:Landroid/content/Intent;
    const-string/jumbo v3, "program_data_list"

    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/telephony/cdma/CdmaSmsCbProgramData;

    check-cast v2, [Landroid/telephony/cdma/CdmaSmsCbProgramData;

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 148
    const-string v2, "android.permission.RECEIVE_SMS"

    invoke-virtual {p0, v0, v2}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->dispatch(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static resultToCause(I)I
    .locals 1
    .parameter "rc"

    .prologue
    .line 558
    packed-switch p0, :pswitch_data_0

    .line 569
    :pswitch_0
    const/16 v0, 0x60

    :goto_0
    return v0

    .line 562
    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    .line 564
    :pswitch_2
    const/16 v0, 0x23

    goto :goto_0

    .line 566
    :pswitch_3
    const/4 v0, 0x4

    goto :goto_0

    .line 558
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method protected acknowledgeLastIncomingSms(ZILandroid/os/Message;)V
    .locals 4
    .parameter "success"
    .parameter "result"
    .parameter "response"

    .prologue
    .line 543
    const-string/jumbo v2, "ril.cdma.inecmmode"

    const-string v3, "false"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 544
    .local v1, inEcm:Ljava/lang/String;
    const-string/jumbo v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 555
    :goto_0
    return-void

    .line 548
    :cond_0
    invoke-static {p2}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->resultToCause(I)I

    move-result v0

    .line 549
    .local v0, causeCode:I
    iget-object v2, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p1, v0, p3}, Lcom/android/internal/telephony/CommandsInterface;->acknowledgeLastIncomingCdmaSms(ZILandroid/os/Message;)V

    .line 551
    if-nez v0, :cond_1

    .line 552
    iget-object v2, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mLastDispatchedSmsFingerprint:[B

    iput-object v2, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mLastAcknowledgedSmsFingerprint:[B

    .line 554
    :cond_1
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mLastDispatchedSmsFingerprint:[B

    goto :goto_0
.end method

.method protected calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;
    .locals 1
    .parameter "messageBody"
    .parameter "use7bitOnly"

    .prologue
    .line 431
    invoke-static {p1, p2}, Lcom/android/internal/telephony/cdma/SmsMessage;->calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;

    move-result-object v0

    return-object v0
.end method

.method protected dispatchBroadcastPdus([[BZ)V
    .locals 4
    .parameter "pdus"
    .parameter "isEmergencyMessage"

    .prologue
    .line 258
    if-eqz p2, :cond_0

    .line 259
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.Telephony.EMERGENCY_CDMA_MESSAGE_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 260
    .local v0, broadcastIntent:Landroid/content/Intent;
    const-string/jumbo v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 261
    const-string v1, "CDMA"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dispatching "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " emergency SMS CB pdus"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    const-string v1, "android.permission.RECEIVE_EMERGENCY_BROADCAST"

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->dispatch(Landroid/content/Intent;Ljava/lang/String;)V

    .line 267
    .end local v0           #broadcastIntent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 265
    :cond_0
    const-string v1, "CDMA"

    const-string v2, "CDMA non emergency messages: not supported"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected dispatchMessage(Lcom/android/internal/telephony/SmsMessageBase;)I
    .locals 13
    .parameter "smsb"

    .prologue
    const/16 v12, 0x1005

    const/16 v11, 0x1002

    const/4 v6, -0x1

    const/16 v10, 0x1004

    const/4 v7, 0x1

    .line 156
    if-nez p1, :cond_1

    .line 157
    const-string v6, "CDMA"

    const-string v7, "dispatchMessage: message is null"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    const/4 v6, 0x2

    .line 254
    :cond_0
    :goto_0
    return v6

    .line 161
    :cond_1
    const-string/jumbo v8, "ril.cdma.inecmmode"

    const-string v9, "false"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, inEcm:Ljava/lang/String;
    const-string/jumbo v8, "true"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 166
    iget-boolean v8, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mSmsReceiveDisabled:Z

    if-eqz v8, :cond_2

    .line 168
    const-string v6, "CDMA"

    const-string v8, "Received short message on device which doesn\'t support receiving SMS. Ignored."

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v6, v7

    .line 170
    goto :goto_0

    :cond_2
    move-object v4, p1

    .line 174
    check-cast v4, Lcom/android/internal/telephony/cdma/SmsMessage;

    .line 176
    .local v4, sms:Lcom/android/internal/telephony/cdma/SmsMessage;
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getIncomingSmsFingerprint()[B

    move-result-object v8

    iput-object v8, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mLastDispatchedSmsFingerprint:[B

    .line 177
    iget-object v8, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mLastAcknowledgedSmsFingerprint:[B

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mLastDispatchedSmsFingerprint:[B

    iget-object v9, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mLastAcknowledgedSmsFingerprint:[B

    invoke-static {v8, v9}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v8

    if-eqz v8, :cond_3

    move v6, v7

    .line 179
    goto :goto_0

    .line 182
    :cond_3
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->parseSms()V

    .line 183
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getTeleService()I

    move-result v5

    .line 184
    .local v5, teleService:I
    const/4 v0, 0x0

    .line 186
    .local v0, handled:Z
    const/16 v8, 0x1003

    if-eq v8, v5, :cond_4

    const/high16 v8, 0x4

    if-ne v8, v5, :cond_6

    .line 189
    :cond_4
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getNumOfVoicemails()I

    move-result v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->updateMessageWaitingIndicator(I)V

    .line 190
    const/4 v0, 0x1

    .line 206
    :cond_5
    :goto_1
    if-eqz v0, :cond_a

    move v6, v7

    .line 207
    goto :goto_0

    .line 191
    :cond_6
    if-eq v11, v5, :cond_7

    if-ne v12, v5, :cond_8

    :cond_7
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->isStatusReportMessage()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 194
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->handleCdmaStatusReport(Lcom/android/internal/telephony/cdma/SmsMessage;)V

    .line 195
    const/4 v0, 0x1

    goto :goto_1

    .line 196
    :cond_8
    const/16 v8, 0x1006

    if-ne v8, v5, :cond_9

    .line 197
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->handleServiceCategoryProgramData(Lcom/android/internal/telephony/cdma/SmsMessage;)V

    .line 198
    const/4 v0, 0x1

    goto :goto_1

    .line 199
    :cond_9
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getUserData()[B

    move-result-object v8

    if-nez v8, :cond_5

    .line 203
    const/4 v0, 0x1

    goto :goto_1

    .line 210
    :cond_a
    iget-object v8, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mStorageMonitor:Lcom/android/internal/telephony/SmsStorageMonitor;

    invoke-virtual {v8}, Lcom/android/internal/telephony/SmsStorageMonitor;->isStorageAvailable()Z

    move-result v8

    if-nez v8, :cond_b

    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getMessageClass()Landroid/telephony/SmsMessage$MessageClass;

    move-result-object v8

    sget-object v9, Landroid/telephony/SmsMessage$MessageClass;->CLASS_0:Landroid/telephony/SmsMessage$MessageClass;

    if-eq v8, v9, :cond_b

    .line 215
    const/4 v6, 0x3

    goto/16 :goto_0

    .line 223
    :cond_b
    const v8, 0xfdea

    if-eq v8, v5, :cond_c

    if-ne v10, v5, :cond_d

    :cond_c
    const-string v8, "gsm.sim.operator.numeric"

    const-string v9, "0"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "46003"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 225
    const-string v6, "CDMA"

    const-string v7, "CT\'s MMS notification"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getUserData()[B

    move-result-object v6

    invoke-static {v6}, Lcom/android/internal/telephony/cdma/sms/BearerData;->decode([B)Lcom/android/internal/telephony/cdma/sms/BearerData;

    move-result-object v2

    .line 227
    .local v2, mCTBearerData:Lcom/android/internal/telephony/cdma/sms/BearerData;
    iget-object v6, v2, Lcom/android/internal/telephony/cdma/sms/BearerData;->userData:Lcom/android/internal/telephony/cdma/sms/UserData;

    iget-object v6, v6, Lcom/android/internal/telephony/cdma/sms/UserData;->payload:[B

    const/16 v7, 0x1f

    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v6, v7, v8}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->processCdmaWapPdu([BILjava/lang/String;)I

    move-result v6

    goto/16 :goto_0

    .line 231
    .end local v2           #mCTBearerData:Lcom/android/internal/telephony/cdma/sms/BearerData;
    :cond_d
    if-ne v10, v5, :cond_e

    .line 232
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getUserData()[B

    move-result-object v6

    iget v7, v4, Lcom/android/internal/telephony/cdma/SmsMessage;->messageRef:I

    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v6, v7, v8}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->processCdmaWapPdu([BILjava/lang/String;)I

    move-result v6

    goto/16 :goto_0

    .line 239
    :cond_e
    if-eq v11, v5, :cond_f

    if-eq v12, v5, :cond_f

    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getMessageType()I

    move-result v8

    if-eq v7, v8, :cond_f

    .line 242
    const/4 v6, 0x4

    goto/16 :goto_0

    .line 245
    :cond_f
    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getMessageType()I

    move-result v8

    if-ne v8, v7, :cond_10

    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getServiceCategory()I

    move-result v8

    const/16 v9, 0x1000

    if-lt v8, v9, :cond_10

    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getServiceCategory()I

    move-result v8

    if-gt v8, v10, :cond_10

    .line 249
    new-array v3, v7, [[B

    .line 250
    .local v3, pdus:[[B
    const/4 v8, 0x0

    invoke-virtual {v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getPdu()[B

    move-result-object v9

    aput-object v9, v3, v8

    .line 251
    invoke-virtual {p0, v3, v7}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->dispatchBroadcastPdus([[BZ)V

    goto/16 :goto_0

    .line 254
    .end local v3           #pdus:[[B
    :cond_10
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->dispatchNormalMessage(Lcom/android/internal/telephony/SmsMessageBase;)I

    move-result v6

    goto/16 :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v0, p0}, Lcom/android/internal/telephony/CommandsInterface;->unSetOnNewCdmaSms(Landroid/os/Handler;)V

    .line 88
    invoke-super {p0}, Lcom/android/internal/telephony/SMSDispatcher;->dispose()V

    .line 89
    return-void
.end method

.method protected getFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    const-string v0, "3gpp2"

    return-object v0
.end method

.method protected handleGetIccSmsDone(Landroid/os/AsyncResult;)V
    .locals 2
    .parameter "ar"

    .prologue
    .line 112
    const-string v0, "CDMA"

    const-string v1, "handleGetIccSmsDone function is not applicable for CDMA"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    return-void
.end method

.method protected handleSmsOnIcc(Landroid/os/AsyncResult;)V
    .locals 2
    .parameter "ar"

    .prologue
    .line 103
    const-string v0, "CDMA"

    const-string v1, "handleSmsOnIcc function is not applicable for CDMA"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    return-void
.end method

.method protected processCdmaWapPdu([BILjava/lang/String;)I
    .locals 15
    .parameter "pdu"
    .parameter "referenceNumber"
    .parameter "address"

    .prologue
    .line 280
    const/4 v11, 0x0

    .line 282
    .local v11, index:I
    add-int/lit8 v12, v11, 0x1

    .end local v11           #index:I
    .local v12, index:I
    aget-byte v1, p1, v11

    and-int/lit16 v13, v1, 0xff

    .line 283
    .local v13, msgType:I
    if-eqz v13, :cond_0

    .line 284
    const-string v1, "CDMA"

    const-string v3, "Received a WAP SMS which is not WDP. Discard."

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    const/4 v1, 0x1

    move v11, v12

    .line 322
    .end local v12           #index:I
    .restart local v11       #index:I
    :goto_0
    return v1

    .line 287
    .end local v11           #index:I
    .restart local v12       #index:I
    :cond_0
    add-int/lit8 v11, v12, 0x1

    .end local v12           #index:I
    .restart local v11       #index:I
    aget-byte v1, p1, v12

    and-int/lit16 v6, v1, 0xff

    .line 288
    .local v6, totalSegments:I
    add-int/lit8 v12, v11, 0x1

    .end local v11           #index:I
    .restart local v12       #index:I
    aget-byte v1, p1, v11

    and-int/lit16 v5, v1, 0xff

    .line 290
    .local v5, segment:I
    if-lt v5, v6, :cond_1

    .line 291
    const-string v1, "CDMA"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WDP bad segment #"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " expecting 0-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v6, -0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    const/4 v1, 0x1

    move v11, v12

    .end local v12           #index:I
    .restart local v11       #index:I
    goto :goto_0

    .line 296
    .end local v11           #index:I
    .restart local v12       #index:I
    :cond_1
    const/4 v14, 0x0

    .line 297
    .local v14, sourcePort:I
    const/4 v9, 0x0

    .line 298
    .local v9, destinationPort:I
    if-nez v5, :cond_2

    .line 300
    add-int/lit8 v11, v12, 0x1

    .end local v12           #index:I
    .restart local v11       #index:I
    aget-byte v1, p1, v12

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v14, v1, 0x8

    .line 301
    add-int/lit8 v12, v11, 0x1

    .end local v11           #index:I
    .restart local v12       #index:I
    aget-byte v1, p1, v11

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v14, v1

    .line 302
    add-int/lit8 v11, v12, 0x1

    .end local v12           #index:I
    .restart local v11       #index:I
    aget-byte v1, p1, v12

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v9, v1, 0x8

    .line 303
    add-int/lit8 v12, v11, 0x1

    .end local v11           #index:I
    .restart local v12       #index:I
    aget-byte v1, p1, v11

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v9, v1

    .line 306
    iget-boolean v1, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mCheckForDuplicatePortsInOmadmWapPush:Z

    if-eqz v1, :cond_2

    .line 307
    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->checkDuplicatePortOmadmWappush([BI)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 308
    add-int/lit8 v11, v12, 0x4

    .line 314
    .end local v12           #index:I
    .restart local v11       #index:I
    :goto_1
    const-string v1, "CDMA"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received WAP PDU. Type = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", originator = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", src-port = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", dst-port = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", ID = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", segment# = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    move-object/from16 v0, p1

    array-length v1, v0

    sub-int/2addr v1, v11

    new-array v2, v1, [B

    .line 320
    .local v2, userData:[B
    const/4 v1, 0x0

    move-object/from16 v0, p1

    array-length v3, v0

    sub-int/2addr v3, v11

    move-object/from16 v0, p1

    invoke-static {v0, v11, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 322
    const-wide/16 v7, 0x0

    const/4 v10, 0x1

    move-object v1, p0

    move-object/from16 v3, p3

    move/from16 v4, p2

    invoke-virtual/range {v1 .. v10}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->processMessagePart([BLjava/lang/String;IIIJIZ)I

    move-result v1

    goto/16 :goto_0

    .end local v2           #userData:[B
    .end local v11           #index:I
    .restart local v12       #index:I
    :cond_2
    move v11, v12

    .end local v12           #index:I
    .restart local v11       #index:I
    goto :goto_1
.end method

.method protected sendData(Ljava/lang/String;Ljava/lang/String;I[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .locals 8
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "destPort"
    .parameter "data"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    .line 330
    if-eqz p6, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {p2, p1, p3, p4, v0}, Lcom/android/internal/telephony/cdma/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;I[BZ)Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;

    move-result-object v5

    .local v5, pdu:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    .line 333
    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerMapFactory(Ljava/lang/String;Ljava/lang/String;I[BLcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v6

    .line 334
    .local v6, map:Ljava/util/HashMap;
    invoke-virtual {p0}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->getFormat()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v6, p5, p6, v0}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerFactory(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v7

    .line 336
    .local v7, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->sendSubmitPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 337
    return-void

    .line 330
    .end local v5           #pdu:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    .end local v6           #map:Ljava/util/HashMap;
    .end local v7           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected sendMultipartData(Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 19
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "destPort"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<[B>;",
            "Ljava/util/List",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/List",
            "<",
            "Landroid/app/PendingIntent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 372
    .local p4, data:Ljava/util/List;,"Ljava/util/List<[B>;"
    .local p5, sentIntents:Ljava/util/List;,"Ljava/util/List<Landroid/app/PendingIntent;>;"
    .local p6, deliveryIntents:Ljava/util/List;,"Ljava/util/List<Landroid/app/PendingIntent;>;"
    invoke-static {}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->getNextConcatenatedRef()I

    move-result v3

    and-int/lit16 v15, v3, 0xff

    .line 373
    .local v15, refNumber:I
    invoke-interface/range {p4 .. p4}, Ljava/util/List;->size()I

    move-result v13

    .line 375
    .local v13, msgCount:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    if-ge v11, v13, :cond_3

    .line 376
    new-instance v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-direct {v9}, Lcom/android/internal/telephony/SmsHeader$ConcatRef;-><init>()V

    .line 377
    .local v9, concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    iput v15, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 378
    add-int/lit8 v3, v11, 0x1

    iput v3, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    .line 379
    iput v13, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    .line 381
    const/4 v3, 0x1

    iput-boolean v3, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->isEightBits:Z

    .line 382
    new-instance v14, Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    invoke-direct {v14}, Lcom/android/internal/telephony/SmsHeader$PortAddrs;-><init>()V

    .line 383
    .local v14, portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;
    move/from16 v0, p3

    iput v0, v14, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    .line 384
    const/4 v3, 0x0

    iput v3, v14, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->origPort:I

    .line 385
    const/4 v3, 0x0

    iput-boolean v3, v14, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->areEightBits:Z

    .line 387
    new-instance v17, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct/range {v17 .. v17}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 388
    .local v17, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    move-object/from16 v0, v17

    iput-object v9, v0, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    .line 389
    move-object/from16 v0, v17

    iput-object v14, v0, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    .line 391
    const/16 v16, 0x0

    .line 392
    .local v16, sentIntent:Landroid/app/PendingIntent;
    if-eqz p5, :cond_0

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v11, :cond_0

    .line 393
    move-object/from16 v0, p5

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .end local v16           #sentIntent:Landroid/app/PendingIntent;
    check-cast v16, Landroid/app/PendingIntent;

    .line 396
    .restart local v16       #sentIntent:Landroid/app/PendingIntent;
    :cond_0
    const/4 v10, 0x0

    .line 397
    .local v10, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p6, :cond_1

    invoke-interface/range {p6 .. p6}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v11, :cond_1

    .line 398
    move-object/from16 v0, p6

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .end local v10           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v10, Landroid/app/PendingIntent;

    .line 401
    .restart local v10       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_1
    const/4 v8, 0x0

    .line 403
    .local v8, pdus:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    move-object/from16 v0, p4

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    if-eqz v10, :cond_2

    const/4 v4, 0x1

    :goto_1
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsHeader;[BZ)Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;

    move-result-object v8

    .line 406
    move-object/from16 v0, p4

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerMapFactory(Ljava/lang/String;Ljava/lang/String;I[BLcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v12

    .line 407
    .local v12, map:Ljava/util/HashMap;
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->getFormat()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v12, v1, v10, v3}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerFactory(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v18

    .line 409
    .local v18, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 375
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_0

    .line 403
    .end local v12           #map:Ljava/util/HashMap;
    .end local v18           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 411
    .end local v8           #pdus:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    .end local v9           #concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v10           #deliveryIntent:Landroid/app/PendingIntent;
    .end local v14           #portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;
    .end local v16           #sentIntent:Landroid/app/PendingIntent;
    .end local v17           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :cond_3
    return-void
.end method

.method protected sendNewSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsHeader;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;Z)V
    .locals 6
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "message"
    .parameter "smsHeader"
    .parameter "encoding"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "lastPart"

    .prologue
    const/4 v4, 0x1

    .line 439
    new-instance v3, Lcom/android/internal/telephony/cdma/sms/UserData;

    invoke-direct {v3}, Lcom/android/internal/telephony/cdma/sms/UserData;-><init>()V

    .line 440
    .local v3, uData:Lcom/android/internal/telephony/cdma/sms/UserData;
    iput-object p3, v3, Lcom/android/internal/telephony/cdma/sms/UserData;->payloadStr:Ljava/lang/String;

    .line 441
    iput-object p4, v3, Lcom/android/internal/telephony/cdma/sms/UserData;->userDataHeader:Lcom/android/internal/telephony/SmsHeader;

    .line 442
    if-ne p5, v4, :cond_0

    .line 444
    const/4 v5, 0x2

    iput v5, v3, Lcom/android/internal/telephony/cdma/sms/UserData;->msgEncoding:I

    .line 449
    :goto_0
    iput-boolean v4, v3, Lcom/android/internal/telephony/cdma/sms/UserData;->msgEncodingSet:Z

    .line 455
    if-eqz p7, :cond_1

    if-eqz p8, :cond_1

    :goto_1
    invoke-static {p1, v3, v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getSubmitPdu(Ljava/lang/String;Lcom/android/internal/telephony/cdma/sms/UserData;Z)Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;

    move-result-object v1

    .line 458
    .local v1, submitPdu:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerMapFactory(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v0

    .line 460
    .local v0, map:Ljava/util/HashMap;
    invoke-virtual {p0}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->getFormat()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v0, p6, p7, v4}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerFactory(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v2

    .line 462
    .local v2, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->sendSubmitPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 463
    return-void

    .line 447
    .end local v0           #map:Ljava/util/HashMap;
    .end local v1           #submitPdu:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    .end local v2           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_0
    const/4 v5, 0x4

    iput v5, v3, Lcom/android/internal/telephony/cdma/sms/UserData;->msgEncoding:I

    goto :goto_0

    .line 455
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method protected sendRetrySms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V
    .locals 1
    .parameter "tracker"

    .prologue
    .line 537
    iget-object v0, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mImsSMSDispatcher:Lcom/android/internal/telephony/ImsSMSDispatcher;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/ImsSMSDispatcher;->sendRetrySms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 538
    return-void
.end method

.method protected sendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V
    .locals 3
    .parameter "tracker"

    .prologue
    .line 484
    const-string v0, "CDMA"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sendSms: tracker is:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    iget-object v0, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mTrackerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 489
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mTrackerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->sendSmsImmediately(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 490
    const/16 v0, 0xf

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    const-wide/32 v1, 0xea60

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 493
    :cond_0
    return-void
.end method

.method protected sendSmsImmediately(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)Z
    .locals 6
    .parameter "tracker"

    .prologue
    .line 502
    if-nez p1, :cond_0

    .line 503
    const/4 v3, 0x0

    .line 531
    :goto_0
    return v3

    .line 506
    :cond_0
    iget-object v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mData:Ljava/util/HashMap;

    .line 508
    .local v0, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "CDMA"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "sendSmsImmediately: tracker is:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    const-string v3, "CDMA"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "sendSmsImmediately: mTrackerList size is:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mTrackerList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    const-string/jumbo v3, "pdu"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v1, v3

    check-cast v1, [B

    .line 514
    .local v1, pdu:[B
    const/4 v3, 0x2

    invoke-virtual {p0, v3, p1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 516
    .local v2, reply:Landroid/os/Message;
    const-string v3, "CDMA"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "sendSms:  isIms()="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->isIms()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mRetryCount="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mImsRetry="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mMessageRef="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " SS="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/ServiceState;->getState()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    iget v3, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    if-nez v3, :cond_1

    invoke-static {}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->isIms()Z

    move-result v3

    if-nez v3, :cond_1

    .line 524
    iget-object v3, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v3, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->sendCdmaSms([BLandroid/os/Message;)V

    .line 531
    :goto_1
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 526
    :cond_1
    iget-object v3, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    iget v4, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    iget v5, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    invoke-interface {v3, v1, v4, v5, v2}, Lcom/android/internal/telephony/CommandsInterface;->sendImsCdmaSms([BIILandroid/os/Message;)V

    .line 529
    iget v3, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    goto :goto_1
.end method

.method protected sendSubmitPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V
    .locals 2
    .parameter "tracker"

    .prologue
    .line 466
    const-string/jumbo v0, "ril.cdma.inecmmode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 467
    iget-object v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mSentIntent:Landroid/app/PendingIntent;

    if-eqz v0, :cond_0

    .line 469
    :try_start_0
    iget-object v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mSentIntent:Landroid/app/PendingIntent;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/app/PendingIntent;->send(I)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 478
    :cond_0
    :goto_0
    return-void

    .line 477
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    goto :goto_0

    .line 470
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected sendText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .locals 5
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    .line 418
    if-eqz p5, :cond_0

    const/4 v3, 0x1

    :goto_0
    const/4 v4, 0x0

    invoke-static {p2, p1, p3, v3, v4}, Lcom/android/internal/telephony/cdma/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/android/internal/telephony/SmsHeader;)Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;

    move-result-object v1

    .line 421
    .local v1, pdu:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerMapFactory(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v0

    .line 422
    .local v0, map:Ljava/util/HashMap;
    invoke-virtual {p0}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->getFormat()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, p4, p5, v3}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->SmsTrackerFactory(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v2

    .line 424
    .local v2, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->sendSubmitPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 425
    return-void

    .line 418
    .end local v0           #map:Ljava/util/HashMap;
    .end local v1           #pdu:Lcom/android/internal/telephony/cdma/SmsMessage$SubmitPdu;
    .end local v2           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method updateMessageWaitingIndicator(I)V
    .locals 1
    .parameter "mwi"

    .prologue
    .line 661
    if-gez p1, :cond_1

    .line 662
    const/4 p1, -0x1

    .line 669
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/internal/telephony/CdmaSMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/PhoneBase;->setVoiceMessageCount(I)V

    .line 671
    invoke-virtual {p0}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->storeVoiceMailCount()V

    .line 672
    return-void

    .line 663
    :cond_1
    const/16 v0, 0x63

    if-le p1, v0, :cond_0

    .line 666
    const/16 p1, 0x63

    goto :goto_0
.end method

.method updateMessageWaitingIndicator(Z)V
    .locals 1
    .parameter "mwi"

    .prologue
    .line 652
    if-eqz p1, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/CdmaSMSDispatcher;->updateMessageWaitingIndicator(I)V

    .line 653
    return-void

    .line 652
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
