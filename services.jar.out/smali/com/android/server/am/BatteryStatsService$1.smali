.class Lcom/android/server/am/BatteryStatsService$1;
.super Ljava/lang/Object;
.source "BatteryStatsService.java"

# interfaces
.implements Landroid/bluetooth/BluetoothProfile$ServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/BatteryStatsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/BatteryStatsService;


# direct methods
.method constructor <init>(Lcom/android/server/am/BatteryStatsService;)V
    .locals 0
    .parameter

    .prologue
    .line 311
    iput-object p1, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(ILandroid/bluetooth/BluetoothProfile;)V
    .locals 3
    .parameter "profile"
    .parameter "proxy"

    .prologue
    .line 314
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    #getter for: Lcom/android/server/am/BatteryStatsService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;
    invoke-static {v0}, Lcom/android/server/am/BatteryStatsService;->access$000(Lcom/android/server/am/BatteryStatsService;)Landroid/bluetooth/BluetoothHeadset;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 315
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    #getter for: Lcom/android/server/am/BatteryStatsService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;
    invoke-static {v2}, Lcom/android/server/am/BatteryStatsService;->access$000(Lcom/android/server/am/BatteryStatsService;)Landroid/bluetooth/BluetoothHeadset;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/bluetooth/BluetoothAdapter;->closeProfileProxy(ILandroid/bluetooth/BluetoothProfile;)V

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    check-cast p2, Landroid/bluetooth/BluetoothHeadset;

    .end local p2
    #setter for: Lcom/android/server/am/BatteryStatsService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;
    invoke-static {v0, p2}, Lcom/android/server/am/BatteryStatsService;->access$002(Lcom/android/server/am/BatteryStatsService;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;

    .line 319
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    iget-object v1, v0, Lcom/android/server/am/BatteryStatsService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    monitor-enter v1

    .line 320
    :try_start_0
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    #getter for: Lcom/android/server/am/BatteryStatsService;->mBluetoothPendingStats:Z
    invoke-static {v0}, Lcom/android/server/am/BatteryStatsService;->access$100(Lcom/android/server/am/BatteryStatsService;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 321
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    iget-object v0, v0, Lcom/android/server/am/BatteryStatsService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    invoke-virtual {v0}, Lcom/android/internal/os/BatteryStatsImpl;->noteBluetoothOnLocked()V

    .line 322
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    iget-object v0, v0, Lcom/android/server/am/BatteryStatsService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    iget-object v2, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    #getter for: Lcom/android/server/am/BatteryStatsService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;
    invoke-static {v2}, Lcom/android/server/am/BatteryStatsService;->access$000(Lcom/android/server/am/BatteryStatsService;)Landroid/bluetooth/BluetoothHeadset;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/android/internal/os/BatteryStatsImpl;->setBtHeadset(Landroid/bluetooth/BluetoothHeadset;)V

    .line 323
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    const/4 v2, 0x0

    #setter for: Lcom/android/server/am/BatteryStatsService;->mBluetoothPendingStats:Z
    invoke-static {v0, v2}, Lcom/android/server/am/BatteryStatsService;->access$102(Lcom/android/server/am/BatteryStatsService;Z)Z

    .line 325
    :cond_1
    monitor-exit v1

    .line 326
    return-void

    .line 325
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onServiceDisconnected(I)V
    .locals 2
    .parameter "profile"

    .prologue
    .line 329
    iget-object v0, p0, Lcom/android/server/am/BatteryStatsService$1;->this$0:Lcom/android/server/am/BatteryStatsService;

    const/4 v1, 0x0

    #setter for: Lcom/android/server/am/BatteryStatsService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;
    invoke-static {v0, v1}, Lcom/android/server/am/BatteryStatsService;->access$002(Lcom/android/server/am/BatteryStatsService;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;

    .line 330
    return-void
.end method
