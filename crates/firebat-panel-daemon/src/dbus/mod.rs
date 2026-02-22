//! D-Bus interface for Firebat Panel Daemon.
//!
//! Provides the `org.firebat.Panel1` interface on the session or system bus.

mod interface;

pub use interface::{run_dbus_server, DaemonSignals};
