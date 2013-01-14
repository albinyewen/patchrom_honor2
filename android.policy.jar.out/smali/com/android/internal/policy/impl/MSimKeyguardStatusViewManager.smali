.class Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;
.super Lcom/android/internal/policy/impl/KeyguardStatusViewManager;
.source "MSimKeyguardStatusViewManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$3;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "MSimKeyguardStatusView"


# instance fields
.field private mCarrierTextSub:[Ljava/lang/CharSequence;

.field private mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;

.field private mMSimPlmn:[Ljava/lang/CharSequence;

.field private mMSimSpn:[Ljava/lang/CharSequence;

.field private mMSimState:[Lcom/android/internal/telephony/IccCard$State;

.field private mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

.field private mNumPhones:I

.field private mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Z)V
    .locals 5
    .parameter "view"
    .parameter "updateMonitor"
    .parameter "lockPatternUtils"
    .parameter "callback"
    .parameter "emergencyButtonEnabledInScreen"

    .prologue
    const/4 v4, 0x0

    .line 57
    invoke-direct/range {p0 .. p5}, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;-><init>(Landroid/view/View;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Z)V

    .line 43
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    const/4 v2, 0x0

    sget-object v3, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;->Normal:Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    aput-object v3, v1, v2

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    .line 208
    new-instance v1, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$1;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$1;-><init>(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;

    .line 262
    new-instance v1, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$2;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$2;-><init>(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    .line 59
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v1

    iput v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    .line 60
    iget v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v1, v1, [Ljava/lang/CharSequence;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    .line 61
    iget v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v1, v1, [Ljava/lang/CharSequence;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    .line 62
    iget v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v1, v1, [Ljava/lang/CharSequence;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    .line 63
    iget v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v1, v1, [Lcom/android/internal/telephony/IccCard$State;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    .line 64
    iget v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v1, v1, [Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    .line 67
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    if-ge v0, v1, :cond_0

    .line 68
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    sget-object v2, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;->Normal:Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    aput-object v2, v1, v0

    .line 69
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aput-object v4, v1, v0

    .line 70
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aput-object v4, v1, v0

    .line 71
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    aput-object v4, v1, v0

    .line 72
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    sget-object v2, Lcom/android/internal/telephony/IccCard$State;->READY:Lcom/android/internal/telephony/IccCard$State;

    aput-object v2, v1, v0

    .line 67
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 74
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerInfoCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;)V

    .line 75
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerSimStateCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;)V

    .line 76
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->resetStatusInfo()V

    .line 78
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MSimTelephonyManager;->getDefaultSubscription()I

    move-result v2

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mStatus:Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    .line 79
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MSimTelephonyManager;->getDefaultSubscription()I

    move-result v2

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mPlmn:Ljava/lang/CharSequence;

    .line 80
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MSimTelephonyManager;->getDefaultSubscription()I

    move-result v2

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSpn:Ljava/lang/CharSequence;

    .line 81
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MSimTelephonyManager;->getDefaultSubscription()I

    move-result v2

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimState:Lcom/android/internal/telephony/IccCard$State;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)[Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)[Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)[Lcom/android/internal/telephony/IccCard$State;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;Lcom/android/internal/telephony/IccCard$State;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->updateCarrierStateWithSimStatus(Lcom/android/internal/telephony/IccCard$State;I)V

    return-void
.end method

.method private updateCarrierStateWithSimStatus(Lcom/android/internal/telephony/IccCard$State;I)V
    .locals 5
    .parameter "simState"
    .parameter "subscription"

    .prologue
    const v3, 0x1040305

    const/4 v4, 0x1

    .line 142
    const/4 v0, 0x0

    .line 143
    .local v0, carrierHelpTextId:I
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    .line 144
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getStatusForIccState(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    move-result-object v2

    aput-object v2, v1, p2

    .line 145
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    aput-object p1, v1, p2

    .line 146
    sget-object v1, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$3;->$SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode:[I

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    aget-object v2, v2, p2

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 203
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->setCarrierText()V

    .line 204
    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->setCarrierHelpText(I)V

    .line 205
    iget v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mPhoneState:I

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->updateEmergencyCallButtonState(I)V

    .line 206
    return-void

    .line 148
    :pswitch_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v2, v2, p2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    goto :goto_0

    .line 153
    :pswitch_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1040534

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    .line 156
    const v0, 0x10402f9

    .line 157
    goto :goto_0

    .line 164
    :pswitch_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    .line 167
    const v0, 0x1040308

    .line 168
    goto :goto_0

    .line 171
    :pswitch_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    .line 173
    const v0, 0x104030a

    .line 174
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto :goto_0

    .line 178
    :pswitch_4
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    .line 181
    const v0, 0x1040307

    .line 182
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto :goto_0

    .line 186
    :pswitch_5
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1040314

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    .line 189
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto/16 :goto_0

    .line 193
    :pswitch_6
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1040312

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    .line 196
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->isPukUnlockScreenEnable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 198
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto/16 :goto_0

    .line 146
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method


# virtual methods
.method public onPause()V
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->removeCallback(Ljava/lang/Object;)V

    .line 120
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->removeCallback(Ljava/lang/Object;)V

    .line 121
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerInfoCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;)V

    .line 128
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerSimStateCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;)V

    .line 129
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->resetStatusInfo()V

    .line 130
    return-void
.end method

.method protected registerInfoCallback()V
    .locals 0

    .prologue
    .line 86
    return-void
.end method

.method setCarrierText()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, -0x1

    .line 89
    const/4 v1, 0x0

    .local v1, subidOfCard0:I
    const/4 v2, 0x1

    .line 91
    .local v2, subidOfCard1:I
    const-string v3, "MSimKeyguardStatusView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In setCarrierText, sub0: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aget-object v5, v5, v7

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", sub1: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aget-object v5, v5, v8

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v0

    .line 94
    .local v0, hm:Lcom/huawei/telephony/HuaweiTelephonyManager;
    if-eqz v0, :cond_3

    .line 95
    invoke-virtual {v0, v7}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getSubidFromSlotId(I)I

    move-result v1

    .line 96
    invoke-virtual {v0, v8}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getSubidFromSlotId(I)I

    move-result v2

    .line 97
    const-string v3, "MSimKeyguardStatusView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Card1 subid = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", Card2 subid = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    if-ltz v1, :cond_1

    if-ne v2, v6, :cond_1

    .line 100
    rsub-int/lit8 v2, v1, 0x1

    .line 107
    :cond_0
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " , "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aget-object v4, v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierText:Ljava/lang/CharSequence;

    .line 113
    :goto_1
    const/16 v3, 0xb

    iget-object v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v3, v4}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->update(ILjava/lang/CharSequence;)V

    .line 114
    return-void

    .line 101
    :cond_1
    if-ltz v2, :cond_2

    if-ne v1, v6, :cond_2

    .line 102
    rsub-int/lit8 v1, v2, 0x1

    goto :goto_0

    .line 103
    :cond_2
    if-ne v1, v6, :cond_0

    if-ne v2, v6, :cond_0

    .line 104
    const/4 v1, 0x0

    .line 105
    const/4 v2, 0x1

    goto :goto_0

    .line 109
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aget-object v4, v4, v7

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " , "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aget-object v4, v4, v8

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierText:Ljava/lang/CharSequence;

    goto :goto_1
.end method
