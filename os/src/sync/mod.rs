//! Synchronization and interior mutability primitives
mod up;
pub use up::UPSafeCell;

/// Low-level support for mutex(spinlock, sleeplock, etc)
pub trait MutexSupport {
    /// Guard data
    type GuardData;
    /// Called before lock() & try_lock()
    fn before_lock() -> Self::GuardData;
    /// Called when MutexGuard dropping
    fn after_unlock(_: &mut Self::GuardData);
}
